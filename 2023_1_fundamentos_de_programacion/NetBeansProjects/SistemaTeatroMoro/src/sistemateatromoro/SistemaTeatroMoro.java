package sistemateatromoro;
import java.util.Scanner;

public class SistemaTeatroMoro {
       // Atributos
       // Arreglo con la información. ubicacion, precio, disponibilidad
        String[][] stock = {
            {"A", "$10000", "4"},
            {"B", "$15000", "1"},
            {"C", "$20000", "2"},
            {"D", "$25000", "0"}
        };
       // Método 1: validación edad
        private int validarEdad(Scanner scanner) {
        int edad;
            while(true) {
                System.out.println("Ingrese la edad del cliente.");
                edad = scanner.nextInt();
                if (edad > 0) {
                    if (edad <18) {
                        System.out.println("Cliente posee descuento del 10%");
                    } else if (edad > 64){
                            System.out.println("Cliente posee descuento del 15%");
                    }
                    break;
                } else {
                    System.out.println("Error. Por favor ingrese una edad válida.");
                }
            }
            return edad;
        }
       // Método 2: validación asiento
        private char validarNombreAsiento(Scanner scanner) {
        char ubicacionAsiento;
        // Colocamos un bucle infinito para solicitar la entrada hasta que se proporcione una ubicación válida.
        while (true) {
            System.out.println("Ingrese la ubicacion del asiento: A, B, C o D");
            ubicacionAsiento = scanner.next().toUpperCase().charAt(0);

            boolean encontrado = false;
            // Buscamos la ubicación del asiento en la primera columna de la matriz stock.
            for (int i = 0; i < stock.length; i++) {
                if (stock[i][0].charAt(0) == ubicacionAsiento) {
                    encontrado = true;
                    break;
                }
            }

            if (encontrado) {
                break;
            } else {
                System.out.println("Error. Por favor, ingrese una ubicación válida.");
            }
        }
        return ubicacionAsiento;
        }
       // Método 3: encuentra el registro de stock segun ubicacion
        private int obtenerFilaAsiento(String ubicacionAsiento) {
            for (int i = 0; i < stock.length; i++) {
                if (stock[i][0].equals(ubicacionAsiento)) {
                    return i;
                }
            }
            // -1 indica que no se encontró.
            return -1;
        }
       // Metodo 4: determina stock
        private String obtenerStockAsiento(String ubicacionAsiento) {
            int filaAsiento = obtenerFilaAsiento(ubicacionAsiento);
            if (filaAsiento != -1) {
                return stock[filaAsiento][2]; // Devuelve la cantidad de asientos disponibles como una cadena
            } else {
                // Si la ubicación del asiento no se encuentra en el stock
                return null;
            }
        }
        // Método 5: Preguntar para continuar
        private boolean siContinuar(Scanner scanner) {
            while (true) {
                System.out.println("¿Desea confirmar la compra? (S/N)");
                char opcionContinuar = scanner.next().toUpperCase().charAt(0);

                switch (opcionContinuar) {
                    case 'S':
                        return true; // El usuario confirmó la compra
                    case 'N':
                        return false; 
                    default:
                        System.out.println("Error. Por favor, ingrese 'S' para confirmar o 'N' para cancelar.");
                }
            }
        }
        // Método para obtener el precio del asiento
        private String obtenerPrecioAsiento(String ubicacionAsiento) {
            int filaAsiento = obtenerFilaAsiento(ubicacionAsiento);
            if (filaAsiento != -1) {
                // La columna 1 contiene el precio del asiento
                return stock[filaAsiento][1];
            } else {
                // Si la ubicación del asiento no se encuentra en el stock
                return "No disponible"; // o cualquier otro mensaje que desees devolver
            }
        }  
        
       //            M  A  I  N  
       public static void main(String[] args){
       // Inicialización de variables
       Scanner scanner = new Scanner(System.in);
       SistemaTeatroMoro sistema = new SistemaTeatroMoro();
       
       // variables de control
       boolean continuar = true; // control de flujo principal
        do {
            // Saludo
            System.out.println("************************************************************");
            System.out.println("*                     TEATRO MORO                          *");
            System.out.println("************************************************************");
            System.out.println("Bienvenidos al sistema de compra de entradas del Teatro Moro");
            System.out.println("");
            // Menu inicial. Preguntar si se desea comprar
            System.out.println("Desea comprar una entrada o salir?");
            System.out.println("1. Comprar entrada.");
            System.out.println("2. Salir.");
            int opcion = scanner.nextInt();
                switch (opcion){
                    case 1:
                        // Inicio de la compra
                        // Preguntar edad, valida edad, devuelve mensaje 
                        int edad = sistema.validarEdad(scanner);
                        // Preguntar preferencia de la zona de asiento, valida, consulta y devuelve mensaje
                        char ubicacionAsiento = sistema.validarNombreAsiento(scanner);
                        // Ver disponibilidad de asiento
                         String stockAsiento = sistema.obtenerStockAsiento(String.valueOf(ubicacionAsiento));
                        if (stockAsiento != null) {
                            if (Integer.parseInt(stockAsiento) == 0) {
                                System.out.println("Lo sentimos, no hay disponibilidad de asientos en " + ubicacionAsiento + ".");
                                break;
                            } else {
                                System.out.println("Asientos disponibles en la zona " + ubicacionAsiento + ": " + stockAsiento + ".");
                                System.out.println("--------------------");
                                System.out.println("RESUMEN DE LA COMPRA");
                                System.out.println("--------------------");
                                System.out.println("Ubicación del asiento: " + ubicacionAsiento);
                                System.out.println("Precio del asiento: " + sistema.obtenerPrecioAsiento(String.valueOf(ubicacionAsiento)));
                                System.out.println("- - - - - - - - - - ");
                                

                                // Mensaje resumen de la compra y confirmación
                                boolean opcionContinuar = sistema.siContinuar(scanner);
                                if (opcionContinuar == true) {
                                    System.out.println("continuamos");
                                
                                } else {
                                    // Salir del bucle
                                    break;
                                }
                                // Confirma la compra y realiza la compra o vuelve al inicio
                                // Si confirma la compra muestra la compra realizada,
                                // resta 1 a la cantidad de asientos y vuelve al inicio
                                continue;
                            }
                            
                        } else {
                            System.out.println("Error. No existe stock para el elemento seleccionado");
                            break;
                        }
                        
                    case 2:
                        // Salida del sistema
                        System.out.println("Gracias por visitarnos...Hasta luego!");
                        continuar = false;
                        break;
                    default:
                        // Otra respuesta
                        System.out.println("Opción incorrecta. Presione cualquier tecla para continuar");
                        scanner.next();
                }
        } while (continuar);
       }
}