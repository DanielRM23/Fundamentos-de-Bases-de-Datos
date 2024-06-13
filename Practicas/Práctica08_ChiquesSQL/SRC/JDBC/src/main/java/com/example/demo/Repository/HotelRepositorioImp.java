package com.example.demo.Repository;
import com.example.demo.Mapper.HotelRowMapper;
import com.example.demo.model.Hotel;
import java.sql.Time;
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
public class HotelRepositorioImp implements HotelRepositorio{
   
    NamedParameterJdbcTemplate template;
    private final String[] consulta = agregarConsultas();

  /**
   * Retorna un arreglo de strings que contiene consultas SQL predefinidas para operaciones CRUD en una tabla de hoteles.
   * Índices del arreglo:
   * 0: Inserción de un nuevo hotel.
   * 1: Actualización de un hotel existente.
   * 2: Eliminación de un hotel existente.
   * 3: Selección de todos los hoteles.
   * 4: Selección de un hotel por su ID.
   * @return Arreglo de strings con consultas SQL.
   */
    private String[] agregarConsultas(){
      String[] consultas = new String[5];
      consultas[0] = "INSERT INTO hotel (idHotel,nombreEstablecimiento, horaCheckIn, horaCheckOut, petFriendly, servicio, numeroInterior, numeroExterior, colonia, calle, estado) VALUES (:idHotel,:nombreEstablecimiento, :horaCheckIn, :horaCheckOut, :petFriendly, :servicio, :numeroInterior, :numeroExterior, :colonia, :calle, :estado);";
      consultas[1] = "UPDATE hotel SET  idHotel=:idHotel,nombreEstablecimiento=:nombreEstablecimiento,horaCheckIn=:horaCheckIn,horaCheckOut=:horaCheckout,petFriendly=:petFriendly,servicio=:servicio,numeroInterior=:numeroInterior,numeroExterior=:numeroExterior,colonia=:colonia,calle=:calle,estado=:estado WHERE (idHotel=:idHotel);";
      consultas[2] = "DELETE FROM hotel WHERE (idHotel=:idHotel);";
      consultas[3] = "SELECT * FROM hotel;";
      consultas[4] = "SELECT * FROM hotel WHERE (idHotel=:idHotel);";
      return consultas;
    }

   /**
    * Constructor de la clase HotelRepositorioImp.
    * @param template NamedParameterJdbcTemplate utilizado para ejecutar consultas SQL.
    */
    public HotelRepositorioImp(NamedParameterJdbcTemplate template){
      this.template = template;
    }

    /**
     * Obtiene todos los hoteles de la base de datos.
     * @return Lista de objetos Hotel.
     */
    @Override
    public List<Hotel> obtenerTodos(){
      return template.query(this.consulta[3],new HotelRowMapper());
    }

   /**
    * Obtiene un hotel por su ID.
    * @param id ID del hotel a buscar.
    * @return Objeto Hotel si se encuentra, de lo contrario, retorna null.
    */
    @Override 
    public Hotel obtener(String id){
        List<Hotel> hoteles = template.query(this.consulta[4],
                new MapSqlParameterSource("idHotel", id), (resultSet, i) -> {
                    return toHotel(resultSet);
                });

        if (hoteles.size() == 1) {
            return hoteles.get(0);
        }
        return null;
    }

    /**
     * Convierte un ResultSet en un objeto Hotel.
     * @param r ResultSet obtenido de una consulta SQL.
     * @return Objeto Hotel.
     * @throws SQLException Si hay un error al acceder a los datos en el ResultSet.
     */
    private Hotel  toHotel(ResultSet r) throws SQLException{
            Hotel aux = new Hotel();
            aux.setNombreEstablecimento(r.getString("nombreEstablecimiento"));
            aux.setHoraCheckInt(r.getTime("horaCheckIn").toLocalTime());
            aux.setHoraCheckOut(r.getTime("horaCheckOut").toLocalTime());
            aux.setPetFiendly(r.getString("petFriendly"));
            aux.setServicios(r.getString("servicio"));
            aux.setNumeroInterior(r.getString("numeroInterior"));
            aux.setNumeroExterior(r.getInt("numeroExterior"));
            aux.setColonia(r.getString("colonia"));
            aux.setCalle(r.getString("calle"));
            aux.setEstado(r.getString("estado"));   
            return aux;
    }


    

   /**
    * Inserta un nuevo hotel en la base de datos.
    * @param h Objeto Hotel a insertar.
    */  
    @Override
    public void insertar(Hotel h){
       KeyHolder holder = new GeneratedKeyHolder();
       SqlParameterSource param = new MapSqlParameterSource()
             .addValue("idHotel", h.getIdHotel())
             .addValue("nombreEstablecimiento", h.getNombreEstablecimento())
             .addValue("horaCheckIn", Time.valueOf(h.getHoraCheckInt()))
             .addValue("horaCheckOut", Time.valueOf(h.getHoraCheckOut()))
             .addValue("petFriendly", h.getPetFiendly())
             .addValue("servicio", h.getServicios())
             .addValue("numeroInterior", h.getNumeroInterior())
             .addValue("numeroExterior", h.getNumeroExterior()) 
             .addValue("colonia", h.getColonia())
             .addValue("calle", h.getCalle())
             .addValue("estado", h.getEstado());
       template.update(this.consulta[0], param,holder);
    }
    
    /**
     * Modifica un hotel existente en la base de datos.
     * @param h Objeto Hotel con los nuevos datos.
     */
    @Override
    public void modificar(Hotel h){
      KeyHolder holder = new GeneratedKeyHolder();
      SqlParameterSource param = new MapSqlParameterSource()
           .addValue("idHotel", h.getIdHotel())
           .addValue("nombreEstablecimiento", h.getNombreEstablecimento())
           .addValue("horaCheckIn", Time.valueOf(h.getHoraCheckInt()))
           .addValue("horaCheckOut", Time.valueOf(h.getHoraCheckOut()))
           .addValue("petFriendly", h.getPetFiendly())
           .addValue("servicio", h.getServicios())
           .addValue("numeroInterior", h.getNumeroInterior())
           .addValue("numeroExterior", h.getNumeroExterior())
           .addValue("colonia", h.getColonia())
           .addValue("calle", h.getCalle())
           .addValue("estado", h.getEstado());
      template.update(this.consulta[1], param,holder);
    }

   /**
    * Elimina un hotel de la base de datos.
    * @param h Objeto Hotel a eliminar.
    */
    @Override
    public void eliminar(Hotel h){
       Map<String,Object>  map = new HashMap<String, Object>();
       map.put("idHotel", h.getIdHotel());
       template.execute(this.consulta[2],map,new PreparedStatementCallback<Object>() {
          @Override
          public Object doInPreparedStatement(PreparedStatement ps)
               throws SQLException, DataAccessException{
                  return ps.executeUpdate();
               }
       });
    }
  
   /**
    * Ejecuta una modificación en un hotel existente en la base de datos.
    * @param h Objeto Hotel con los datos modificados.
    */  
    @Override
    public void EjecutarModificacion(Hotel h){
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("idHotel", h.getIdHotel());
      map.put("nombreEstablecimiento", h.getNombreEstablecimento());
      map.put("horaCheckIn", Time.valueOf(h.getHoraCheckInt())); 
      map.put("horaCheckout", Time.valueOf(h.getHoraCheckOut())); 
      map.put("petFriendly", h.getPetFiendly());
      map.put("servicio", h.getServicios());
      map.put("numeroInterior", h.getNumeroInterior());
      map.put("numeroExterior", h.getNumeroExterior()); 
      map.put("colonia", h.getColonia());
      map.put("calle", h.getCalle());
      map.put("estado", h.getEstado());

                template.execute(this.consulta[1],map,new PreparedStatementCallback<Object>(){
                    @Override
                    public Object doInPreparedStatement(PreparedStatement ps)
                            throws SQLException, DataAccessException{
                        return ps.executeUpdate();
                    }
                    
                });      
    }

}
