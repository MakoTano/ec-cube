<?php

namespace Customize\Form\Extension;

use Eccube\Form\Type\Admin\ProductType;
use Symfony\Component\Form\AbstractTypeExtension;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\FormBuilderInterface;

class ProductTypePublishDateExtension extends AbstractTypeExtension
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('publish_date', DateTimeType::class, [
            'label' => '公開予定日時',
            'required' => false,
            'years' => range(date('Y'), date('Y') + 10),
            'placeholder' => [ 'year' => '----', 'month' => '--', 'day' => '--', 'hour' => '--', 'minute' => '--' ],
            'eccube_form_options' => [
                'auto_render' => true
            ]
        ]);
    }

    /**
    * {@inheritdoc}
    */
    public function getExtendedType()
    {
        return ProductType::class;
    }
}