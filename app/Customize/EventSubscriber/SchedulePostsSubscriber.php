<?php

namespace Customize\EventSubscriber;

use Doctrine\ORM\EntityManagerInterface;
use Eccube\Entity\Master\ProductStatus;
use Eccube\Repository\Master\ProductStatusRepository;
use Eccube\Repository\ProductRepository;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpKernel\Event\GetResponseEvent;
use Symfony\Component\HttpKernel\KernelEvents;

/**
 * サイトにアクセスしたとき、非公開で予定公開日時を過ぎている商品を公開にするイベント
 *
 * Class SchedulePostsSubscriber
 * @package Customize\EventSubscriber
 */
class SchedulePostsSubscriber implements EventSubscriberInterface
{
    /**
     * @var ProductRepository
     */
    private $productRepository;

    /**
     * @var ProductStatusRepository
     */
    private $productStatusRepository;

    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    public function __construct(
        ProductRepository $productRepository,
        ProductStatusRepository $productStatusRepository,
        EntityManagerInterface $entityManager
    )
    {
        $this->productRepository = $productRepository;
        $this->productStatusRepository = $productStatusRepository;
        $this->entityManager = $entityManager;
    }

    public function onKernelRequest(GetResponseEvent $event)
    {
        // 非公開で予定公開日時を過ぎている商品を探す
        $qb = $this->productRepository->createQueryBuilder("p");
        $qb
            ->where("p.Status = :Status")
            ->andWhere("p.publish_date < :now")
            ->setParameters([
                "Status" => ProductStatus::DISPLAY_HIDE,
                "now" => new \DateTime()
            ]);

        $result = $qb->getQuery()->getResult();

        // 非公開で予定公開日時を過ぎている商品が見つかったら
        if($result) {
            // 商品ステータスの公開を取得
            $Status = $this->productStatusRepository->find(ProductStatus::DISPLAY_SHOW);
            foreach($result as $Product) {
                // 商品ステータスの公開をセット
                $Product->setStatus($Status);
                $this->entityManager->persist($Product);
            }
            $this->entityManager->flush();
        }
    }

    public static function getSubscribedEvents()
    {
        return [
            'kernel.request' => 'onKernelRequest',
        ];
    }
}