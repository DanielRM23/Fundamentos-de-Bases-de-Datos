package com.example.demo.Controller;

import com.example.demo.Service.HuespedServicio;
import com.example.demo.model.Huesped;
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
public class HuespedControlador{
    @Resource
    HuespedServicio huespedServicio;
    
    /*Metodo para obtener todas las tuplas de la tabla huespedes.
    @return lista de huespedes tipo: list<Huepedes>
    */   
    @GetMapping(value="/huespedList")
    public List<Huesped> getHuespedes(){
        return huespedServicio.obtenerTodos();
    }

    /*Metodo para obtener una tupla de la tabla huesoed apartir de su id.
    @return un hotel tipo:Huesped
    @param String idPersona
    */
    @GetMapping("/huesped/{idPersona}")
    public Huesped getHuesped(@PathVariable("idPersona") String idPersona){
       return huespedServicio.obtener(idPersona);       
    }


    /*Metodo que inserta una tupla en la tabla huesped.
    @param Huesped h.
    */
    @PostMapping(value="/createHuesped")
    public void insertarHuesped(@RequestBody Huesped h){
        huespedServicio.insertar(h);
    }

    /*Metodo para mofidificar una tupla de la tabla huesped.
    @param Huesped h.
    */  
    @PutMapping(value="/updateHuesped")
    public void modificarHuesped(@RequestBody Huesped h){
        huespedServicio.modificar(h);
    }
    
    /*Metodo para modificar una tupla de la tabla  hotel.
    @param Hotel h.
    */
    @PutMapping(value="/ejecutarModificacionHuesped")
    public void ejecutarModificacion(@RequestBody Huesped  h){
        huespedServicio.EjecutarModificacion(h);
    }

    /*Metodo para eliminar una tupla de la tabla hotel
    @param Hotel h.
    */
    @DeleteMapping(value="/borrarHuesped")
    public void borrarHuesped(@RequestBody Huesped h){
        huespedServicio.eliminar(h);
    }


}
