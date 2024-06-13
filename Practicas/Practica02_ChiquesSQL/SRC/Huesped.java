import java.util.List;
import java.util.Scanner;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;

/**
 * Clase que representa a un huésped en un hotel.
 */
public class Huesped {
    private String nombreHuesped;
    private String nacionalidad;
    private String telefono;
    private String fechaNacimiento;
    private String email;
    private String genero;
    private int numMembresia;
    private String tipoPago;
    private String numTarjeta;
    private String fechaVencimientoTarjeta;
    //private Habitacion infoHabitacion;

    /**
     * Constructor para la clase Huesped.
     *
     * @param nombreHuesped           Nombre del huésped.
     * @param nacionalidad            Nacionalidad del huésped.
     * @param telefono                Número de teléfono del huésped.
     * @param fechaNacimiento         Fecha de nacimiento del huésped (en formato YYYY-MM-DD).
     * @param email                   Dirección de correo electrónico del huésped.
     * @param genero                  Género del huésped.
     * @param numMembresia            Número de membresía del huésped.
     * @param tipoPago                Tipo de pago del huésped.
     * @param numTarjeta              Número de tarjeta del huésped.
     * @param fechaVencimientoTarjeta Fecha de vencimiento de la tarjeta del huésped (en formato MM/YY).
     */

    public Huesped(String nombreHuesped, String nacionalidad, String telefono, String fechaNacimiento, String email,
                   String genero, int numMembresia, String tipoPago, String numTarjeta, String fechaVencimientoTarjeta
                   //Habitacion infoHabitacion
                   ) {
        this.nombreHuesped = nombreHuesped;
        this.nacionalidad = nacionalidad;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.email = email;
        this.genero = genero;
        this.numMembresia = numMembresia;
        this.tipoPago = tipoPago;
        this.numTarjeta = numTarjeta;
        this.fechaVencimientoTarjeta = fechaVencimientoTarjeta;
        //this.infoHabitacion = infoHabitacion;
    }

    /**
     * Obtiene el nombre del huésped.
     *
     * @return Nombre del huésped.
     */
    public String getNombreHuesped() {
        return nombreHuesped;
    }

    /**
     * Obtiene la nacionalidad del huésped.
     *
     * @return Nacionalidad del huésped.
     */
    public String getNacionalidad() {
        return nacionalidad;
    }

    /**
     * Obtiene el número de teléfono del huésped.
     *
     * @return Número de teléfono del huésped.
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * Obtiene la fecha de nacimiento del huésped.
     *
     * @return Fecha de nacimiento del huésped (en formato YYYY-MM-DD).
     */
    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    /**
     * Obtiene el correo electrónico del huésped.
     *
     * @return Correo electrónico del huésped.
     */
    public String getEmail() {
        return email;
    }

    /**
     * Obtiene el género del huésped.
     *
     * @return Género del huésped.
     */
    public String getGenero() {
        return genero;
    }

    /**
     * Obtiene el número de membresía del huésped.
     *
     * @return Número de membresía del huésped.
     */
    public int getNumMembresia() {
        return numMembresia;
    }

    /**
     * Obtiene el tipo de pago del huésped.
     *
     * @return Tipo de pago del huésped.
     */
    public String getTipoPago() {
        return tipoPago;
    }

    /**
     * Obtiene el número de tarjeta del huésped.
     *
     * @return Número de tarjeta del huésped.
     */
    public String getNumTarjeta() {
        return numTarjeta;
    }

    /**
     * Obtiene la fecha de vencimiento de la tarjeta del huésped.
     *
     * @return Fecha de vencimiento de la tarjeta del huésped (en formato MM/YY).
     */
    public String getFechaVencimientoTarjeta() {
        return fechaVencimientoTarjeta;
    }

    /**
     * Establece el nombre del huésped.
     *
     * @param nombreHuesped Nuevo nombre del huésped.
     */
    public void setNombreHuesped(String nombreHuesped) {
        this.nombreHuesped = nombreHuesped;
    }

    /**
     * Establece la nacionalidad del huésped.
     *
     * @param nacionalidad Nueva nacionalidad del huésped.
     */
    public void setNacionalidad(String nacionalidad) {
        this.nacionalidad = nacionalidad;
    }

    /**
     * Establece el número de teléfono del huésped.
     *
     * @param telefono Nuevo número de teléfono del huésped.
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    /**
     * Establece la fecha de nacimiento del huésped.
     *
     * @param fechaNacimiento Nueva fecha de nacimiento del huésped (en formato YYYY-MM-DD).
     */
    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    /**
     * Establece el correo electrónico del huésped.
     *
     * @param email Nuevo correo electrónico del huésped.
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Establece el género del huésped.
     *
     * @param genero Nuevo género del huésped.
     */
    public void setGenero(String genero) {
        this.genero = genero;
    }

    /**
     * Establece el número de membresía del huésped.
     *
     * @param numMembresia Nuevo número de membresía del huésped.
     */
    public void setNumMembresia(int numMembresia) {
        this.numMembresia = numMembresia;
    }

    /**
     * Establece el tipo de pago del huésped.
     *
     * @param tipoPago Nuevo tipo de pago del huésped.
     */
    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    /**
     * Establece el número de tarjeta del huésped.
     *
     * @param numTarjeta Nuevo número de tarjeta del huésped.
     */
    public void setNumTarjeta(String numTarjeta) {
        this.numTarjeta = numTarjeta;
    }

    /**
     * Establece la fecha de vencimiento de la tarjeta del huésped.
     *
     * @param fechaVencimientoTarjeta Nueva fecha de vencimiento de la tarjeta del huésped (en formato MM/YY).
     */
    public void setFechaVencimientoTarjeta(String fechaVencimientoTarjeta) {
        this.fechaVencimientoTarjeta = fechaVencimientoTarjeta;
    }

    /**
     * Devuelve una representación en formato de cadena (String) del objeto Huesped.
     *
     * @return Una cadena que contiene los campos del huésped separados por comas.
     */
    public String toString() {            
        return nombreHuesped + "," + nacionalidad + "," + telefono + "," + fechaNacimiento + "," + email + "," + genero + "," + numMembresia + "," + tipoPago + "," + numTarjeta + "," + fechaVencimientoTarjeta;
    }
    
    
    /**
     * Instancia de la clase Verificadores utilizada para realizar verificaciones y obtener datos.
     */
    Verificadores verificadores = new Verificadores();
    /**
     * Crea un objeto Huesped solicitando datos al usuario.
     *
     * @return Nuevo objeto Huesped creado con los datos ingresados.
     */
    public Huesped crearHuesped() {
        // Variables locales
        String nombreHuesped, nacionalidad, telefono, fechaNacimiento, email, genero, tipoPago, numTarjeta, fechaVencimientoTarjeta;
        int numMembresia;
    
        // Obtener datos del huésped
        nombreHuesped = verificadores.pedirDatosAgregar("\nIngrese el nombre del huésped:");
        if (nombreHuesped == null) {
            return null;
        }
    
        nacionalidad = verificadores.pedirDatosAgregar("\nIngrese la nacionalidad del huésped:");
        if (nacionalidad == null) {
            return null;
        }
    
        telefono = verificadores.pedirDatosAgregar("\nIngrese el teléfono del huésped:");
        if (telefono == null) {
            return null;
        }
    
        fechaNacimiento = verificadores.pedirDatosAgregar("\nIngrese la fecha de nacimiento del huésped (YYYY-MM-DD):");
        if (fechaNacimiento == null) {
            return null;
        }
    
        email = verificadores.pedirDatosAgregar("\nIngrese el email del huésped:");
        if (email == null) {
            return null;
        }
    
        genero = verificadores.pedirDatosAgregar("\nIngrese el género del huésped:");
        if (genero == null) {
            return null;
        }
    
        // Obtener número de membresía
        String numMembresiaString = verificadores.verificarEsUnEntero("\nIngrese el número de membresía del huésped: ");
        if (numMembresiaString == null) {
            return null;
        }
        numMembresia = Integer.parseInt(numMembresiaString);
    
        tipoPago = verificadores.pedirDatosAgregar("\nIngrese el tipo de pago del huésped:");
        if (tipoPago == null) {
            return null;
        }
    
        numTarjeta = verificadores.pedirDatosAgregar("\nIngrese el número de tarjeta del huésped:");
        if (numTarjeta == null) {
            return null;
        }
    
        fechaVencimientoTarjeta = verificadores.pedirDatosAgregar("\nIngrese la fecha de vencimiento de la tarjeta del huésped (MM/YY):");
        if (fechaVencimientoTarjeta == null) {
            return null;
        }
    
        // Puedes implementar la lógica para obtener la información de la habitación según tus necesidades
        // Por ejemplo, puedes tener un método en Hotel que devuelva una habitación disponible
    
        // Crear y retornar el objeto Huesped
        return new Huesped(nombreHuesped, nacionalidad, telefono, fechaNacimiento, email, genero, numMembresia, tipoPago,
                numTarjeta, fechaVencimientoTarjeta);
    }
    
    /**
     * Elimina un huésped de la lista según el número de membresía proporcionado.
     *
     * @param listaHuespedes      Lista de huéspedes.
     * @param numMembresiaEliminar Número de membresía del huésped a eliminar.
     */
     public static void eliminarHuesped(List<Huesped> listaHuespedes, int numMembresiaEliminar) {
        boolean huespedEncontrado = false;

        // Iterar sobre la lista de huéspedes y eliminar el huésped con el número de membresía proporcionado
        Iterator<Huesped> iterator = listaHuespedes.iterator();
        while (iterator.hasNext()) {
            Huesped huesped = iterator.next();
            if (huesped.getNumMembresia() == numMembresiaEliminar) {
                iterator.remove();
                huespedEncontrado = true;
                System.out.println("Huésped eliminado:\n" + huesped.toString());
                break; // No es necesario continuar buscando
            }
        }

        if (!huespedEncontrado) {
            System.out.println("No se encontró ningún huésped con el número de membresía proporcionado.");
        }
    }

    /**
     * Consulta y devuelve un objeto Huesped de la lista según el número de membresía proporcionado.
     *
     * @param listaHuespedes Lista de huéspedes.
     * @param numMembresia   Número de membresía del huésped a consultar.
     * @return Objeto Huesped si se encuentra, o null si no se encuentra.
     */    
    public static Huesped consultarHuesped(List<Huesped> listaHuespedes, int numMembresia) {
        for (Huesped huesped : listaHuespedes) {
            if (huesped.getNumMembresia() == numMembresia) {
                return huesped;
            }
        }
        return null; // Si no se encuentra el huésped
    }



   /**
     * Método para editar los atributos de un huésped, solicitando la entrada del usuario a través de un Scanner.
     * Los atributos que se pueden editar incluyen nombre, nacionalidad, teléfono, fecha de nacimiento,
     * email, género, tipo de pago, número de tarjeta y fecha de vencimiento de la tarjeta.
     *
     * @param sc Scanner utilizado para la entrada del usuario.
     */
    private void editarAtributosHuesped(Scanner sc) {
        boolean seguirEditando = true;

        while (seguirEditando) {
            System.out.println("Seleccione el atributo a editar:");
            System.out.println("1. Nombre del Huésped");
            System.out.println("2. Nacionalidad");
            System.out.println("3. Teléfono");
            System.out.println("4. Fecha de Nacimiento");
            System.out.println("5. Email");
            System.out.println("6. Género");
            System.out.println("7. Tipo de Pago");
            System.out.println("8. Número de Tarjeta");
            System.out.println("9. Fecha de Vencimiento de la Tarjeta");
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
                    System.out.println("Ingrese el nuevo nombre del huésped:");
                    String nuevoNombre = sc.nextLine();
                    this.setNombreHuesped(nuevoNombre);
                    break;
                case 2:
                    System.out.println("Ingrese la nueva nacionalidad del huésped:");
                    String nuevaNacionalidad = sc.nextLine();
                    this.setNacionalidad(nuevaNacionalidad);
                    break;
                case 3:
                    System.out.println("Ingrese el nuevo teléfono del huésped:");
                    String nuevoTelefono = sc.nextLine();
                    this.setTelefono(nuevoTelefono);
                    break;
                case 4:
                    System.out.println("Ingrese la nueva fecha de nacimiento del huésped (YYYY-MM-DD):");
                    String nuevaFechaNacimiento = sc.nextLine();
                    this.setFechaNacimiento(nuevaFechaNacimiento);
                    break;
                case 5:
                    System.out.println("Ingrese el nuevo email del huésped:");
                    String nuevoEmail = sc.nextLine();
                    this.setEmail(nuevoEmail);
                    break;
                case 6:
                    System.out.println("Ingrese el nuevo género del huésped:");
                    String nuevoGenero = sc.nextLine();
                    this.setGenero(nuevoGenero);
                    break;
                case 7:
                    System.out.println("Ingrese el nuevo tipo de pago del huésped:");
                    String nuevoTipoPago = sc.nextLine();
                    this.setTipoPago(nuevoTipoPago);
                    break;
                case 8:
                    System.out.println("Ingrese el nuevo número de tarjeta del huésped:");
                    String nuevoNumTarjeta = sc.nextLine();
                    this.setNumTarjeta(nuevoNumTarjeta);
                    break;
                case 9:
                    System.out.println("Ingrese la nueva fecha de vencimiento de la tarjeta del huésped (MM/YY):");
                    String nuevaFechaVencimiento = sc.nextLine();
                    this.setFechaVencimientoTarjeta(nuevaFechaVencimiento);
                    break;
                case 10:
                    seguirEditando = false;
                    break;
                default:
                    System.out.println("Opción no válida. Por favor, elija un número del 1 al 10.");
            }
        }

        // Después de editar los atributos, actualiza el archivo CSV
        try {
            this.actualizarArchivoCSV();
        } catch (IOException e) {
            System.err.println("Error al actualizar el archivo CSV de huéspedes: " + e.getMessage());
        }
    }

    /**
     * Método para editar huéspedes, solicitando el número de membresía del huésped que se desea editar
     * y luego llamando al método de edición de atributos.
     *
     * @param sc             Scanner utilizado para la entrada del usuario.
     * @param listaHuespedes Lista de huéspedes.
     */
    public void editarHuespedes(Scanner sc, List<Huesped> listaHuespedes) {
        System.out.println("Ingrese el número de membresía del huésped que desea editar:");
        int numMembresiaEditar;
        while (true) {
            // Validar que la opción ingresada sea un entero
            System.out.print("Ingrese el número de membresía: ");
            String numMembresiaStr = sc.nextLine();
            if (esEntero(numMembresiaStr)) {
                numMembresiaEditar = Integer.parseInt(numMembresiaStr);
                break;
            } else {
                System.out.println("Por favor, ingrese un número válido.");
            }
        }

        Huesped huespedEditar = consultarHuesped(listaHuespedes, numMembresiaEditar);

        if (huespedEditar != null) {
            System.out.println("Huésped encontrado:\n" + huespedEditar.toString());
            huespedEditar.editarAtributosHuesped(sc);
            System.out.println("Huésped actualizado:\n" + huespedEditar.toString());
        } else {
            System.out.println("No se encontró un huésped con el número de membresía proporcionado.");
        }
    }

    /**
     * Método para validar si una cadena es un entero.
     *
     * @param str Cadena a ser validada.
     * @return true si la cadena es un entero, false de lo contrario.
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
     * Método para actualizar el archivo CSV con los datos del huésped después de editar sus atributos.
     * Lanza una IOException en caso de error durante la lectura o escritura del archivo CSV.
     *
     * @throws IOException Si ocurre un error al actualizar el archivo CSV.
     */
    private void actualizarArchivoCSV() throws IOException {
        try {
            // Lee todas las líneas del archivo CSV
            List<String> lineas = Files.readAllLines(Paths.get("huespedes.csv"));

            // Encuentra la línea correspondiente al huésped actual
            for (int i = 1; i < lineas.size(); i++) {
                String[] campos = lineas.get(i).split(",");
                if (campos.length > 0 && campos[6].equals(String.valueOf(this.numMembresia))) {
                    // Actualiza los campos en la línea

                    // Reemplaza los índices y los valores de ejemplo con los atributos reales del objeto Huesped
                    campos[0] = this.nombreHuesped;
                    campos[1] = this.nacionalidad;
                    campos[2] = this.telefono;
                    campos[3] = this.fechaNacimiento;
                    campos[4] = this.email;
                    campos[5] = this.genero;
                    campos[6] = String.valueOf(this.numMembresia);
                    campos[7] = this.tipoPago;
                    campos[8] = this.numTarjeta;
                    campos[9] = this.fechaVencimientoTarjeta;

                    // Actualiza la línea en la lista
                    lineas.set(i, String.join(",", campos));
                    break;
                }
            }

            // Reescribe el archivo CSV con las líneas actualizadas
            Files.write(Paths.get("huespedes.csv"), lineas);

            System.out.println("Archivo CSV de huéspedes actualizado después de cambiar los atributos.");
        } catch (IOException e) {
            // Maneja las excepciones específicas que pueden ocurrir durante la lectura o escritura del archivo
            throw new IOException("Error al actualizar el archivo CSV de huéspedes.", e);
        }
    }




}