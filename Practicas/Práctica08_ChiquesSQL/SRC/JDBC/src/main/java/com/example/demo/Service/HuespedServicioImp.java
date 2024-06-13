package com.example.demo.Service;

import com.example.demo.model.Huesped;
import com.example.demo.Repository.HuespedRepositorioImp;

import jakarta.annotation.Resource;

import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class HuespedServicioImp implements HuespedServicio{
    @Resource
    private HuespedRepositorioImp huespedRep;

    /* Metodo para insertar un huesped.
    @param Huesped h.
    */
    @Override
    public void insertar(Huesped h){
        huespedRep.insertar(h);
    }

    /* Metodo para modificar un huesped.
    @param Huesped h.
    */
    @Override
    public void modificar(Huesped h){
        huespedRep.modificar(h);
    }

    /* Metodo para eliminar un huesped.
    @param Huesped h.
    */
    @Override
    public void eliminar(Huesped h){
        huespedRep.eliminar(h);
    }

    /* Metodo para obtener una lista huespedes.
    @return una lista de huespedes : List<Huesped>.
    */
    @Override
    public List<Huesped> obtenerTodos(){
        return huespedRep.obtenerTodos();
    }

    /* Metodo para obtener un huesped.
    @param String idPersona.
    */
    @Override
    public Huesped obtener(String idPersona){
        return huespedRep.obtener(idPersona);
    }

    /* Metodo para modificar  un huesped.
    @param Huesped h.
    */
    @Override
    public void EjecutarModificacion(Huesped h){
        huespedRep.EjecutarModificacion(h);
    }

}

