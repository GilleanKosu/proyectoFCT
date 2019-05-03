<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CartaRepository")
 */
class Carta
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nombre;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $efecto;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="cartas")
     */
    private $usuario;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Partida", inversedBy="cartas")
     */
    private $partida;

    public function __construct()
    {
        $this->partida = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getEfecto(): ?string
    {
        return $this->efecto;
    }

    public function setEfecto(string $efecto): self
    {
        $this->efecto = $efecto;

        return $this;
    }

    public function getUsuario(): ?User
    {
        return $this->usuario;
    }

    public function setUsuario(?User $usuario): self
    {
        $this->usuario = $usuario;

        return $this;
    }

    /**
     * @return Collection|Partida[]
     */
    public function getPartida(): Collection
    {
        return $this->partida;
    }

    public function addPartida(Partida $partida): self
    {
        if (!$this->partida->contains($partida)) {
            $this->partida[] = $partida;
        }

        return $this;
    }

    public function removePartida(Partida $partida): self
    {
        if ($this->partida->contains($partida)) {
            $this->partida->removeElement($partida);
        }

        return $this;
    }
}
