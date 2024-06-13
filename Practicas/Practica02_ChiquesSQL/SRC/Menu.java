import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;
import java.io.BufferedWriter;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.function.Predicate;


/**
 * La clase Menu implementa un programa de gestión de hoteles, huéspedes y habitaciones.
 * Proporciona opciones para agregar, consultar, editar y eliminar información.
 */
public class Menu {

    private List<Hotel> listaHoteles = new ArrayList<>();
    private List<Huesped> listaHuespedes = new ArrayList<>(); 
    private List<Habitacion> listaHabitaciones = new ArrayList<>(); 

    private static Hotel HOTEL = new Hotel(0, null, null, null, 0, 0, 0, null, null, false);
    private static Huesped HUESPED = new Huesped(null, null, null, null, null, null, 0, null, null, null);
    private static Habitacion HABITACION = new Habitacion(null, 0, 0, false, 0.0);

    /**
     * Método que devuelve el menú principal del programa.
     * @return Cadena de caracteres que representa el menú principal.
     */
    private String menu() {
        return "------------------------------------------------------------------------\n" +
                "|                                                                      |\n" +
                "|                             HOTELES LUNA                             |\n" +
                "|                                                                      |\n" +
                "------------------------------------------------------------------------\n\n" +
                "1.- Agregar\n" +
                "2.- Consultar\n" +
                "3.- Editar\n" +
                "4.- Eliminar\n" +
                "5.- Salir\n";
    }

    /**
     * Método que devuelve un banner personalizado para diferentes opciones del menú.
     * @param option Opción para la cual se generará el banner.
     * @return Cadena de caracteres que representa el banner.
     */
    private String menuSigns(String option) {
        switch (option) {
            case "Agregar":
                return "\n------------------------------------------------\n" +
                        "|                MENU \"AGREGAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case "Eliminar":
                return "\n------------------------------------------------\n" +
                        "|               MENU \"ELIMINAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case "Consultar":
                return "\n------------------------------------------------\n" +
                        "|              MENU \"CONSULTAR\"                |\n" +
                        "------------------------------------------------\n\n";
            case "Editar":
                return "\n------------------------------------------------\n" +
                        "|              MENU \"EDITAR\"                  |\n" +
                        "------------------------------------------------\n\n";
            default:
                return "";
        }
    }

     /**
     * Método principal que inicia la ejecución del programa.
     */
    public void app() {
        Scanner sc = new Scanner(System.in);
        boolean isItAnExit = false;
        do {
            System.out.println(menu());
            String input = sc.nextLine().replaceAll("\\s", "");
            try {
                int option = Integer.parseInt(input);
                switch (option) {
                    case 1:
                        menuAgregar(sc);
                        break;
                    case 2:
                        menuConsultar(sc);
                        break;
                    case 3:
                        menuEditar(sc);
                        break;
                    case 4:
                        menuEliminar(sc);
                        break;
                    case 5:
                        isItAnExit = true;
                        System.out.println("\n¡Adiós! Gracias por usar HOTELES LUNA.");
                        break;
                    default:
                        System.out.println("\nIngrese un número de nuestro menú, en un rango de [1, 5].\n");
                        break;
                }
            } catch (java.lang.NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menú de opciones sin ningún otro carácter.\n");
            }
        } while (!isItAnExit);
        sc.close();
    }

    
    /**
     * Método que presenta un menú para elegir el tipo de objeto a agregar y realiza la acción correspondiente.
     * @param sc Scanner para la entrada del usuario.
     */
    private String elegirTipo(Scanner sc, String tipoMenu) {
        String[] opciones = {"Hoteles", "Huespedes", "Habitaciones", "Salir"};

        while (true) {
            System.out.println(setMenu(menuSigns(tipoMenu), tipoMenu));

            try {
                int option = Integer.parseInt(sc.nextLine().replaceAll("\\s", ""));
                if (option >= 1 && option <= opciones.length) {
                    return opciones[option - 1];
                } else {
                    System.out.println("\nIngrese un número de nuestro menú, en un rango de [1, " + opciones.length + "].\n");
                }
            } catch (NumberFormatException e) {
                System.err.println("\nSolo ingrese un número de nuestro menú de opciones sin ningún otro carácter.\n");
            }
        }
    }


    /**
     * Método que devuelve un menú personalizado para diferentes opciones del programa.
     * @param titulo Título del menú.
     * @param option Opción para la cual se generará el menú.
     * @return Cadena de caracteres que representa el menú personalizado.
     */
    private String setMenu(String titulo, String option) {
        return titulo +
                "1.- " + option + " Hotel.\n" +
                "2.- " + option + " Huesped.\n" +
                "3.- " + option + " Habitación.\n" +
                "4.- Regresar/Atras.\n";
    }
    

    /**
     * Método que maneja la lógica de agregar objetos (Hoteles, Huéspedes, Habitaciones) al sistema.
     * @param sc Scanner para la entrada del usuario.
     */
    public void menuAgregar(Scanner sc) {
        String tipo = elegirTipo(sc, "Agregar");
        if (tipo.equals("Salir")) return;
    
        switch (tipo) {
            case "Hoteles":
                Hotel nuevoHotel = HOTEL.crearHotel();
                if (nuevoHotel != null) {
                    listaHoteles.add(nuevoHotel);
                    guardarObjetoEnCSV("hoteles.csv", nuevoHotel.toString());
                    System.out.println("\nHotel creado:\n" + nuevoHotel.toString());
    
                    // Imprimir la lista de hoteles después de agregar
                    System.out.println("\nLista de Hoteles:");
                    for (Hotel hotel : listaHoteles) {
                        System.out.println(hotel);
                    }
                } else {
                    System.out.println("\nError al crear el hotel.");
                }
                break;
    
            case "Huespedes":
                Huesped nuevoHuesped = HUESPED.crearHuesped();
                if (nuevoHuesped != null) {
                    listaHuespedes.add(nuevoHuesped);
                    guardarObjetoEnCSV("huespedes.csv", nuevoHuesped.toString());
                    System.out.println("\nHuésped creado:\n" + nuevoHuesped.toString());
    
                    // Imprimir la lista de huéspedes después de agregar
                    System.out.println("\nLista de Huéspedes:");
                    for (Huesped huesped : listaHuespedes) {
                        System.out.println(huesped);
                    }
                } else {
                    System.out.println("\nError al crear el huésped.");
                }
                break;
    
            case "Habitaciones":
                // Asumiendo que ya tienes un hotel al cual deseas agregar la habitación
                int idHotelParaAgregarHabitacion = HOTEL.pedirIdHotel(sc, "agregar una habitación");
                Hotel hotelParaAgregarHabitacion = Hotel.consultarHotel(listaHoteles, idHotelParaAgregarHabitacion);
            
                if (hotelParaAgregarHabitacion != null) {
                    // Crear una nueva habitación
                    Habitacion nuevaHabitacion = HABITACION.crearHabitacion();
            
                    if (nuevaHabitacion != null) {
                        // Agregar la habitación al hotel
                        hotelParaAgregarHabitacion.agregarHabitacion(nuevaHabitacion);
            
                        // Agregar la habitación a la lista de habitaciones del sistema
                        listaHabitaciones.add(nuevaHabitacion);
            
                        // Imprimir la información de la habitación y el hotel después de agregar
                        System.out.println("\nHabitación creada y agregada al hotel " + hotelParaAgregarHabitacion.getNombre() + ":");
                        System.out.println(nuevaHabitacion.toString());
            
                        // Llamada para guardar la habitación en el archivo CSV
                        guardarObjetoEnCSV("habitaciones.csv", nuevaHabitacion.toString());
            
                        // También puedes imprimir la lista de habitaciones del sistema si es necesario
                        System.out.println("\nLista de habitaciones en el sistema:");
                        for (Habitacion habitacion : listaHabitaciones) {
                            System.out.println(habitacion.toString());
                        }
                    } else {
                        System.out.println("\nError al crear la habitación.");
                    }
                } else {
                    System.out.println("\nNo se encontró un hotel con el ID proporcionado.");
                }
                break;
            
    
            default:
                System.out.println("\nUpsss! Error al elegir el tipo");
                break;
        }
    }
    
    /**
     * Método que maneja la lógica de eliminar objetos (Hoteles, Huéspedes, Habitaciones) del sistema.
     * @param sc Scanner para la entrada del usuario.
     */
    public void menuEliminar(Scanner sc) {
        String tipo = elegirTipo(sc, "Eliminar");
        if (tipo.equals("Salir")) return;

        switch (tipo) {
            case "Hoteles":
                System.out.println("\nIngrese el ID del hotel que desea eliminar:");
                int idEliminar = sc.nextInt();
                sc.nextLine(); // Consumir la nueva línea después de nextInt

                eliminarObjetoEnCSV("hoteles.csv", linea -> {
                    String[] campos = linea.split(",");
                    return campos.length > 0 && campos[0].equals(String.valueOf(idEliminar));
                });
                break;

            case "Huespedes":
                System.out.println("\nIngrese el número de membresía del huésped que desea eliminar:");
                int numMembresiaEliminar = sc.nextInt();
                sc.nextLine(); // Consumir la nueva línea después de nextInt

                eliminarObjetoEnCSV("huespedes.csv", linea -> {
                    String[] campos = linea.split(",");
                    return campos.length > 6 && campos[6].equals(String.valueOf(numMembresiaEliminar));
                });
                break;

            case "Habitaciones":
                // Asumiendo que ya tienes un hotel al cual deseas eliminar la habitación
                int idHotelParaEliminarHabitacion = HOTEL.pedirIdHotel(sc, "eliminar una habitación");
                Hotel hotelParaEliminarHabitacion = Hotel.consultarHotel(listaHoteles, idHotelParaEliminarHabitacion);
            
                if (hotelParaEliminarHabitacion != null) {
                    // Luego, puedes solicitar el número de habitación que desea eliminar
                    try {
                        System.out.println("\nIngrese el número de habitación que desea eliminar:");
                        int numHabitacionEliminar = sc.nextInt();
                        sc.nextLine(); // Consumir la nueva línea después de nextInt
            
                        // Consulta la habitación en la lista del hotel
                        Habitacion habitacionAEliminar = HABITACION.consultarHabitacion(hotelParaEliminarHabitacion.getHabitaciones(), numHabitacionEliminar);
            
                        if (habitacionAEliminar != null) {
                            // Define la condición para eliminar la línea en el archivo CSV
                            Predicate<String> condicionEliminar = linea -> {
                                String[] campos = linea.split(",");
                                return campos.length > 0 && campos[0].equals(String.valueOf(numHabitacionEliminar));
                            };
            
                            // Elimina la habitación del hotel y del sistema utilizando el método existente
                            hotelParaEliminarHabitacion.eliminarHabitacionEnHotelYLista(numHabitacionEliminar, listaHabitaciones);
            
                            // Elimina la línea correspondiente en el archivo CSV
                            eliminarObjetoEnCSV("habitaciones.csv", condicionEliminar);
                        } else {
                            System.out.println("\nLa habitación no existe en el hotel.");
                        }
                    } catch (InputMismatchException e) {
                        System.out.println("\nError: Ingrese un número válido para el número de habitación.");
                        sc.nextLine(); // Limpiar el búfer del scanner
                    }
                } else {
                    System.out.println("\nNo se encontró un hotel con el ID proporcionado.");
                }
                break;

            default:
                System.out.println("Uppsss: Error al elegir el tipo");
                break;
        }
    }

    /**
     * Método que maneja la lógica de consultar información de objetos (Hoteles, Huéspedes, Habitaciones) en el sistema.
     * @param sc Scanner para la entrada del usuario.
     */
    public void menuConsultar(Scanner sc) {
        String tipo = elegirTipo(sc, "Consultar");
        if (tipo.equals("Salir")) return;

        switch (tipo) {
            case "Hoteles":
                System.out.println("\nIngrese el ID del hotel que desea consultar:");
                int idHotelConsultar = sc.nextInt();
                sc.nextLine(); // Consumir la nueva línea después de nextInt

                Hotel hotelConsultado = Hotel.consultarHotel(listaHoteles, idHotelConsultar);

                if (hotelConsultado != null) {
                    System.out.println("\nInformación del hotel consultado:\n" + hotelConsultado.toString());
                } else {
                    System.out.println("\nNo se encontró un hotel con el ID proporcionado.");
                }
                break;

            case "Huespedes":
                System.out.println("\nIngrese el número de membresía del huésped que desea consultar:");
                int numMembresiaConsultar = sc.nextInt();
                sc.nextLine(); // Consumir la nueva línea después de nextInt

                Huesped huespedConsultado = Huesped.consultarHuesped(listaHuespedes, numMembresiaConsultar);

                if (huespedConsultado != null) {
                    System.out.println("\nInformación del huésped consultado:\n" + huespedConsultado.toString());
                } else {
                    System.out.println("\nNo se encontró un huésped con el número de membresía proporcionado.");
                }
                break;

            case "Habitaciones":
                
                int idHotelParaConsultarHabitacion = HOTEL.pedirIdHotel(sc, "consultar una habitación");
                
                Hotel hotelParaConsultarHabitacion = Hotel.consultarHotel(listaHoteles, idHotelParaConsultarHabitacion);
                
                if (hotelParaConsultarHabitacion != null) {
                    // Luego, puedes solicitar el número de habitación que desea consultar
                    System.out.println("\nIngrese el número de habitación que desea consultar:");
                    int numHabitacionConsultar = sc.nextInt();
                    sc.nextLine(); // Consumir la nueva línea después de nextInt
                    // Consultar la habitación específica en el hotel
                    Habitacion habitacionConsultada = HABITACION.consultarHabitacion(hotelParaConsultarHabitacion.getHabitaciones(), numHabitacionConsultar);
                
                    if (habitacionConsultada != null) {
                        System.out.println("\nInformación de la habitación consultada:\n" + habitacionConsultada.toString());
                    } else {
                        System.out.println("\nNo se encontró una habitación con el número proporcionado en el hotel " + hotelParaConsultarHabitacion.getNombre() + ".");
                    }
                } else {
                    System.out.println("\nNo se encontró un hotel con el ID proporcionado.");
                }
                break;         
        }
    }

    /**
     * Método que maneja la lógica de editar objetos (Hoteles, Huéspedes) en el sistema.
     * @param sc Scanner para la entrada del usuario.
     */
    public void menuEditar(Scanner sc) {
        String tipo = elegirTipo(sc, "Editar");
        if (tipo.equals("Salir")) return;
    
        switch (tipo) {
            case "Hoteles":
                HOTEL.editarHoteles(sc, listaHoteles);
                break;
    
            case "Huespedes":
                HUESPED.editarHuespedes(sc, listaHuespedes);
                break;

            case "Habitaciones":
                HABITACION.editarHabitaciones(sc, listaHoteles, listaHabitaciones);
                break;
    
            default:
                System.out.println("Uppsss: Error al elegir el tipo");
                break;
        }
    }

    /**
     * Método que guarda un objeto en un archivo CSV.
     * @param archivo Nombre del archivo CSV.
     * @param objeto Cadena de caracteres que representa el objeto a guardar.
     */
    public void guardarObjetoEnCSV(String archivo, String objeto) {
        try {
            // Verifica si el archivo ya existe
            boolean existeArchivo = Files.exists(Paths.get(archivo));
    
            // Crea el archivo y agrega encabezados si no existe
            if (!existeArchivo) {
                // Agrega encabezados (puedes personalizarlos según tus necesidades)
                String encabezados = obtenerEncabezados(archivo);
                Files.write(Paths.get(archivo), encabezados.getBytes());
            }
    
            // Utiliza el bloque try-with-resources para garantizar el cierre del FileWriter
            try (FileWriter writer = new FileWriter(archivo, true)) {
                // Agrega el objeto como una nueva línea en el archivo CSV
                writer.write(objeto + "\n");
                System.out.println("Objeto guardado en " + archivo);
            }
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo CSV: " + e.getMessage());
        }
    }
    
    /**
     * Método que elimina un objeto de un archivo CSV basado en una condición dada.
     * @param archivo Nombre del archivo CSV.
     * @param condicionEliminar Condición que debe cumplir la línea para ser eliminada.
     */
    public void eliminarObjetoEnCSV(String archivo, Predicate<String> condicionEliminar) {
        try {
            // Lee todas las líneas del archivo CSV
            List<String> lineas = Files.readAllLines(Paths.get(archivo));
    
            // Crea un nuevo archivo temporal con extensión .csv
            Path archivoTemporal = Files.createTempFile("temp", ".csv");
            BufferedWriter writer = Files.newBufferedWriter(archivoTemporal);
    
            // Escribe solo aquellas líneas que no cumplen con la condición de eliminación
            for (String linea : lineas) {
                if (!condicionEliminar.test(linea)) {
                    writer.write(linea + "\n");
                }
            }
    
            writer.close();
    
            // Reemplaza el archivo original con el archivo temporal
            Files.move(archivoTemporal, Paths.get(archivo), StandardCopyOption.REPLACE_EXISTING);
    
            System.out.println("Objeto eliminado del archivo " + archivo);
        } catch (IOException e) {
            System.err.println("Error al eliminar objeto del archivo CSV: " + e.getMessage());
        }
    }
    
    /**
     * Método privado que devuelve los encabezados correspondientes al archivo CSV.
     * @param archivo Nombre del archivo CSV.
     * @return Cadena de caracteres que representa los encabezados.
     */
    private String obtenerEncabezados(String archivo) {
        if (archivo.equals("hoteles.csv")) {
            // Incluye los campos de la clase Direccion
            return "idHotel,nombre,calle,numeroInterior,numeroExterior,colonia,estado,telefono,numHabitaciones,habitacionesDisponibles,habitacionesOcupadas,horaCheckin,horaCheckout,petFriendly\n";
        } else if (archivo.equals("huespedes.csv")) {
            return "nombreHuesped,nacionalidad,telefono,fechaNacimiento,email,genero,numMembresia,tipoPago,numTarjeta,fechaVencimientoTarjeta\n";
        } else if (archivo.equals("habitaciones.csv")) {
            return "tipoHabitacion,numHabitacion,numCamas,disponible,costoNoche\n";
        } else {
            return "";
        }
    }



    /**
     * Método principal que inicia el programa.
     * @param args Argumentos de la línea de comandos (no utilizados en este caso).
     */
    public static void main(String[] args) {
        Menu menu = new Menu();
        menu.app();
    }
}
