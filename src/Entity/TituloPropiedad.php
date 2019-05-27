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

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $grupo;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $alquilerBase;

    /**
     * @ORM\Column(type="float", nullable=true)
     */
    private $factorRevalorizacion;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $numCasas;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $numHoteles;

    /**
     * @ORM\Column(type="integer", nullable=true)
     */
    private $precioEdificar;

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

    public function getGrupo(): ?string
    {
        return $this->grupo;
    }

    public function setGrupo(string $grupo): self
    {
        $this->grupo = $grupo;

        return $this;
    }

    public function getAlquilerBase(): ?int
    {
        return $this->alquilerBase;
    }

    public function setAlquilerBase(?int $alquilerBase): self
    {
        $this->alquilerBase = $alquilerBase;

        return $this;
    }

    public function getFactorRevalorizacion(): ?float
    {
        return $this->factorRevalorizacion;
    }

    public function setFactorRevalorizacion(?float $factorRevalorizacion): self
    {
        $this->factorRevalorizacion = $factorRevalorizacion;

        return $this;
    }

    public function getNumCasas(): ?int
    {
        return $this->numCasas;
    }

    public function setNumCasas(?int $numCasas): self
    {
        $this->numCasas = $numCasas;

        return $this;
    }

    public function getNumHoteles(): ?int
    {
        return $this->numHoteles;
    }

    public function setNumHoteles(?int $numHoteles): self
    {
        $this->numHoteles = $numHoteles;

        return $this;
    }

    public function getPrecioEdificar(): ?int
    {
        return $this->precioEdificar;
    }

    public function setPrecioEdificar(?int $precioEdificar): self
    {
        $this->precioEdificar = $precioEdificar;

        return $this;
    }
}
