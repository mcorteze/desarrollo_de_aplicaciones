// IDENTIFICACIÓN ------------------------------------------------
// Carrera: Desarrollo de Aplicaciones.
// Asignatura: Fundamentos de programación.
// Profesor: Cristian Oliva Perez.
// Estudiantes: Leandro Gutierrez Abarca y Manuel Cortez Echeverría.

// PROBLEMA ------------------------------------------------------
// Semana 1: Mi primer Algoritmo.
// Problema: Calcula el total de ingresos para el Teatro Moro, considerando la venta de entradaspara dos tipos de asientos: 
// preferencial y regular. El usuario debe ingresar la cantidadde entradas para cada tipo y el precio por entrada.

// JUSTIFICACIÓN DE ABSTRACCIÓN ----------------------------------
// Abstracción de Datos: se utilizan funciones para manejar datos específicos, ocultando como se procesan internamente. 
// Permite al usuario interactuar con los datos de manera abstracta sin la necesidad de conoces los detalles de su manipulación interna.
// Abstraccion de Control: las funciones dividen la lógica de control en pasos manejables y específicos, facilitando la comprensión. 
// Lo que mejor su legibilidad e implementación.
// Funciones que cumplen lo anterior: esnumero_0, esnumero_1, esreal, 
// esentero, esnatural, esnaturalNoCero.
// Abstraccion de Representación de Datos: se ocultan los detalles internos de como se manipulan o se formatean los datos.
// Funciones que cumplen lo anterior:formateaMoneda, marcatemporal.

// ENTRADA - SALIDA - PROCESO
// ENTRADA: lineas: 223, 241, 252, 262, 272.
// PROCESO: lineas: 245, 255, 265, 275.
// SALIDA: lineas: 286.

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

Funcion r<-marcatemporal(0)
	Definir r Como Caracter;
	Definir marca Como Entero;
	Definir marcaTexto Como Caracter;
	Definir hora Como Caracter;
	Definir minuto Como Caracter;
	Definir segun2 Como Caracter;
	
	marca <- HoraActual();
	marcaTexto <- ConvertirATexto(marca);
	
	Si Longitud(marcaTexto) = 5 Entonces
		hora <- Subcadena(marcaTexto,0,0);
		minuto <- Subcadena(marcaTexto,1,2);
		segun2 <- Subcadena(marcaTexto,3,4);
	Sino
		hora <- Subcadena(marcaTexto,0,1);
		minuto <- Subcadena(marcaTexto,2,3);
		segun2 <- Subcadena(marcaTexto,4,5);
	FinSi
	
	marcaTexto <- Concatenar("(",hora);
	marcaTexto <- Concatenar(marcaTexto,Concatenar(":",minuto));
	marcaTexto <- Concatenar(marcaTexto,Concatenar(":",segun2));
	marcaTexto <- Concatenar(marcaTexto,")");
	
	r <- marcaTexto;
	
FinFuncion

Funcion r<-formateaMoneda(valor)
	Definir r Como Caracter;
	Definir valorSTR Como Caracter;
	Definir largo Como Entero;
	Definir texto1 Como Caracter;
	Definir texto2 Como Caracter;
	Definir textoTemporal Como Caracter;
	Definir textoFinal Como Caracter;
	Definir posicion Como Caracter;
	Definir seccionDerecha Como Caracter;
	Definir i Como Entero;
	Definir contador Como Entero;
	
	//valor <- 10000;
	valorSTR <- ConvertirATexto(valor);
	largo <- Longitud(valorSTR);
	textoTemporal <- "";
	textoFinal <- "";
	contador <- 0;
	
    Para i <- largo Hasta 1 Con Paso -1 Hacer
		//Escribir "i: ",i;
		seccionDerecha <- Subcadena(valorSTR, i-1, i -1);
		//Escribir "seccionDerecha: ",seccionDerecha;
		textoTemporal <- Concatenar(seccionDerecha,textoTemporal);
		//Escribir "textoTemporal ",textoTemporal;
		contador <- contador + 1;
		//Escribir "contador: ",contador;
			Si (contador = 3) Y (i<>1) Entonces
				textoTemporal <- Concatenar(".",textoTemporal);
				textoFinal <- Concatenar(textoTemporal,textoFinal);
				//Escribir "textoFinal: ",textoFinal;
				seccionDerecha <- "";
				textoTemporal <- "";
				contador <- 0;
			FinSi
    FinPara

	textoFinal <- Concatenar(textoTemporal, textoFinal);
	
	r <- textoFinal;
FinFuncion
		

Algoritmo Asistente
	// ENTRADA -------------------------------
	Definir tiempo Como Caracter;
	Definir entrada Como Caracter;
	Definir cantidadEntradasRegulares Como Caracter;
	Definir cantidadEntradasPreferenciales Como Caracter;
	Definir precioEntradasRegulares Como Caracter;
	Definir precioEntradasPreferenciales Como Caracter;
	Definir ingresoRegular Como Entero;
	Definir ingresoPreferencial Como Entero;
	Definir ingresoTotal Como Entero;
	
	
	Escribir "¡Bienvenido a la aplicación de asistencia del Teatro Moro!";
	Escribir "Estoy aquí para ayudarte a calcular el ingreso bruto total por venta de entradas.";
	Escribir "Presiona cualquier tecla para continuar", marcatemporal(0);
	Esperar Tecla;
	
	// Cantidad entradas tipo regular
	// ENTRADA -------------------------------
	Escribir "--------------------";
	Escribir "Ingresa la cantidad de entradas regulares vendidas:", marcatemporal(0);
	Leer cantidadEntradasRegulares;
	// PROCESO ------------------------------
	Mientras esnatural(cantidadEntradasRegulares) = Falso Hacer
		Escribir "Se espera un numero entero positivo o bien cero. Ingresa la cantidad de entradas regulares vendidas:", marcatemporal(0);
		Leer cantidadEntradasRegulares;
	FinMientras
	
	// Precio entradas tipo regular
	// ENTRADA -------------------------------
	Escribir "Ingresa el precio de venta de entrada para asiento regular:", marcatemporal(0);
	Leer precioEntradasRegulares;
	// PROCESO ------------------------------
	Mientras esnaturalNoCero(precioEntradasRegulares) = Falso Hacer
		Escribir "Se espera un numero entero positivo. Ingresa el precio de venta de entrada para asiento regular:", marcatemporal(0);
		Leer precioEntradasRegulares;
	FinMientras
	
	// Cantidad entradas tipo preferencial
	// ENTRADA -------------------------------
	Escribir "Ingresa la cantidad de entradas preferenciales vendidas:", marcatemporal(0);
	Leer cantidadEntradasPreferenciales;
	// PROCESO ------------------------------
	Mientras esnatural(cantidadEntradasPreferenciales) = Falso Hacer
		Escribir "Se espera un numero entero positivo o bien cero. Ingresa la cantidad de entradas preferenciales vendidas:", marcatemporal(0);
		Leer cantidadEntradasPreferenciales;
	FinMientras
	
	// Precio entradas tipo preferencial
	// ENTRADA -------------------------------
	Escribir "Ingresa el precio de venta de entrada para asiento preferencial:", marcatemporal(0);
	Leer precioEntradasPreferenciales;
	// PROCESO ------------------------------
	Mientras esnaturalNoCero(precioEntradasPreferenciales) = Falso Hacer
		Escribir "Se espera un numero entero positivo. Ingresa el precio de venta de entrada para asiento preferencial:", marcatemporal(0);
		Leer precioEntradasPreferenciales;
	FinMientras
	
	// Calculamos el ingreso
	ingresoRegular <- ConvertirANumero(cantidadEntradasRegulares) * ConvertirANumero(precioEntradasRegulares);
	ingresoPreferencial <- ConvertirANumero(cantidadEntradasPreferenciales) * ConvertirANumero(precioEntradasPreferenciales);
	ingresoTotal <- ingresoRegular + ingresoPreferencial;
	
	// SALIDA DE RESULTADOS -------------------------------
	Escribir "--------------------";
	Escribir "Resultados:";
	Escribir "Ingreso bruto por venta de entradas regulares: $",formateaMoneda(ingresoRegular),".";
	Escribir "Ingreso bruto por venta de entradas preferenciales: $",formateaMoneda(ingresoPreferencial),".";
	Escribir "Ingreso bruto total: $",formateaMoneda(ingresoTotal),".";
	Escribir "--------------------";
	Escribir "Fin del proceso.¡Gracias por utilizar nuestra aplicación de asistencia!";
	Escribir "Deja un like, Atte. SUDCRA";
	Escribir "--------------------";
	
FinAlgoritmo
	