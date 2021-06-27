<?php

/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Eccube\Service\PurchaseFlow\Processor;

use Eccube\Entity\ItemInterface;
use Eccube\Entity\OrderItem;
use Eccube\Service\PurchaseFlow\ItemValidator;
use Eccube\Service\PurchaseFlow\PurchaseContext;

use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;

use Plugin\Mixpack\Entity\CustomerGroupMembership;
use Plugin\Mixpack\Repository\CustomerGroupMembershipRepository;
use Plugin\Mixpack\Entity\CustomerGroup;
use Plugin\Mixpack\Repository\CustomerGroupRepository;
use Plugin\Mixpack\Entity\PriceRule;
use Plugin\Mixpack\Repository\PriceRuleRepository;
use Plugin\Mixpack\Entity\Master\RuleType;
use Eccube\Repository\ProductClassRepository;
use Plugin\Mixpack\Entity\CustomerGroupProductClass;
use Plugin\Mixpack\Repository\CustomerGroupProductClassRepository;
use Eccube\Service\TaxRuleService;
use Eccube\Repository\TaxRuleRepository;

/**
 * 販売価格の変更検知.
 */
class PriceChangeValidator extends ItemValidator
{
    public function __construct(
        TokenStorageInterface $tokenStorage,
        AuthorizationCheckerInterface $authorizationChecker,
        CustomerGroupMembershipRepository $customerGroupMembershipRepository,
        CustomerGroupRepository $customerGroupRepository,
        PriceRuleRepository $priceRuleRepository,
        ProductClassRepository $productClassRepository,
        CustomerGroupProductClassRepository $customerGroupProductClassRepository,
        TaxRuleService $taxRuleService,
        TaxRuleRepository $taxRuleRepository
    ) {
        $this->tokenStorage = $tokenStorage;
        $this->authorizationChecker = $authorizationChecker;
        $this->customerGroupMembershipRepository = $customerGroupMembershipRepository;
        $this->customerGroupRepository = $customerGroupRepository;
        $this->priceRuleRepository = $priceRuleRepository;
        $this->productClassRepository = $productClassRepository;
        $this->customerGroupProductClassRepository = $customerGroupProductClassRepository;
        $this->taxRuleService = $taxRuleService;
        $this->taxRuleRepository = $taxRuleRepository;
    }

    /**
     * @param ItemInterface $item
     * @param PurchaseContext $context
     *
     * @throws \Eccube\Service\PurchaseFlow\InvalidItemException
     */
    public function validate(ItemInterface $item, PurchaseContext $context)
    {
        if (!$item->isProduct()) {
            return;
        }

        if ($item instanceof OrderItem) {
            $price = $item->getPrice();
            $realPrice = $item->getProductClass()->getPrice02();
    	    $parentItemId = $item->getParentOrderItemId();
        } else {
            // CartItem::priceは税込金額.
            $price = $item->getPrice();
            $realPrice = $item->getProductClass()->getPrice02IncTax();
	        $parentItemId = $item->getParentCartItemId();
	}

        // ミックスパックの選択商品価格が0円の場合、計算不要
        if (is_null($parentItemId) || $price > 0) {
            // 会員グループID取得
            $groupId = 1; // デフォルトグループ：ゲスト
            if ($this->authorizationChecker->isGranted('ROLE_USER')) {
                $Customer = $this->getUser();
                // 会員グループID取得
                $CustomerGroupMemberShip = $this->customerGroupMembershipRepository->findCustomerGroupMembership($Customer->getId());
                if(!empty($CustomerGroupMemberShip)){
                    $groupId = $CustomerGroupMemberShip->getGroupId();
                }
            }

            // 会員グループ別割引情報取得
            $discountRate = 0;
            $CustomerGroup = $this->customerGroupRepository->find($groupId);
            if(!empty($CustomerGroup)){
                $priceRuleId = $CustomerGroup->getPriceRuleId();
                $PriceRule = $this->priceRuleRepository->find($priceRuleId);
                if(!empty($PriceRule)){
                    $discountRate = $PriceRule->getRate();
                }
            }

            // 会員グループ用金額修正
            $updateGroupPriceFlag = false;
            $ProductClass = $this->productClassRepository->find($item->getProductClass()->getId());

            $CustomerGroupProductClass = $this->customerGroupProductClassRepository->findBy(['product_class_id' => $ProductClass->getId(), 'group_id' => $groupId]);
            if(!empty($CustomerGroupProductClass) && $CustomerGroupProductClass[0]->getPrice() > 0){
                // グループ別商品規格価格セット
                $newPrice = $CustomerGroupProductClass[0]->getPrice();
                $updateGroupPriceFlag = true;
            } else {
                // グループ別割引適用
                $productPrice = $ProductClass->getPrice02();
                if($discountRate > 0){
                    if($PriceRule->getRuleType()->getId() == RuleType::RELATIVE_DISCOUNT){
                        $newPrice = $productPrice - ($productPrice*($discountRate/100));

                        // 上記金額は小数点を含む商品金額になるため、小数点を丸める
                        $TaxRule  = $this->taxRuleRepository->getByRule(null, null, null, null);
                        $newPrice = $this->taxRuleService->roundByRoundingType($newPrice, $TaxRule->getRoundingType()->getId());
                    } else {
                        $newPrice = $productPrice - $discountRate;
                    }
                    if($newPrice < 0){
                        $newPrice = (int)0;
                    }
                    $updateGroupPriceFlag = true;
                }
            }
            if($updateGroupPriceFlag && $newPrice >= 0){
                if ($item instanceof OrderItem) {
                    if($realPrice != $newPrice){
                        $realPrice = $newPrice;
                        $item->setPrice($realPrice);
                        return true;
                    }
                } else {
                    $newPriceInTax = $this->taxRuleService->getPriceIncTax($newPrice);

                    if($realPrice != $newPriceInTax){
                        $realPrice = $newPriceInTax;
                        $item->setPrice($realPrice);
                        return true;
                    }
                }
            }
	}

	// ミックスパックが有料設定の場合、選択商品を0円として登録するため
        if ($price != $realPrice  && is_null($parentItemId)) {
            $item->setPrice($realPrice);
            $this->throwInvalidItemException('front.shopping.price_changed', $item->getProductClass());
        }
    }

    protected function getUser()
    {
        if (null === $token = $this->tokenStorage->getToken()) {
            return;
        }

        if (!is_object($user = $token->getUser())) {
            // e.g. anonymous authentication
            return;
        }

        return $user;
    }
}
