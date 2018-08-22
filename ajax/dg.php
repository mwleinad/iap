<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

	session_start();
	
	// echo "<pre>"; print_r($_GET);
	// exit;
	if($_SESSION["User"]["type"]=="student"){
		if($_SESSION["User"]["userId"]<>$_GET['id'])
			exit;
		
	}
	
	$verResultado = true;
	$student->setUserId($_GET['id']);
	$info = $student->GetInfo();
	
	$test->setActivityId($_GET["cId"]);
	$myTest = $test->Enumerate($verResultado,$_GET['id']);
	
	$resEstadoisticas = $test->estadisticas($_GET["cId"],$_GET['id']);
	
	$firma = $student->extraeFirma($_GET['id'],2);
	// echo "<pre>"; print_r($firma );
	// exit;
	
	$html .= "
	<html>
	<head>
	<title>EVALUACION DIAGNOSTICA</title>
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
	
    @page { margin: 180px 50px; }
    #header { position: fixed; left: 0px; top: -180px; right: 0px; height: 150px;  text-align: center; }
    #footer { position: fixed; left: 0px; bottom: -180px; right: 0px; height: 150px; text-align:center; font-size:9}
    #footer .page:after { content: counter(page, upper-roman); }
  
	</style>
	</head>
	<body>

	<div id='header'>
		<table style='width:100%; '  >
	<tr>
		<td style='text-align:left; '>
			<img src='".DOC_ROOT."/images/logo_correo.jpg' >
		</td>
		<td style='text-align:right; '>
			<img src='".DOC_ROOT."/images/logoconocer.png' >
		</td>
	</tr>
	<tr>
		<td colspan=2><center>Evaluación diagnostica</center></td>
	</tr>
	</table>
	  </div>
	  <div id='footer'>
		<p class='page'>
		Instituto de Administración Pública del Estado de Chiapas, A.C.<br>
		Libramiento Norte Poniente No. 2718, Fracc Ladera de la Loma, C.P. 29026<br>
		Tuxtla Gutiérrez, Chiapas; Teléfonos: (961) 12 515 08, 12 515 09, 12 51510, ext 107<br>
		www.iapchiapas.org.mx, redconocer@iapchiapas.org.mx <br>
	  </div>	
";
	
	
	$html .= '
<div id="content">
	<table style="width:100%;"  >';
	
			 
		$html .='
			<tr><td >';
				
foreach($myTest as $key=>$subject){
$html .='<table style="width:100%" >
			<tr>
			<td style="width:100%"><b>'.$subject["numero"].'. '.$subject["question"].'</b></td><td>'.$subject["puntos"].'</b></td></tr>
			<tr >
			<td colspan=2>';
			
			if ($subject["opcionA"]) 
				$html .="   A) ".$subject["opcionA"]."<br>";
			 
			if ($subject["opcionB"]) 
				$html .="   B) ".$subject["opcionB"]."<br>";
			
			if ($subject["opcionC"]) 
				$html .="   C) ".$subject["opcionC"]."<br>";
			  
			if ($subject["opcionD"]) 
				$html .="   D) ".$subject["opcionD"]."<br>";
			
			if ($subject["opcionE"]) 
				$html .="   E) ".$subject["opcionE"]."<br>";
			 
			 
			 	$html .= '<br><br></td></tr></table>';
			}	
					
		
	$html .= '</td></tr>';
		
			
		
	$html .= "
	<tr>
		<td><b>
			Comentarios acerca del resultado del diagnóstico:
				   <br>
				   <br>
					"; 
					foreach($resEstadoisticas["lstRes"] as $key=>$axy){
						if($axy<>"")
						$html .= $axy["comentario"]." [".$axy["numero"]."]<br>";
					
					} 
				
					$html .= "<br>
					<br>
					Respuestas Correctas:".$resEstadoisticas["countOK"]."<br>
					Puntos Obtenidos: ".$resEstadoisticas["puntosOk"]."<br>
					Calificación: ".$resEstadoisticas["calificacion"]."(".$resEstadoisticas["puntosOk"]."/".$resEstadoisticas["totalPuntos"].")<br>
					Sugerencia:"; if ($resEstadoisticas["countOK"] < $resEstadoisticas["limiteAprobatorio"]) { $html .= "Se recomienda  Certificación"; }  else { $html .= "Ninguna"; }
	$html .= "	</b>
	
	<br>
	<br>
	<center>
	SOLICITO MI PROCESO DE EVALUACION<br>
	".$firma["firma"]."<br>
	".strtoupper($info["names"].' '.$info["lastNamePaterno"].'  '.$info["lastNameMaterno"])."</center>
	</td>
	</tr>
	
	</table> 
	</div>
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
	$mipdf ->load_html($html);
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('acuse.pdf',array('Attachment' => 0));
			


?>