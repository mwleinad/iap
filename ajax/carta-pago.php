<?php
// echo "<pre>"; print_r($_GET); 
// exit;
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

	
	$personal->setPersonalId($_GET['Id']);
	$infoPerso = $personal->InfoBasica();
	$info = $personal->Info();


	if(file_exists(DOC_ROOT."/".$info['foto'])){
		$foto = DOC_ROOT."/".$info['foto'];
	}else{
		$foto = DOC_ROOT."/alumnos/no_foto.JPG";
	}
	
	if(date('m') <= 9){
		$m = explode('0',date('m'));
		$mes  = $m[1];
	}else{
		$mes  = date('m');
	}
	
	$mes = $util->ConvertirMes($mes);
	
	
	// echo '<pre>'; print_r($mes);
	// exit;
	

	$html .= "
	<html>
	<head>
	<title>CARTA DE PAGO</title>
	<style type='text/css'>
	.txtTicket{
			text-align: justify;
			font-size:12px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
		}
		table,td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	.notas{
			font-size:10px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
		}
		table,td {
		border: 1px solid black;
		 border-collapse: collapse;
	}
	.line{
		border-bottom: 1px solid; border-left: 0px; border-right: 0px;	
	}
		</style>
	</head>
	<body>
	<br>	
	<br>	

	
		<table align='center' width='100%' border='0' class='txtTicket'>
			<tr>
				<td colspan='2' align='right'>
					Tuxtla Gutiérrez, Chiapas 
					<br>
					".date('d')." de ".$mes." de ".date('Y')."
				</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class='txtTicket'>
		<b>MTRO. JOSE FEDERICO GUZMAN HERNANDEZ.<br>
		CORDINADOR ADMINISTRATIVO DEL IAP CHIAPAS.<br>
		PRESENTE.
		</b>
		</div>
		<br>
		<br>

		<div class='txtTicket'>
		Derivado del Contrato de Prestación de Servicios Profesionales Independientes que tengo celebrado con este Instituto, solicito de la
		manera más atenta, que los pagos sean efectuados por medio de transferencia o depósito bancario a la cuenta cuyos datos describo a continuación:
		</div>
		<br>
		<br>
		<br>

		<table  align='center' width='100%' border='0' class='txtTicket'>
			<tr>
				<td style='width:199px'><b>Titular:</b><td> ".$info['name']." ".$info['lastname_paterno']." ".$info['lastname_materno']."</td> 
			</tr>
			<tr>
				<td><b>No. de Cuenta:</b><td>  ".$infoPerso['infoBanco'][0]['numCuenta']."</td>
			</tr>
			<tr>
				<td><b>Banco:</b><td> ".$infoPerso['infoBanco'][0]['nombreBanco']."</td>
			</tr>
			<tr>
				<td><b>Clave Interbancaria:</b><td>	".$infoPerso['infoBanco'][0]['claveInterbancaria']."</td>
			</tr>
			<tr>
				<td><b>Correo Electrónico:</b><td>".$infoPerso['infoBanco'][0]['correo']."</td>
			</tr>
			";
		$html .= "</table>";

	
	
	
	$html .= "
	<br>
		<br>
		<br>
		<br>
		<br>
		<br>

	<div class='txtTicket'>Así mismo por el momento y no habiendo otro asunto en lo particular que tratar, hago propicia la ocasión para enviarle un cordial
	saludo.
	</div>
	<br>
	<br>
	<br>
	<br>
	<div class='txtTicket'>
	Atentamente
	<br>
	<br>
	<br>
	<br>
	MTRO(A). ".$info['name']." ".$info['lastname_paterno']." ".$info['lastname_materno']."
			</div>";

		

	

	$html .= "	
	</body>
	</html>

	";
	// echo $html;
	// exit;
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	 
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	$mipdf ->set_paper("A4", "portrait");
	 
	# Cargamos el contenido HTML.
	$mipdf ->load_html(utf8_decode($html));
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('certificadodeValidez.pdf',array('Attachment' => 0));
			


?>