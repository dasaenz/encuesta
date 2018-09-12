<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function enviar(valor){
	document.getElementById('acepta').value = valor;	
	frmEncuesta.submit();
}
</script>
<link rel="stylesheet" type="text/css" href="styles/style.css"></link>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HP Service Manager :: Compensar :: Encuesta a Usuarios</title>
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

    <table width="95%" border="0" align="center">
	<tr>
		<td colspan="2" class="txtLabel">
			<div align="center">

                                
                                Se desea  conocer su satisfacción frente al servicio prestado.
			</div>	
		</td>
	<tr>
		<td width="50%">
			<div align="right">
				<input type="button" value="Si" onclick="document.forms[0].acepta.value='S'; submit()"/>
			</div>
		</td>
		<td>
			<input type="button" value="No" onclick="document.forms[0].acepta.value='N'; submit()"/>
		</td>

	</tr>
</table>

<input type="hidden" name="incidente" id="incidente" value='Q18-073809' />
<input type="hidden" name="usuario" id="usuario" value='NJGARCIA' />
<input type="hidden" name="company" id="company" value='CredibanCoIT' />
<input type="hidden" name="service" id="service" value='Gestión' />
<input type="hidden" name="acepta" id="acepta" value="" />
<input type="hidden" name="tarea" value='1' />

</form>
</body>
</html>