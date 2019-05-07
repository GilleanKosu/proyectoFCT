<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MensajeRepository")
 */
class Mensaje
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
    private $nombre_remitente;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $email_remitente;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $mensaje_remitente;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNombreRemitente(): ?string
    {
        return $this->nombre_remitente;
    }

    public function setNombreRemitente(?string $nombre_remitente): self
    {
        $this->nombre_remitente = $nombre_remitente;

        return $this;
    }

    public function getEmailRemitente(): ?string
    {
        return $this->email_remitente;
    }

    public function setEmailRemitente(string $email_remitente): self
    {
        $this->email_remitente = $email_remitente;

        return $this;
    }

    public function getMensajeRemitente(): ?string
    {
        return $this->mensaje_remitente;
    }

    public function setMensajeRemitente(?string $mensaje_remitente): self
    {
        $this->mensaje_remitente = $mensaje_remitente;

        return $this;
    }
}
