import java.util.Scanner;


public class Verificadores{
       /**
     * Verifica si el usuario ingreso un entero
     * @param sc es un objeto Scanner para obtener la entrada del usuario.
     * @param mensaje el mensaje que va a tener el dato que requiere.
     * @return Regresa un string que es el dato que se pide en el scanner, null si el usuario quiere terminar la ejecucion.
     */
    public String verificarEsUnEntero(String mensaje) {
        while (true) {
            String input = pedirDatosAgregar(mensaje);
            if (input == null) {return null;}
            try {
                input = input.replaceAll("\\s", "");
                int entero = Integer.parseInt(input);
                return String.valueOf(entero);
            } catch (Exception e) {
                System.err.println("\nNo se permite ingresar otros caracteres mas que numeros.\n");
            }
        }
    }

    
     /**
     * Metodo para mostrar un mensaje de agregacion de atributos de entidades
     * 
     * @param sc es el Scannner con el cual vamos a realizar la entrada al usuario.
     * @param mensaje es el mensaje del atributo en forma de pregunta que vamos a realizar al usuario.4EVER
     * 
     * @return un String en caso de que el usuario este de acuerdo en ingresar a guardar ese dato. Regresa 
     * Null en caso de regresar.
     */
    public String pedirDatosAgregar(String mensaje) {
        Scanner scNuevo = new Scanner(System.in);
        boolean haveIAResponse = false;
        do {
            System.out.println(mensaje);
            String input = scNuevo.nextLine();
            input = input.replaceAll(",", "~");
            boolean amISure = false;
            while (!amISure) {
                System.out.println("\n¿Esta seguro que desea guardar este dato?\n" +
                    "1.- SI.\n" +
                    "2.- NO.\n" +
                    "3.- REGRESAR.\n");
                String newInput = scNuevo.nextLine().toLowerCase().replaceAll("\\s", "~");
                if (newInput.equals("1") || newInput.equals("si")) {
                    return input;
                } else if (newInput.equals("2") || newInput.equals("no")) {
                    amISure = true;
                } else if (newInput.equals("3") || newInput.equals("regresar")) {
                    return null;
                } else {
                    System.out.println("\nIngrese el numero de la opcion a realizar o escriba \"SI\" O \"NO\".\n");
                }
            } 
        } while (!haveIAResponse);
        scNuevo.close();
        return null;
    }
}