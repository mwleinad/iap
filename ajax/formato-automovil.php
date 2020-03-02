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
	
	// echo $foto = DOC_ROOT."/".$info['foto'];
	// exit;

	if(file_exists(DOC_ROOT."/".$info['foto'])){
		$foto = DOC_ROOT."/".$info['foto'];
	}else{
		$foto = DOC_ROOT."/alumnos/no_foto.JPG";
	}


	

	$html .= "
	<html>
	<head>
	<title>DATOS DEL AUTOMOVIL</title>
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
	<br>	
	<br>	

	
		<table align='center' width='100%' border='1' class='txtTicket'>
			<tr>
				<td colspan='2' align='left'>
					<img src='".DOC_ROOT."/images/logo_correo.jpg' >
				</td>
			</tr>
			<tr>
				<td align=right colspan='2'>
				
					<br>
					<br>
					<br>
					<center>
					<img src='".$foto."?".rand()."' style='width: 100px !important'>
					</center>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<td align=left colspan='2'>
				<b>Datos del Docente:</b> ".$info['name']." ".$info['lastname_materno']. " ".$info['lastname_paterno']."
				<br>
				<br>
				</td>
			</tr>
			<tr>
				<td align=left colspan='2'>
				<b>Datos del Vehiculo</b>
				</td>
			</tr>
			<tr>
				<td style='width:133px'>
					Modelo:
				</td>
				<td align=left>".$infoPerso['infoAuto'][0]['modelo']."		
				</td>
			</tr>
			<tr>
				<td>
					Color:
				</td>
				<td align=left>".$infoPerso['infoAuto'][0]['color']."		
				</td>
			</tr>
			<tr>
				<td>
				Placas:
				</td>
				<td align=left>".$infoPerso['infoAuto'][0]['placas']."		
				</td>
			</tr>
		

			";
		$html .= "</table>";

	


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