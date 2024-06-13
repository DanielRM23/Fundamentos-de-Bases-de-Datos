package com.example.demo.Repository;
import java.util.List;

public interface Repositorio<T, K>{
    
    //Metodo para insertar un elemento.
    public void insertar(T h);

    //Metodo para modificar un elemento
    public void modificar(T h);

    //Metodo para eliminar un elemento.
    public void eliminar(T h);

    //Metodo para obtenerTodos los elementos.
    public List<T> obtenerTodos();

    //Metodo para obtener un elemento.
    public T obtener(K id);

    //Metodo para ejecutar la modificacion.
    public void EjecutarModificacion(T h);
}
