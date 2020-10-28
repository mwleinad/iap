<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

	session_start();
// echo "<pre>"; print_r($lstPreguntas);
    // exit;

	
	$module->setCourseModuleId($_GET['Id']);
	$infoM  = $module->InfoCourseModule();
	$infoC  = $module->infoCourseMol($infoM['courseId']);
	$personal->setPersonalId($infoM['access'][1]);
	$infoP = $personal->Info();

	
	$lstPreguntas = $encuesta->promedioXRubro($_GET['Id'],$infoM['courseId']);     
	
	$html .= "
	<html>
	<head>
	<title>VALORACION</title>
	<style type='text/css'>
	.txtTicket{
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
		
		<table align='center' width='100%'  border='0' class='txtTicket'>
			<tr>
				<td  align='left' '>
					<img src='".DOC_ROOT."/images/logo_correo.jpg' >
				</td>
			</tr>
		</table>
		<br>	
		<br>	
		<br>	
		<br>	
		<br>	
		<center><b class='txtTicket'>Valoración</b></center>
		<br>	
		<br>
		<table align='center' width='100%' border='1' class='txtTicket'>
			<tr>
				<td style='width:34%'>Materia</td>
				<td>".$infoM['name']."</td>
			</tr>
			<tr>
				<td>Grupo</td>
				<td>".$infoC['group']."</td>
			</tr>
			<tr>
				<td>Posgrado</td>
				<td>".$infoM['subjectName']."</td>
			</tr>
			<tr>
				<td>Nombre Docente</td>
				<td>".$infoP['name']." ".$infoP['lastname_paterno']." ".$infoP['lastname_materno']."</td>
			</tr>
			";
		$html .= "</table>";
		$html .= "<br>";
		$html .= "<br><font class='txtTicket'><b>Resultados</b>  </font>";
		$html .= "<br>";
	
		
		foreach($lstPreguntas['result'] as $key=>$aux){
			$html .= "<table align='center' width='700px' border='1' class='txtTicket'>";
			$html .= "<tr><td >Rubro</td><td width='44px'>Prom.</td></tr>";
			$html .= "<tr><td><b>".$aux['nombre']."</b></td><td width='44px'>".$aux['promedio']."</td></tr>";
			$html .= ""; 
			
			$html .= "
				<tr>
					<td>Pregunta</td>
					<td width='94px'></td>
				</tr>"; 		
			foreach($aux['lstPreguntas'] as $keyp=>$auxp){
				$html .= "<tr><td>".$auxp['pregunta']."</td><td width='94px'>".$auxp['totalPp']."</td></tr>"; 	
			}

			$html .= "</table>
			<br>
			<br>
			";
			
		}
		
		
		$html .= "<br><div style='page-break-after:always;'></div>";
		$html .= "<br><font class='txtTicket'><b>Comentarios</b> </font>";
		
		$html .= "<br>";
		$html .= "<table align='center' width='77%' border='1' class='txtTicket'>";

		
		foreach($lstPreguntas['lstComentarios'] as $key=>$aux){
			$html .= "<tr><td>".$aux['comentario']."</td></tr>";
		}
		$html .= "</table>";
		

	$html .= "	
	</body>
	</html>

	";
	
	// <div style='page-break-after:always;'>
	// echo $html;
	// exit;
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	 
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	$mipdf ->set_paper("A4", "portrait");
	 
	# Cargamos el contenido HTML.
	$mipdf ->load_html($html);
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('certificadodeValidez.pdf',array('Attachment' => 0));
			


?>
