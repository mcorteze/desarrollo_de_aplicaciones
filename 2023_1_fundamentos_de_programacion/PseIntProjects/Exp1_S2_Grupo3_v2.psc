// IDENTIFICACIÓN ------------------------------------------------
// Carrera: Desarrollo de Aplicaciones.
// Asignatura: Fundamentos de programación.
// Profesor: Cristian Oliva Perez.
// Estudiantes: Leandro Gutierrez Abarca y Manuel Cortez Echeverría.

// PROBLEMA ------------------------------------------------------
// Semana 2: Diseño y modelado de algoritmos.
// Problema: 

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
	Definir fila, columna, i, numeracion, largoArray, saldo, indiceCarrito, vista_actual, limite_vista_actual Como Entero;
	Definir ARTICULO, FILTRO, CARRITO, BOBBIE, opcionesCategoria, categoriaEscogida Como Cadena;
	Definir opcion Como Caracter;;
	Definir entradaValida Como Logico;
	//Inicializacion de variables
	Dimensionar ARTICULO[200,6];
	Dimensionar FILTRO[200,6];
	Dimensionar CARRITO[200,5];
	Dimensionar BOBBIE[200,5];
	Dimensionar opcionesCategoria[5,5];
	
	saldo <- 500;
	indiceCarrito <- 0;
	
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
	

	BOBBIE[0,0] <- '1';
	BOBBIE[1,0] <- '1';
	BOBBIE[2,0] <- '1';
	BOBBIE[3,0] <- '1';
	BOBBIE[4,0] <- '1';
	BOBBIE[5,0] <- '1';
	BOBBIE[6,0] <- '1';
	BOBBIE[7,0] <- '1';
	BOBBIE[8,0] <- '1';
	BOBBIE[9,0] <- '1';
	BOBBIE[10,0] <- '1';
	BOBBIE[11,0] <- '1';
	BOBBIE[12,0] <- '1';
	BOBBIE[13,0] <- '1';
	BOBBIE[14,0] <- '1';
	BOBBIE[0,1] <- 'DIALOGO';
	BOBBIE[1,1] <- 'DIALOGO';
	BOBBIE[2,1] <- 'DIALOGO';
	BOBBIE[3,1] <- 'DIALOGO';
	BOBBIE[4,1] <- 'ESPERAR TECLA';
	BOBBIE[5,1] <- 'BORRAR PANTALLA';
	BOBBIE[6,1] <- 'ESPERAR';
	BOBBIE[7,1] <- 'SALTAR LINEA';
	BOBBIE[8,1] <- 'DIALOGO';
	BOBBIE[9,1] <- 'ESPERAR';
	BOBBIE[10,1] <- 'DIALOGO';
	BOBBIE[11,1] <- 'SALTAR LINEA';
	BOBBIE[12,1] <- 'ESPERAR';
	BOBBIE[13,1] <- 'DIALOGO';
	BOBBIE[14,1] <- 'ESPERAR TECLA';
	BOBBIE[0,2] <- '-----------------------------------------------';
	BOBBIE[1,2] <- '  			TIENDA POKEMON DE CIUDAD CELESTE   ';
	BOBBIE[2,2] <- '-----------------------------------------------';
	BOBBIE[3,2] <- 'Presiona cualquier tecla para hablar con el vendedor.';
	BOBBIE[4,2] <- '';
	BOBBIE[5,2] <- '';
	BOBBIE[6,2] <- '1';
	BOBBIE[7,2] <- '';
	BOBBIE[8,2] <- 'Vendedor: ¡Hola!, te doy la bienvenida a la tienda pokemon de ciudad Celeste.';
	BOBBIE[9,2] <- '1';
	BOBBIE[10,2] <- 'Vendedor: ¿Cómo puedo ayudarte?';
	BOBBIE[11,2] <- '';
	BOBBIE[12,2] <- '1';
	BOBBIE[13,2] <- 'Presiona cualquier tecla para continuar.';
	BOBBIE[14,2] <- '';

	
	// ----------------------------------------------------------
	// VISTA 1: Saludo inicial de bienvenida (sólo ocurre una vez)
	// ----------------------------------------------------------
	
	vista_actual <- 1;
	limite_vista_actual <- 14;
	Para i = 0 Hasta limite_vista_actual Hacer
		Si BOBBIE[i,0] = ConvertirATexto(vista_actual) Entonces
			Si BOBBIE[i,1] = 'DIALOGO' Entonces
				Escribir BOBBIE[i,2];
			Sino 
				Si BOBBIE[i,1]='ESPERAR TECLA' Entonces
					Esperar Tecla;
				SiNo
					Si BOBBIE[i,1]='BORRAR PANTALLA' Entonces
						Borrar Pantalla;
					SiNo
						Si BOBBIE[i,1]= 'ESPERAR' Entonces
							Esperar 1 Segundos;
						SiNo
							Si BOBBIE[i,1]= 'SALTAR LINEA' Entonces
								Escribir '';
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinPara
	
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
	// Confecciona un array de elementos en la categoría escogida
	Leer Opcion;
	entradaValida <- Falso;
	Mientras entradaValida = Falso Hacer
		Si esEntero(Opcion) = Verdadero y ConvertirANumero(Opcion) <= 5 y ConvertirANumero(Opcion) >= 1 Entonces
			entradaValida <- Verdadero;
		SiNo
			Escribir 'Escoge una categoría válida...';
			Leer Opcion;
		FinSi
	FinMientras
	
	// ----------------------------------------------------------
	// VISTA 3: Submenú de categorías
	// ----------------------------------------------------------
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
		Si esEntero(Opcion) = Verdadero y ConvertirANumero(Opcion) <=largoArray y ConvertirANumero(Opcion) >= 1 Entonces
			entradaValida <- Verdadero;
		SiNo
			Escribir 'Escoge un artículo de la lista...';
			Leer Opcion;
		FinSi
	FinMientras
	
	// ----------------------------------------------------------
	// VISTA 4: Artículo seleccionado
	// ----------------------------------------------------------
	Borrar Pantalla;
	Esperar 1 segundos;
	Escribir '';
	Escribir 'Artículo seleccionado: ', FILTRO[Opcion,1],'(',categoriaEscogida,'),';
	Escribir '';
	Escribir 'Precio: $', FILTRO[Opcion,3],'.';
	Escribir 'Unidades disponibles: ', FILTRO[Opcion,5],' unidades.';
	Escribir '';
	Escribir 'Saldo actual: $',saldo;
	Escribir '';
	Escribir '';
	Escribir '1. Agregar al carrito de compras.';
	Escribir '2. Finalizar la compra.';
	Escribir '3. Cancelar.';
	
	// ----------------------------------------------------------
	// VISTA 5: CARRITO DE COMPRAS
	// ----------------------------------------------------------
	Leer Opcion;
	entradaValida <- Falso;
	Mientras entradaValida = Falso Hacer
		Si esEntero(Opcion) = Verdadero y ConvertirANumero(Opcion) <=3 y ConvertirANumero(Opcion) >= 1 Entonces
			entradaValida <- Verdadero;
		SiNo
			Escribir 'Escoge una opción válida...';
			Leer Opcion;
		FinSi
	FinMientras
	
	Borrar Pantalla;
	Esperar 1 segundos;
	Escribir '';
	Escribir 'Artículo seleccionado: ',FILTRO[Opcion,1];
	
	Segun ConvertirANumero(Opcion) Hacer
		1:
			indiceCarrito <- indiceCarrito + 1;
			CARRITO[indiceCarrito,0] <- FILTRO[Opcion,0];
			Escribir CARRITO[indiceCarrito,0];
			Escribir 'Agregado al carrito de compras';
		2:
			Escribir 'Finalizada la compra';
		3:
			Escribir '¡Vuelve cuando quieras!';
		De Otro Modo:
			Escribir '¿Qué grosería es esa, he?';
	FinSegun

	

FinAlgoritmo

