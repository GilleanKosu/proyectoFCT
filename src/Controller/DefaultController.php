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
use App\Entity\TituloPropiedad;
use Proxies\__CG__\App\Entity\Casillas as ProxiesCasillas;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="index")
     */
    public function index(){
        return $this->render('index.html');
    }
    /**
     * @Route("/admin", name="admin")
     */
    public function admin(){

        if (isset($_POST['addUserAdmin'])) {

            $entityManager = $this->getDoctrine()->getManager();
            $usuario = new User ();
            $usuario ->setEmail($_POST['email_usuario']);
            $usuario ->setNickname($_POST['nickname_usuario']);
            $usuario ->setPassword(md5($_POST['nueva_pass']));
            $usuario ->setSaldoPartida(NULL);
            $usuario ->setCasillas(NULL);
            
            $entityManager->persist($usuario);
            $entityManager->flush();
            return $this->render('admin.html.twig');
        }
        return $this->render('admin.html.twig');

    }
    /**
     * @Route("/sacar_lista_usuarios", name="sacarListaUsuarios")
     */
    public function sacar_lista_usuarios(){

        $repository = $this->getDoctrine()->getRepository(User::class);

        $usuarios = $repository->findAll();

        $lista_usuarios=array();
        foreach ($usuarios as $key => $value) {
            $lista_usuarios[$key][0]=$value->getEmail();
            $lista_usuarios[$key][1]=$value->getUsername();
            $lista_usuarios[$key][2]=$value->getPassword();
        }
        return $this->json(['lista_usuarios' => $lista_usuarios]);
    }
    /**
     * @Route("/sacar_lista_mensajes", name="sacarListaMensajes")
     */
    public function sacar_lista_mensajes(){

        $repository = $this->getDoctrine()->getRepository(Mensaje::class);

        $mensajes = $repository->findAll();

        $lista_mensajes=array();
        foreach ($mensajes as $key => $value) {
            $lista_mensajes[$key][0]=$value->getNombreRemitente();
            $lista_mensajes[$key][1]=$value->getEmailRemitente();
            $lista_mensajes[$key][2]=$value->getMensajeRemitente();
            // $lista_mensajes[$key][2]=$value->getMensajeRemitente();
        }
        return $this->json(['lista_mensajes' => $lista_mensajes]);
    }

    /**
     * @Route("/registro_usuarios", name="registroUsuarios")
     */
    public function registro_usuarios(){
        if (isset($_POST['email_usuario'])) {
            $entityManager = $this->getDoctrine()->getManager();
            $usuario = new User ();
            $usuario ->setEmail($_POST['email_usuario']);
            $usuario ->setNickname($_POST['nickname_usuario']);
            $usuario ->setPassword(md5($_POST['nueva_pass']));
            $usuario ->setSaldoPartida(NULL);
            $usuario ->setCasillas(NULL);
            
            $entityManager->persist($usuario);
            $entityManager->flush();
            return $this->render('registro_usuarios.html'); 

        } else {
            return $this->render('registro_usuarios.html'); 
        }
    }
    /**
     * @Route("/registro", name="registro")
     */
    public function registro(){

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
           return $this->json(['adsf']);
        
    }

    /**
     * @Route("/tablero", name="tablero")
     */
    public function tablero(){
           
        return $this->render('tableBoots.html.twig', ['jugadores_partida_tablero' => json_decode(stripslashes($_POST['hidden_jugadores'])), 'id_jugadores_partida' => json_decode(stripslashes($_POST['hidden_id_jugadores']))]);
    }
    /**
     * @Route("/contacto", name="contacto")
     */
    public function contacto()
    {   
        
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

            $usuario = $repository->findUserByEmailPass($_POST['email'], md5($_POST['password']));

            $_SESSION[$usuario -> getNickname()] = $usuario;

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
                $jugador_actualizado->setSaldoPartida($jugador_actualizado->getSaldoPartida()+1000);
                if (($casilla_vieja + $_POST['dado'])==21) {
                    
                    $casilla_nueva = $repository2 -> findCasillaById(1);
                    
                } else {
                    $dado = $_POST['dado'];
                    $resultado_vuelta_completa = (20 - $casilla_vieja);
                    $casilla_nueva = $dado - $resultado_vuelta_completa;

                    $casilla_nueva = $repository2 -> findCasillaById($casilla_nueva - 1);
                }

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
     * @Route("/actualizar_saldo_jugador", name="actualizarSaldoJugador")
     */
    public function actualizar_saldo_jugador(){
        $entityManager = $this->getDoctrine()->getManager();
        $repository1 = $this->getDoctrine()->getRepository(User::class);

        $nuevo_usuario = $repository1->findOneById($_POST['jugador']);
        if ($_POST['actualizar']=="sumar") {

            $nuevo_usuario->setSaldoPartida($nuevo_usuario->getSaldoPartida() + $_POST['cantidad']);

            if (isset($_POST['id_jugadores_partida'])) { //Si nos han pasado los jugadores de la partida es porque se va a hacer una transferencia de los demas jugadores

                foreach ($_POST['id_jugadores_partida'] as $key => $value) {//Recorremos todos los jugadores de la partida

                   if ($value!=$_POST['jugador']) {//Cada uno que no sea el jugador actual que ha caido en la casilla recibira o perdera una cantidad

                    $usuario_traspaso = $repository1->findOneById($value);

                    $usuario_traspaso->setSaldoPartida($usuario_traspaso->getSaldoPartida() - 500);

                    $entityManager->merge($usuario_traspaso);

                    $entityManager->flush();

                   }

                }

            }
        }
        if ($_POST['actualizar']=="restar") {
            $nuevo_usuario->setSaldoPartida($nuevo_usuario->getSaldoPartida() - $_POST['cantidad']);

            if (isset($_POST['id_jugadores_partida'])) {//Si nos han pasado los jugadores de la partida es porque se va a hacer una a los demas jugadores

                foreach ($_POST['id_jugadores_partida'] as $key => $value) {//Recorremos todos los jugadores de la partida

                   if ($value!=$_POST['jugador']) {//Cada uno que no sea el jugador actual que ha caido en la casilla recibira o perdera una cantidad

                    $usuario_ingreso = $repository1->findOneById($value);

                    $usuario_ingreso->setSaldoPartida($usuario_ingreso->getSaldoPartida() + 500);

                    $entityManager->merge($usuario_ingreso);
                    
                    $entityManager->flush();
                   }
                }
            }
        }

        $entityManager->merge($nuevo_usuario);

        $entityManager->flush();

        return $this->json(['saldo_actualizado' => $nuevo_usuario->getSaldoPartida()]);//ESTO NO HACE FALTA

    }

    /**
     * @Route("/actualizar_info_jugadores", name="actualizarInfoJugadores")
     */
    public function actualizar_info_jugadores(){//Metodo que obtiene los datos que nos interesan de todos los jugadores que esten en la partida y los devuelve ya actualizados
        
        $repository = $this->getDoctrine()->getRepository(User::class);
        
        foreach ($_POST['datos_jugadores'] as $key => $value) {
            $usuario = $repository->findOneById($value['id']);
            $datos_jugadores_actualizados[$key]['id'] = $usuario->getId();
            $datos_jugadores_actualizados[$key]['nickName'] = $usuario->getNickname();
            $datos_jugadores_actualizados[$key]['Saldo'] = $usuario->getSaldoPartida();
        }
 
        return $this->json(['info_jugadores' => $datos_jugadores_actualizados]);


    }
    /**
     * @Route("/comprobar_propietario", name="comprobarPropietario")
     */
    public function comprobar_propietario(){
        
        $repository = $this->getDoctrine()->getRepository(TituloPropiedad::class);
        $repository2 = $this->getDoctrine()->getRepository(User::class);
        
        
        $tituloPropiedad = $repository->findTituloById($_POST['id_casilla']);
        $usuario_actual = $repository2->findOneById($_POST['jugador']);
        
            if ($tituloPropiedad->getUsuario()==NULL) {

                return $this->json(['info_jugadores' => "no"]);

            } else {

                if ($usuario_actual->getId() == $tituloPropiedad->getUsuario()->getId()) {
                    return $this->json(['info_jugadores' => 'yes', 'mismo_propietario' => true]);
                } else {
                    return $this->json(['info_jugadores' => 'yes', 'mismo_propietario' => false, 'propietario' => $tituloPropiedad->getUsuario()->getId()]);
                }
                
            }
        
    }

    /**
     * @Route("/comprar_titulo_propiedad", name="comprarTituloPropiedad")
     */
    public function comprar_titulo_propiedad(){

            $repository = $this->getDoctrine()->getRepository(TituloPropiedad::class);
            $repository2 = $this->getDoctrine()->getRepository(User::class);
        
            $tituloPropiedad = $repository->findTituloById($_POST['id_casilla']);
            $usuario_actual = $repository2->findOneById($_POST['jugador']);


            $tituloPropiedad->setUsuario($usuario_actual);

            $entityManager = $this->getDoctrine()->getManager();

            $entityManager->merge($tituloPropiedad);
                    
            $entityManager->flush();
            
            return $this->json(['grupo' => $tituloPropiedad->getGrupo(), 'nombre_propiedad' => $tituloPropiedad->getNombre()]);
        
    }
    /**
     * @Route("/actualizar_propiedades", name="actualizarPropiedades")
     */
    public function actualizar_propiedades(){

        

        $repository = $this->getDoctrine()->getRepository(User::class);
    
        $usuario_actual = $repository->findOneById($_POST['jugador']);

        foreach ($usuario_actual->getTituloPropiedads() as $key => $value) {

            $datos_propiedades_jugados_actual[$key][0]=$value->getNombre();

            $datos_propiedades_jugados_actual[$key][1]=$value->getGrupo();
            
        }
        
        return $this->json(['datos_propiedades_jugados_actual' => $datos_propiedades_jugados_actual]);
    
    }

    /**
     * @Route("/edificar_propiedades", name="edificar_propiedades")
     */
    public function edificar_propiedades(){

        $repository = $this->getDoctrine()->getRepository(TituloPropiedad::class);
        $repository2 = $this->getDoctrine()->getRepository(User::class);

        $tituloPropiedad = $repository->findTituloByName($_POST['propiedad_marcada']);
        $jugador_turno = $repository2->findOneById($_POST['jugador']);

        if ($jugador_turno->getSaldoPartida() >= $tituloPropiedad->getPrecioEdificar()) {

            if ($_POST['jugador'] != $tituloPropiedad->getUsuario()->getId()) {//Si el jugador que ha solicitado edificar no es el propietario no podra edificar

                return $this->json(['respuesta' => "nopropietario"]);

            } else {

                $entityManager = $this->getDoctrine()->getManager();

                if (($tituloPropiedad->getNumCasas()<4) && ($tituloPropiedad->getNumHoteles()<=2)) {
    
                    $tituloPropiedad->setNumCasas($tituloPropiedad->getNumCasas()+1);
                    
                    $nombre_casilla = $tituloPropiedad -> getCasilla()->getNombre();

                    $jugador_turno->setSaldoPartida($jugador_turno->getSaldoPartida() - $tituloPropiedad->getPrecioEdificar());
    
                    $entityManager->merge($tituloPropiedad);
    
                    $entityManager->flush();
                    
                    return $this->json(['respuesta' => "casa", 'id_casilla' => $nombre_casilla]);
                }

                if ( ( $tituloPropiedad->getNumCasas()==4 ) && ( $tituloPropiedad->getNumHoteles()<2 ) ) {

                    $tituloPropiedad->setNumCasas(0);

                    $tituloPropiedad->setNumHoteles( $tituloPropiedad->getNumHoteles() + 1 );

                    $jugador_turno->setSaldoPartida($jugador_turno->getSaldoPartida() - $tituloPropiedad->getPrecioEdificar());
                    
                    $nombre_casilla = $tituloPropiedad -> getCasilla()->getNombre();
    
                    $entityManager->merge($tituloPropiedad);
    
                    $entityManager->flush();
                    
                    return $this->json(['respuesta' => "hotel", 'id_casilla' => $nombre_casilla]);
                }

                if (($tituloPropiedad->getNumCasas()==4 ) && ($tituloPropiedad->getNumHoteles()==2)) {
                    
                    return $this->json(['respuesta' => "noedificarmas"]);

                }

            }

            
            
        } else {
            return $this->json(['respuesta' => "nosaldo"]);
        }

        
    
    }

    /**
     * @Route("/pagar_alquiler", name="pagarAlquiler")
     */
    public function pagar_alquiler(){

        $repository = $this->getDoctrine()->getRepository(User::class);
        $repository2 = $this->getDoctrine()->getRepository(TituloPropiedad::class);
    
        $usuario_actual = $repository->findOneById($_POST['jugador_actual']);
        $propietario_casilla = $repository->findOneById($_POST['propietario_calle']);
        $titulo_propiedad = $repository2->findTituloById($_POST['id_casilla']);

        $alquiler = ( $titulo_propiedad->getAlquilerBase()) + ( $titulo_propiedad->getPrecioEdificar() * ($titulo_propiedad->getNumCasas() + $titulo_propiedad->getNumHoteles() ) );
        $usuario_actual -> setSaldoPartida($usuario_actual->getSaldoPartida()-$alquiler);
        $propietario_casilla -> setSaldoPartida( $propietario_casilla->getSaldoPartida() + $alquiler );

        $entityManager = $this->getDoctrine()->getManager();

        $entityManager->merge($usuario_actual);

        $entityManager->merge($propietario_casilla);
    
        $entityManager->flush();
        
        return $this->json(['resultado_operacion' => "correcto"]);
    
    }

    /**
     * @Route("/vender_titulo_propiedad", name="venderTituloPropiedad")
     */
    public function vender_titulo_propiedad(){

        $repository = $this->getDoctrine()->getRepository(User::class);
        $repository2 = $this->getDoctrine()->getRepository(TituloPropiedad::class);
    
        $propietario_casilla = $repository->findOneById($_POST['jugador']);
        $titulo_propiedad = $repository2->findTituloByName($_POST['nombre_casilla']);

        $precio_venta = ( $titulo_propiedad->getPrecioCompra() + ( ( $titulo_propiedad->getPrecioEdificar() * ($titulo_propiedad->getNumCasas() + $titulo_propiedad->getNumHoteles() ) ) * $titulo_propiedad->getFactorRevalorizacion() ) );

        $propietario_casilla -> setSaldoPartida( $propietario_casilla->getSaldoPartida() + $precio_venta );
        $titulo_propiedad->setUsuario(NULL);
        $titulo_propiedad->setNumCasas(0);
        $titulo_propiedad->setNumHoteles(0);

        $entityManager = $this->getDoctrine()->getManager();

        $entityManager->merge($propietario_casilla);
        $entityManager->merge($titulo_propiedad);
    
        $entityManager->flush();
        
        return $this->json(['resultado_operacion' => "correcto"]);
    
    }
    /**
     * @Route("/ganador_perdedor", name="ganadorPerdedor")
     */
    public function ganador_perdedor(){

        $repository = $this->getDoctrine()->getRepository(User::class);
    
        $usuario = $repository->findOneById($_POST['jugador']);

        if ($usuario->getSaldoPartida() <= 0) {
            $usuario2 = $repository->findOneById($_POST['array_jugadores'][0]);
            $max = $usuario2->getSaldoPartida();
            foreach ($_POST['array_jugadores'] as $key => $value) {
                $usuario3 = $repository->findOneById($value);
               if ($usuario3->getSaldoPartida()>$max) {
                return $this->json(['bancarrota' => "si" , 'jugador_ganador' => $usuario3->getNombre()]);
               }
            }
        }
        
        return $this->json(['bancarrota' => "no"]);
    
    }


}
