package com.example.demo.model;
import java.time.LocalTime;


// LocalTime.ofSecondOfDay(10000);
public class Hotel{
	//atributos
	private String idHotel;
	private String nombreEstablecimiento;
	private LocalTime horaCheckInt;
	private LocalTime horaCheckOut;
	private String petFriendly;
	private String servicios;
	private String numeroInterior;
	private int numeroExterior;
	private String colonia;
	private String calle;
	private String estado;
     
    //Metodo Constructor.
    public Hotel(){

    }
     
    //Metodos de asignacion.

/**
 * Establece el ID del hotel.
 * @param idHotel El ID del hotel a establecer.
 */
public void setIdHotel(String idHotel){
   this.idHotel = idHotel;
}

/**
 * Establece el nombre del establecimiento.
 * @param nombreEstablecimiento El nombre del establecimiento a establecer.
 */
public void setNombreEstablecimento(String nombreEstablecimiento){
    this.nombreEstablecimiento = nombreEstablecimiento;
}

/**
 * Establece la hora de check-in.
 * @param horaCheckInt La hora de check-in a establecer.
 */
public void setHoraCheckInt(LocalTime horaCheckInt){
    this.horaCheckInt = horaCheckInt;
}

/**
 * Establece la hora de check-out.
 * @param horaCheckOut La hora de check-out a establecer.
 */
public void setHoraCheckOut(LocalTime horaCheckOut){
    this.horaCheckOut = horaCheckOut;
}

/**
 * Establece si el hotel es pet-friendly.
 * @param petFriendly Indica si el hotel es pet-friendly.
 */
public void setPetFiendly(String petFriendly){
    this.petFriendly = petFriendly;
}

/**
 * Establece los servicios ofrecidos por el hotel.
 * @param servicios Los servicios ofrecidos por el hotel.
 */
public void setServicios(String servicios){
    this.servicios = servicios;
}

/**
 * Establece el número interior del establecimiento.
 * @param numeroInterior El número interior del establecimiento.
 */
public void setNumeroInterior(String numeroInterior){
    this.numeroInterior = numeroInterior;
}

/**
 * Establece el número exterior del establecimiento.
 * @param numeroExterior El número exterior del establecimiento.
 */
public void setNumeroExterior(int numeroExterior){
    this.numeroExterior = numeroExterior;
}

/**
 * Establece la colonia del establecimiento.
 * @param colonia La colonia del establecimiento.
 */
public void setColonia(String colonia){
    this.colonia = colonia;
}

/**
 * Establece la calle del establecimiento.
 * @param calle La calle del establecimiento.
 */
public void setCalle(String calle){
    this.calle = calle;
}

/**
 * Establece el estado donde se encuentra el establecimiento.
 * @param estado El estado donde se encuentra el establecimiento.
 */
public void setEstado(String estado){
    this.estado = estado;
}

// Métodos de obtención

/**
 * Obtiene el ID del hotel.
 * @return El ID del hotel.
 */
public String getIdHotel(){
     return this.idHotel;
}

/**
 * Obtiene el nombre del establecimiento.
 * @return El nombre del establecimiento.
 */
public String getNombreEstablecimento(){
    return	this.nombreEstablecimiento;
}

/**
 * Obtiene la hora de check-in.
 * @return La hora de check-in.
 */
public LocalTime getHoraCheckInt(){
    return	this.horaCheckInt;
}

/**
 * Obtiene la hora de check-out.
 * @return La hora de check-out.
 */
public LocalTime getHoraCheckOut(){
    return	this.horaCheckOut;
}

/**
 * Obtiene si el hotel es pet-friendly.
 * @return Indicador de si el hotel es pet-friendly.
 */
public String getPetFiendly(){
    return	this.petFriendly;
}

/**
 * Obtiene los servicios ofrecidos por el hotel.
 * @return Los servicios ofrecidos por el hotel.
 */
public String getServicios(){
    return	this.servicios;
}

/**
 * Obtiene el número interior del establecimiento.
 * @return El número interior del establecimiento.
 */
public String getNumeroInterior(){
    return	this.numeroInterior;
}

/**
 * Obtiene el número exterior del establecimiento.
 * @return El número exterior del establecimiento.
 */
public int getNumeroExterior(){
    return	this.numeroExterior;
}

/**
 * Obtiene la colonia del establecimiento.
 * @return La colonia del establecimiento.
 */
public String getColonia(){
    return	this.colonia;
}

/**
 * Obtiene la calle del establecimiento.
 * @return La calle del establecimiento.
 */
public String getCalle(){
    return	this.calle;
}

/**
 * Obtiene el estado donde se encuentra el establecimiento.
 * @return El estado donde se encuentra el establecimiento.
 */
public String getEstado(){
    return	this.estado;
}

  @Override
  public String toString(){
    String datos = "idHotel:" + this.idHotel + "\n";
    datos += "Nombre:" + this.nombreEstablecimiento + "\n";
    datos += "horaCheckInt:" + this.horaCheckInt + "\n";
    datos += "horaCheckOut:" + this.horaCheckOut + "\n";
    datos += "petFriendly:" + this.petFriendly + "\n";
    datos += "servicios:" + this.servicios + "\n";
    datos += "numeroInterior:" + this.numeroInterior + "\n";
    datos += "numeroExterior:" + this.numeroExterior + "\n";
    datos += "colonia:" + this.colonia + "\n";
    datos += "calle:" + this.calle + "\n";
    datos += "estado:" + this.estado + "\n";
    return datos;
  }



}
