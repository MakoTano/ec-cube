<?php

namespace Customize\Entity\Master;

use Eccube\Entity\Master\AbstractMasterEntity;
use Doctrine\ORM\Mapping as ORM;

if (!class_exists('\Customize\Entity\Mater\BeerType')) {
    /**
     * InvoiceDelivery
     *
     * @ORM\Table(name="customize_mtb_beer_type")
     * @ORM\InheritanceType("SINGLE_TABLE")
     * @ORM\DiscriminatorColumn(name="discriminator_type", type="string", length=255)
     * @ORM\HasLifecycleCallbacks()
     * @ORM\Entity(repositoryClass="Customize\Repository\Master\BeerTypeRepository")
     * @ORM\Cache(usage="NONSTRICT_READ_WRITE")
     */
    class BeerType extends AbstractMasterEntity
    {
        /**
         * ビール
         */
        const BEER = 1;

        /**
         * 発泡酒 < 25%モルト
         */
        const LOW_MALT_BEER_25 = 2;

        /**
         * 発泡酒 < 50%モルト
         */
        const LOW_MALT_BEER_50 = 3;

        /**
         * 発泡酒 < 100%モルト
         */
        const LOW_MALT_BEER_100 = 4;

        /**
         * その他の酒類
         */
        const OTHER_LIQUOR = 5;

        /**
         * その他
         */
        const OTHER = 6;
    }
}
