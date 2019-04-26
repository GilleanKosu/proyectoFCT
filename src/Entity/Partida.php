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
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\User", inversedBy="partidas")
     */
    private $jugadores;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $ganador;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $num_turnos;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Dado", inversedBy="partidas")
     */
    private $dado;

    public function __construct()
    {
        $this->jugadores = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }
    public function setId(int $id): self
    {
        $this->id = $id;

        return $this;
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

    public function setGanador(string $ganador): self
    {
        $this->ganador = $ganador;

        return $this;
    }

    public function getNumTurnos(): ?int
    {
        return $this->num_turnos;
    }

    public function setNumTurnos(?int $num_turnos): self
    {
        $this->num_turnos = $num_turnos;

        return $this;
    }

    public function getDado(): ?Dado
    {
        return $this->dado;
    }

    public function setDado(?Dado $dado): self
    {
        $this->dado = $dado;

        return $this;
    }
   
}
