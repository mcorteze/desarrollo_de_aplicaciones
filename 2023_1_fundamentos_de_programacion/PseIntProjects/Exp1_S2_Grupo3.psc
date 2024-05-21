// IDENTIFICACIÓN ------------------------------------------------
// Carrera: Desarrollo de Aplicaciones.
// Asignatura: Fundamentos de programación.
// Profesor: Cristian Oliva Perez.
// Estudiantes: Leandro Gutierrez Abarca y Manuel Cortez Echeverría.

// PROBLEMA ------------------------------------------------------
// Semana 2: Diseño y modelado de algoritmos.
// Problema: Sistema de gestión de venta online: desarrollar un sistema 
// que permita a los usuarios buscar productos, agregar artículos a un 
// carrito de compras, realizar pagos y gestionar pedidos.

// ---------------------------------------------------------------
//                            FUNCIONES
// ---------------------------------------------------------------

Funcion r<-esnumero_0(valor)
	// Esta funcion determina si un valor es un número, 
	// pero no es infalible contra el uso puntos.
	
	// Definir variables
	Definir r Como Logico;
	Definir largo Como Entero;
	Definir i Como Entero;
	Definir character Como Caracter;
	Definir esnum Como Logico;
	// Valorización
	largo <- Longitud(valor);
	esnum <- Verdadero;
	i<-0;
	// Verifica si el string contiene caracteres fuera de numeros o "."
	Mientras i<largo Y esnum = Verdadero Hacer
		character = SubCadena(valor,i,i);
		Si (character = '0') O (character = '1') O (character = '2') O (character = '3') O (character = '4') O (character = '5') O (character = '6') O (character = '7') O (character = '8') O (character = '9') O (character = '.') O (character = '-') Entonces
			esnum <- Verdadero;
		Sino
			esnum <- Falso;
		FinSi
		i<-i+1;
	FinMientras
	r <- esnum;
FinFuncion

Funcion r<-esnumero_1(valor)
	// Esta funcion complementa a esnumero
	// filtrando string que inician o terminan con punto, o poseen mas de un punto.
	
	// Definir variables
	Definir r Como Logico;
	Definir largo Como Entero;
	Definir i Como Entero;
	Definir character Como Caracter;
	Definir cadena Como Caracter;
	Definir contadorpuntos Como Entero;
	Definir esnum Como Logico;
	
	// Valorización
	largo <- Longitud(valor);
	esnum <- Verdadero;
	i<-0;
	contadorpuntos<-0;
	
	Mientras i < largo Y esnum = Verdadero Hacer
		character = SubCadena(valor,i,i);
		Si (character = ".") Y (i = 0) Entonces
			esnum <- Falso;
		Sino 
			Si (character = ".") Y (i + 1 = largo) Entonces
				esnum <- Falso;
			SiNo
				Si (character = "-") Y (i > 0) Entonces
					esnum<-Falso;
				Sino
					Si character = "." Entonces
						contadorpuntos <- contadorpuntos + 1;
						Si contadorpuntos > 1 Entonces
							esnum <- Falso;
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
		i <- i + 1;
	FinMientras
	r <- esnum;
FinFuncion

Funcion r<-esreal(valor)
	Definir r Como Logico;
	
	Si (esnumero_0(valor) = Verdadero) Y (esnumero_1(valor) = Verdadero) Entonces
		r <- Verdadero;
	SiNo
		r <- Falso;
	FinSi
	
FinFuncion

Funcion r<-esentero(valor)
	Definir r Como Logico;
	Definir redondeo Como Entero;
	Definir diferencia Como Real;
	
	Si esreal(valor) = Verdadero Entonces
		redondeo <- redon(ConvertirANumero(valor));
		diferencia = ConvertirANumero(valor) - redondeo;
		Si diferencia = 0 Entonces
			r <- Verdadero;
		SiNo
			r <- Falso;
		FinSi
	FinSi
FinFuncion

Funcion r<-esnatural(valor)
	Definir r Como Logico;
	
	Si esentero(valor) = Verdadero Entonces
		Si ConvertirANumero(valor) >= 0 Entonces
			r <- Verdadero;
		SiNo
			r <- Falso;
		FinSi
	FinSi
FinFuncion

Funcion r <- esnaturalNoCero(valor)
	Definir r Como Logico;
	
	Si esnatural(valor) = Verdadero Y ConvertirANumero(valor) > 0 Entonces
		r <- Verdadero;
	SiNo
		r <- Falso;
	FinSi
	
FinFuncion



// ---------------------------------------------------------------
//                            VISTAS
// ---------------------------------------------------------------


Algoritmo TiendaPokemon
	// Parámetros
	Definir fila, columna, i, j, numeracion, numeracion_pago, largoArray, saldo, indiceCarrito, monto_final Como Entero;
	Definir ARTICULO, FILTRO, CARRITO, opcionesCategoria, categoriaEscogida, item_carrito, calle_domicilio, numero_domicilio Como Cadena;
	Definir opcion, Opcion_reseteable Como Caracter;;
	Definir comprando, agregando_carrito, entradaValida, compra_cancelada, ir_a_finalizar Como Logico;
	//Inicializacion de variables
	Dimensionar ARTICULO[200,6];
	Dimensionar FILTRO[200,6];
	Dimensionar CARRITO[200,5];
	Dimensionar opcionesCategoria[5,5];
	
	item_carrito <- '';
	
	Para i = 0 Hasta 199 Hacer
		CARRITO[i,0] <- 'nan';
		CARRITO[i,1] <- 'nan';
	FinPara
	
	saldo <- 50000;
	indiceCarrito <- 0;
	comprando <- Verdadero;
	agregando_carrito <- Verdadero;
	compra_cancelada <- Falso;
	ir_a_finalizar <- Falso;
	
	opcionesCategoria[0,0] <- '1';
	opcionesCategoria[1,0] <- '2';
	opcionesCategoria[2,0] <- '3';
	opcionesCategoria[3,0] <- '4';
	opcionesCategoria[4,0] <- '5';
	opcionesCategoria[0,1] <- 'POKEBALLS';
	opcionesCategoria[1,1] <- 'POCIONES';
	opcionesCategoria[2,1] <- 'PIEDRAS EVOLUTIVAS';
	opcionesCategoria[3,1] <- 'MT-MO';
	opcionesCategoria[4,1] <- 'ACCESORIOS';
	
	ARTICULO[0,0] <- '0';
	ARTICULO[1,0] <- '1';
	ARTICULO[2,0] <- '2';
	ARTICULO[3,0] <- '3';
	ARTICULO[4,0] <- '4';
	ARTICULO[5,0] <- '5';
	ARTICULO[6,0] <- '6';
	ARTICULO[7,0] <- '7';
	ARTICULO[8,0] <- '8';
	ARTICULO[9,0] <- '9';
	ARTICULO[10,0] <- '10';
	ARTICULO[11,0] <- '11';
	ARTICULO[12,0] <- '12';
	ARTICULO[13,0] <- '13';
	ARTICULO[14,0] <- '14';
	ARTICULO[15,0] <- '15';
	ARTICULO[16,0] <- '16';
	ARTICULO[17,0] <- '17';
	ARTICULO[18,0] <- '18';
	ARTICULO[19,0] <- '19';
	ARTICULO[20,0] <- '20';
	ARTICULO[21,0] <- '21';
	ARTICULO[22,0] <- '22';
	ARTICULO[0,1] <- 'POKÉ BALL';
	ARTICULO[1,1] <- 'MALLA BALL';
	ARTICULO[2,1] <- 'BUCEO BALL';
	ARTICULO[3,1] <- 'POCIÓN';
	ARTICULO[4,1] <- 'SUPER POCIÓN';
	ARTICULO[5,1] <- 'HIPER POCIÓN';
	ARTICULO[6,1] <- 'REVIVIR';
	ARTICULO[7,1] <- 'PIEDRA AGUA';
	ARTICULO[8,1] <- 'PIEDRA TRUENO';
	ARTICULO[9,1] <- 'PIEDRA FUEGO';
	ARTICULO[10,1] <- 'PIEDRA HOJA';
	ARTICULO[11,1] <- 'MT03 HIDROPULSO';
	ARTICULO[12,1] <- 'MT04 HIDROBOMBA';
	ARTICULO[13,1] <- 'MT18 DANZA LLUVIA';
	ARTICULO[14,1] <- 'MT55 ESCALDAR';
	ARTICULO[15,1] <- 'MO03 SURF';
	ARTICULO[16,1] <- 'MO05 CASCADA';
	ARTICULO[17,1] <- 'CAÑA VIEJA';
	ARTICULO[18,1] <- 'CAÑA BUENA';
	ARTICULO[19,1] <- 'SÚPER CAÑA';
	ARTICULO[20,1] <- 'CUERDA HUIDA';
	ARTICULO[21,1] <- 'REPELENTE';
	ARTICULO[22,1] <- 'BICICLETA';
	ARTICULO[0,2] <- 'POKEBALLS';
	ARTICULO[1,2] <- 'POKEBALLS';
	ARTICULO[2,2] <- 'POKEBALLS';
	ARTICULO[3,2] <- 'POCIONES';
	ARTICULO[4,2] <- 'POCIONES';
	ARTICULO[5,2] <- 'POCIONES';
	ARTICULO[6,2] <- 'POCIONES';
	ARTICULO[7,2] <- 'PIEDRAS EVOLUTIVAS';
	ARTICULO[8,2] <- 'PIEDRAS EVOLUTIVAS';
	ARTICULO[9,2] <- 'PIEDRAS EVOLUTIVAS';
	ARTICULO[10,2] <- 'PIEDRAS EVOLUTIVAS';
	ARTICULO[11,2] <- 'MT-MO';
	ARTICULO[12,2] <- 'MT-MO';
	ARTICULO[13,2] <- 'MT-MO';
	ARTICULO[14,2] <- 'MT-MO';
	ARTICULO[15,2] <- 'MT-MO';
	ARTICULO[16,2] <- 'MT-MO';
	ARTICULO[17,2] <- 'ACCESORIOS';
	ARTICULO[18,2] <- 'ACCESORIOS';
	ARTICULO[19,2] <- 'ACCESORIOS';
	ARTICULO[20,2] <- 'ACCESORIOS';
	ARTICULO[21,2] <- 'ACCESORIOS';
	ARTICULO[22,2] <- 'ACCESORIOS';
	ARTICULO[0,3] <- '200';
	ARTICULO[1,3] <- '1350';
	ARTICULO[2,3] <- '1200';
	ARTICULO[3,3] <- '200';
	ARTICULO[4,3] <- '600';
	ARTICULO[5,3] <- '1200';
	ARTICULO[6,3] <- '3250';
	ARTICULO[7,3] <- '1000';
	ARTICULO[8,3] <- '30000';
	ARTICULO[9,3] <- '5000';
	ARTICULO[10,3] <- '30000';
	ARTICULO[11,3] <- '3000';
	ARTICULO[12,3] <- '6000';
	ARTICULO[13,3] <- '4000';
	ARTICULO[14,3] <- '25000';
	ARTICULO[15,3] <- '40000';
	ARTICULO[16,3] <- '30000';
	ARTICULO[17,3] <- '500';
	ARTICULO[18,3] <- '3250';
	ARTICULO[19,3] <- '9200';
	ARTICULO[20,3] <- '750';
	ARTICULO[21,3] <- '400';
	ARTICULO[22,3] <- '1000000';
	ARTICULO[0,4] <- '0 - 1000';
	ARTICULO[1,4] <- '1001 - 5000';
	ARTICULO[2,4] <- '1001 - 5000';
	ARTICULO[3,4] <- '0 - 1000';
	ARTICULO[4,4] <- '0 - 1000';
	ARTICULO[5,4] <- '1001 - 5000';
	ARTICULO[6,4] <- '1001 - 5000';
	ARTICULO[7,4] <- '1001 - 5000';
	ARTICULO[8,4] <- 'MÁS DE 25000';
	ARTICULO[9,4] <- '1001 - 5000';
	ARTICULO[10,4] <- 'MÁS DE 25000';
	ARTICULO[11,4] <- '1001 - 5000';
	ARTICULO[12,4] <- '5001 - 10000';
	ARTICULO[13,4] <- '1001 - 5000';
	ARTICULO[14,4] <- '10001 - 25000';
	ARTICULO[15,4] <- 'MÁS DE 25000';
	ARTICULO[16,4] <- 'MÁS DE 25000';
	ARTICULO[17,4] <- '0 - 1000';
	ARTICULO[18,4] <- '1001 - 5000';
	ARTICULO[19,4] <- '5001 - 10000';
	ARTICULO[20,4] <- '0 - 1000';
	ARTICULO[21,4] <- '0 - 1000';
	ARTICULO[22,4] <- 'MÁS DE 25000';
	ARTICULO[0,5] <- '100';
	ARTICULO[1,5] <- '55';
	ARTICULO[2,5] <- '23';
	ARTICULO[3,5] <- '240';
	ARTICULO[4,5] <- '168';
	ARTICULO[5,5] <- '79';
	ARTICULO[6,5] <- '15';
	ARTICULO[7,5] <- '125';
	ARTICULO[8,5] <- '1';
	ARTICULO[9,5] <- '0';
	ARTICULO[10,5] <- '1';
	ARTICULO[11,5] <- '35';
	ARTICULO[12,5] <- '19';
	ARTICULO[13,5] <- '69';
	ARTICULO[14,5] <- '32';
	ARTICULO[15,5] <- '44';
	ARTICULO[16,5] <- '17';
	ARTICULO[17,5] <- '81';
	ARTICULO[18,5] <- '56';
	ARTICULO[19,5] <- '9';
	ARTICULO[20,5] <- '202';
	ARTICULO[21,5] <- '3985';
	ARTICULO[22,5] <- '1';
	
	// ----------------------------------------------------------
	// VISTA 1: Saludo inicial de bienvenida (sólo ocurre una vez)
	// ----------------------------------------------------------
	Escribir ("-----------------------------------------------");
	Escribir ("  		TIENDA POKEMON DE CIUDAD CELESTE 	   ");
	Escribir ("-----------------------------------------------");
	Escribir 'Presiona cualquier tecla para hablar con el vendedor. <-';
	Esperar Tecla;
	Borrar Pantalla;
	Esperar 1 segundos;
	Escribir '';
	Escribir 'Vendedor: ¡Hola!, te doy la bienvenida a la tienda pokemon de ciudad Celeste.';
	Esperar 1 segundos;
	Escribir 'Vendedor: ¿Cómo puedo ayudarte?';
	Escribir '';
	Esperar 1 segundos;
	Escribir 'Presiona cualquier tecla para continuar. <-';
	Esperar Tecla;
	
	Mientras comprando = Verdadero Hacer
		
		Mientras agregando_carrito = Verdadero Hacer
			// ----------------------------------------------------------
			// VISTA 2: Menú de categorías, punto de retorno base y único filtro de artículos
			// ----------------------------------------------------------
			Borrar Pantalla;
			Esperar 1 segundos;
			Escribir '';
			Escribir 'Escoge una categoría de artículos:';
			Escribir '';
			Esperar 1 segundos;
			
			Para i = 0 Hasta 4 Con Paso 1 Hacer
				Escribir ' ', 	opcionesCategoria[i,0], '. ', opcionesCategoria[i,1], '.';
			FinPara
			Escribir '';
			Si indiceCarrito >= 1 Entonces
				Escribir 'Presiona f para finalizar tu compra.';
			FinSi
			
			// Confecciona un array de elementos en la categoría escogida
			Leer Opcion;
			entradaValida <- Falso;
			Mientras entradaValida = Falso Hacer
				Si esEntero(Opcion) = Verdadero y ConvertirANumero(Opcion) <= 5 y ConvertirANumero(Opcion) >= 1 Entonces
					entradaValida <- Verdadero;
				SiNo
					Si Opcion = 'f' Entonces
						ir_a_finalizar <- Verdadero;
						entradaValida <- Verdadero;
						agregando_carrito <- Falso;
					SiNo
						Escribir 'Escoge una categoría válida...';
						Leer Opcion;
					FinSi
				FinSi
			FinMientras
			
			// ----------------------------------------------------------
			// VISTA 3: Submenú de categorías
			// ----------------------------------------------------------
			Si ir_a_finalizar = Falso Entonces
				Borrar Pantalla;
				Esperar 1 segundos;
				Para i = 0 Hasta 4 Con Paso 1 Hacer
					// Busco el id (no la posicion) y devuelvo el nombre de la categoria
					Si opcionesCategoria[i,0] = Opcion Entonces
						categoriaEscogida = opcionesCategoria[i,1];
					FinSi
				FinPara
				Escribir '';
				Escribir "Has escogido la categoría ", categoriaEscogida,":";
				Escribir '';
				Esperar 1 segundos;
				largoArray <- 0;
				// Lista de artículos
				Para i = 0 Hasta 22 Con Paso 1 Hacer
					Si ARTICULO[i,2] = categoriaEscogida Entonces
						FILTRO[largoArray,0] <- ARTICULO[i,0];
						FILTRO[largoArray,1] <- ARTICULO[i,1];
						FILTRO[largoArray,2] <- ARTICULO[i,2];
						FILTRO[largoArray,3] <- ARTICULO[i,3];
						FILTRO[largoArray,4] <- ARTICULO[i,4];
						FILTRO[largoArray,5] <- ARTICULO[i,5];
						Escribir ' ',largoArray + 1,': ',FILTRO[largoArray,1],' x',FILTRO[largoArray,5],', $',FILTRO[largoArray,3],'.';
						largoArray <- largoArray + 1;
					FinSi
				FinPara
				Escribir '';
				Escribir 'Selecciona lo que quieras comprar.';
				// Validar opción
				Leer Opcion;
				entradaValida <- Falso;
				Mientras entradaValida = Falso Hacer
					Si esEntero(Opcion) = Verdadero y ConvertirANumero(Opcion) <= largoArray y ConvertirANumero(Opcion) >= 1 Entonces
						entradaValida <- Verdadero;
					SiNo
						Escribir 'Escoge un artículo de la lista...';
						Leer Opcion;
					FinSi
				FinMientras
			FinSi
			
			
			// ----------------------------------------------------------
			// VISTA 4: Artículo seleccionado
			// ----------------------------------------------------------
			Si ir_a_finalizar = Falso Entonces
				Borrar Pantalla;
				Esperar 1 segundos;
				Escribir '';
				Escribir 'Artículo seleccionado: ', FILTRO[ConvertirANumero(Opcion) - 1,1],'(',categoriaEscogida,'),';
				Escribir '';
				Escribir 'Precio: $', FILTRO[ConvertirANumero(Opcion) - 1,3],'.';
				Escribir 'Unidades disponibles: ', FILTRO[ConvertirANumero(Opcion) - 1,5],'.';
				Escribir '';
				Escribir 'Saldo actual: $',saldo;
				Escribir '';
				Escribir '';
				Escribir '1. Escoger cantidad de unidades(necesario).';
				Escribir '2. Finalizar la compra.';
				Escribir '3. Cancelar la compra.';
			FinSi

			
			// ----------------------------------------------------------
			// VISTA 5: CARRITO DE COMPRAS
			// ----------------------------------------------------------
			// Validamos la opción escogida
			Si ir_a_finalizar = Falso Entonces
				
				Leer Opcion_reseteable;
				entradaValida <- Falso;
				Mientras entradaValida = Falso Hacer
					Si esEntero(Opcion_reseteable) = Verdadero y ConvertirANumero(Opcion_reseteable) <=3 y ConvertirANumero(Opcion_reseteable) >= 1 Entonces
						entradaValida <- Verdadero;
					SiNo
						Escribir 'Escoge una opción válida...';
						Leer Opcion_reseteable;
					FinSi
				FinMientras
				
				
				Segun ConvertirANumero(Opcion_reseteable) Hacer
					1:
						// Comprobamos si hay stock
						Si ConvertirANumero(FILTRO[ConvertirANumero(Opcion) - 1,5])>0 Entonces
							Borrar Pantalla;
							Esperar 1 segundos;
							Escribir 'Agregar al carrito*';
							Escribir '';
							Escribir 'Artículo seleccionado: ',FILTRO[ConvertirANumero(Opcion) - 1,1];
							Escribir 'Precio: $', FILTRO[ConvertirANumero(Opcion) - 1,3],'.';
							Escribir 'Unidades disponibles: ', FILTRO[ConvertirANumero(Opcion) - 1,5],'.';
							Escribir '';
							Escribir 'Indica la cantidad de unidades que deseas comprar:';
							Leer Opcion_reseteable;
							entradaValida <- Falso;
							Mientras entradaValida = Falso Hacer
								Si esEntero(Opcion_reseteable) = Verdadero y ConvertirANumero(Opcion_reseteable) <= ConvertirANumero(FILTRO[ConvertirANumero(Opcion) - 1,5]) y ConvertirANumero(Opcion_reseteable) >= 1 Entonces
									entradaValida <- Verdadero;
								SiNo
									Escribir 'Escoge una opción válida...';
									Leer Opcion_reseteable;
								FinSi
							FinMientras
							
							// precio x unidades seleccionadas < saldo actual
							Si ConvertirANumero(FILTRO[ConvertirANumero(Opcion) - 1,3]) * ConvertirANumero(Opcion_reseteable) <= saldo Entonces
								// Almacenamos el id del item en carrito
								CARRITO[indiceCarrito,0] <- FILTRO[ConvertirANumero(Opcion) - 1,0];
								CARRITO[indiceCarrito,1] <- Opcion_reseteable;
								indiceCarrito <- indiceCarrito + 1;
								Borrar Pantalla;
								Escribir '';
								Escribir '¡Artículo agregado al carrito!';
								Escribir '';
								Escribir '------------------------------';
								Escribir 'Carrito actual:';
								Escribir '------------------------------';
								Para i = 0 Hasta 199 Hacer
									Si CARRITO[i,0] <> 'nan' Entonces
										Para j = 0 Hasta 21 Con Paso 1 Hacer
											Si ARTICULO[j,0] = CARRITO[i,0] Entonces
												item_carrito <- ARTICULO[j,1];
											FinSi
										FinPara
										Escribir item_carrito,' x',CARRITO[i,1];
									FinSi
								FinPara
								Escribir '';
								Escribir 'Presiona cualquier tecla para continuar.';
								Esperar Tecla;
							SiNo
								Borrar Pantalla;
								Escribir '';
								Escribir 'Vendedor: Lo siento, el saldo en tu cuenta es insuficiente.';
								Escribir '';
								Escribir 'Presiona cualquier tecla para continuar.';
								Esperar Tecla;
							FinSi
							
						SiNo
							Borrar Pantalla;
							Escribir '';
							Escribir 'Vendedor: Lo siento, actualmente no tenemos unidades disponibles para el artículo:',FILTRO[ConvertirANumero(Opcion) - 1,1],'.';
							Escribir '';
							Escribir 'Presiona cualquier tecla para continuar.';
							Esperar Tecla;
						FinSi
					2:
						agregando_carrito <- Falso;
					3:
						agregando_carrito <- Falso;
						comprando <- Falso;
						compra_cancelada <- Verdadero;
						
					De Otro Modo:
						Escribir '¿Qué grosería es esa, he?';
			FinSegun
				
			FinSi
			
			
		FinMientras
		// Aca va la vista de finalizar la compra
		
		Si compra_cancelada = Falso Entonces
			// Vista de finalizacion de compra
			Borrar Pantalla;
			Escribir '------------------------------';
			Escribir '		Resumen de tu pedido	 :';
			monto_final <- 0;
			numeracion_pago <- 1;
			Para i = 0 Hasta indiceCarrito - 1 Hacer
				Si CARRITO[i,0] <> 'nan' Entonces
					Para j = 0 Hasta 21 Con Paso 1 Hacer
						Si CARRITO[i,0] = ARTICULO[j,0] Entonces
							monto_final <- monto_final + ConvertirANumero(ARTICULO[j,3]) * ConvertirANumero(CARRITO[i,1]);
							item_carrito <- ARTICULO[j,1];
						FinSi
					FinPara
					Escribir numeracion_pago,'. ',item_carrito,' x',CARRITO[i,1];
					numeracion_pago <- numeracion_pago + 1;
				FinSi
			FinPara
			Escribir '------------------------------';
			Escribir 'Valor a pagar: $',monto_final, '.';
			Escribir '';
			Escribir '1. Finaliza tu pedido(pagar)';
			Escribir '2. Continuar comprando';
			// Validar opción
			Leer Opcion_reseteable;
			entradaValida <- Falso;
			Mientras entradaValida = Falso Hacer
				Si esEntero(Opcion_reseteable) = Verdadero y ConvertirANumero(Opcion_reseteable) <= 2 y ConvertirANumero(Opcion_reseteable) >= 1 Entonces
					entradaValida <- Verdadero;
				SiNo
					Escribir 'Escoge una opción.';
					Leer Opcion_reseteable;
				FinSi
			FinMientras
			
			Segun ConvertirANumero(Opcion_reseteable) Hacer
				1:
					// ir a pagar
					Si monto_final < saldo Entonces
						Borrar Pantalla;
						Escribir '';
						Escribir 'Procesando el pago...';
						Esperar 3 Segundos;
						Escribir 'Compra realizada con éxito.';
						Escribir '';
						Escribir 'Presiona cualquier tecla para continuar.';
						Esperar Tecla;
						
						// Gestionar pedido
						Borrar Pantalla;
						Escribir '';
						Escribir 'Vendedor: ¡Gracias por tu compra!';
						Esperar 1 Segundos;
						Escribir 'Vendedor:¿Quieres tus artículos para llevar o te gustaría recibirlos en tu domicilio?';
						Escribir '1. Deseo llevarlos conmigo.';
						Escribir '2. Quiero que los envien a mi domicilio.';
						Leer Opcion_reseteable;
						entradaValida <- Falso;
						Mientras entradaValida = Falso Hacer
							Si esEntero(Opcion_reseteable) = Verdadero y ConvertirANumero(Opcion_reseteable) <= 2 y ConvertirANumero(Opcion_reseteable) >= 1 Entonces
								entradaValida <- Verdadero;
							SiNo
								Escribir 'Escoge una opción.';
								Leer Opcion_reseteable;
							FinSi
						FinMientras
						Segun ConvertirANumero(Opcion_reseteable) Hacer
							1:
								// Finalizar
								Borrar Pantalla;
								agregando_carrito <- Falso;
								comprando <- Falso;
								
							2:
								//enviar a domiciio
								Borrar Pantalla;
								Escribir '';
								Escribir 'Vendedor:¡Claro, enviaremos los productos a tu domicilio!.';
								Escribir 'Vendedor:Escribe tu dirección (calle):';
								Leer calle_domicilio;
								Escribir 'Vendedor: Escribe la numeración:';
								Leer numero_domicilio;
								Escribir 'Vendedor:¡Excelente, enviaremos tu pedido a :',calle_domicilio,' #', numero_domicilio,'.';
								Escribir '';
								Escribir 'Presiona cualquier tecla para continuar.';
								Esperar Tecla;
								agregando_carrito <- Falso;
								comprando <- Falso;
							De Otro Modo:
						FinSegun
						
						
					SiNo
						Borrar Pantalla;
						Escribir '';
						Escribir 'Vendedor: Lo siento, el saldo en tu cuenta es insuficiente.';
						Escribir '';
						Escribir 'Presiona cualquier tecla para continuar.';
						Esperar Tecla;
						agregando_carrito <- Falso;
					FinSi
				2:
					agregando_carrito <- Verdadero;
					ir_a_finalizar <- Falso;
				De Otro Modo:
					// nada
			FinSegun
		FinSi
		
		
		
	FinMientras
	
	Si compra_cancelada = Verdadero Entonces
		Borrar Pantalla;
		Escribir '';
		Escribir '';
		Escribir '';
		Escribir 'Vendedor: ¡Vuelve pronto!';
		Escribir '';
		Escribir '';
		Escribir '';
	SiNo
		Si comprando = Falso Entonces
			Borrar Pantalla;
			Escribir '';
			Escribir '';
			Escribir '';
			Escribir 'Vendedor: ¡Que disfrutes tus productos!';
			Escribir 'Vendedor: ¡Vuelve pronto!';
			Escribir '';
			Escribir '';
			Escribir '';
		FinSi
	FinSi

	
FinAlgoritmo

