<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\User;
use App\Entity\Partida;
use App\Entity\Dado;
use App\Entity\Casillas;
use App\Entity\Carta;
use App\Entity\Mensaje;
class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(){
        return $this->render('index.html');
    }
    /**
     * @Route("/registro_usuarios", name="registroUsuarios")
     */
    public function registro_usuarios(){
        if (isset($_POST['email'])) {
            $entityManager = $this->getDoctrine()->getManager();
           $usuario = new User ();
           // $usuario ->setId();
           $usuario ->setEmail($_POST['email']);
           // $usuario ->setRoles('');
           $usuario ->setNickname($_POST['nickname']);
           $usuario ->setPassword(md5($_POST['password']));
           $usuario ->setSaldoPartida(NULL);
           $usuario ->setCasillas(NULL);

           $entityManager->persist($usuario);
           $entityManager->flush();

           return new Response('registro_usuarios.html');

        } else {
            return $this->render('registro_usuarios.html'); 
        }
    }
    /**
     * @Route("/tablero", name="tablero")
     */
    public function tablero()
    {   
        // var_dump($_POST);
        // var_dump(json_decode(stripslashes($_POST['hidden_jugadores'])));
        // die();
        return $this->render('tableBoots.html.twig', ['jugadores_partida_tablero' => json_decode(stripslashes($_POST['hidden_jugadores'])), 'id_jugadores_partida' => json_decode(stripslashes($_POST['hidden_id_jugadores']))]);
    }
    /**
     * @Route("/contacto", name="contacto")
     */
    public function contacto()
    {   
        // var_dump($_POST);
        // var_dump(json_decode(stripslashes($_POST['hidden_jugadores'])));
        // die();
        if (isset($_POST['nombre_contacto']) && isset($_POST['email_contacto']) && isset($_POST['txtMsg'])) {
            
            $mensaje = new Mensaje();
            $mensaje->setNombreRemitente($_POST['nombre_contacto']);
            $mensaje->setEmailRemitente($_POST['email_contacto']);
            $mensaje->setMensajeRemitente($_POST['txtMsg']);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($mensaje);
            $entityManager->flush();

            return $this->render('contacto.html');

        } else {
            return $this->render('contacto.html');
        }
        
    }
    /**
     * @Route("/logeoAjax", name="logeoAjax")
     */
    public function logeoAjax(){ //Obtenemos el usuario con el email y la contraseña que nos introduce el usuario en cada formulario
        
        if(isset($_POST['email']) && isset($_POST['password'])) {//Comprobamos si se han pasado ciertos datos por POST
            $repository = $this->getDoctrine()->getRepository(User::class);
            // $encriptedPass=password_hash($_POST['password'], PASSWORD_ARGON2I);
            $usuario = $repository->findUserByEmailPass($_POST['email'], md5($_POST['password']));
            return $this->json(['username' => $usuario -> getEmail(), 'id' => $usuario -> getId(), 'nickname' => $usuario -> getNickname(), 'id' => $usuario -> getId()]);
        } else {
            return $this->render('login_tablero.html');
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

        $random_number = mt_rand(1,9999999);//Generamos el id de la partida
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
        shuffle($lista_cartas);//Barajamos las cartas


        //Creamos los objetos Usuarios con los datos de los usuarios que se ha logueado para añadirlos a la partida en cuestion, de manera que todos los jugadores que esten logueados serán los que jueguen
        
        foreach ($_POST['array_jugadores'] as $key => $value) {

            $usuario = $repository->findOneById($value);
            $usuario->setSaldoPartida(7500);

            //Obtenemos los datos que nos interesan de los jugadores para trabajar con ellos mas adelante
            $datos_jugadores[$key]['id']=$usuario->getId();
            $datos_jugadores[$key]['nickName']=$usuario->getNickname();
            $datos_jugadores[$key]['Saldo']=$usuario->getSaldoPartida();

            
            $nueva_partida->addJugadore($usuario);//Añadimos cada jugador que va a jugar a la partida
            $casillas[0]->addUser($usuario);//Ponemos a cada jugador en la casilla inicial
            $entityManager->persist($nueva_partida);
            $entityManager->flush();
        }


        //Devolvemos los valores que nos interesan de la partida
        return $this->json(['id_partida' => $nueva_partida->getId(), 'ganador' => $nueva_partida -> getGanador(), 'caras_dado' => $dado->getCaras(), 'lista_casillas' =>  $lista_casillas, 'lista_cartas' => $lista_cartas, 'info_jugadores' => $datos_jugadores]);
        

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
    /**
     * @Route("/recargar_baraja", name="recargarBaraja")
     */
    public function recargar_baraja()
    {
        $repository = $this->getDoctrine()->getRepository(Carta::class);
        $cartas = $repository -> findAll();

        foreach ($cartas as $key => $value) {//Añadimos las cartas que tendrá el tablero a la partida
            $lista_cartas[$value->getId()]=[$value->getNombre(),$value->getEfecto()];
        }
        shuffle($lista_cartas);

        return $this->json(['lista_cartas' => $lista_cartas]);

    }
    /**
     * @Route("/actualizar_posicion_tablero", name="actualizarPosicionTablero")
     */
    public function actualizar_posicion_tablero()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $repository = $this->getDoctrine()->getRepository(Casillas::class);
        $repository2 = $this->getDoctrine()->getRepository(User::class);

        $casilla_nueva = $repository->findCasillaById($_POST['posicion']);
        $nuevo_usuario = $repository2->findOneById($_POST['jugador']);
        $nuevo_usuario->setCasillas($casilla_nueva);

        $entityManager->merge($nuevo_usuario);
        $entityManager->flush();

        return $this->json(['resultado' => 'OK']);

    }

    /**
     * @Route("/actualizar_saldo_jugador", name="actualizarsaldojugador")
     */
    public function actualizar_saldo_jugador()
    {
        $entityManager = $this->getDoctrine()->getManager();
        $repository1 = $this->getDoctrine()->getRepository(User::class);

        $nuevo_usuario = $repository1->findOneById($_POST['jugador']);
        if ($_POST['actualizar']=="sumar") {
            $nuevo_usuario->setSaldoPartida($nuevo_usuario->getSaldoPartida() + $_POST['cantidad']);
        }
        if ($_POST['actualizar']=="restar") {
            $nuevo_usuario->setSaldoPartida($nuevo_usuario->getSaldoPartida() - $_POST['cantidad']);
        }

        $entityManager->merge($nuevo_usuario);
        $entityManager->flush();

        return $this->json(['saldo_actualizado' => $nuevo_usuario->getSaldoPartida()]);

    }

}
