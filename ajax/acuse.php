<?php
// echo "<pre>"; print_r($_GET); 
// exit;
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

	// $course->setCourseId($_GET['q']);
	// $infoCourse = $course->Info();
	
	// echo "<pre>"; print_r();
	// exit;
	// $course->setUserId($_SESSION['User']['userId']);
	// $lstBoleta = $course->boletaAlumno();
 
	// echo '<pre>'; print_r($infoCourse);
	// exit;
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
	<br>	
	<br>	
";
	
	
	$html .= '
	<center>
	<table style="width:90%; text-align:right; border:0px" boder=0 >
	<tr>
		<td>
			Tuxtla Gutiérrez, Chiapas<br>
			Fecha: '.date("Y-m-d").'
		</td>
	</tr>
	<tr>
	<td style="height:800px" align=center>

	
	<b>ACUSE DE RECIBO DEL DOCUMENTO DERECHOS Y
	OBLIGACIONES DEL USUARIO DEL SNC</b>
	
	<br>
	<br>
	Manifiesto por este medio, haber recibido por parte del Evaluador el documento titulado:<br>
	"Derechos y Obligaciones de los Usuarios del Sistema Nacional de Competencias", el cual
	tendrá observancia durante todo mi proceso de Evaluación, cuyo contenido me permite
	exigir mis derechos y cumplir con mis obligaciones. </td></tr></center>';
		
			
		
	$html .= "	
	<tr>
	<td style='width:90%; text-align:center; border:0px'>
	<font style='font-size:9'>
	Instituto de Administración Pública del Estado de Chiapas, A.C.<br>
	Libramiento Norte Poniente No. 2718, Fracc Ladera de la Loma, C.P. 29026<br>
	Tuxtla Gutiérrez, Chiapas; Teléfonos: (961) 12 515 08, 12 515 09, 12 51510, ext 107<br>
	www.iapchiapas.org.mx, redconocer@iapchiapas.org.mx
	
		</font>
		</td>
		</tr>
		</table> 
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