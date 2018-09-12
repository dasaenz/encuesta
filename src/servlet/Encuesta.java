package servlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Conexion;

public class Encuesta extends HttpServlet{

		
	private static final long serialVersionUID = 1L;
	private ServletContext sContext;

	public void doGet(HttpServletRequest request, HttpServletResponse response){
		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		sContext = request.getSession().getServletContext();
		int tarea = 0;
		
		try{
			if(request.getParameter("tarea")!=null){
				tarea = Integer.parseInt(request.getParameter("tarea"));
			}else{
				sContext.getRequestDispatcher("/index.jsp").forward(request,response);
			}
			if(tarea==1){
				String acepta = request.getParameter("acepta");
				if(acepta.equals("S")){
					sContext.getRequestDispatcher("/preguntas.jsp").forward(request,response);
				}else{
					sContext.getRequestDispatcher("/fin.jsp").forward(request,response);
				}
			}else if(tarea==2){
				guardarEncuesta(request);
				sContext.getRequestDispatcher("/finPreguntas.jsp").forward(request,response);
			}else if(tarea==3){
				guardarEncuesta(request);
				sContext.getRequestDispatcher("/fin.jsp").forward(request,response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
		
		
	private void guardarEncuesta(HttpServletRequest request){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			String encuestadoNumeroCaso = request.getParameter("encuestadoNumeroCaso");
			String encuestadoPreguntaCodigo = request.getParameter("encuestadoPreguntaCodigo");
			String preguntaCodigo = request.getParameter("preguntaCodigo");
			String respuesta = request.getParameter("respuesta0");
			LocalDate fechaDate = LocalDate.now();
			int fecha = fechaDate.getYear()+fechaDate.getMonthValue()+fechaDate.getDayOfMonth();
			con = Conexion.getConexion();			
			String sql ="insert into Respuesta(Fecha,Valor,Encuestado_Numero_de_caso,Encuestado_Pregunta_Codigo,Pregunta_Codigo)"+
						"values (?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, fecha);
			ps.setString(2, respuesta);
			ps.setString(3, encuestadoNumeroCaso);
			ps.setString(4, encuestadoPreguntaCodigo);
			ps.setString(5, preguntaCodigo);
			ps.execute();			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			Conexion.closePrepared(ps);
			Conexion.closeConexion(con);
		}
		
	}
}
