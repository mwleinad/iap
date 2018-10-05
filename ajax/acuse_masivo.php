<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	use Dompdf\Adapter\CPDF;
	use Dompdf\Dompdf;
	use Dompdf\Exception;

	session_start();
	
	
	
	$pagess = $_GET["pagina"];
	$limit =  $_GET["total"];
	
	$lstp1 = $student->extraeUserCourse($pagess,$limit); 
	
	// echo "<pre>"; print_r($lstp1);
	// exit;

	foreach($lstp1 as $key=>$auxUC){
		
		$key = new DOMPDF();
		$key  ->set_paper("A4", "portrait");
		
		$html = "";
		
		$html .= "
		<html>
		<head>
		<title>ACUSE DE RECIBO</title>
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
	
	$student->setUserId($auxUC['alumnoId']);
	$info = $student->GetInfo();
	
	$firma = $student->extraeFirma($auxUC['alumnoId'],1,'course',$auxUC['courseId']); 


	$html .= '

	<table style="width:100%; "  >
	<tr>
		<td style="text-align:left; ">
			<img src="'.DOC_ROOT.'/images/logo_correo.jpg" >
		</td>
		<td style="text-align:right; ">
			<img src="'.DOC_ROOT.'/images/logoconocer.png" >
				<br>
				<br>
		</td>
	</tr>
	<tr>
		<td colspan=2 style="text-align:right; ">
			Tuxtla Gutiérrez, Chiapas<br>
			Fecha: '.$firma["fecha"].'
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</td>
	</tr>
	<tr>
	<td style="text-align:center; " colspan=2>
	<b>ACUSE DE RECIBO DEL DOCUMENTO DERECHOS Y
	OBLIGACIONES DEL USUARIO DEL SNC</b>
	<br>
	<br>
	<br>
	<br>
	Manifiesto por este medio, haber recibido por parte del Evaluador el documento titulado:<br>
	"Derechos y Obligaciones de los Usuarios del Sistema Nacional de Competencias", el cual
	tendrá observancia durante todo mi proceso de Evaluación, cuyo contenido me permite
	exigir mis derechos y cumplir con mis obligaciones. 
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<b>'.$firma["firma"].'<b/><br>
	<b>'.strtoupper($info["names"].' '.$info["lastNamePaterno"].'  '.$info["lastNameMaterno"]).'</b><br>
	Firma del Candidato
	</td></tr>';
	$html .= "	
	<tr>
	<td style=\"text-align:center; \" colspan=2>
		<font style='font-size:9'>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		Instituto de Administración Pública del Estado de Chiapas, A.C.<br>
		Libramiento Norte Poniente No. 2718, Fracc Ladera de la Loma, C.P. 29026<br>
		Tuxtla Gutiérrez, Chiapas; Teléfonos: (961) 12 515 08, 12 515 09, 12 51510, ext 107<br>
		www.iapchiapas.org.mx, redconocer@iapchiapas.org.mx
		</font>
	</td>
	</tr>
	</table> 
	<div style='page-break-after:always;'></div>
	";
	$html .= "
	</body>
	</html>

	";
	
		$key  ->load_html($html);

		$key  ->render();
		 
		file_put_contents('acuses/acuse_'.$auxUC["name"].'.pdf', $key ->output());

	}
	
	
	 

	
			

	
?>