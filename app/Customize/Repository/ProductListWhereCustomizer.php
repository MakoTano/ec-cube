<?php

namespace Customize\Repository;

use Doctrine\ORM\QueryBuilder;
use Eccube\Doctrine\Query\QueryCustomizer;
use Eccube\Repository\QueryKey;
use Eccube\Request\Context;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class ProductListWhereCustomizer implements QueryCustomizer
{
    /**
     * @var Context
     */
    private $context;

    /**
     * @var SessionInterface
     */
    protected $session;

    /**
     * ProductListWhereCustomizer constructor.
     *
     * @param Context $context
     */
    public function __construct(
        Context $context,
        SessionInterface $session
    ) {
        $this->context = $context;
        $this->session = $session;
    }

    /**
     * {@inheritdoc}
     */
    public function customize(QueryBuilder $builder, $params, $queryKey)
    {
        $tag_id_list = $this->session->get('eccube.front.customize.tag.search');

        if (null !== $tag_id_list && !empty($tag_id_list)) {
            foreach ($tag_id_list as $key => $tag_id) {
                $builder
                    ->innerJoin('p.ProductTag', 'ptt'.$key)
                    ->andWhere('ptt'.$key.'.Tag = :tag'.$key)
                    ->setParameter(':tag'.$key, $tag_id);
            }
        }
    }

    /**
     * {@inheritdoc}
     */
    public function getQueryKey()
    {
        return QueryKey::PRODUCT_SEARCH;
    }
}
