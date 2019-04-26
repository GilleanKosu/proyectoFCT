<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\User;
use App\Entity\Partida;
use App\Entity\Dado;
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
    public function logeoAjax(){
        $repository = $this->getDoctrine()->getRepository(User::class);
        // $encriptedPass=password_hash($_POST['password'], PASSWORD_ARGON2I);
        $usuario = $repository->findUserByEmailPass($_POST['email'], $_POST['password']);

        if(isset($_POST['email'])) {
            return $this->json(['username' => $usuario -> getEmail(), 'id' => $usuario -> getId(), 'nickname' => $usuario -> getNickname()]);
        } else {
            return $this->render('tableBoots.html.twig');
        }
        
    }
    /**
     * @Route("/crearPartida", name="crearPartda")
     */
    public function crear_partida(){
        $random_number = mt_rand(1,9999999);
        $nueva_partida = new Partida();
        $entityManager = $this->getDoctrine()->getManager();
        $nueva_partida->setId($random_number);
        $nueva_partida->setGanador("hola");
        $nueva_partida->setNumTurnos(0);
        $entityManager->persist($nueva_partida);
        $entityManager->flush();

        $repository = $this -> getDoctrine() -> getRepository(Dado::class);
        $dado = $repository ->findOneById(1);
        
        return $this->json(['id' => $nueva_partida -> getId(), 'ganador' => $nueva_partida -> getGanador(), 'total_turnos' => $nueva_partida -> getNumTurnos(), 'caras_dado' => $dado->getCaras()]);
        
        
    }

}
