<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 * @UniqueEntity(fields={"email"}, message="There is already an account with this email")
 */
class User implements UserInterface
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $nickname;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Partida", mappedBy="jugadores")
     */
    private $partidas;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Casillas", inversedBy="user")
     */
    private $casillas;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\TituloPropiedad", mappedBy="usuario")
     */
    private $tituloPropiedads;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\Carta", mappedBy="usuario")
     */
    private $cartas;

    public function __construct()
    {
        $this->partidas = new ArrayCollection();
        $this->tituloPropiedads = new ArrayCollection();
        $this->cartas = new ArrayCollection();
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

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getSalt()
    {
        // not needed when using the "bcrypt" algorithm in security.yaml
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }
    public function __toString()
    {
        return $this->email;
    }

    public function getNickname(): ?string
    {
        return $this->nickname;
    }

    public function setNickname(string $nickname): self
    {
        $this->nickname = $nickname;

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
            $partida->addJugadore($this);
        }

        return $this;
    }

    public function removePartida(Partida $partida): self
    {
        if ($this->partidas->contains($partida)) {
            $this->partidas->removeElement($partida);
            $partida->removeJugadore($this);
        }

        return $this;
    }

    public function getCasillas(): ?Casillas
    {
        return $this->casillas;
    }

    public function setCasillas(?Casillas $casillas): self
    {
        $this->casillas = $casillas;

        return $this;
    }

    /**
     * @return Collection|TituloPropiedad[]
     */
    public function getTituloPropiedads(): Collection
    {
        return $this->tituloPropiedads;
    }

    public function addTituloPropiedad(TituloPropiedad $tituloPropiedad): self
    {
        if (!$this->tituloPropiedads->contains($tituloPropiedad)) {
            $this->tituloPropiedads[] = $tituloPropiedad;
            $tituloPropiedad->setUsuario($this);
        }

        return $this;
    }

    public function removeTituloPropiedad(TituloPropiedad $tituloPropiedad): self
    {
        if ($this->tituloPropiedads->contains($tituloPropiedad)) {
            $this->tituloPropiedads->removeElement($tituloPropiedad);
            // set the owning side to null (unless already changed)
            if ($tituloPropiedad->getUsuario() === $this) {
                $tituloPropiedad->setUsuario(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|Carta[]
     */
    public function getCartas(): Collection
    {
        return $this->cartas;
    }

    public function addCarta(Carta $carta): self
    {
        if (!$this->cartas->contains($carta)) {
            $this->cartas[] = $carta;
            $carta->setUsuario($this);
        }

        return $this;
    }

    public function removeCarta(Carta $carta): self
    {
        if ($this->cartas->contains($carta)) {
            $this->cartas->removeElement($carta);
            // set the owning side to null (unless already changed)
            if ($carta->getUsuario() === $this) {
                $carta->setUsuario(null);
            }
        }

        return $this;
    }
    
}
