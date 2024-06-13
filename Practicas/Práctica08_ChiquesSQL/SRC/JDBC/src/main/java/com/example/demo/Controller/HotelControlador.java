package com.example.demo.Controller;

import com.example.demo.Service.HotelServicio;
import com.example.demo.model.Hotel;
import jakarta.annotation.Resource;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PathVariable;

@RestController
@RequestMapping("/postgressApp")
public class HotelControlador{
    @Resource
     HotelServicio hotelServicio;
    
    /*Metodo para obtener todas las tuplas de la tabla hotel.
    @return lista de hoteles tipo: list<Hotel>
    */
    @GetMapping(value="/hotelList")
    public List<Hotel> getHoteles(){
        return hotelServicio.obtenerTodos();
    }
    
    /*Metodo para obtener una tupla de la tabla hotel apartir de su id.
    @return un hotel tipo:Hotel
    @param String idHotel
    */
    @GetMapping("/hotel/{idHotel}")
    public Hotel getHotel(@PathVariable("idHotel") String idHotel){
       return hotelServicio.obtener(idHotel);       
    }
    
    /*Metodo que inserta una tupla en la tabla hotel.
    @param Hotel h.
    */
    @PostMapping(value="/createHotel")
    public void insertarHotel(@RequestBody Hotel h){
        hotelServicio.insertar(h);
    }
    
    /*Metodo para mofidificar una tupla de la tabla hotel.
    @param Hotel h.
    */
    @PutMapping(value="/updateHotel")
    public void modificarHotel(@RequestBody Hotel h){
        hotelServicio.modificar(h);
    }
     
    /*Metodo para modificar una tupla de la tabla  hotel.
    @param Hotel h.
    */
    @PutMapping(value="/ejecutarModificacionHotel")
    public void ejecutarModificacion(@RequestBody Hotel  h){
        hotelServicio.EjecutarModificacion(h);
    }    

    /*Metodo para eliminar una tupla de la tabla hotel
    @param Hotel h.
    */
    @DeleteMapping(value="/borrarHotel")
    public void borrarHotel(@RequestBody Hotel h){
        hotelServicio.eliminar(h);
    }


}
