import java.util.List;
import java.util.Optional;
import java.util.Scanner;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;


/**
 * La clase Habitacion representa una habitación en un hotel.
 */
public class Habitacion {

    // Atributos de la clase

    private String tipoHabitacion;
    private int numHabitacion;
    private int numCamas;
    private boolean disponible;
    private double costoNoche;

    /**
     * Constructor para la clase Habitacion.
     *
     * @param tipoHabitacion Tipo de la habitación.
     * @param numHabitacion  Número de la habitación.
     * @param numCamas       Número de camas en la habitación.
     * @param disponible     Estado de disponibilidad de la habitación.
     * @param costoNoche     Costo por noche de la habitación.
     */

    public Habitacion(String tipoHabitacion, int numHabitacion, int numCamas, boolean disponible, double costoNoche) {
        this.tipoHabitacion = tipoHabitacion;
        this.numHabitacion = numHabitacion;
        this.numCamas = numCamas;
        this.disponible = disponible;
        this.costoNoche = costoNoche;
    }

    // Métodos getter y setter para tipoHabitacion

    /**
     * Obtiene el tipo de la habitación.
     *
     * @return Tipo de la habitación.
     */
    public String getTipoHabitacion() {
        return tipoHabitacion;
        
    }

    /**
     * Establece el tipo de la habitación.
     *
     * @param tipoHabitacion Nuevo tipo de la habitación.
     */
    public void setTipoHabitacion(String tipoHabitacion) {
        this.tipoHabitacion = tipoHabitacion;
        actualizarArchivoCSV();
    }

   // Métodos getter y setter para numHabitacion

    /**
     * Obtiene el número de la habitación.
     *
     * @return Número de la habitación.
     */
    public int getNumHabitacion() {
        return numHabitacion;
    }

    /**
     * Establece el número de la habitación.
     *
     * @param numHabitacion Nuevo número de la habitación.
     */
    public void setNumHabitacion(int numHabitacion) {
        this.numHabitacion = numHabitacion;
        actualizarArchivoCSV();
    }

    // Métodos getter y setter para numCamas

    /**
     * Obtiene el número de camas en la habitación.
     *
     * @return Número de camas.
     */
    public int getNumCamas() {
        return numCamas;
    }

    /**
     * Establece el número de camas en la habitación.
     *
     * @param numCamas Nuevo número de camas.
     */
    public void setNumCamas(int numCamas) {
        this.numCamas = numCamas;
        actualizarArchivoCSV();
    }

    // Métodos getter y setter para disponible

    /**
     * Verifica si la habitación está disponible.
     *
     * @return true si la habitación está disponible, false de lo contrario.
     */
    public boolean isDisponible() {
        return disponible;
    }

    /**
     * Establece la disponibilidad de la habitación.
     *
     * @param disponible Nuevo estado de disponibilidad.
     */
    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
        actualizarArchivoCSV();
    }

    // Métodos getter y setter para costoNoche

    /**
     * Obtiene el costo por noche de la habitación.
     *
     * @return Costo por noche.
     */
    public double getCostoNoche() {
        return costoNoche;
    }

    /**
     * Establece el costo por noche de la habitación.
     *
     * @param costoNoche Nuevo costo por noche.
     */
    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
        actualizarArchivoCSV();
    }

    /**
     * Sobrescribe el método toString para obtener una representación en cadena de la habitación.
     *
     * @return Cadena que representa la habitación.
     */
    @Override
    public String toString() {
        return numHabitacion + "," + tipoHabitacion + "," + numCamas + "," + disponible + "," + costoNoche;
    }

    // Instancia de Verificadores para validaciones
    Verificadores verificadores = new Verificadores();
    private static Hotel HOTEL = new Hotel(0, null, null, null, 0, 0, 0, null, null, false);


    /**
     * Crea una nueva habitación solicitando los datos al usuario.
     *
     * @return Objeto Habitacion creado.
     */
    public Habitacion crearHabitacion() {
        // Variables locales
        String tipoHabitacion;
        int numHabitacion, numCamas;
        boolean disponible;
        double costoNoche;
    
        // Llamar al método verificarEsUnEntero desde la instancia de Verificadores
        String numHabitacionString = verificadores.verificarEsUnEntero("\nIngrese el número de habitación:");
        if (numHabitacionString == null) {
            return null;  // Manejo de error o retorno nulo según tus necesidades
        }
        numHabitacion = Integer.parseInt(numHabitacionString);

        // Llamar al método pedirDatosAgregar desde la instancia de Verificadores
        tipoHabitacion = verificadores.pedirDatosAgregar("\nIngrese el tipo de habitación (individual, doble, cuádruple, penthouse):");
    
        // Llamar al método verificarEsUnEntero desde la instancia de Verificadores
        String numCamasString = verificadores.verificarEsUnEntero("\nIngrese el número de camas:");
        if (numCamasString == null) {
            return null;  // Manejo de error o retorno nulo según tus necesidades
        }
        numCamas = Integer.parseInt(numCamasString);
    
        // Llamar al método pedirDatosAgregar desde la instancia de Verificadores
        String disponibleString = verificadores.pedirDatosAgregar("\n¿La habitación está disponible? (SI/NO):");
        if (disponibleString == null) {
            return null;  // Manejo de error o retorno nulo según tus necesidades
        }
        disponible = disponibleString.equalsIgnoreCase("SI");
    
        // Llamar al método verificarEsUnEntero desde la instancia de Verificadores
        String costoNocheString = verificadores.verificarEsUnEntero("\nIngrese el costo por noche:");
        if (costoNocheString == null) {
            return null;  // Manejo de error o retorno nulo según tus necesidades
        }
        costoNoche = Double.parseDouble(costoNocheString);
    
        // Crear y retornar el objeto Habitacion
        return new Habitacion(tipoHabitacion, numHabitacion, numCamas, disponible, costoNoche);
    }


    /**
     * Consulta una habitación por su número en una lista de habitaciones.
     *
     * @param listaHabitaciones Lista de habitaciones.
     * @param numHabitacion     Número de la habitación a consultar.
     * @return La habitación con el número especificado o null si no se encuentra.
     */
    public Habitacion consultarHabitacion(List<Habitacion> listaHabitaciones, int numHabitacion) {
        for (Habitacion habitacion : listaHabitaciones) {
            if (habitacion.getNumHabitacion() == numHabitacion) {
                return habitacion;
            }
        }
        return null; // Si no se encuentra la habitación
    }


    /**
     * Método para editar los atributos de una habitación dado por el usuario.
     *
     * @param sc         Scanner utilizado para obtener la entrada del usuario.
     * @param habitacion Objeto Habitacion que se editará.
     */
    private void editarAtributosHabitacion(Scanner sc, Habitacion habitacion) {
        boolean seguirEditando = true;

        while (seguirEditando) {
            System.out.println("\nSeleccione el atributo a editar:");
            System.out.println("1. Tipo de Habitación");
            System.out.println("2. Número de Camas");
            System.out.println("3. Disponibilidad");
            System.out.println("4. Costo por Noche");
            System.out.println("5. Terminar edición");

            int opcion;
            while (true) {
                // Validar que la opción ingresada sea un entero
                System.out.print("Ingrese el número de la opción: ");
                String opcionStr = sc.nextLine();
                if (esEntero(opcionStr)) {
                    opcion = Integer.parseInt(opcionStr);
                    break;
                } else {
                    System.out.println("Por favor, ingrese un número válido.");
                }
            }

            
            switch (opcion) {
                case 1:
                    System.out.println("Ingrese el nuevo tipo de habitación:");
                    String nuevoTipo = sc.nextLine();
                    habitacion.setTipoHabitacion(nuevoTipo);
                    break;
                    
                case 2:
                    // Validar que la entrada sea un entero antes de convertirla
                    while (true) {
                        System.out.println("Ingrese el nuevo número de camas:");
                        String nuevoNumCamasStr = sc.nextLine();
                        if (esEntero(nuevoNumCamasStr)) {
                            int nuevoNumCamas = Integer.parseInt(nuevoNumCamasStr);
                            habitacion.setNumCamas(nuevoNumCamas);
                            break;
                        } else {
                            System.out.println("Por favor, ingrese un número válido.");
                        }
                    }
                    break;
                case 3:
                    System.out.println("Ingrese la nueva disponibilidad (true/false):");
                    boolean nuevaDisponibilidad = sc.nextBoolean();
                    sc.nextLine(); // Consumir la nueva línea después de nextBoolean
                    habitacion.setDisponible(nuevaDisponibilidad);
                    break;
                case 4:
                    // Validar que la entrada sea un número antes de convertirla
                    while (true) {
                        System.out.println("Ingrese el nuevo costo por noche:");
                        String nuevoCostoNocheStr = sc.nextLine();
                        if (esEntero(nuevoCostoNocheStr)) {
                            double nuevoCostoNoche = Double.parseDouble(nuevoCostoNocheStr);
                            habitacion.setCostoNoche(nuevoCostoNoche);
                            break;
                        } else {
                            System.out.println("Por favor, ingrese un número válido.");
                        }
                    }
                    break;
                case 5:
                    seguirEditando = false;
                    break;
                default:
                    System.out.println("Opción no válida. Por favor, elija un número del 1 al 6.");
            }
        }
    }


   /**
     * Método para editar las habitaciones en la lista proporcionada por su número.
     *
     * @param sc              Scanner utilizado para obtener la entrada del usuario.
     * @param listaHoteles    Lista de hoteles donde se buscará el hotel que contiene la habitación a editar.
     * @param listaHabitacion Lista de habitaciones donde se buscará y editarán los datos de la habitación.
     */
    public void editarHabitaciones(Scanner sc, List<Hotel> listaHoteles, List<Habitacion> listaHabitacion) {
        // Asumiendo que ya tienes un hotel al cual deseas editar la habitación
        int idHotelEditarHabitacion = HOTEL.pedirIdHotel(sc, "editar una habitación");
        Hotel hotelEditarHabitacion = Hotel.consultarHotel(listaHoteles, idHotelEditarHabitacion);

        if (hotelEditarHabitacion != null) {
            System.out.println("\nIngrese el número de la habitación que desea editar:");
            int numHabitacionEditar = sc.nextInt();
            sc.nextLine(); // Consumir la nueva línea después de nextInt

            // Buscar la habitación en la lista del hotel
            Optional<Habitacion> habitacionOptional = hotelEditarHabitacion.getHabitaciones().stream()
                    .filter(h -> h.getNumHabitacion() == numHabitacionEditar)
                    .findFirst();

            if (habitacionOptional.isPresent()) {
                Habitacion habitacionEditar = habitacionOptional.get();
                System.out.println("Habitación encontrada en el hotel " + hotelEditarHabitacion.getNombre() + ":\n" + habitacionEditar.toString());
                editarAtributosHabitacion(sc, habitacionEditar);
                System.out.println("Habitación actualizada:\n" + habitacionEditar.toString());
                // Puedes guardar la información actualizada en el CSV si es necesario
            } else {
                System.out.println("No se encontró una habitación con el número proporcionado en el hotel.");
            }
        } else {
            System.out.println("No se encontró un hotel con el ID proporcionado.");
        }
    }


     /**
     * Método privado que verifica si una cadena representa un número entero.
     *
     * @param str Cadena a verificar.
     * @return true si la cadena es un entero, false si no lo es.
     */
    private boolean esEntero(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    
    /**
     * Actualiza los atributos de la habitación en el archivo CSV correspondiente.
     * La actualización se realiza mediante la lectura del archivo CSV, la modificación de la línea
     * que corresponde a la habitación actual y la escritura de las líneas actualizadas nuevamente en el archivo.
     * Los atributos de la habitación se toman directamente de los atributos actuales del objeto.
     */
    private void actualizarArchivoCSV() {
        try {
            // Lee todas las líneas del archivo CSV
            List<String> lineas = Files.readAllLines(Paths.get("habitaciones.csv"));

            // Encuentra la línea correspondiente a la habitación actual
            for (int i = 1; i < lineas.size(); i++) {
                String[] campos = lineas.get(i).split(",");
                if (campos.length > 0 && campos[0].equals(String.valueOf(this.numHabitacion))) {
                    // Actualiza los campos en la línea

                    // Reemplaza los índices y los valores de ejemplo con los atributos reales de la habitación
                    campos[1] = this.tipoHabitacion;
                    campos[2] = String.valueOf(this.numCamas);
                    campos[3] = String.valueOf(this.disponible);
                    campos[4] = String.valueOf(this.costoNoche);

                    // Actualiza la línea en la lista
                    lineas.set(i, String.join(",", campos));
                    break;
                }
            }

            // Reescribe el archivo CSV con las líneas actualizadas
            Files.write(Paths.get("habitaciones.csv"), lineas);

            System.out.println("Archivo CSV de habitaciones actualizado después de cambiar los atributos.");
        } catch (IOException e) {
            System.err.println("Error al actualizar el archivo CSV de habitaciones: " + e.getMessage());
        }
    }

}
