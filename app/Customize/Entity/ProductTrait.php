<?php

namespace Customize\Entity;

use Customize\Entity\Master\BeerType;
use Customize\Entity\ProductBeerContainer;
use Doctrine\ORM\Mapping as ORM;
use Eccube\Annotation\EntityExtension;

/**
 * @EntityExtension("Eccube\Entity\Product")
 */
trait ProductTrait
{
    /**
     * @ORM\Column(type="datetimetz", nullable=true)
     */
    private $publish_date;

    /**
     * @var BeerType
     *
     * @ORM\ManyToOne(targetEntity="Customize\Entity\Master\BeerType")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="beer_type_id", referencedColumnName="id")
     * })
     */
    private $BeerType;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\OneToMany(targetEntity="Customize\Entity\ProductBeerContainer", mappedBy="Product", cascade={"persist","remove"})
     */
    private $ProductBeerContainers;

    /**
     * @var string|null
     *
     * @ORM\Column(name="alcohol_percentage ", type="decimal", precision=5, scale=2, nullable=true)
     */
    private $alcohol_percentage;

    public function getPublishDate(): ?\DateTimeInterface
    {
        return $this->publish_date;
    }

    public function setPublishDate(?\DateTimeInterface $publish_date): self
    {
        $this->publish_date = $publish_date;

        return $this;
    }

    /**
     * Set alcohol_percentage.
     *
     * @param string|null $alcohol_percentage
     *
     * @return self
     */
    public function setAlcoholPercentage(?string $alcohol_percentage): self
    {
        $this->alcohol_percentage = $alcohol_percentage;

        return $this;
    }

    /**
     * Get alcohol_percentage.
     *
     * @return string|null
     */
    public function getAlcoholPercentage(): ?string
    {
        return $this->alcohol_percentage;
    }

    /**
     * Set BeerType.
     *
     * @param BeerType|null $BeerType
     *
     * @return self
     */
    public function setBeerType(?BeerType $BeerType): self
    {
        $this->BeerType = $BeerType;

        return $this;
    }

    /**
     * Get BeerType.
     *
     * @return BeerType|null
     */
    public function getBeerType(): ?BeerType
    {
        return $this->BeerType;
    }

    /**
     * Add ProductBeerContainer.
     *
     * @param ProductBeerContainer $ProductBeerContainer
     *
     * @return self
     */
    public function addProductBeerContainer(ProductBeerContainer $ProductBeerContainer)
    {
        $this->ProductBeerContainers[] = $ProductBeerContainer;

        return $this;
    }

    /**
     * Remove ProductBeerContainer.
     *
     * @param ProductBeerContainer $ProductBeerContainer
     *
     * @return boolean TRUE if this collection contained the specified element, FALSE otherwise.
     */
    public function removeProductBeerContainer(ProductBeerContainer $ProductBeerContainer)
    {
        return $this->ProductBeerContainers->removeElement($ProductBeerContainer);
    }

    /**
     * Get ProductBeerContainers.
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getProductBeerContainers()
    {
        return $this->ProductBeerContainers;
    }
}
