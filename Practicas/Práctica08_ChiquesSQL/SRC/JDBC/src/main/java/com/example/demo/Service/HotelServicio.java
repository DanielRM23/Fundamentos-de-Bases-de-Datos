package com.example.demo.Service;

import com.example.demo.model.Hotel;
import java.util.List;

public interface HotelServicio {
    
    /*Metodo para insertar un elemento.
    @param Hotel h. 
    */
    public void insertar(Hotel h);

    /*Metodo para modificar un elemento
    @param Hotel h.
    */
    public void modificar(Hotel h);

    /*Metodo para eliminar un elemento.
    @param hotel h.
    */
    public void eliminar(Hotel h);

    /*Metodo para obtenerTodos los elementos.
    @return lista de hoteles : tipo List<Hotel>
    */
    public List<Hotel> obtenerTodos();

    /*Metodo para obtener un elemento
    @param String idHotel
    @return hotel : tipo Hotel
    */
    public Hotel obtener(String idHotel);

    /*Metodo para ejecutar la modificacion.
    @param Hotel h.
    */
    public void EjecutarModificacion(Hotel h);
    
}
