<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\DadoRepository")
 */
class Dado
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="integer")
     */
    private $caras;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\User", mappedBy="dado")
     */
    private $jugador;

    public function __construct()
    {
        $this->jugador = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCaras(): ?int
    {
        return $this->caras;
    }

    public function setCaras(int $caras): self
    {
        $this->caras = $caras;

        return $this;
    }

    /**
     * @return Collection|User[]
     */
    public function getJugador(): Collection
    {
        return $this->jugador;
    }

    public function addJugador(User $jugador): self
    {
        if (!$this->jugador->contains($jugador)) {
            $this->jugador[] = $jugador;
            $jugador->setDado($this);
        }

        return $this;
    }

    public function removeJugador(User $jugador): self
    {
        if ($this->jugador->contains($jugador)) {
            $this->jugador->removeElement($jugador);
            // set the owning side to null (unless already changed)
            if ($jugador->getDado() === $this) {
                $jugador->setDado(null);
            }
        }

        return $this;
    }
}
