package com.example.demo.Mapper;
import com.example.demo.model.Huesped;
import org.springframework.jdbc.core.RowMapper;
import java.sql.SQLException;
import java.sql.ResultSet;


public class HuespedRowMapper implements RowMapper<Huesped>{
    
    /* Metodo que crea un objeto de la clase Huesped apartir de un ResultSet.
     @param rs : tipo ResultSet
     @param rowNum: tipo int
     @return objeto de tipo Huesped.
     @throws SQLException.
    */
    @Override
    public Huesped mapRow(ResultSet rs,int rowNum) throws SQLException {
            Huesped aux = new Huesped();
            aux.setIdHotel(rs.getString("idHotel"));
            aux.setNombre(rs.getString("nombre"));    
            aux.setPaterno(rs.getString("paterno"));
            aux.setMaterno(rs.getString("materno")); 
            aux.setFechaDeNacimiento(rs.getDate("fechaNacimiento").toLocalDate());     
            aux.setGenero(rs.getString("genero").charAt(0)); 
            aux.setNacionalidad(rs.getString("nacionalidad"));
            aux.setIdFormaEfectivo(rs.getString("idFormaEfectivo"));
            aux.setIdFormaTarjeta(rs.getString("idFormaTarjeta"));
        
       return aux;
    }

}


