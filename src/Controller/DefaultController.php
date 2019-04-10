<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(){
        return $this->render('index.html');
    }
    /**
     * @Route("/tablero", name="tablero")
     */
    public function tablero()
    {
        return $this->render('tableBoots.html.twig');
    }
    /**
     * @Route("/logeoAjax", name="logeoAjax")
     */
    public function logeoAjax()
    {
        $hola= "hola";
        return $this->render('tableBoots.html.twig', [
            'saludo' => $hola
        ]);
    }
}
