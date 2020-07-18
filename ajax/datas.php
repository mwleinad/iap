<?php
// echo "<pre>"; print_r($_GET); 
// exit;
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

	session_start();

$student->setUserId($_GET["id"]);
	$info = $student->GetInfo();
	
	// echo "<pre>"; print_r($info);
	// exit;
	// $course->setUserId($_SESSION['User']['userId']);
	// $lstBoleta = $course->boletaAlumno();
 
	// echo '<pre>'; print_r($infoCourse);
	// exit;
	$html .= "
	<html>
	<head>
	<title>INFORMACION DE REGISTRO</title>
	<style type='text/css'>
	.txtTicket{
			font-size:12px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
		}
		table,td {
		border: 0px solid black;
		border-collapse: collapse;
	}
	.notas{
			font-size:10px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
		}
		table,td {
		border: 0px solid black;
		 border-collapse: collapse;
	}
	</style>
	</head>
	<body>

";
	
	
	$html .= '
	<table style="width:100%; "  >
	<tr>
		<td style="text-align:left; ">
			<img src="'.DOC_ROOT.'/images/logo_correo.jpg" >
		</td>
		<td style="text-align:right; ">
			<img src="'.DOC_ROOT.'/images/logoconocer.png" ">
			<br>
			<br>
		</td>
	</tr>
	</table>
	<center>
	<table style="width:90%; text-align:right; border:0px" boder=0 >
	<tr>
		<td style="height:100px" align=right>
			Tuxtla Gutiérrez, Chiapas<br>
			Fecha: '.date("Y-m-d").'
		</td>
	</tr>
	<tr>

</td>
		</tr>
		</table> 
	<table>
		<tr>
			<td>Usuario:</td>
			<td>'.$info["controlNumber"].'</td>
		</tr>
		<tr>
			<td>Contraseña:</td>
			<td>'.$info["password"].'</td>
		</tr>
	</table>
	</td>
';
		
			
		
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
	$mipdf ->stream('acuse.pdf',array('Attachment' => 0));
			


?>