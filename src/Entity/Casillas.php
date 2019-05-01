<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\CasillasRepository")
 */
class Casillas
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $nombre;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Partida", inversedBy="casillas")
     */
    private $partida;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\User", mappedBy="casillas")
     */
    private $user;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $tipo;

    public function __construct()
    {
        $this->partida = new ArrayCollection();
        $this->user = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(?string $nombre): self
    {
        $this->nombre = $nombre;

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

    /**
     * @return Collection|User[]
     */
    public function getUser(): Collection
    {
        return $this->user;
    }

    public function addUser(User $user): self
    {
        if (!$this->user->contains($user)) {
            $this->user[] = $user;
            $user->setCasillas($this);
        }

        return $this;
    }

    public function removeUser(User $user): self
    {
        if ($this->user->contains($user)) {
            $this->user->removeElement($user);
            // set the owning side to null (unless already changed)
            if ($user->getCasillas() === $this) {
                $user->setCasillas(null);
            }
        }

        return $this;
    }

    public function getTipo(): ?string
    {
        return $this->tipo;
    }

    public function setTipo(?string $tipo): self
    {
        $this->tipo = $tipo;

        return $this;
    }
}
