<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HP Service Center :: Survey</title>
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

function validar(preguntas)
{
	pendientes='';
	cuantas=0;
	forma=document.forms[0];
	for (i=0; i<preguntas; i++){
		if (forma.elements['obligatoria'+i].value=='true'){
			if(forma.elements['respuesta'+i].type==undefined){
				if (!(forma.elements['respuesta'+i][0].checked || forma.elements['respuesta'+i][1].checked || forma.elements['respuesta'+i][2].checked || forma.elements['respuesta'+i][3].checked || forma.elements['respuesta'+i][4].checked)){
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

<form action="almacenarRespuestas.jsp" method="post" >



<input type="hidden" name="resultado" value="Rechazado"/>
<input type="hidden" name="incidente" value='Q18-069002' />
<input type="hidden" name="usuario" value='NJGARCIA' />
<input type="hidden" name="company" value='CredibanCoIT' />
<input type="hidden" name="service" value='' />
<input type="hidden" name="preguntas" value='1' />



<P>
    <BR>
<div align="center" class="txtLabel"><B>Encuesta de Satisfacción</B></div>
<P>
    <BR>
<div align="center" class="txtLabel">Para el  Centro de Servicios Compartidos es importante conocer el motivo de la no aceptación del servicio.
</div>
<P>


<table width="90%" border="0" align="right">
		
		
		<tr>
			<td colspan="2" class="txtLabel">
				<input type="hidden" value="51" name="consecutivo"/>
				<input type="hidden" value="true" name="obligatoria0"/>
				1. (*) Por favor justifique la razón del rechazo.
			</td>
		</tr>
		<tr>
			<td colspan="2" class="txtLabel">
					   
                                        <textarea rows="3" cols="50" name="respuesta0"></textarea>
				   
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