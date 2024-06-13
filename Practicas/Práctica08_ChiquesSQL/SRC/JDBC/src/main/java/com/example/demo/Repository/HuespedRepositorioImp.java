package com.example.demo.Repository;
import com.example.demo.Mapper.HuespedRowMapper;
import com.example.demo.model.Huesped;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.sql.ResultSet;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;



@Repository
public class HuespedRepositorioImp implements HuespedRepositorio{
   
    NamedParameterJdbcTemplate template;
    private final String[] consulta = agregarConsultas();

   /**
    * Método que retorna un array de Strings con las consultas SQL para agregar, actualizar, eliminar y consultar datos de la tabla 'huesped'.
    * 
    * @return Un array de Strings con las consultas SQL.
    */
    private String[] agregarConsultas(){
      String[] consultas = new String[5];
      consultas[0] = "INSERT INTO huesped (idPersona,idHotel, nombre, paterno, materno, fechaNacimiento, genero, nacionalidad, idFormaEfectivo, idFormaTarjeta) VALUES (:idPersona, :idHotel, :nombre, :paterno, :materno, :fechaNacimiento, :genero, :nacionalidad, :idFormaEfectivo, :idFormaTarjeta);";
      consultas[1] = "UPDATE huesped SET idHotel=:idHotel, nombre=:nombre, paterno=:paterno, materno=:materno, fechaNacimiento=:fechaNacimiento, genero=:genero, nacionalidad=:nacionalidad, idFormaEfectivo=:idFormaEfectivo, idFormaTarjeta=:idFormaTarjeta  WHERE (idPersona=:idPersona);";
      consultas[2] = "DELETE FROM huesped WHERE (idPersona=:idPersona);";
      consultas[3] = "SELECT * FROM huesped;";
      consultas[4] = "SELECT * FROM huesped WHERE (idPersona=:idPersona);";
      return consultas;
    }

    /**
     * Constructor de la clase HuespedRepositorioImp.
     * 
     * @param template Objeto NamedParameterJdbcTemplate utilizado para realizar consultas a la base de datos.
     */
    public HuespedRepositorioImp(NamedParameterJdbcTemplate template){
      this.template = template;
    }

    /**
     * Método que obtiene todos los registros de la tabla 'huesped'.
     * 
     * @return Una lista de objetos Huesped que representan todos los registros de la tabla 'huesped'.
     */
    @Override
    public List<Huesped> obtenerTodos(){
      return template.query(this.consulta[3],new HuespedRowMapper());
    }

     /**
      * Método que obtiene un registro de la tabla 'huesped' basado en el ID de la persona.
      * 
      * @param id El ID de la persona.
      * @return Un objeto Huesped que representa el registro correspondiente al ID proporcionado, o null si no se encuentra.
      */
    @Override 
    public Huesped obtener(String id){
        List<Huesped> huespedes = template.query(this.consulta[4],
                new MapSqlParameterSource("idPersona", id), (resultSet, i) -> {
                    return toHuesped(resultSet);
                });

        if (huespedes.size() == 1) {
            return huespedes.get(0);
        }
        return null;
    }

    /**
     * Método privado que mapea un objeto ResultSet a un objeto Huesped.
     * 
     * @param r El objeto ResultSet que contiene los datos.
     * @return Un objeto Huesped con los datos obtenidos del ResultSet.
     * @throws SQLException Si ocurre algún error de SQL.
     */
    private Huesped  toHuesped(ResultSet r) throws SQLException{
            Huesped aux = new Huesped();
            aux.setIdHotel(r.getString("idHotel"));
            aux.setNombre(r.getString("nombre"));    
            aux.setPaterno(r.getString("paterno"));
            aux.setMaterno(r.getString("materno")); 
            aux.setFechaDeNacimiento(r.getDate("fechaNacimiento").toLocalDate());     
            aux.setGenero(r.getString("genero").charAt(0)); 
            aux.setNacionalidad(r.getString("nacionalidad"));
            aux.setIdFormaEfectivo(r.getString("idFormaEfectivo"));
            aux.setIdFormaTarjeta(r.getString("idFormaTarjeta"));
            return aux;
    }
    

    /**
     * Método que inserta un nuevo registro en la tabla 'huesped'.
     * 
     * @param h Objeto Huesped que representa los datos a insertar.
     */
    @Override
    public void insertar(Huesped h){
       KeyHolder holder = new GeneratedKeyHolder();
       SqlParameterSource param = new MapSqlParameterSource()
            .addValue("idPersona",h.getIdPersona())
            .addValue("idHotel",h.getIdHotel())
            .addValue("nombre",h.getNombre())
            .addValue("paterno",h.getPaterno())
            .addValue("materno",h.getMaterno())
            .addValue("fechaNacimiento",Date.valueOf(h.getFechaDeNacimiento()))
            .addValue("genero", h.getGenero())
            .addValue("nacionalidad",h.getNacionalidad())
            .addValue("idFormaEfectivo",h.getIdFormaEfectivo())
            .addValue("idFormaTarjeta",h.getIdFormaTarjeta()); 
       template.update(this.consulta[0],param,holder);
    }
    
    /**
     * Método que modifica un registro existente en la tabla 'huesped'.
     * 
     * @param h Objeto Huesped que representa los nuevos datos.
     */
    @Override
    public void modificar(Huesped h){
      KeyHolder holder = new GeneratedKeyHolder();
      SqlParameterSource param = new MapSqlParameterSource()
           .addValue("idPersona",h.getIdPersona())
           .addValue("idHotel",h.getIdHotel())
           .addValue("nombre",h.getNombre())
           .addValue("paterno",h.getPaterno())
           .addValue("materno",h.getMaterno())
           .addValue("fechaNacimiento",Date.valueOf(h.getFechaDeNacimiento()))
           .addValue("genero", h.getGenero())
           .addValue("nacionalidad",h.getNacionalidad())
           .addValue("idFormaEfectivo",h.getIdFormaEfectivo())
           .addValue("idFormaTarjeta",h.getIdFormaTarjeta()); 
      template.update(this.consulta[1],param,holder);
    }

    /**
     * Método que elimina un registro de la tabla 'huesped'.
     * 
     * @param h Objeto Huesped que contiene el ID del registro a eliminar.
     */
    @Override
    public void eliminar(Huesped h){
       Map<String,Object>  map = new HashMap<String,Object>();
       map.put("idPersona", h.getIdPersona());
       template.execute(this.consulta[2],map,new PreparedStatementCallback<Object>() {
          @Override
          public Object doInPreparedStatement(PreparedStatement ps)
               throws SQLException, DataAccessException{
                  return ps.executeUpdate();
               }
       });
    }
    
    /**
     * Método que ejecuta la modificación de un registro en la tabla 'huesped'.
     * 
     * @param h Objeto Huesped que representa los nuevos datos a modificar.
     */
    @Override
    public void EjecutarModificacion(Huesped h){
      HashMap<String,Object> map = new HashMap<String,Object>();
      map.put("idPersona",h.getIdPersona());
      map.put("idHotel",h.getIdHotel());
      map.put("nombre",h.getNombre());
      map.put("paterno",h.getPaterno());
      map.put("materno",h.getMaterno());
      map.put("fechaNacimiento",Date.valueOf(h.getFechaDeNacimiento()));
      map.put("genero", h.getGenero());
      map.put("nacionalidad",h.getNacionalidad());
      map.put("idpago",h.getIdpago());
      map.put("idFormaEfectivo",h.getIdFormaEfectivo()); 
      map.put("idFormaTarjeta",h.getIdFormaTarjeta()); 
      

                template.execute(this.consulta[1],map,new PreparedStatementCallback<Object>(){
                    @Override
                    public Object doInPreparedStatement(PreparedStatement ps)
                            throws SQLException, DataAccessException{
                        return ps.executeUpdate();
                    }
                    
                });      
    }

}
