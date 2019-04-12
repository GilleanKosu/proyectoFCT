<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\User;

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
        $repository = $this->getDoctrine()->getRepository(User::class);

        $usuario = $repository->findUserByEmail($_POST['nombre_jugador2']);

        if ($usuario!=NULL) {
            $_SESSION['usuario2'] = $usuario;
        }
        if(isset($_SESSION['usuario2'])) {
            return $this->json(['username' => $usuario -> getEmail(), 'id' => $usuario -> getId()]);
        } else {
            return $this->render('tableBoots.html.twig');
        }
        
    }
}
