public class Pokedex {
    // Atributos
    private String nombre;
    private String tipo;
    private int nivel;

    // Constructor
    public Pokedex(String nombre, String tipo, int nivel) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.nivel = nivel;
    }

    // Método para imprimir información del Pokémon
    public void mostrarPokemon() {
        System.out.println("Nombre: " + nombre);
        System.out.println("Tipo: " + tipo);
        System.out.println("Nivel: " + nivel);
        System.out.println();
    }

    public static void main(String[] args) {
        // Crear 5 Pokémon utilizando el constructor
        Pokedex pokemon1 = new Pokedex("Pikachu", "Eléctrico", 10);
        Pokedex pokemon2 = new Pokedex("Charmander", "Fuego", 8);
        Pokedex pokemon3 = new Pokedex("Bulbasaur", "Planta/Veneno", 7);
        Pokedex pokemon4 = new Pokedex("Squirtle", "Agua", 9);
        Pokedex pokemon5 = new Pokedex("Jigglypuff", "Normal/Hada", 6);

        // Mostrar información de los Pokémon
        System.out.println("Información de los Pokémon:");
        pokemon1.mostrarPokemon();
        pokemon2.mostrarPokemon();
        pokemon3.mostrarPokemon();
        pokemon4.mostrarPokemon();
        pokemon5.mostrarPokemon();
    }
}
