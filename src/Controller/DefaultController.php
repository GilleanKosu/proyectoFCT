<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\User;
use App\Entity\Partida;
use App\Entity\Dado;
use App\Entity\Casillas;
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
    public function logeoAjax(){ //Obtenemos el usuario con el email y la contraseña que nos introduce el usuario en cada formulario
        if(isset($_POST['email'])) {//Comprobamos si se han pasado ciertos datos por POST
            $repository = $this->getDoctrine()->getRepository(User::class);
            // $encriptedPass=password_hash($_POST['password'], PASSWORD_ARGON2I);
            $usuario = $repository->findUserByEmailPass($_POST['email'], $_POST['password']);
            return $this->json(['username' => $usuario -> getEmail(), 'id' => $usuario -> getId(), 'nickname' => $usuario -> getNickname(), 'id' => $usuario -> getId()]);
        } else {
            return $this->render('tableBoots.html.twig');
        }
        
    }

    /**
     * @Route("/crearPartida", name="crearPartida")
     */
     public function crear_Partida(){//Crearemos la partida introduciendole los datos que necesitamos y devolveremos un json para ir trabajando con el en la vista
        $repository = $this->getDoctrine()->getRepository(User::class);
        $repository2 = $this->getDoctrine()->getRepository(Dado::class);
        $repository3 = $this->getDoctrine()->getRepository(Casillas::class);
        $dado = $repository2 ->findOneById(1);//Este es el dado de 6 caras que usaremos normalmente

        $random_number = mt_rand(1,9999999);
        $nueva_partida = new Partida();
        $entityManager = $this->getDoctrine()->getManager();
        $nueva_partida->setId($random_number);
        $nueva_partida->setGanador("");
        $nueva_partida->setNumTurnos(0);
        $nueva_partida->setDado($dado);//Guardamos el dato en la partida
        $date = new \DateTime('@'.strtotime('now'));//Este es el formato que tendrá la fecha segun el tipo DATETIME
        $nueva_partida->setFecha($date);
        $entityManager->persist($nueva_partida);
        $entityManager->flush();

        //Creamos los objetos Usuarios con los datos de los usuarios que se ha logueado para añadirlos a la partida en cuestion, de manera que todos los jugadores que esten logueados serán los que jueguen


        // $repository2 = $this->getDoctrine()->getRepository(Partida::class);
        //Por si quisiera sacar los jugadores, necesita un for each
        // $nueva2_partida2 = $repository2->findOneById(7337246);
        // var_dump($nueva2_partida2->getJugadores()[0]->getEmail());
        // die();
        
        foreach ($_POST['array_jugadores'] as $key => $value) {
            $usuario = $repository->findOneById($value);
            $nueva_partida->addJugadore($usuario);//Añadimos cada jugador a la partida
            $entityManager->persist($nueva_partida);
            $entityManager->flush();
        }

        $casillas = $repository3 -> findAll();
        foreach ($casillas as $key => $value) {
            $lista_casillas[]=$value->getId();
        }

        //Devolvemos los valores que nos interesan de la partida
        return $this->json(['id_partida' => $nueva_partida->getId(), 'ganador' => $nueva_partida -> getGanador(), 'caras_dado' => $dado->getCaras(), 'lista_casillas' =>  $lista_casillas]);
        

    }
}
