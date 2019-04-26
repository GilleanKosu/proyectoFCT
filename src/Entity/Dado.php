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
     * @ORM\Column(type="integer", nullable=true)
     */
    private $caras;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Partida", mappedBy="dado")
     */
    private $partidas;

    public function __construct()
    {
        $this->partidas = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCaras(): ?int
    {
        return $this->caras;
    }

    public function setCaras(?int $caras): self
    {
        $this->caras = $caras;

        return $this;
    }

    /**
     * @return Collection|Partida[]
     */
    public function getPartidas(): Collection
    {
        return $this->partidas;
    }

    public function addPartida(Partida $partida): self
    {
        if (!$this->partidas->contains($partida)) {
            $this->partidas[] = $partida;
            $partida->setDado($this);
        }

        return $this;
    }

    public function removePartida(Partida $partida): self
    {
        if ($this->partidas->contains($partida)) {
            $this->partidas->removeElement($partida);
            // set the owning side to null (unless already changed)
            if ($partida->getDado() === $this) {
                $partida->setDado(null);
            }
        }

        return $this;
    }
}
