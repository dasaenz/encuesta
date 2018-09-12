<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HP Service Manager :: Survey</title>
<link rel="stylesheet" type="text/css" href="styles/style.css"></link>
<script type="text/javascript">
var tiempo=360000;
var tiempo2=tiempo;
String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");
}
function enviar(){
	document.forms[0].submit();
}

function reloj() {
	var fObj = new Date();
	copia=tiempo2;
	 
	var horas = Math.floor(copia/(60*60*1000)); 
	copia-=horas*3600000;
	var minutos = Math.floor(copia/(60*1000));
	copia-=minutos*60000; 
	var segundos = Math.floor(copia/1000); 
	if (horas <= 9) 
		horas = "0" + horas; 
	if (minutos <= 9) minutos = "0" + minutos; if (segundos <= 9) 
		segundos = "0" + segundos; 
	
	document.forms[0].elements["reloj"].value = horas+":"+minutos+":"+segundos;
	tiempo2-=1000;
	
}

function validar(preguntas)
{
	pendientes='';
	cuantas=0;
	forma=document.forms[0];
	for (i=0; i<preguntas; i++){
		if (forma.elements['obligatoria'+i].value=='true'){
			if(forma.elements['respuesta'+i].type==undefined){
				if (!(forma.elements['respuesta'+i][0].checked || forma.elements['respuesta'+i][1].checked || forma.elements['respuesta'+i][2].checked || forma.elements['respuesta'+i][3].checked || forma.elements['respuesta'+i][4].checked || forma.elements['respuesta'+i][5].checked)){
					pendientes+=(i+1)+', ';
					cuantas++;
				} 
			}else{
				if (forma.elements['respuesta'+i].value.trim()==''){
					pendientes+=(i+1)+', ';
					cuantas++;				
				}
			}
		}
	}
	if (pendientes=='')
		forma.submit();
	else{
		if (cuantas==1)
			alert("La pregunta "+pendientes.substr(0, pendientes.length-2)+" es obligatoria");
		else
			alert("Las preguntas "+pendientes.substr(0, pendientes.length-2)+" son obligatorias");
	}
	
}
</script>
</head>



<body>

<table width="100%" class="FrameworkLogoBackground" style="HEIGHT: 30px">
<tr>
	<td>
		<IMG src="Image/header_left.gif" border="0"/><SPAN class="FrameworkProductHeading"></span>
	</td>
	<td align="right">
		<IMG src="Image/logoCliente.JPG" border="0"/>
	</td>
</tr>
</table>

<form name="frmEncuesta" method="POST" action="Encuesta">


<input type="hidden" name="resultado" value="Aceptado">
<input type="hidden" name="incidente" value='Q18-073809' />
<input type="hidden" name="usuario" value='NJGARCIA' />
<input type="hidden" name="company" value='CredibanCoIT' />
<input type="hidden" name="service" value='' />
<input type="hidden" name="preguntas" value='7' />
<input type="hidden" name="tarea" value='2' />
<input type="hidden" name="encuestadoNumeroCaso" value='123' />
<input type="hidden" name="encuestadoPreguntaCodigo" value='456' />
<input type="hidden" name="preguntaCodigo" value='789' />

<BR>
<div align="center" class="txtLabel"><B>Encuesta de Satisfacción</B></div>
<BR>
 
<div align="rigth" class="txtLabel">Para nosotros es muy importante conocer su opinión acerca de la prestación de los servicios ofrecidos a través de nuestro portafolio.</div>
<P>
<div align="rigth" class="txtLabel">A continuación lo invitamos a contestar de manera objetiva la encuesta de satisfacción del servicio y agradecemos el tiempo que dedique para responderla.</div>
<P>
<div align="rigth" class="txtLabel">Para cada  pregunta:</div>
<div align="rigth" class="txtLabel">Califique de 1 a 6. Donde  1-  Totalmente Insatisfecho, 2- Insatisfecho, 3- Medianamente satisfecho, 4- Satisfecho y 5- Muy Satisfecho, 6. Totalmente Satisfecho.</div>
<P>
<table width="90%" border="0" align="right">
		
		
		<tr>
			<td colspan="2" class="txtLabel">
				<input type="hidden" value="1" name="consecutivo"/>
				<input type="hidden" value="true" name="obligatoria0"/>
                                1. (*) Calidad: El servicio recibido por el soporte, cumple con sus necesidades actuales para la atención de incidentes y requerimientos.
			</td>
		</tr>
		<tr>
			<td colspan="2" class="txtLabel">
				   
					<input type="radio" value="1" name="respuesta0" id="respuesta0"> 1
					<input type="radio" value="2" name="respuesta0" id="respuesta0"> 2 
					<input type="radio" value="3" name="respuesta0" id="respuesta0"> 3 
					<input type="radio" value="4" name="respuesta0" id="respuesta0"> 4 
					<input type="radio" value="5" name="respuesta0" id="respuesta0"> 5
					<input type="radio" value="6" name="respuesta0" id="respuesta0"> 6
				   
			</td>
		</tr>

		<tr>
			<td colspan="2" class="txtLabel">
<input type="button" value="Grabar" onclick="validar(1)"/>

			</td>
		</tr>

</table>


</form>
</body>
</html>
