// Importar clases necesarias
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Random;

// Clase principal que representa el inicio de la aplicación
public class VentaEntradas{
	
	// Clase estática interna que representa la estructura y atributos de Entrada
	static class Entrada {
		String tipo; // Tipo de entrada
		String vip; // Tarifa VIP
		String plateaBaja; // Tarifa en platea baja
		String plateaAlta; // Tarifa en platea alta
		String palco; // Tarifa en palco
		
		
		// Constructor para la clase Entrada
		public Entrada(String tipo, String vip, String plateaBaja, String plateaAlta, String palco) {
			this.tipo = tipo;
			this.vip = vip;
			this.plateaBaja = plateaBaja;
			this.plateaAlta = plateaAlta;
			this.palco = palco;
		}
	}
	
	// Método principal que se ejecuta al iniciar el programa
	public static void main(String[] args) {
		// Crear un objeto Scanner para leer entrada por consola
		Scanner scanner = new Scanner(System.in);
		int result = 5 + 2 * 3;
		System.out.println(result);
		// Creamos un diccionario, la clave es el tipo de entrada
		Map<String, Entrada> entradas = new HashMap<>();
			
		// Inicializar tipos de entradas y agregarlas al diccionario. 
		// clave en minuscula para una busqueda eficiente 
		entradas.put("estudiante", new Entrada("Estudiante", "$13.000", "$10.000", "$9.000", "$6.500"));
		entradas.put("general", new Entrada("General", "$25.000", "$19.000", "$11.000", "$7.200"));
		
		// Saludar al usuario
		System.out.println("Vendedor: ¡Buenos días, te damos la bienvenida al Teatro Moro!");
		System.out.println("Vendedor: Puedo ayudarte a comprar una entrada para la función que buscas.");

		// Solicitamos y capturamos el nombre del usuario
		System.out.println("Vendedor: ¿Cuál es tu nombre?");
		String nombreCliente = scanner.nextLine();
		
		String tipoEntrada = "";
		while (!tipoEntrada.equals("estudiante") && !tipoEntrada.equals("general")) {
			System.out.println("Vendedor: " + nombreCliente + ", ¿eres estudiante?");
			tipoEntrada = scanner.nextLine().toLowerCase();
			// Verificamos si la entrada es "si", de lo contrario será "no"
			if (tipoEntrada.equals("si")) {
				tipoEntrada = "estudiante";
			} else if (tipoEntrada.equals("no")) {
					tipoEntrada = "general";
			} else {
					System.out.println("Vendedor: por favor responde con 'si' o 'no'.");
			}
		}
		
		// definimos tipoEscogido para alojar coincidencia
		// utilizamos la entrada del usuario (con tratamientos) para buscar en el diccionario
		// la busqueda utiliza el metodo get de la clase HashMap
		Entrada tipoEscogido = entradas.get(tipoEntrada);
			
			
		// Traducimos la variable a un string para usar en el mensaje
		String tipoEntradaMensaje; // Primero inicializamos
		if (tipoEntrada.equals("estudiante")) {
			tipoEntradaMensaje = "Estudiante";
		} else {
			tipoEntradaMensaje = "Público General";
		}
		
		// Mostramos la información de la compra al cliente
		System.out.println("Vendedor: entendido, entonces tu entrada será de tipo: " + tipoEntradaMensaje + ".");
		System.out.println("Vendedor: aquí estan los precios según la sección del teatro:");
		
		// Volcamos los registros de tarifas
		System.out.println("---");
		System.out.println("1. Sección VIP: " + tipoEscogido.vip + ".");
		System.out.println("2. Sección Platea Baja: " + tipoEscogido.plateaBaja + ".");
		System.out.println("3. Sección Platea Alta: " + tipoEscogido.plateaAlta + ".");
		System.out.println("4. Sección Palco: " + tipoEscogido.palco + ".");
		System.out.println("---");
		
		// Confirmamos la compra
		System.out.println("Vendedor: por cierto...sólo puedo venderte una entrada por vez.");
		System.out.println("Vendedor: si te parece bien, confirma tu compra escogiendo la sección de tu preferencia.");
		System.out.println("Vendedor: ingresa: 1, 2, 3 o 4. En caso contrario, escribe 'salir'.");
		
		String opcionCompra = scanner.nextLine().toLowerCase();
		boolean compraConfirmada = false;
		
		while (!compraConfirmada) {
			if (opcionCompra.equals("1") || opcionCompra.equals("2") || opcionCompra.equals("3") || opcionCompra.equals("4")) {
				System.out.println("Vendedor: ¡excelente elección! Ahora confirmaremos tu compra...");
				System.out.println("--");
				System.out.println("Estableciendo conexión para la transacción.");
				// Simular conexión inestabilidad con un 35% de probabilidad
				Random random = new Random();
				if (random.nextInt(100) <= 35) {
					System.out.println("Conexión inestable, intentando reconectar...");
					try {
						Thread.sleep(2000); // Tiempo de reconexión
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					System.out.println("Conexión establecida, procesando el pago...");
				} else {
					System.out.println("Procesando el pago...");
				}
				
				System.out.println("Por favor espera un momento...");
				try {
					Thread.sleep(3000); // Esperamos 3 segundos
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
				System.out.println("Transacción realizada con éxito.");
				System.out.println("--");
				System.out.println("Vendedor: ¡Todo listo " + nombreCliente + "!, ¡aquí tienes tu entrada!");
				System.out.println("Vendedor: ¡Que disfrutes la obra!");
				System.out.println("Vendedor: ¡Vuelve pronto!");
				compraConfirmada = true;
			} else if (opcionCompra.equals("salir")) {
				System.out.println("Vendedor: ¡Vuelve pronto!");
				compraConfirmada = true;
			} else {
				System.out.println("Vendedor: Por favor, selecciona una opción válida (1, 2, 3, 4 o escribe 'salir').");
				opcionCompra = scanner.nextLine().toLowerCase();
			}
		}
		scanner.close();
		System.out.println("--");
		System.out.println("Fin de la rutina.");
		System.out.println("creado por: Manuel Pedro Cortez Echeverría.");
	}
}