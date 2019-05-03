<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use App\Entity\User;
use App\Entity\Partida;
use App\Entity\Dado;
use App\Entity\Casillas;
use App\Entity\Carta;
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
        $repository4 = $this->getDoctrine()->getRepository(Carta::class);

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

        $casillas = $repository3 -> findAll();

        foreach ($casillas as $key => $value) {//Añadimos las casillas que tendrá el tablero a la partida
            $lista_casillas[$value->getId()]=$value->getNombre();//De momento no parece necesario, lo pasamos a la vista por si fuera necesario en un futuro
            $nueva_partida->addCasilla($value);
            $entityManager->persist($nueva_partida);
            $entityManager->flush();
        }

        $cartas = $repository4 -> findAll();

        foreach ($cartas as $key => $value) {//Añadimos las cartas que tendrá el tablero a la partida
            $lista_cartas[$value->getId()]=[$value->getNombre(),$value->getEfecto()];
            $nueva_partida->addCarta($value);
            $entityManager->persist($nueva_partida);
            $entityManager->flush();
        }

        //Creamos los objetos Usuarios con los datos de los usuarios que se ha logueado para añadirlos a la partida en cuestion, de manera que todos los jugadores que esten logueados serán los que jueguen
        
        foreach ($_POST['array_jugadores'] as $key => $value) {
            $usuario = $repository->findOneById($value);
            $nueva_partida->addJugadore($usuario);//Añadimos cada jugador a la partid
            $casillas[0]->addUser($usuario);
            $entityManager->persist($nueva_partida);
            $entityManager->flush();
        }


        //Devolvemos los valores que nos interesan de la partida
        return $this->json(['id_partida' => $nueva_partida->getId(), 'ganador' => $nueva_partida -> getGanador(), 'caras_dado' => $dado->getCaras(), 'lista_casillas' =>  $lista_casillas, 'lista_cartas' => $lista_cartas]);
        

    }

    /**
     * @Route("/actualizar_movimiento", name="actualizarMovimiento")
     */

    public function actualizar_movimiento(){
        if (isset($_POST['jugador'])) {
           $repository = $this->getDoctrine()->getRepository(User::class);
           $repository2 = $this->getDoctrine()->getRepository(Casillas::class);

           $jugador_actualizado = $repository -> findOneById($_POST['jugador']);

           $entityManager = $this->getDoctrine()->getManager();

           $casilla_vieja = $jugador_actualizado->getCasillas()->getId();
           $casilla_nueva=0;
           if ($casilla_vieja + $_POST['dado']>20) {
                $dado = $_POST['dado'];
               $resultado_vuelta_completa = (20 - $casilla_vieja);
               $casilla_nueva = $dado - $resultado_vuelta_completa;

               $casilla_nueva = $repository2 -> findCasillaById($casilla_nueva - 1);
           } else {
                $casilla_nueva = $repository2 -> findCasillaById($casilla_vieja + $_POST['dado']);
           }

           $jugador_actualizado->setCasillas($casilla_nueva);

           $entityManager->merge($jugador_actualizado);
           $entityManager->flush();
           return $this->json(['casilla_antigua' => $casilla_vieja, 'casilla_actualizada' => $casilla_nueva->getId()]);
        }
    }
    /**
     * @Route("/devolver_tipo_casilla", name="devolverTipoCasilla")
     */
    public function devolver_tipo_casilla()
    {
        $repository = $this->getDoctrine()->getRepository(Casillas::class);
        $tipo_casilla = $repository ->findCasillaById($_POST['id_casilla']);
        
        return $this->json(['tipo_casilla' => $tipo_casilla->getTipo()]);
    }

}
