import java.util.Scanner;

public class Direccion {

    // Atributos de la clase 

    private String calle;
    private int numeroInterior;
    private int numeroExterior;
    private String colonia;
    private String estado;

    /**
     * Constructor que inicializa una dirección con los parámetros dados.
     *
     * @param calle           Calle de la dirección.
     * @param numeroInterior  Número interior de la dirección.
     * @param numeroExterior  Número exterior de la dirección.
     * @param colonia         Colonia de la dirección.
     * @param estado          Estado de la dirección.
     */
    public Direccion(String calle, int numeroInterior, int numeroExterior, String colonia, String estado) {
        this.calle = calle;
        this.numeroInterior = numeroInterior;
        this.numeroExterior = numeroExterior;
        this.colonia = colonia;
        this.estado = estado;
    }

     /**
     * Obtiene la calle de la dirección.
     *
     * @return Calle de la dirección.
     */
    public String getCalle() {
        return calle;
    }

    /**
     * Obtiene el número interior de la dirección.
     *
     * @return Número interior de la dirección.
     */
    public int getNumeroInterior() {
        return numeroInterior;
    }

    /**
     * Obtiene el número exterior de la dirección.
     *
     * @return Número exterior de la dirección.
     */
    public int getNumeroExterior() {
        return numeroExterior;
    }

    /**
     * Obtiene la colonia de la dirección.
     *
     * @return Colonia de la dirección.
     */
    public String getColonia() {
        return colonia;
    }

    /**
     * Obtiene el estado de la dirección.
     *
     * @return Estado de la dirección.
     */
    public String getEstado() {
        return estado;
    }

    /**
     * Establece la calle de la dirección.
     *
     * @param calle Nueva calle de la dirección.
     */
    public void setCalle(String calle) {
        this.calle = calle;
    }

    /**
     * Establece el número interior de la dirección.
     *
     * @param numeroInterior Nuevo número interior de la dirección.
     */
    public void setNumeroInterior(int numeroInterior) {
        this.numeroInterior = numeroInterior;
    }

    /**
     * Establece el número exterior de la dirección.
     *
     * @param numeroExterior Nuevo número exterior de la dirección.
     */
    public void setNumeroExterior(int numeroExterior) {
        this.numeroExterior = numeroExterior;
    }

    /**
     * Establece la colonia de la dirección.
     *
     * @param colonia Nueva colonia de la dirección.
     */
    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    /**
     * Establece el estado de la dirección.
     *
     * @param estado Nuevo estado de la dirección.
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    /**
     * Convierte la dirección a una cadena en formato CSV (calle, numeroInterior, numeroExterior, colonia, estado).
     *
     * @return Representación en cadena de la dirección en formato CSV.
     */
    @Override
    public String toString() {
        // Asegúrate de que los campos estén en el orden correcto y separados por comas
        return calle + "," + numeroInterior + "," + numeroExterior + "," + colonia + "," + estado;
    }


    // Instancia de Verificadores para validaciones
    Verificadores verificadores = new Verificadores();


    /**
     * Obtiene una nueva instancia de Direccion solicitando los datos al usuario.
     *
     * @return Nueva instancia de Direccion ingresada por el usuario.
     */
    public Direccion obtenerDireccion() {
        String calle = verificadores.pedirDatosAgregar("\nIngrese la calle:");
        if (calle == null) {
            return null;
        }
    
        String numeroInteriorString = verificadores.verificarEsUnEntero("\nIngrese el número interior:");
        if (numeroInteriorString == null) {
            return null;
        }
        int numeroInterior = Integer.parseInt(numeroInteriorString);
    
        String numeroExteriorString = verificadores.verificarEsUnEntero("\nIngrese el número exterior:");
        if (numeroExteriorString == null) {
            return null;
        }
        int numeroExterior = Integer.parseInt(numeroExteriorString);
    
        String colonia = verificadores.pedirDatosAgregar("\nIngrese la colonia:");
        if (colonia == null) {
            return null;
        }
    
        String estado = verificadores.pedirDatosAgregar("\nIngrese el estado:");
        if (estado == null) {
            return null;
        }
    
        return new Direccion(calle, numeroInterior, numeroExterior, colonia, estado);
    }

    /**
     * Permite la edición de los atributos de la dirección mediante la entrada del usuario.
     *
     * @param sc Scanner para la entrada de usuario.
     */
    public void editarAtributosDireccion(Scanner sc) {
        boolean seguirEditando = true;

        while (seguirEditando) {
            System.out.println("\nSeleccione el atributo a editar:");
            System.out.println("1. Calle");
            System.out.println("2. Número Interior");
            System.out.println("3. Número Exterior");
            System.out.println("4. Colonia");
            System.out.println("5. Estado");
            System.out.println("6. Terminar edición");

            int opcion = sc.nextInt();
            sc.nextLine(); // Consumir la nueva línea después de nextInt

            switch (opcion) {
                case 1:
                    System.out.println("\nIngrese la nueva calle:");
                    String nuevaCalle = sc.nextLine();
                    setCalle(nuevaCalle);
                    break;
                case 2:
                    System.out.println("\nIngrese el nuevo número interior:");
                    int nuevoNumeroInterior = sc.nextInt();
                    sc.nextLine();
                    setNumeroInterior(nuevoNumeroInterior);
                    break;
                case 3:
                    System.out.println("\nIngrese el nuevo número exterior:");
                    int nuevoNumeroExterior = sc.nextInt();
                    sc.nextLine();
                    setNumeroExterior(nuevoNumeroExterior);
                    break;
                case 4:
                    System.out.println("\nIngrese la nueva colonia:");
                    String nuevaColonia = sc.nextLine();
                    setColonia(nuevaColonia);
                    break;
                case 5:
                    System.out.println("\nIngrese el nuevo estado:");
                    String nuevoEstado = sc.nextLine();
                    setEstado(nuevoEstado);
                    break;
                case 6:
                    seguirEditando = false;
                    break;
                default:
                    System.out.println("\nOpción no válida.");
            }
        }
    }


}
