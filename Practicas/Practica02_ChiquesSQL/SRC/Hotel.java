import java.util.List;
import java.util.Scanner;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;

public class Hotel {
    
    // Atributos de la clase
    
    private int idHotel;
    private String nombre;
    private Direccion direccion;
    private String telefono;
    private int numHabitaciones;
    private int habitacionesDisponibles;
    private int habitacionesOcupadas;
    private String horaCheckin;
    private String horaCheckout;
    private boolean petFriendly;
    private List<Habitacion> habitaciones;


    /**
     * Constructor de la clase Hotel que inicializa sus atributos con los valores proporcionados.
     *
     * @param idHotel Identificador único del hotel.
     * @param nombre Nombre del hotel.
     * @param direccion Objeto de la clase Direccion que representa la ubicación del hotel.
     * @param telefono Número de teléfono del hotel.
     * @param numHabitaciones Número total de habitaciones en el hotel.
     * @param habitacionesDisponibles Número de habitaciones disponibles en el hotel.
     * @param habitacionesOcupadas Número de habitaciones actualmente ocupadas en el hotel.
     * @param horaCheckin Hora de check-in del hotel en formato HH:mm.
     * @param horaCheckout Hora de check-out del hotel en formato HH:mm.
     * @param petFriendly Indica si el hotel admite mascotas (true) o no (false).
     */
    public Hotel(int idHotel, String nombre, Direccion direccion, String telefono, int numHabitaciones, int habitacionesDisponibles,
                 int habitacionesOcupadas, String horaCheckin, String horaCheckout,
                 boolean petFriendly
                 //List<Habitacion> habitaciones, 
                 //Servicios servicios,
                 //SalonEventos salonesEventos
                 ) {

        this.idHotel = idHotel;
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
        this.numHabitaciones = numHabitaciones;
        this.habitacionesDisponibles = habitacionesDisponibles;
        this.habitacionesOcupadas = habitacionesOcupadas;
        this.horaCheckin = horaCheckin;
        this.horaCheckout = horaCheckout;
        this.petFriendly = petFriendly;
        //this.habitaciones = habitaciones;
    }

    /**
     * Obtiene el identificador único del hotel.
     *
     * @return El identificador único del hotel.
     */
    public int getIdHotel() {
        return idHotel;
    }

    /**
     * Obtiene el nombre del hotel.
     *
     * @return El nombre del hotel.
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Obtiene la dirección del hotel.
     *
     * @return Un objeto de la clase Direccion que representa la ubicación del hotel.
     */
    public Direccion getDireccion() {
        return direccion;
    }

    /**
     * Obtiene el número de teléfono del hotel.
     *
     * @return El número de teléfono del hotel.
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Obtiene el número total de habitaciones en el hotel.
     *
     * @return El número total de habitaciones en el hotel.
     */
    public int getNumHabitaciones() {
        return numHabitaciones;
    }

    /**
     * Obtiene el número de habitaciones disponibles en el hotel.
     *
     * @return El número de habitaciones disponibles en el hotel.
     */
    public int getHabitacionesDisponibles() {
        return habitacionesDisponibles;
    }

    /**
     * Obtiene el número de habitaciones actualmente ocupadas en el hotel.
     *
     * @return El número de habitaciones ocupadas en el hotel.
     */
    public int getHabitacionesOcupadas() {
        return habitacionesOcupadas;
    }

    /**
     * Obtiene la hora de check-in del hotel en formato HH:mm.
     *
     * @return La hora de check-in del hotel.
     */
    public String getHoraCheckin() {
        return horaCheckin;
    }

    /**
     * Obtiene la hora de check-out del hotel en formato HH:mm.
     *
     * @return La hora de check-out del hotel.
     */
    public String getHoraCheckout() {
        return horaCheckout;
    }

    /**
     * Obtiene la lista de habitaciones disponibles en el hotel.
     *
     * @return Una lista de objetos de la clase Habitacion que representan las habitaciones del hotel.
     */
    public List<Habitacion> getHabitaciones() {
        return habitaciones;
    }

    /**
     * Verifica si el hotel admite mascotas (Pet Friendly).
     *
     * @return true si el hotel es Pet Friendly, false si no lo es.
     */
    public boolean isPetFriendly() {
        return petFriendly;
    }

   
    /**
     * Establece el identificador único del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param idHotel El nuevo identificador único del hotel.
     */
    public void setIdHotel(int idHotel) {
        this.idHotel = idHotel;
        actualizarArchivoCSV();
    }

    /**
     * Establece el nombre del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param nombre El nuevo nombre del hotel.
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
        actualizarArchivoCSV();
    }

    /**
     * Establece la dirección del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param direccion La nueva dirección del hotel.
     */
    public void setDireccion(Direccion direccion) {
        this.direccion = direccion;
        actualizarArchivoCSV();
    }

    /**
     * Establece el número de teléfono del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param telefono El nuevo número de teléfono del hotel.
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
        actualizarArchivoCSV();
    }

    /**
     * Establece el número total de habitaciones en el hotel y actualiza el archivo CSV correspondiente.
     *
     * @param numHabitaciones El nuevo número total de habitaciones en el hotel.
     */
    public void setNumHabitaciones(int numHabitaciones) {
        this.numHabitaciones = numHabitaciones;
        actualizarArchivoCSV();
    }

    /**
     * Establece el número de habitaciones disponibles en el hotel y actualiza el archivo CSV correspondiente.
     *
     * @param habitacionesDisponibles El nuevo número de habitaciones disponibles en el hotel.
     */
    public void setHabitacionesDisponibles(int habitacionesDisponibles) {
        this.habitacionesDisponibles = habitacionesDisponibles;
        actualizarArchivoCSV();
    }

    /**
     * Establece el número de habitaciones ocupadas en el hotel y actualiza el archivo CSV correspondiente.
     *
     * @param habitacionesOcupadas El nuevo número de habitaciones ocupadas en el hotel.
     */
    public void setHabitacionesOcupadas(int habitacionesOcupadas) {
        this.habitacionesOcupadas = habitacionesOcupadas;
        actualizarArchivoCSV();
    }

    /**
     * Establece la hora de check-in del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param horaCheckin La nueva hora de check-in del hotel en formato HH:mm.
     */
    public void setHoraCheckin(String horaCheckin) {
        this.horaCheckin = horaCheckin;
        actualizarArchivoCSV();
    }

    /**
     * Establece la hora de check-out del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param horaCheckout La nueva hora de check-out del hotel en formato HH:mm.
     */
    public void setHoraCheckout(String horaCheckout) {
        this.horaCheckout = horaCheckout;
        actualizarArchivoCSV();
    }

    /**
     * Establece la lista de habitaciones del hotel y actualiza el archivo CSV correspondiente.
     *
     * @param habitaciones La nueva lista de habitaciones del hotel.
     */
    public void setHabitaciones(List<Habitacion> habitaciones) {
        this.habitaciones = habitaciones;
        actualizarArchivoCSV();
    }

    /**
     * Establece si el hotel es Pet Friendly y actualiza el archivo CSV correspondiente.
     *
     * @param petFriendly true si el hotel es Pet Friendly, false si no lo es.
     */
    public void setPetFriendly(boolean petFriendly) {
        this.petFriendly = petFriendly;
        actualizarArchivoCSV();
    }
    
    /**
     * Devuelve una representación en formato de cadena (String) del objeto Hotel.
     * Los campos están ordenados y separados por comas.
     *
     * @return Una cadena que contiene los campos del hotel separados por comas.
     */
    @Override
    public String toString() {
        return idHotel + "," + nombre + "," + direccion + "," + telefono + "," + numHabitaciones + ","
                + habitacionesDisponibles + "," + habitacionesOcupadas + "," + horaCheckin + ","
                + horaCheckout + "," + petFriendly;
    }

   
    /**
     * Instancia de la clase Verificadores utilizada para realizar verificaciones y obtener datos.
     */
    Verificadores verificadores = new Verificadores();

    /**
     * Instancia de la clase Direccion utilizada para almacenar la dirección del hotel.
     * Inicializada con valores nulos y ceros, se espera que sea actualizada posteriormente.
     */
    Direccion adress = new Direccion(null, 0, 0, null, null);

    /**
     * Instancia de la clase Menu 
     */
    Menu MENU = new Menu();


    /**
     * Método para crear un objeto Hotel con la información proporcionada por el usuario.
     * Utiliza la clase Verificadores para validar y obtener datos.
     *
     * @return Objeto Hotel creado con la información ingresada por el usuario.
     */
    public Hotel crearHotel() {
        // Variables locales
        int idHotel, numHabitaciones, habitacionesDisponibles, habitacionesOcupadas;
        Direccion direccion;
        String nombre, telefono, horaCheckin, horaCheckout;
        //Servicios servicios;
        boolean petFriendly;
        //SalonEventos salonEventos;
        //List<Habitacion> habitaciones;

        
         // Llamar al método verificarEsUnEntero desde la instancia
        String idHotelString = verificadores.verificarEsUnEntero("\nIngrese el número de identificador");

         // Convertir el resultado a un entero si es necesario
        if (idHotelString != null) {
             // Ahora puedes usar idHotel en tu lógica
         }         
        idHotel = Integer.parseInt(idHotelString);


        // Obtener datos del hotel
        nombre = verificadores.pedirDatosAgregar("\nIngrese el nombre del hotel:");
        if (nombre == null) {
            return null;
        }

        telefono = verificadores.pedirDatosAgregar("\nIngrese el teléfono del hotel:");
        if (telefono == null) {
            return null;
        }

         // Por ejemplo, para la hora de check-in y check-out
         horaCheckin = verificadores.pedirDatosAgregar("\nIngrese la hora de check-in (HH:mm):");
         if (horaCheckin == null) {
             return null;
         }
 
         horaCheckout = verificadores.pedirDatosAgregar("\nIngrese la hora de check-out (HH:mm):");
         if (horaCheckout == null) {
             return null;
         }

         direccion = adress.obtenerDireccion();

         String numHabitacionesString = verificadores.verificarEsUnEntero("\n¿Cuántas habitaciones tiene este hotel? ");
         if (numHabitacionesString == null) {
             // Manejo de error o retorno nulo según tus necesidades
         }
         numHabitaciones = Integer.parseInt(numHabitacionesString);
    
         // Obtener datos de habitaciones disponibles
        String habitacionesDisponiblesString = verificadores.verificarEsUnEntero("\n¿Cuántas habitaciones están disponibles en este hotel? ");
        if (habitacionesDisponiblesString == null) {
            // Manejo de error o retorno nulo según tus necesidades
        }
        habitacionesDisponibles = Integer.parseInt(habitacionesDisponiblesString);

        // Obtener datos de habitaciones ocupadas
        String habitacionesOcupadasString = verificadores.verificarEsUnEntero("\n¿Cuántas habitaciones están ocupadas en este hotel? ");
        if (habitacionesOcupadasString == null) {
            // Manejo de error o retorno nulo según tus necesidades
        }
        habitacionesOcupadas = Integer.parseInt(habitacionesOcupadasString);

        String petFriendlyString = verificadores.pedirDatosAgregar("\n¿El hotel es pet-friendly? (SI/NO): ");
        if (petFriendlyString == null) {
            return null;// Manejo de error o retorno nulo según tus necesidades
        }
        petFriendly = true;
        
        // Crear y retornar el objeto Hotel
        return new Hotel(idHotel, nombre, direccion, telefono, numHabitaciones, habitacionesDisponibles, habitacionesOcupadas, horaCheckin, horaCheckout, petFriendly);
    
    }
    

    /**
     * Método estático que elimina un hotel de la lista proporcionada por su ID.
     *
     * @param listaHoteles Lista de hoteles donde se buscará y eliminará el hotel.
     * @param idEliminar Identificador del hotel a eliminar.
     */
    public static void eliminarHotel(List<Hotel> listaHoteles, int idEliminar) {
        boolean hotelEncontrado = false;

        // Iterar sobre la lista de hoteles y eliminar el hotel con el ID proporcionado
        Iterator<Hotel> iterator = listaHoteles.iterator();
        while (iterator.hasNext()) {
            Hotel hotel = iterator.next();
            if (hotel.getIdHotel() == idEliminar) {
                iterator.remove();
                hotelEncontrado = true;
                System.out.println("Hotel eliminado:\n" + hotel.toString());
                break; // No es necesario continuar buscando
            }
        }

        if (!hotelEncontrado) {
            System.out.println("No se encontró ningún hotel con el ID proporcionado.");
        }
    }
   

    /**
     * Método estático que consulta un hotel en la lista por su ID.
     *
     * @param listaHoteles Lista de hoteles donde se buscará el hotel.
     * @param idConsultar Identificador del hotel a consultar.
     * @return Objeto Hotel si se encuentra, o null si no se encuentra.
     */
    public static Hotel consultarHotel(List<Hotel> listaHoteles, int idConsultar) {
        for (Hotel hotel : listaHoteles) {
            if (hotel.getIdHotel() == idConsultar) {
                return hotel; // Se encontró el hotel, se devuelve
            }
        }
        return null; // No se encontró el hotel
    }


    /**
     * Método para editar los atributos de un hotel dado por el usuario.
     *
     * @param sc Scanner utilizado para obtener la entrada del usuario.
     * @param hotel Objeto Hotel que se editará.
     */
    private void editarAtributosHotel(Scanner sc, Hotel hotel) {
        boolean seguirEditando = true;

        while (seguirEditando) {
            System.out.println("Seleccione el atributo a editar:");
            System.out.println("1. Nombre");
            System.out.println("2. Dirección");
            System.out.println("3. Teléfono");
            System.out.println("4. Número de Habitaciones");
            System.out.println("5. Habitaciones Disponibles");
            System.out.println("6. Habitaciones Ocupadas");
            System.out.println("7. Hora de Check-in");
            System.out.println("8. Hora de Checkout");
            System.out.println("9. Pet Friendly");
            System.out.println("10. Terminar edición");

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
                    System.out.println("Ingrese el nuevo nombre:");
                    String nuevoNombre = sc.nextLine();
                    hotel.setNombre(nuevoNombre);
                    break;
                case 2:
                    // Editar dirección
                    hotel.getDireccion().editarAtributosDireccion(sc);
                    break;
                case 3:
                    System.out.println("Ingrese el nuevo teléfono:");
                    String nuevoTelefono = sc.nextLine();
                    hotel.setTelefono(nuevoTelefono);
                    break;
                case 4:
                    // Validar que la entrada sea un entero antes de convertirla
                    while (true) {
                        System.out.println("Ingrese el nuevo número de habitaciones:");
                        String nuevoNumHabitacionesStr = sc.nextLine();
                        if (esEntero(nuevoNumHabitacionesStr)) {
                            int nuevoNumHabitaciones = Integer.parseInt(nuevoNumHabitacionesStr);
                            hotel.setNumHabitaciones(nuevoNumHabitaciones);
                            break;
                        } else {
                            System.out.println("Por favor, ingrese un número válido.");
                        }
                    }
                    break;
                case 5:
                    // Validar que la entrada sea un entero antes de convertirla
                    while (true) {
                        System.out.println("Ingrese el nuevo número de habitaciones disponibles:");
                        String nuevoHabitacionesDisponiblesStr = sc.nextLine();
                        if (esEntero(nuevoHabitacionesDisponiblesStr)) {
                            int nuevoHabitacionesDisponibles = Integer.parseInt(nuevoHabitacionesDisponiblesStr);
                            hotel.setHabitacionesDisponibles(nuevoHabitacionesDisponibles);
                            break;
                        } else {
                            System.out.println("Por favor, ingrese un número válido.");
                        }
                    }
                    break;
                case 6:
                    // Validar que la entrada sea un entero antes de convertirla
                    while (true) {
                        System.out.println("Ingrese el nuevo número de habitaciones ocupadas:");
                        String nuevoHabitacionesOcupadasStr = sc.nextLine();
                        if (esEntero(nuevoHabitacionesOcupadasStr)) {
                            int nuevoHabitacionesOcupadas = Integer.parseInt(nuevoHabitacionesOcupadasStr);
                            hotel.setHabitacionesOcupadas(nuevoHabitacionesOcupadas);
                            break;
                        } else {
                            System.out.println("Por favor, ingrese un número válido.");
                        }
                    }
                    break;
                
                case 7:
                    System.out.println("Ingrese la nueva hora de check-in (HH:mm):");
                    String nuevaHoraCheckin = sc.nextLine();
                    hotel.setHoraCheckin(nuevaHoraCheckin);
                    break;
                case 8:
                    System.out.println("Ingrese la nueva hora de check-out (HH:mm):");
                    String nuevaHoraCheckout = sc.nextLine();
                    hotel.setHoraCheckout(nuevaHoraCheckout);
                    break;
                case 9:
                    System.out.println("¿El hotel es Pet Friendly? (true/false):");
                    boolean petFriendly = sc.nextBoolean();
                    sc.nextLine(); // Consumir la nueva línea después de nextBoolean
                    hotel.setPetFriendly(petFriendly);
                    break;
                case 10:
                    seguirEditando = false;
                    break;
                default:
                    System.out.println("Opción no válida. Por favor, elija un número del 1 al 10.");
            }
        }
    }


    /**
     * Permite la edición de hoteles en la lista de hoteles proporcionada, solicitando información al usuario mediante el scanner.
     *
     * @param sc          Scanner utilizado para la entrada del usuario.
     * @param listaHoteles Lista de hoteles que se editarán.
     */
    public void editarHoteles(Scanner sc, List<Hotel> listaHoteles) {
        System.out.println("\nIngrese el ID del hotel que desea editar:");
        int idEditar = sc.nextInt();
        sc.nextLine(); // Consumir la nueva línea después de nextInt
    
        Hotel hotelEditar = Hotel.consultarHotel(listaHoteles, idEditar);
    
        if (hotelEditar != null) {
            System.out.println("\nHotel encontrado:\n" + hotelEditar);
            editarAtributosHotel(sc, hotelEditar);
            System.out.println("\nHotel actualizado:\n" + hotelEditar);
    
            // Llama al método para guardar el hotel editado en el archivo CSV
            guardarObjetoEnCSV("hoteles.csv", hotelEditar.toString());
            System.out.println("\nInformación del hotel actualizada en el archivo CSV.");
        } else {
            System.out.println("\nNo se encontró un hotel con el ID proporcionado.");
        }
    }
    

    /**
     * Método para agregar una habitación a la lista de habitaciones del hotel.
     *
     * @param habitacion La habitación que se va a agregar al hotel.
     */
    public void agregarHabitacion(Habitacion habitacion) {
        // Asegúrate de que la lista de habitaciones esté inicializada
        if (this.habitaciones == null) {
            this.habitaciones = new ArrayList<>();
        }

        // Agrega la nueva habitación a la lista
        this.habitaciones.add(habitacion);

        // Actualiza las estadísticas del hotel (puedes ajustar esto según tus necesidades)
        // Por ejemplo, si tienes atributos como numHabitaciones, habitacionesDisponibles, etc.
        this.numHabitaciones++;
        this.habitacionesDisponibles++;
    }


    /**
     * Método para solicitar al usuario el ID del hotel.
     *
     * @param sc      Scanner utilizado para la entrada del usuario.
     * @param accion  Acción que el usuario realizará (puede ser un mensaje para el prompt).
     * @return El ID del hotel ingresado por el usuario.
    */
    public int pedirIdHotel(Scanner sc, String accion) {
        while (true) {
            System.out.print("Ingrese el ID del hotel donde desea " + accion + ": ");
            if (sc.hasNextInt()) {
                int idHotel = sc.nextInt();
                sc.nextLine(); // Consumir la nueva línea después de nextInt
                return idHotel;
            } else {
                System.out.println("Por favor, ingrese un número válido.");
                sc.nextLine(); // Limpiar el búfer del scanner
            }
        }
    }


    /**
     * Método para eliminar una habitación del hotel y de la lista de habitaciones del sistema.
     *
     * @param numHabitacionEliminar Número de habitación a eliminar.
     * @param listaHabitaciones     Lista de habitaciones del sistema.
     */
    public void eliminarHabitacionEnHotelYLista(int numHabitacionEliminar, List<Habitacion> listaHabitaciones) {
        // Buscar la habitación en el hotel
        Habitacion habitacionAEliminar = null;
        for (Habitacion habitacion : habitaciones) {
            if (habitacion.getNumHabitacion() == numHabitacionEliminar) {
                habitacionAEliminar = habitacion;
                break;
            }
        }
    
        // Eliminar la habitación del hotel y de la lista de habitaciones del sistema
        if (habitacionAEliminar != null) {
            habitaciones.remove(habitacionAEliminar);
            // También puedes eliminar la habitación del sistema si está almacenada en una lista central
            listaHabitaciones.remove(habitacionAEliminar);
    
            // Lógica adicional para eliminar la habitación del archivo CSV, si es necesario
            MENU.eliminarObjetoEnCSV("habitaciones.csv", linea -> {
                String[] campos = linea.split(",");
                return campos.length > 0 && campos[0].equals(String.valueOf(numHabitacionEliminar));
            });
    
            System.out.println("Habitación eliminada del hotel y del sistema.");
        } else {
            System.out.println("No se encontró una habitación con el número proporcionado en el hotel.");
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


     // Método para obtener el ID de un objeto desde su representación en formato CSV
     private String obtenerIdObjetoDesdeString(String linea) {
        // Implementa este método según la estructura de tu CSV y cómo obtienes el ID del objeto
        // Por ejemplo, si el ID está en la primera columna, podrías hacer algo como:
        String[] campos = linea.split(",");
        return campos.length > 0 ? campos[0] : "";
    }


     /**
     * Método privado que actualiza el archivo CSV con la información del hotel.
     * Se invoca después de realizar cambios en los atributos del hotel.
     */
    private void actualizarArchivoCSV() {
        try {
            // Lee todas las líneas del archivo CSV
            List<String> lineas = Files.readAllLines(Paths.get("hoteles.csv"));

            // Encuentra la línea correspondiente al hotel actual
            for (int i = 1; i < lineas.size(); i++) {
                String[] campos = lineas.get(i).split(",");
                if (campos.length > 0 && campos[0].equals(String.valueOf(this.idHotel))) {
                    // Actualiza los campos en la línea

                    // Reemplaza los índices y los valores de ejemplo con los atributos reales del objeto Hotel
                    campos[1] = this.nombre;
                    campos[2] = this.direccion.toString(); // Ajusta la forma de representar la dirección
                    campos[3] = this.telefono;
                    campos[4] = String.valueOf(this.numHabitaciones);
                    campos[5] = String.valueOf(this.habitacionesDisponibles);
                    campos[6] = String.valueOf(this.habitacionesOcupadas);
                    campos[7] = this.horaCheckin;
                    campos[8] = this.horaCheckout;
                    campos[9] = String.valueOf(this.petFriendly);

                    // Actualiza la línea en la lista
                    lineas.set(i, String.join(",", campos));
                    break;
                }
            }

            // Reescribe el archivo CSV con las líneas actualizadas
            Files.write(Paths.get("hoteles.csv"), lineas);

            System.out.println("Archivo CSV actualizado después de cambiar los atributos del hotel.");
        } catch (IOException e) {
            System.err.println("Error al actualizar el archivo CSV: " + e.getMessage());
        }
    }


    /**
     * Guarda un objeto en un archivo CSV, actualizando o añadiendo una nueva línea según la existencia del objeto.
     *
     * @param archivo El nombre o ruta del archivo CSV donde se almacenará el objeto.
     * @param objeto  La representación en cadena del objeto que se guardará en el archivo CSV.
     *                La estructura de esta cadena debe ser coherente con el formato del CSV.
     *                Implementa el método {@code obtenerIdObjetoDesdeString} para extraer el ID del objeto del texto.
     */
    public void guardarObjetoEnCSV(String archivo, String objeto) {
        try {
            // Verifica si el archivo ya existe
            boolean existeArchivo = Files.exists(Paths.get(archivo));

            // Lee todas las líneas del archivo CSV si ya existe
            List<String> lineas = existeArchivo ? Files.readAllLines(Paths.get(archivo)) : new ArrayList<>();

            // Busca y elimina la línea antigua correspondiente al objeto si ya existe
            String idObjeto = obtenerIdObjetoDesdeString(objeto); // Implementa este método según la estructura de tu CSV
            lineas.removeIf(linea -> obtenerIdObjetoDesdeString(linea).equals(idObjeto));

            // Agrega el objeto actualizado o nuevo como una nueva línea en el archivo CSV
            lineas.add(objeto);

            // Utiliza el bloque try-with-resources para garantizar el cierre del FileWriter
            try (FileWriter writer = new FileWriter(archivo, false)) {
                // Agrega todas las líneas al archivo CSV
                for (String linea : lineas) {
                    writer.write(linea + "\n");
                }
                System.out.println("Objeto guardado en " + archivo);
            }
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo CSV: " + e.getMessage());
        }
    }







}










