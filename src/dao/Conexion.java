package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Conexion {

	private static Connection cnn;
    private static PreparedStatement ps;
    private static String connectionUrl = "jdbc:mysql://localhost/mydb";
    private static String driver = "com.mysql.jdbc.Driver";
    private static String user = "root";
    private static String password = "root";
    
	public static Connection getConexion() {
        if (cnn == null) {
            if(connectionUrl == null || driver == null){
                throw new RuntimeException("Debe definir el driver y/o la ruta de la base de datos usando los metodos estaticos de la clase Conexion");
            }
            
            try {
                Class.forName(driver);
                cnn = DriverManager.getConnection(
                        connectionUrl, user, password);
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE,
                        null, ex);
                throw new RuntimeException(ex.getMessage());
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE,
                        null, ex);
                throw new RuntimeException(ex.getMessage());
            }
        }
        return cnn;
    }
	
	
	public static void closeConexion(Connection con) {
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void closePrepared(PreparedStatement ps) {
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void closeResulset(ResultSet rs) {
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
