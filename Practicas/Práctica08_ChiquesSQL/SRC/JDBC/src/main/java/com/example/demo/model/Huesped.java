package com.example.demo.model;
import java.time.LocalDate;


public class Huesped{
  //atributos
  private String  idPersona; 			
  private String  idHotel; 
  private String  nombre; 		     
  private String  paterno;    
  private String  materno;   
  private LocalDate fechaNacimiento;      
  private char   genero;     
  private String  nacionalidad;          
  private String  idpago;                  
  private String  idFormaEfectivo;                
  private String  idFormaTarjeta;                  
  
  //Metodo constructor.
  public Huesped(){

  }

  //Metodos de asignacion.

  /**
   * Establece el identificador de la persona.
   * @param idPersona El identificador de la persona.
   */
  public void setIdPersona(String idPersona){
  	this.idPersona = idPersona;
  }

  /**
   * Establece el identificador del hotel.
   * @param idHotel El identificador del hotel.
   */
  public void setIdHotel(String idHotel){
  	this.idHotel = idHotel;
  }

  /**
   * Establece el nombre de la persona.
   * @param nombre El nombre de la persona.
   */
  public void setNombre(String nombre){
  	this.nombre = nombre;
  }

  /**
   * Establece el apellido paterno de la persona.
   * @param paterno El apellido paterno de la persona.
   */
  public void setPaterno(String paterno){
  	this.paterno = paterno;
  }

  /**
   * Establece el apellido materno de la persona.
   * @param materno El apellido materno de la persona.
   */ 
  public void setMaterno(String materno){
  	this.materno = materno;
  }

  /**
   * Establece la fecha de nacimiento de la persona.
   * @param ano Año de nacimiento.
   * @param mes Mes de nacimiento.
   * @param dia Día de nacimiento.
   */
  public void setFechaDeNacimiento(int ano, int mes, int dia){
  	this.fechaNacimiento = LocalDate.of(ano, mes, dia);
  }

  /**
   * Establece la fecha de nacimiento de la persona.
   * @param fechaNacimiento La fecha de nacimiento de la persona.
   */
  public void setFechaDeNacimiento(LocalDate fechaNacimiento){
    this.fechaNacimiento = fechaNacimiento;
  }

  /**
   * Establece el género de la persona.
   * @param genero El género de la persona ('M' para masculino, 'F' para femenino, u otro para no especificado).
   */
  public void setGenero(char genero){
  	this.genero = genero;
  }

  /**
   * Establece la nacionalidad de la persona.
   * @param nacionalidad La nacionalidad de la persona.
   */
  public void setNacionalidad(String nacionalidad){
  	this.nacionalidad = nacionalidad;
  }

  /**
   * Establece el identificador de pago.
   * @param idpago El identificador de pago.
   */
  public void setIdpago(String idpago){
  	this.idpago = idpago;
  }

  /**
   * Establece el identificador de la forma de pago en efectivo.
   * @param idFormaEfectivo El identificador de la forma de pago en efectivo.
   */
  public void setIdFormaEfectivo(String idFormaEfectivo){
  	this.idFormaEfectivo = idFormaEfectivo;
  }

  /**
   * Establece el identificador de la forma de pago con tarjeta.
   * @param idFormaTarjeta El identificador de la forma de pago con tarjeta.
   */
  public void setIdFormaTarjeta(String idFormaTarjeta){
  	this.idFormaTarjeta = idFormaTarjeta;
  }

  //Metodos de obtencion.

/**
 * Obtiene el identificador de la persona.
 * @return El identificador de la persona.
 */
public String getIdPersona(){
    return this.idPersona;
}

/**
 * Obtiene el identificador del hotel.
 * @return El identificador del hotel.
 */
public String getIdHotel(){
    return this.idHotel;
}

/**
 * Obtiene el nombre de la persona.
 * @return El nombre de la persona.
 */
public String getNombre(){
    return this.nombre;
}

/**
 * Obtiene el apellido paterno de la persona.
 * @return El apellido paterno de la persona.
 */
public String getPaterno(){
    return this.paterno;
}

/**
 * Obtiene el apellido materno de la persona.
 * @return El apellido materno de la persona.
 */
public String getMaterno(){
    return this.materno;
}

/**
 * Obtiene la fecha de nacimiento de la persona.
 * @return La fecha de nacimiento de la persona.
 */
public LocalDate getFechaDeNacimiento(){
    return this.fechaNacimiento;
}

/**
 * Obtiene el género de la persona.
 * @return El género de la persona.
 */
public char getGenero(){
    return this.genero;
}

/**
 * Obtiene la nacionalidad de la persona.
 * @return La nacionalidad de la persona.
 */
public String getNacionalidad(){
    return this.nacionalidad;
}

/**
 * Obtiene el identificador de pago.
 * @return El identificador de pago.
 */
public String getIdpago(){
    return this.idpago;
}

/**
 * Obtiene el identificador de la forma de pago en efectivo.
 * @return El identificador de la forma de pago en efectivo.
 */
public String getIdFormaEfectivo(){
    return this.idFormaEfectivo;
}

/**
 * Obtiene el identificador de la forma de pago con tarjeta.
 * @return El identificador de la forma de pago con tarjeta.
 */
public String getIdFormaTarjeta(){
    return this.idFormaTarjeta;
}
  
  @Override
  public String toString(){
    String datos = "idPersona:" + this.idPersona + "\n";
    datos += "idHotel:" + this.idHotel + "\n";
    datos += "Nombre:" + this.nombre + "\n";
    datos += "Paterno:" + this.paterno + "\n";
    datos += "Materno:" + this.materno + "\n";
    datos += "Fecha de nacimiento:" + this.fechaNacimiento + "\n";
    datos += "Genero:" + this.genero + "\n";
    datos += "idpago:" + this.idpago + "\n";
    datos += "idFormaEfectivo:" + this.idFormaEfectivo + "\n";
    datos += "idFormaTarjeta:" + this.idFormaTarjeta + "\n";
    return datos;
  }


}



