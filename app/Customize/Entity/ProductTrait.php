<?php

namespace Customize\Entity;

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
}
