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
     * @Route("/crearPartida", name="crearPartida")
     */
     public function crear_Partida(){
        $repository = $this->getDoctrine()->getRepository(User::class);
        $repository2 = $this->getDoctrine()->getRepository(Dado::class);
        $dado = $repository2 ->findOneById(1);

        $random_number = mt_rand(1,9999999);
        $nueva_partida = new Partida();
        $entityManager = $this->getDoctrine()->getManager();
        $nueva_partida->setId($random_number);
        $nueva_partida->setGanador("");
        $nueva_partida->setNumTurnos(0);
        $nueva_partida->setDado($dado);
        $date = new \DateTime('@'.strtotime('now'));
        $nueva_partida->setFecha($date);
        $entityManager->persist($nueva_partida);
        $entityManager->flush();

        //Creamos los objetos Usuarios con los datos de los usuarios que se ha logueado para añadirlos a la partida en cuestion


        // $repository2 = $this->getDoctrine()->getRepository(Partida::class);
        //Por si quisiera sacar los jugadores, necesita un for each
        // $nueva2_partida2 = $repository2->findOneById(7337246);
        // var_dump($nueva2_partida2->getJugadores()[0]->getEmail());
        // die();
        foreach ($_POST['array_jugadores'] as $key => $value) {
            $usuario = $repository->findOneById($value['id']);
            $nueva_partida->addJugadore($usuario);
            $entityManager->persist($nueva_partida);
            $entityManager->flush();
        }

        return $this->json(['id_partida' => $nueva_partida->getId(), 'ganador' => $nueva_partida -> getGanador(), 'caras_dado' => $dado->getCaras()]);
        

    }
}
