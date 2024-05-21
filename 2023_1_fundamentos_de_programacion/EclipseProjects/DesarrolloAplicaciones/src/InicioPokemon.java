// Importar las clases necesarias para el programa
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

// Clase principal que representa el inicio del juego Pokémon
public class InicioPokemon {

    // Clase estática interna que representa la estructura y atributos de un Pokémon
    static class Pokemon {
        String nombre; // Nombre del Pokémon
        String tipo;   // Tipo del Pokémon
        String[] ataques; // Array de ataques del Pokémon
        String altura; // Altura del Pokémon
        String peso;   // Peso del Pokémon
        String edad;   // Edad del Pokémon

        // Constructor para la clase Pokemon. Se utiliza para crear nuevas instancias
        // de Pokémon con valores específicos para sus atributos.
        public Pokemon(String nombre, String tipo, String[] ataques, String altura, String peso, String edad) {
            this.nombre = nombre;
            this.tipo = tipo;
            this.ataques = ataques;
            this.altura = altura;
            this.peso = peso;
            this.edad = edad;
        }
    }

    // Método principal que se ejecuta al iniciar el programa
    public static void main(String[] args) {
        // Crear un objeto Scanner para leer la entrada del usuario
        Scanner scanner = new Scanner(System.in);

        // Diccionario para almacenar los Pokémon, donde la clave es el tipo de Pokémon y el valor es un objeto Pokemon
        Map<String, Pokemon> pokemones = new HashMap<>();

        // Inicializar algunos Pokémon y agregarlos al diccionario
        pokemones.put("Fuego", new Pokemon("Charmander", "Fuego", new String[]{"Arañazo", "Ascuas"}, "Altura: ??", "Peso: ??", "Edad: ??"));
        pokemones.put("Agua", new Pokemon("Squirtle", "Agua", new String[]{"Arañazo", "Pistola Agua"}, "Altura: ??", "Peso: ??", "Edad: ??"));
        pokemones.put("Planta", new Pokemon("Bulbasaur", "Planta", new String[]{"Placaje", "Látigo Cepa"}, "Altura: ??", "Peso: ??", "Edad: ??"));

        // Solicitar el nombre del jugador
        System.out.println("¡Bienvenido a tu aventura Pokémon!");
        System.out.print("Por favor, introduce tu nombre: ");
        String nombreJugador = scanner.nextLine();

        // Solicitar el tipo de Pokémon preferido
        System.out.println("Hola, " + nombreJugador + "! ¿Qué tipo de Pokémon prefieres? (Fuego, Agua, Planta)");
        String tipoPokemon = scanner.nextLine();

        // Confirmar la elección y entregar el Pokémon
        Pokemon pokemonElegido = pokemones.get(tipoPokemon);
        if (pokemonElegido == null) {
            System.out.println("Tipo de Pokémon no válido. Selecciona entre Fuego, Agua o Planta.");
            return;
        }
        System.out.println("El Profesor Oak: Entiendo, " + nombreJugador + "! De acuerdo a tu elección, aquí tienes tu Pokémon inicial:");
        System.out.println("¡Has recibido a " + pokemonElegido.nombre + "!");

        // Mostrar los ataques iniciales del Pokémon
        System.out.println("Los primeros 2 ataques de " + pokemonElegido.nombre + " son:");
        for (int i = 0; i < 2; i++) {
            System.out.println((i + 1) + ". " + pokemonElegido.ataques[i]);
        }

        // Mostrar información adicional del Pokémon
        System.out.println("¡Disfruta de tu aventura con " + pokemonElegido.nombre + "!");
        System.out.println(pokemonElegido.altura);
        System.out.println(pokemonElegido.peso);
        System.out.println(pokemonElegido.edad);

        // Recomendaciones de combate
        System.out.println("Para subir de nivel a " + pokemonElegido.nombre + ", te recomiendo luchar contra Pokémon de tipo: " + obtenerTipoContrario(pokemonElegido.tipo));
    
        scanner.close();
    }

    // Método privado para obtener el tipo de Pokémon contrario al tipo dado
    private static String obtenerTipoContrario(String tipo) {
        switch (tipo.toLowerCase()) {
            case "fuego":
                return "Agua";
            case "agua":
                return "Planta";
            case "planta":
                return "Fuego";
            default:
                return "";
        }
    }
    
    
}
