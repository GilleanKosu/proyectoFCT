var jugadores_partida = [];
var id_jugadores_partida = [];
var jugadores_mezclados = [];
var aux_jugadores = [];
var turnos = 0;
var turno_jugador = -1;
var casillas_tablero = [];
var baraja_cartas = [];
var caras_dado = 0;
var tirada_dado= 0;
//Cada vez que se pase de turno o se inicie la partida el numero aumentará
function sumar_Turno () {
        turnos = turnos + 1;
        $('#numeroTurno p').text('Turno nº '+ turnos);
}
//Metodo para mezclar los jugadores al inicio de la partida
function mezclar_Jugadores () {
                        
        //Esta es la unica forma de clonar relativamente buena en javascript, se guardan los jugadores en un array auxiliar
                //para posteriormente mezclarlos en otro
        for (i = 0; i < jugadores_partida.length; i++){

                aux_jugadores [i] = jugadores_partida [i];
        }
                        
        for (i = 0; i < jugadores_partida.length; i++) {
                var orden_aleatorio = (Math.floor(Math.random() * aux_jugadores.length));
                jugadores_mezclados[i]=aux_jugadores[orden_aleatorio];
                aux_jugadores.splice(orden_aleatorio, 1);
        }
        // console.log(jugadores_mezclados);
                        
}
function siguiente_jugador() {

        if(turno_jugador<(jugadores_partida.length-1)) {

                turno_jugador += 1;

        } else {

                turno_jugador = 0;

        }
        
        $('#jugadorTurno').text('Turno del jugador: ' + jugadores_mezclados[turno_jugador]);
}
function lanzar_dado () {
                   
    tirada_dado = Math.floor((Math.random()*caras_dado) +1);

}
function mover_jugador(valor_cara) {

    for (var i = 0; i < jugadores_partida.length; i++) {
        if (jugadores_mezclados[turno_jugador] == jugadores_partida [i]) {
            $.ajax({
                type: 'POST',
                url:'/actualizar_movimiento',
                data: {
                    jugador: id_jugadores_partida[i],
                    dado: tirada_dado,
                },success:function(response) {//Movimiento en la casilla
                    // console.log(response.casilla_antigua);//Casilla antes del movimiento
                    // console.log(response.casilla_actualizada);//Casilla despues del movimiento
                    // console.log(casillas_tablero[response.casilla_actualizada]);//Nombre de esa casilla
                    $('#'+casillas_tablero[response.casilla_actualizada]).addClass( "bg-primary" ); 
                    console.log(response.casilla_antigua);
                    console.log(response.casilla_actualizada);
                    comprobar_casilla(response.casilla_actualizada);
                }
            });
        }
    }

                    
}

function comprobar_casilla(casilla_actual) {//Con este metodo una vez tiremos el dado, comprobaremos el tipo de la casilla en la que vamos a caer y 
                                                //realizaremos ciertas acciones segun cada tipo
    $.ajax ({

        type: 'POST',

        url:'/devolver_tipo_casilla',

        data: {

            id_casilla: casilla_actual

        },success:function(response) {

            //Comprobamos el tipo de la casilla
            switch (response.tipo_casilla) {

            case 'Sorpresa': 

                if (baraja_cartas.length==0) {//Comprobamos que si la baraja de cartas esta vacia

                    $.ajax({ //En el caso de que lo esté, tendremos que obtener todas las cartas y rebarajar
                       
                        type: 'POST',

                        url:'/recargar_baraja',

                        success:function(response){

                            console.log('Rebarajando');

                            baraja_cartas = response.lista_cartas;

                            console.log(baraja_cartas);

                        }
                    });

                    baraja_cartas.splice(-1,1);//Sacamos la ultima carta
                    console.log(baraja_cartas);

                } else {//Si siguen quedando cartas

                    baraja_cartas.splice(-1,1);//Sacamos la ultima carta
                    console.log(baraja_cartas);

                }

                break;
            }

        }
    });
}

(function () {
    $(function() {
        $('#end_turn_button, #roll_dice_button, #buy_button, #sell_button').hide();
        
        $('.logueoJugador').submit(function(evento){
            evento.preventDefault();
            var padre = $(this);
            var padre_del_padre = $(this).parent();
            var hijosFormulario = $(this).children();
            var email=hijosFormulario.eq(0).val();
            var pass=hijosFormulario.eq(1).val();
            $.ajax({
            type: 'POST',
            url:'/logeoAjax',
            data: {
                    email:email,
                    password:pass
            },success:function(response) {
                    padre.remove();
                    var aux_log = [];
                    aux_log['nickname'] = response.nickname;
                    aux_log['id'] = response.id;
                    jugadores_partida.push(aux_log['nickname']);
                    id_jugadores_partida.push(aux_log['id']);
                    // console.log(jugadores_partida);
                    // console.log(id_jugadores_partida);
                    //console.log(aux_jugadores);
                    padre_del_padre.append('<p>'+response.nickname+'</p>');
            }

            });

        });

        $('#start_button').click(function() {
            $.ajax({
                type: 'POST',
                url:'/crearPartida',
                data: {
                    array_jugadores: id_jugadores_partida,
                },
                success:function(response) {
                        console.log(response);
                        casillas_tablero = response.lista_casillas;
                        baraja_cartas = response.lista_cartas;
                        caras_dado=response.caras_dado;
                        // console.log(casillas_tablero);
                }
                });
                sumar_Turno();
                mezclar_Jugadores();
                siguiente_jugador();
                $(this).hide();
                $('#end_turn_button, #roll_dice_button').show();
            });

        $('#end_turn_button').click(function() {
            sumar_Turno();
            siguiente_jugador();
        });
        $('#roll_dice_button').click(function() {
            lanzar_dado();
            mover_jugador();
        });




    });
        
}(jQuery));