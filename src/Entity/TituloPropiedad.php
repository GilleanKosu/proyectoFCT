<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TituloPropiedadRepository")
 */
class TituloPropiedad
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
    private $precioCompra;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $nombre;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Casillas", cascade={"persist", "remove"})
     */
    private $casilla;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="tituloPropiedads")
     */
    private $usuario;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrecioCompra(): ?int
    {
        return $this->precioCompra;
    }

    public function setPrecioCompra(int $precioCompra): self
    {
        $this->precioCompra = $precioCompra;

        return $this;
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

    public function getCasilla(): ?Casillas
    {
        return $this->casilla;
    }

    public function setCasilla(?Casillas $casilla): self
    {
        $this->casilla = $casilla;

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
}
