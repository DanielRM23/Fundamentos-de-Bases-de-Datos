package com.example.demo.Mapper;
import com.example.demo.model.Hotel;
import org.springframework.jdbc.core.RowMapper;
import java.sql.SQLException;
import java.sql.ResultSet;


public class HotelRowMapper implements RowMapper<Hotel>{
    
    /* Metodo que crea un objeto de la clase Hotel apartir de un ResultSet.
     @param rs : tipo ResultSet
     @param rowNum: tipo int
     @return objeto de tipo Hotel.
     @throws SQLException.
    */
    @Override
    public Hotel mapRow(ResultSet rs,int rowNum) throws SQLException {
        Hotel aux = new Hotel();
        aux.setNombreEstablecimento(rs.getString("nombreEstablecimiento"));
        aux.setHoraCheckInt(rs.getTime("horaCheckIn").toLocalTime());
        aux.setHoraCheckOut(rs.getTime("horaCheckOut").toLocalTime());
        aux.setPetFiendly(rs.getString("petFriendly"));
        aux.setServicios(rs.getString("servicio"));
        aux.setNumeroInterior(rs.getString("numeroInterior"));
        aux.setNumeroExterior(rs.getInt("numeroExterior"));
        aux.setColonia(rs.getString("colonia"));
        aux.setCalle(rs.getString("calle"));
        aux.setEstado(rs.getString("estado"));   
        
       return aux;
    }
}



