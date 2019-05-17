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
var fichas = ['imagenes/sombrero-ficha.png', 'imagenes/perro.png', 'imagenes/coche-ficha.png' , 'imagenes/bota.png'];
var casilla=1;
var jugador_actual;//Este es el id del jugador que esta actuando en cada turno para futuros usos



//Cada vez que se pase de turno o se inicie la partida el numero aumentará
function sumar_Turno () {
        turnos = turnos + 1;
        $('#numeroTurno p').text('Turno nº '+ turnos);
}
//Metodo para mezclar los jugadores al inicio de la partida
function mezclar_Jugadores () {
        // console.log(jugadores_partida);
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
            jugador_actual=id_jugadores_partida[i];//Guardamos el id del jugador que esta actuando en cada turno para futuros usos
            console.log('El jugador que se esta moviendo es: ' + jugador_actual);
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
                    // $('#'+casillas_tablero[response.casilla_actualizada]).addClass( "bg-primary" ); 
                    switch (turno_jugador) {
                        case 0:
                            $('#ficha_jugador1').remove();
                            $('#'+casillas_tablero[response.casilla_actualizada]).children().eq(1).append('<img id="ficha_jugador1" class="ficha" src="'+fichas[0]+'">');
                            break;
                        case 1:

                            $('#ficha_jugador2').remove();
                            $('#'+casillas_tablero[response.casilla_actualizada]).children().eq(1).append('<img id="ficha_jugador2" class="w-50 ficha" src="'+fichas[1]+'">');
                            break;
                        case 2:
                            $('#ficha_jugador3').remove();
                            $('#'+casillas_tablero[response.casilla_actualizada]).children().eq(2).append('<img id="ficha_jugador3" class="ficha" src="'+fichas[2]+'">');
                            break;
                        case 3:
                            $('#ficha_jugador4').remove();
                            $('#'+casillas_tablero[response.casilla_actualizada]).children().eq(2).append('<img id="ficha_jugador4" class="ficha" src="'+fichas[3]+'">');
                            break;  
                        default:
                            break;
                    }
                     
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
            
            console.log(response);
            //Comprobamos el tipo de la casilla
            switch (response.tipo_casilla) {

            case 'sorpresa': 

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

                } else {//Si siguen quedando cartas en la baraja
                    switch (baraja_cartas[(baraja_cartas.length-1)][1]) {

                        case 'Te desplazas a la casilla de inicio':
                            id_ficha = turno_jugador + 1;
                            if (turno_jugador==0 || turno_jugador==1) {
                                console.log($('#ficha_jugador'+(id_ficha)).remove());
                                console.log($('#inicio').children().eq(1).append('<img id="ficha_jugador'+id_ficha+'" class="ficha" src="'+fichas[turno_jugador]+'">'));
                            }else{
                                console.log($('#ficha_jugador'+(id_ficha+1)).remove());
                                console.log($('#inicio').children().eq(2).append('<img id="ficha_jugador'+id_ficha+'" class="ficha" src="'+fichas[turno_jugador]+'">'));
                            }

                            $.ajax({//Aqui se actualiza la posicion del usuario a la casilla de inicio en la base de datos para poder seguir moviendote
                       
                                type: 'POST',
        
                                url:'/actualizar_posicion_tablero',

                                data: {
                                    posicion: 1, //Esta es la posicion a la que se va a mover
                                    jugador: jugador_actual//Este es el jugador que esta en cada turno
                                },
                            });
                            break;

                        case 'Recibes 1500 euros':
                            $.ajax({
                        
                                type: 'POST',
        
                                url:'/actualizar_saldo_jugador',

                                data: {
                                    actualizar:"sumar",
                                    cantidad:1500,
                                    jugador: jugador_actual//Este es el jugador que esta en cada turno
                                },
                            });
                            break;

                        case 'Le pagas a la banca 1500 euros':
                            $.ajax({
                            
                                type: 'POST',
        
                                url:'/actualizar_saldo_jugador',

                                data: {
                                    actualizar:"restar",
                                    cantidad:1500,
                                    jugador: jugador_actual//Este es el jugador que esta en cada turno
                                },success (response) {
                                    //Aqui actualizaremos el saldo en las casillas correspondientes
                                }
                            });
                            break;

                        case 'Vas a la cárcel':
                            id_ficha = turno_jugador + 1;
                            if (turno_jugador==0 || turno_jugador==1) {
                                console.log($('#ficha_jugador'+(id_ficha)).remove());
                                console.log($('#injail').children().eq(1).append('<img id="ficha_jugador'+id_ficha+'" class="ficha" src="'+fichas[turno_jugador]+'">'));
                            }else{
                                console.log($('#ficha_jugador'+(id_ficha+1)).remove());
                                console.log($('#injail').children().eq(2).append('<img id="ficha_jugador'+id_ficha+'" class="ficha" src="'+fichas[turno_jugador]+'">'));
                            }

                            $.ajax({//Aqui se actualiza la posicion del usuario a la casilla de carce en la base de datos para poder seguir moviendote
                       
                                type: 'POST',
        
                                url:'/actualizar_posicion_tablero',

                                data: {
                                    posicion: 6,//Esta es la posicion a la que se va a mover
                                    jugador: jugador_actual//Este es el jugador que esta en cada turno
                                },success (response) {
                                    //Aqui actualizaremos el saldo en las casillas correspondientes
                                }
                            });
                            
                            
                            break;
                    
                        default:
                            break;
                    }
                    console.log('Ha salido:'+baraja_cartas[(baraja_cartas.length-1)][1]);
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
            var contenedor_principal = $('#contenedor_principal');
            var padre = $(this);
            var padre_del_padre = $(this).parent();
            var hijosFormulario = $(this).children().first().children();
            var email=hijosFormulario.children().eq(0).val();
            var pass=hijosFormulario.children().eq(1).val();
            $.ajax({
            type: 'POST',
            url:'/logeoAjax',
            data: {
                    email:email,
                    password:pass
            },success:function(response) {
                    console.log(response);
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
                    // contenedor_principal.append('<input id="comenzar_partida" class="logueoJugador btn btn-lg btn-success btn-block" type="submit" name="empezar_partida" value="Ir a la partida">');
                    $("#comenzar_partida").prop('disabled', false);
                    
                    // contenedor_principal.append('<button type="button" id="comenzar_partida" class="logueoJugador w-100 btn btn-success">Ir a la partida</button>');
            }

            });

        });

        $('#comenzar_partida').click(function(){
            $('#hidden_jugadores').val(JSON.stringify( jugadores_partida ));
            $('#hidden_id_jugadores').val(JSON.stringify( id_jugadores_partida ));
        });



        $('#start_button').click(function() {
            jugadores_partida = myFunc();
            id_jugadores_partida = myFunc2();
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
                        if (jugadores_mezclados[0]) {
                            $('#inicio').children().eq(1).append('<img id="ficha_jugador1" class="w-25 ficha" src="'+fichas[0]+'">');
                        }
                        if (jugadores_mezclados[1]) {
                            $('#inicio').children().eq(1).append('<img id="ficha_jugador2" class="w-25 ficha" src="'+fichas[1]+'">');
                        }
                        if (jugadores_mezclados[2]) {
                            $('#inicio').children().eq(2).append('<img id="ficha_jugador3" class="w-50 ficha" src="'+fichas[2]+'">');
                        }
                        if (jugadores_mezclados[3]) {
                            $('#inicio').children().eq(2).append('<img id="ficha_jugador4" class="w-25 ficha" src="'+fichas[3]+'">');
                        }
                       
                        
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