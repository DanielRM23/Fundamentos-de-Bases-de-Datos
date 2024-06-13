package com.example.demo.Service;

import com.example.demo.model.Hotel;
import com.example.demo.Repository.HotelRepositorioImp;

import jakarta.annotation.Resource;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class HotelServicioImp implements HotelServicio{
    @Resource
    private HotelRepositorioImp hotelRep;

    /* Metodo para insertar un hotel.
    @param Hotel h.
    */
    @Override
    public void insertar(Hotel h){
        hotelRep.insertar(h);
    }

    /* Metodo para modificar un hotel.
    @param Hotel h.
    */
    @Override
    public void modificar(Hotel h){
        hotelRep.modificar(h);
    }

    /* Metodo para eliminar un hotel.
    @param Hotel h.
    */
    @Override
    public void eliminar(Hotel h){
        hotelRep.eliminar(h);
    }

    /* Metodo para obtener una lista hoteles.
    @return una lista de hoteles : List<Hotel>.
    */
    @Override
    public List<Hotel> obtenerTodos(){
        return hotelRep.obtenerTodos();
    }
    
    /* Metodo para obtener un hotel.
    @param String idHotel.
    */
    @Override
    public Hotel obtener(String idHotel){
        return hotelRep.obtener(idHotel);
    }

    /* Metodo para modificar  un hotel.
    @param Hotel h.
    */
    @Override
    public void EjecutarModificacion(Hotel h){
        hotelRep.EjecutarModificacion(h);
    }

}

