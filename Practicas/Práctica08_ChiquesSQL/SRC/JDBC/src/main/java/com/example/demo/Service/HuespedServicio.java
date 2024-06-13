package com.example.demo.Service;

import com.example.demo.model.Huesped;
import java.util.List;

public interface HuespedServicio {


    /*Metodo para insertar un elemento.
    @param Huesped h. 
    */
    public void insertar(Huesped h);

    /*Metodo para modificar un elemento
    @param Huesped h.
    */
    public void modificar(Huesped h);

    /*Metodo para eliminar un elemento.
    @param huesped h.
    */
    public void eliminar(Huesped h);

    /*Metodo para obtenerTodos los elementos.
    @return lista de huespedes : tipo List<Huesped>
    */
    public List<Huesped> obtenerTodos();

    /*Metodo para obtener un elemento
    @param String idPersona
    @return huesped : tipo Huesped
    */
    public Huesped obtener(String idPersona);

    /*Metodo para ejecutar la modificacion.
    @param Huesped h.
    */
    public void EjecutarModificacion(Huesped h);
    
}
