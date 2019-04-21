<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\PartidaRepository")
 */
class Partida
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\User", inversedBy="partidas")
     */
    private $jugadores;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $ganador;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $total_turnos;

    public function __construct()
    {
        $this->jugadores = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return Collection|User[]
     */
    public function getJugadores(): Collection
    {
        return $this->jugadores;
    }

    public function addJugadore(User $jugadore): self
    {
        if (!$this->jugadores->contains($jugadore)) {
            $this->jugadores[] = $jugadore;
        }

        return $this;
    }

    public function removeJugadore(User $jugadore): self
    {
        if ($this->jugadores->contains($jugadore)) {
            $this->jugadores->removeElement($jugadore);
        }

        return $this;
    }

    public function getGanador(): ?string
    {
        return $this->ganador;
    }

    public function setGanador(?string $ganador): self
    {
        $this->ganador = $ganador;

        return $this;
    }

    public function getTotalTurnos(): ?int
    {
        return $this->total_turnos;
    }

    public function setTotalTurnos(?int $total_turnos): self
    {
        $this->total_turnos = $total_turnos;

        return $this;
    }
}
