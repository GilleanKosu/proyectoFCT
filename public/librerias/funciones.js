var jugadores_partida = [];
var id_jugadores_partida = [];
var jugadores_mezclados = [];
var array_datos_jugadores;
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
var casilla_actual_jugador;
var propiedades_edificar = [];

function rollDiceWithoutValues() {
    const element = document.getElementById('dice-box1');
    const numberOfDice = 1;
    const options = {
      element, // element to display the animated dice in.
      numberOfDice, // number of dice to use 
      callback: lanzar_dado
    }
    rollADie(options);
}



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
        $('#jugadorTurno').children().remove();
        $('#jugadorTurno').append('<p>Turno del jugador: <b style="color:red;">' + jugadores_mezclados[turno_jugador] + '</b></p>');
}
function lanzar_dado (resultado_tirada) {
    
    // tirada_dado = Math.floor((Math.random()*caras_dado) +1);//FORMA ANTIGUA
    tirada_dado = Math.floor(resultado_tirada);

    // $('#mensaje_dado').text("Has sacado un: " + resultado_tirada);

    // $('#dado').show();

    // $('#dado').dialog({
    //     width: 250,
    //     height: 150,
    //     resizable: false,
    // });

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
                    casilla_actual_jugador=response.casilla_actualizada;
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
                            $('#'+casillas_tablero[response.casilla_actualizada]).children().eq(1).append('<img id="ficha_jugador2" class="ficha" src="'+fichas[1]+'">');
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
                    actualizar_datos_usuario();
                    actualizar_propiedades();
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
                    $('#mensaje_suerte').text(baraja_cartas[(baraja_cartas.length-1)][1]);

                    $('#carta_suerte').show();

                    $('#carta_suerte').dialog({
                        width: 250,
                        height: 150,
                        resizable: false,
                    });
                    console.log(baraja_cartas);
                    actualizar_datos_usuario();
                    

                } else {//Si siguen quedando cartas en la baraja

                    $('#mensaje_suerte').text(baraja_cartas[(baraja_cartas.length-1)][1]);

                    $('#carta_suerte').show();
                    $('#carta_suerte').dialog({
                        width: 250,
                        height: 150,
                        resizable: false,
                    });
                    

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
                                    ganador_perdedor();
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

                        case 'El jugador paga 500 euros de cada jugador':
                        
                        $.ajax({
                            
                            type: 'POST',
    
                            url:'/actualizar_saldo_jugador',

                            data: {
                                actualizar:"restar",
                                cantidad:1500,
                                jugador: jugador_actual,
                                id_jugadores_partida:id_jugadores_partida
                            },success (response) {
                                //Aqui actualizaremos el saldo en las casillas correspondientes
                                ganador_perdedor();
                            }
                        });

                        
                        break;

                        case 'El jugador recibe 500 euros de cada jugador':
                        
                        $.ajax({
                            
                            type: 'POST',
    
                            url:'/actualizar_saldo_jugador',

                            data: {
                                actualizar:"sumar",
                                cantidad:1500,
                                jugador: jugador_actual,
                                id_jugadores_partida:id_jugadores_partida
                            },success (response) {
                                //Aqui actualizaremos el saldo en las casillas correspondientes
                            }
                        });

                        
                        break;
                        
                        case 'Sal de la cárcel':
                        
                        $.ajax({
                            
                            type: 'POST',
    
                            url:'/actualizar_saldo_jugador',

                            data: {
                                actualizar:"sumar",
                                cantidad:1500,
                                jugador: jugador_actual,
                                id_jugadores_partida:id_jugadores_partida
                            },success (response) {
                                //Aqui actualizaremos el saldo en las casillas correspondientes
                            }
                        });

                        
                        break;
                    
                        default:
                            break;
                    }
                    actualizar_datos_usuario();
                    console.log('Ha salido:'+baraja_cartas[(baraja_cartas.length-1)][1]);
                    baraja_cartas.splice(-1,1);//Sacamos la ultima carta
                    console.log(baraja_cartas);

                }

                break;

            case "calle":
                    $.ajax({
                        type: 'POST',
                        url:'/comprobar_propietario',
                        data: {
                                id_casilla:casilla_actual,
                                jugador: jugador_actual
                        },success:function(response) {
                            console.log(response);
                            if (response.info_jugadores=="no") {//Si no tiene propietario

                                $('#buy_button').show();

                            } else {
                                if (response.info_jugadores=="yes" && response.mismo_propietario==true) { //Si tiene propietario pero y es el jugador actual
                                    $('#sell_button').show();
                                    $('#construct_button').show();
                                }
                                if (response.info_jugadores=="yes" && response.mismo_propietario==false) { //Si tiene propietario pero no es el jugador actual
                                    
                                    pagar_alquiler(response.propietario, casilla_actual);
                                    //PAGAR DINERO
                                    actualizar_datos_usuario();
                                    ganador_perdedor();
                                }
                            }
                            
                        }
                
                    });
                break;
            case "impuesto":
                    $.ajax({
                            
                        type: 'POST',

                        url:'/actualizar_saldo_jugador',

                        data: {

                            actualizar:"restar",
                            cantidad:1000,
                            jugador: jugador_actual,
                            id_jugadores_partida:id_jugadores_partida

                        },success () {

                            $('#mensaje_impuesto').text("Le pagas 1000 a la banca");

                            $('#impuestos').show();

                            $('#impuestos').dialog({
                                width: 250,
                                height: 150,
                                resizable: false,
                            });

                            actualizar_datos_usuario();
                            ganador_perdedor();
                            
                        }
                    });
                break;
            // case "inicio":
            //         $.ajax({
                            
            //             type: 'POST',

            //             url:'/actualizar_saldo_jugador',

            //             data: {

            //                 actualizar:"sumar",
            //                 cantidad:1500,
            //                 jugador: jugador_actual,
            //                 id_jugadores_partida:id_jugadores_partida

            //             },success () {

            //                 $('#mensaje_init').text("Ha vuelto a pasar por el inicio y recibes 1500");

            //                 $('#init').show();

            //                 $('#init').dialog({
            //                     width: 250,
            //                     height: 150,
            //                     resizable: false,
            //                 });

            //                 actualizar_datos_usuario();
                            
            //             }
            //         });
            //     break;
            }

        }
    });
}

function pagar_alquiler(prop, cas) {
    $.ajax({
        type: 'POST',
        url:'/pagar_alquiler',
        data: {
            jugador_actual: jugador_actual,
            propietario_calle: prop,
            id_casilla:cas,
        },success:function(response) {
            console.log(response);
            actualizar_datos_usuario();
        }

    });
    
}

function actualizar_datos_usuario () {
    $.ajax({
        type: 'POST',
        url:'/actualizar_info_jugadores',
        data: {
                datos_jugadores:array_datos_jugadores,
        },success:function(response) {
            console.log("respuesta actualizar datos usuario");
            array_datos_jugadores=response.info_jugadores;
            if (response.info_jugadores[0]) {
                $('#dinero_jugador_rojo').children().first().text('$ '+response.info_jugadores[0].Saldo);
            }
            if (response.info_jugadores[1]) {
                $('#dinero_jugador_amarillo').children().first().text('$ '+response.info_jugadores[1].Saldo);
            }
            if (response.info_jugadores[2]) {
                $('#dinero_jugador_verde').children().first().text('$ '+response.info_jugadores[2].Saldo);
            }
            if (response.info_jugadores[3]) {
                $('#dinero_jugador_azul').children().first().text('$ '+response.info_jugadores[3].Saldo);
            }
        }

    });
}
function actualizar_propiedades () {
    $.ajax({
        type: 'POST',
        url:'/actualizar_propiedades',
        data: {
            jugador: jugador_actual
        },success:function(response) {
            
           console.log('propiedades');
           
        //    $('#propiedades_jugador').children().remove();
        $('#propiedades_jugador').children().remove();
           for (i = 0; i < response.datos_propiedades_jugados_actual.length; i++) {
               
                // console.log(response.datos_propiedades_jugados_actual[i][1]);
                
                console.log(response.datos_propiedades_jugados_actual[i]);
                switch (response.datos_propiedades_jugados_actual[i][1]) {
                    case "verde":
                        $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-success probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.datos_propiedades_jugados_actual[i][0]+'</p></div></div>');
                        break;
                    case "rojo":
                        $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-danger probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.datos_propiedades_jugados_actual[i][0]+'</p></div></div>');
                        break;
                    case "amarilla":
                        $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-warning probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.datos_propiedades_jugados_actual[i][0]+'</p></div></div>');
                        break;
                    case "azul":
                        $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-primary probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.datos_propiedades_jugados_actual[i][0]+'</p></div></div>');
                        break;
                    
                    default:
                        alert('Ninguna propiedad de ese grupo')
                        break;
    
                    
                }
               
           }
           
        }, error: function () {
            $('#propiedades_jugador').children().remove();
          }
        

    });
}

function comprar_titulo_propiedad() {
    $.ajax({
        type: 'POST',
        url:'/comprar_titulo_propiedad',
        data: {
                id_casilla:casilla_actual_jugador,
                jugador: jugador_actual
        },success:function(response) {
            console.log("respuesta compra");
            console.log(response);
            $('#buy_button').hide();
            switch (response.grupo) {
                case "verde":
                    $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-success probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.nombre_propiedad+'</p></div></div>');
                    break;
                case "rojo":
                    $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-danger probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.nombre_propiedad+'</p></div></div>');
                    break;
                case "amarilla":
                    $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-warning probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.nombre_propiedad+'</p></div></div>');
                    break;
                case "azul":
                    $('#propiedades_jugador').append('<div class="row padreMierda"><div class="bg-primary probandoMierda"></div><div class="h-100 bg-light probandoMierda2"><p>'+response.nombre_propiedad+'</p></div></div>');
                    break;
                
                default:
                    alert('No se puede comprar esa propiedad')
                    break;

                
            }
           $('#construct_button').show();
           $('buy_button').hide();

        }, error:function() {
            $('#mensaje_errores').text("No se puede comprar esa propiedad");
                $('#errores').show();
                $('#errores').dialog({
                    width: 200,
                    height: 300,
                    resizable: false,
                });
        }

    });
}

function vender_propiedades () {

    var propiedad_seleccionada = $('.seleccionado');

    if (propiedad_seleccionada.length >1) {

        alert("No se puede marcar mas de 1 propiedad para vender");

    } else if (propiedad_seleccionada.length == 0) {

        alert("Debe marcar al menos 1 propiedad");

    } else {
        propiedad_seleccionada = propiedad_seleccionada.children().eq(1).children().eq(0).text();

        $.ajax({

            type: 'POST',
            url:'/vender_titulo_propiedad',
            data: {
                    nombre_casilla:propiedad_seleccionada,
                    jugador: jugador_actual
            },success:function(response) {
                actualizar_datos_usuario();
                actualizar_propiedades();
            }, error:function() {
                $('#mensaje_errores').text("No se puede vender esa propiedad");
                $('#errores').show();
                $('#errores').dialog({
                    width: 200,
                    height: 300,
                    resizable: false,
                });
            }
    
        });
    }
}
function edificar_propiedades () {
    propiedad_marcada = $('.seleccionado');
    if (propiedad_marcada.length <1 || propiedad_marcada.length >1) {
        alert('Marca solo una propiedad')
        //Para edificar necesitas tener marcada de una propiedad solo
    } else {
        $.ajax({        
                
            type: 'POST',

            url:'/edificar_propiedades',

            data: {

                propiedad_marcada: propiedad_marcada.children().eq(1).children().eq(0).text(),

                jugador: jugador_actual,

            },success:function(response) {
                console.log(response);
                if (response.respuesta == "casa") {

                    if (response.grupo_casilla == "amarilla") {
                        $('#'+response.id_casilla).parent().children().eq(1).append('<img class="casa w-50" src="imagenes/casa.png">');
                    } else {
                        if (response.grupo_casilla == "rojo") {
                            $('#'+response.id_casilla).parent().children().eq(0).append('<img class="casa w-50" src="imagenes/casa.png">');
                        } else {
                            $('#'+response.id_casilla).parent().children().eq(0).append('<img class="casa" src="imagenes/casa.png">');
                        }
                       
                    }

                }
                if (response.respuesta == "hotel") {

                    if (response.grupo_casilla == "amarilla") {
                        $('#'+response.id_casilla).parent().children().eq(1).find('.casa').remove();

                        $('#'+response.id_casilla).parent().children().eq(1).append('<img class="hotel w-50" src="imagenes/hotel.png">');
                    } else {
                        
                        if (response.grupo_casilla == "rojo") {
                            $('#'+response.id_casilla).parent().children().eq(0).find('.casa').remove();

                            $('#'+response.id_casilla).parent().children().eq(0).append('<img class="hotel w-50" src="imagenes/hotel.png">');
                        } else {
                            $('#'+response.id_casilla).parent().children().eq(0).find('.casa').remove();

                            $('#'+response.id_casilla).parent().children().eq(0).append('<img class="hotel" src="imagenes/hotel.png">');
                        }

                        
                    }

                    

                }
                if (response.respuesta == "nosaldo") {

                    alert("No tienes suficiente saldo para edificar propiedades");

                }
                if (response.respuesta == "nopropietario") {

                    alert("No puedes edificar en una propiedad que no te pertenece");

                }
                if (response.respuesta == "noedificarmas") {

                    alert("No se puede edificar mas");

                }

                actualizar_datos_usuario();
            },error:function() {
                $('#mensaje_errores').text("No se puede edificar esa propiedad");
                $('#errores').show();
                $('#errores').dialog({
                    width: 200,
                    height: 300,
                    resizable: false,
                });
            }

        });
    }
}

function ganador_perdedor() {
    $.ajax({

        type: 'POST',
        url:'/ganador_perdedor',
        data: {
                jugador: jugador_actual,
                array_jugadores: id_jugadores_partida
        },success:function(response) {

            if (response.bancarrota == "si") {
                $('#mensaje_winner').text("El ganador es: " + response.jugador_ganador);
                $('#winner').show();
                $('#winner').dialog({
                    width: 200,
                    height: 300,
                    resizable: false,
                });
            }
            

        }

    });
}




(function () {
    $(function() {
        
        //Eventos para marcar las propiedades compradas
        $(document).on('click', '.probandoMierda2', function() {
            $(this).parent().css("margin-left", "10px"); 
            $(this).parent().addClass( "seleccionado" );
        });
        
        $(document).on('dblclick', '.probandoMierda2', function() {
            $(this).parent().css("margin-left", "-15px");
            $(this).parent().removeClass("seleccionado"); 
        });

        //Los botones estan ocultos al principio de la partida
        $('#end_turn_button, #roll_dice_button, #buy_button, #sell_button, #construct_button').hide();
        
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
                        array_datos_jugadores = response.info_jugadores;
                        casillas_tablero = response.lista_casillas;
                        baraja_cartas = response.lista_cartas;
                        caras_dado=response.caras_dado;

                        //Meter los datos de los jugadores en los billetes
                        if (response.info_jugadores[0]) {
                            $('#datos_jugadores').append('<div id="jugador_rojo" class="row p-4"><p class="mx-auto">'+array_datos_jugadores[0].nickName+'</p></div><div id="dinero_jugador_rojo" class="row"><p class="mx-auto" style="color:white;">$ '+array_datos_jugadores[0].Saldo+'</p></div>');
                        }
                        if (response.info_jugadores[1]) {
                            $('#datos_jugadores').append('<div id="jugador_amarillo" class="row p-4"><p class="mx-auto">'+array_datos_jugadores[1].nickName+'</p></div><div id="dinero_jugador_amarillo" class="row"><p class="mx-auto" style="color:white;">$ '+array_datos_jugadores[1].Saldo+'</p></div>');
                        }
                        if (response.info_jugadores[2]) {
                            $('#datos_jugadores').append('<div id="jugador_verde" class="row p-4"><p class="mx-auto">'+array_datos_jugadores[2].nickName+'</p></div><div id="dinero_jugador_verde" class="row"><p class="mx-auto" style="color:white;">$ '+array_datos_jugadores[2].Saldo+'</p></div>');
                        }
                        if (response.info_jugadores[3]) {
                            $('#datos_jugadores').append('<div id="jugador_azul" class="row p-4"><p class="mx-auto">'+array_datos_jugadores[3].nickName+'</p></div><div id="dinero_jugador_azul" class="row"><p class="mx-auto" style="color:white;">$ '+array_datos_jugadores[3].Saldo+'</p></div>');
                        }

                        //Añadir las fichas al tablero
                        if (jugadores_mezclados[0]) {
                            $('#inicio').children().eq(1).append('<img id="ficha_jugador1" class="ficha" src="'+fichas[0]+'">');
                        }
                        if (jugadores_mezclados[1]) {
                            $('#inicio').children().eq(1).append('<img id="ficha_jugador2" class="ficha" src="'+fichas[1]+'">');
                        }
                        if (jugadores_mezclados[2]) {
                            $('#inicio').children().eq(2).append('<img id="ficha_jugador3" class="ficha" src="'+fichas[2]+'">');
                        }
                        if (jugadores_mezclados[3]) {
                            $('#inicio').children().eq(2).append('<img id="ficha_jugador4" class="ficha" src="'+fichas[3]+'">');
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
            $('#sell_button, #construct_button, #roll_dice_button').show();
            siguiente_jugador();
        });
        $('#roll_dice_button').click(function() {
            lanzar_dado();
            $('#roll_dice_button').hide();
            rollDiceWithoutValues();
            actualizar_propiedades();
            mover_jugador();
            
        });
        $('#buy_button').click(function(){
            comprar_titulo_propiedad();
            ganador_perdedor();
            actualizar_datos_usuario();
        });

        // $('#actualizar_button').click(function(){
        //     actualizar_propiedades();
        // });
        $('#sell_button').click(function(){
            vender_propiedades();
        });

        $('#construct_button').click(function(){
            edificar_propiedades();
            ganador_perdedor();
        });

        $('#cartas_propiedades').children().hide();//Ocultamos todas las cartas de las propiedades para luego mostrarlas 
                                                        //segun se pulse sobre las propiedades

        $('#fuencarral').click(function() {
            $('#prop1').show();
            $('#prop1').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });
        
        $('#alberto_aguilera').click(function() {
            $('#prop2').show();
            $('#prop2').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#glorieta_bilbao').click(function() {
            $('#prop3').show();
            $('#prop3').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#calle_bailen').click(function() {
            $('#prop4').show();
            $('#prop4').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#plaza_españa').click(function() {
            $('#prop5').show();
            $('#prop5').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#puerta_del_sol').click(function() {
            $('#prop6').show();
            $('#prop6').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#gran_via').click(function() {
            $('#prop7').show();
            $('#prop7').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#paseo_de_la_castellana').click(function() {
            $('#prop8').show();
            $('#prop8').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#paseo_del_prado').click(function() {
            $('#prop9').show();
            $('#prop9').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#reyes_catolicos').click(function() {
            $('#prop10').show();
            $('#prop10').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#cea_bermudez').click(function() {
            $('#prop11').show();
            $('#prop11').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#maria_molina').click(function() {
            $('#prop12').show();
            $('#prop12').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });

        $('#avenida_america').click(function() {
            $('#prop13').show();
            $('#prop13').dialog({
                width: 200,
                height: 300,
                resizable: false,
            });
        });


    });
        
}(jQuery));