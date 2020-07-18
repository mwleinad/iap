<?php
// echo "<pre>"; print_r($_GET);
// exit;
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');
    use Dompdf\Dompdf;


    session_start();


	$personal->setPersonalId($_GET['Id']);
	$infoPerso = $personal->InfoBasica();
	$info = $personal->Info();


	if(file_exists(DOC_ROOT."/".$info['foto'])){
		$foto = DOC_ROOT."/".$info['foto'];
	}else{
		$foto = DOC_ROOT."/alumnos/no_foto.JPG";
	}
	// echo '<pre>'; print_r($info);
	// exit;


	$html .= "
	<html>
	<head>
	<title>INFORMACION DEL DOCENTE</title>
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

	
		<table align='center' width='100%' border='0' class='txtTicket'>
			<tr>
				<td colspan='2' align='right'>
					<img src='".DOC_ROOT."/images/logo_correo.jpg'>
				</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<img src='".$foto."?".rand()."' style='width: 100px !important'><br>
		<b class='txtTicket'>INFORMACION GENERAL</b>
		<table  align='center' width='100%' border='1' class='txtTicket'>
			<tr>
				<td><b>Nombre:</b><br> ".$info['name']."</td>
				<td><b>Apellido Paterno:</b><br> ".$info['lastname_paterno']."</td>
				<td><b>Apellido Materno:</b><br> ".$info['lastname_materno']."</td>
			</tr>
			<tr>
				<td><b>Correo Electronico:</b><br>	".$info['correo']."</td>
				<td><b>Celular:</b><br>	".$info['celular']."</td>
				<td><b>RFC: </b><br>".$info['rfc']."</td>
			</tr>
			<tr>
				<td><b>Fecha de Nacimiento:</b><br>".$info['fecha_nacimiento']."</td>
				<td><b>Numero de INE:	</b><br>".$info['INE']."</td>
				<td><b>Curp:</b><br> ".$info['curp']."</td>
			</tr>
			<tr>
				<td colspan='3'><b>Domicilio</b></td>
			</tr>
			<tr>
				<td><b>Calle:</b><br>".$info['calle']."</td>
				<td><b>Numero Interior:	</b><br>".$info['nInterior']."</td>
				<td><b>Numero Exterior::</b><br> ".$info['nExterior']."</td>
			</tr>
			<tr>
				<td><b>Colonia:</b><br>".$info['colonia']."</td>
				<td><b>Estado:	</b><br>".$info['estado']."</td>
				<td><b>Ciudad:</b><br> ".$info['ciudad']."</td>
			</tr>
			<tr>
				<td><b>Facebook:</b><br>".$info['facebook']."</td>
				<td><b>Twitter:	</b><br>".$info['twitter']."</td>
				<td></td>
			</tr>
			";
		$html .= "</table>";

	$html .= "
	<br>
	<br>
	<br>
		<b class='txtTicket'>INFORMACION ESCOLAR</b>
		<table  align='center' width='100%' border='1' class='txtTicket'>
		<tr>
			<td>
				<b>Licenciatura</b><br>
				Escuela: 
				".$infoPerso['estudios'][0]['escuela']."<br><center>";

				if($infoPerso['estudios'][0]['titulo'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= "Titulo  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
				if($infoPerso['estudios'][0]['actaExamen'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= " Acta Examen  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ";
				if($infoPerso['estudios'][0]['cedula'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= " Cedula 
				</center>
			</td>
		</tr>

		<tr>
			<td>
				<b>Maestria</b><br>
				Escuela: 
				".$infoPerso['estudios'][1]['escuela']."<br><center>";

				if($infoPerso['estudios'][1]['titulo'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= "Titulo  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
				if($infoPerso['estudios'][1]['actaExamen'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= " Acta Examen  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ";
				if($infoPerso['estudios'][1]['cedula'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= " Cedula 
				</center>
			</td>
		</tr>	
		
		<tr>
			<td>
				<b>Doctorado</b><br>
				Escuela: 
				".$infoPerso['estudios'][2]['escuela']."<br><center>";

				if($infoPerso['estudios'][2]['titulo'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= "Titulo  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ";
				if($infoPerso['estudios'][2]['actaExamen'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= " Acta Examen  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ";
				if($infoPerso['estudios'][2]['cedula'] == 'si'){
					$html .= "<b>[X]</b>";
				}else{
					$html .= "[&nbsp;&nbsp;]";
				}
				$html .= " Cedula 
				</center>
			</td>
		</tr>	
		
	";


	$html .= "	
	</table>
	<br>
	<br>
	<br>
	<b class='txtTicket'>INFORMACION BANCARIA</b>
	<table  align='center' width='100%' border='1' class='txtTicket'>
			<tr>
				<td><b>Institucion Bancaria:</b><br> ".$infoPerso['infoBanco'][0]['nombreBanco']."</td> 
				<td><b>No. Cuenta:</b><br> ".$infoPerso['infoBanco'][0]['numCuenta']."</td>
				<td><b>CLABE Interbancaria:</b><br>  ".$infoPerso['infoBanco'][0]['claveInterbancaria']."</td>
			</tr>
			<tr>
				<td><b>Sucursal</b><br>	".$infoPerso['infoBanco'][0]['sucursal']."</td>
				<td><b>Numero de Plaza :</b><br>".$infoPerso['infoBanco'][0]['numeroPlaza']."</td>
				<td><b>Lugar: </b><br>	".$infoPerso['infoBanco'][0]['lugar']."</td>
			</tr>
			<tr>
				<td><b>Correo Electronico para Notificiación:</b><br>".$infoPerso['infoBanco'][0]['correo']."</td>
				<td><b>Tipo de Contrato:</b><br>Persona ".$info['tipoContrato']."</td>
				<td></td>
			</tr>
			";
		$html .= "</table>";


	$html .= "	
	<br>
	<br>
	<br>
	<b class='txtTicket'>INFORMACION AUTOMÓVIL</b>
	<table  align='center' width='100%' border='1' class='txtTicket'>
			<tr>
				<td><b>Modelo Automóvil:</b><br> ".$infoPerso['infoAuto'][0]['modelo']."</td> 
				<td><b>Color Automóvil:</b><br> ".$infoPerso['infoAuto'][0]['color']."</td>
				<td><b>Placas Automóvil:</b><br>  ".$infoPerso['infoAuto'][0]['placas']."</td>
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
