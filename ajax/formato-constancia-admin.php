<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

	// if($_GET['qAdmin']<>''){
			// $solicitud->setTipo($_GET['qAdmin']);
			// $solicitud->setCursoId($_GET['cursoId']);
			// $Id = $solicitud->SaveSolicitud();
			// $_GET['q'] = $Id;
	// }
	
		
	
	
	$util = new Util;
	

	$infoSol = $solicitud->Info($_GET['q']);
	// echo '<pre>'; print_r($infoSol); 
	// exit;
	$infoIns = $solicitud->buscaDondeIns($infoSol['subjectId']);
	
	$ii = explode('-',$infoSol['initialDate']);
	$if = explode('-',$infoSol['finalDate']);
	$fe = explode('-',$infoSol['fechaEntrega']);
	
	$mes = $util->ConvertirMes($fe[1]);
 // $mes;
	// echo $fe[1];
	// exit;
	if($infoSol['nombreMajor']=='MAESTRIA'){
		$prepo = 'de la';
		$prepo2 = 'la';
	}else{
		$prepo = 'del';
		$prepo2 = 'el';
	}
	
	if($infoSol['tiposolicitudId'] ==2 ){
		
		$lstCal = $solicitud->buscaCalificaciones($infoSol['courseId'],$infoSol['userId']);
		
		$contenido .= "<br>
		Que  el <b>C. ".$infoSol['names']." ".$infoSol['lastNamePaterno']." ".$infoSol['lastNameMaterno']."</b>, concluyó ".$prepo2." <b>".$infoSol['nombreMajor']." en ".$infoSol['name']."</b>,
		correspondiente a la  generación ".$ii[0]." - ".$if[0].", plan ".$infoSol['tipoPeriodo'].", obteniendo las siguientes calificaciones.<br><br>";
		
		
	
		foreach($lstCal as $key=>$aux){
			$contenido .= "<table width='100%'>";
			$contenido .= "<tr><td width='70%'>Materias</td><td colspan='2'>Calificacion</td><td>Creditos</td></tr>";
			$contenido .= "<tr><td>".$aux['semesterId']."</td><td>Cifra</td><td>Letra</td><td></td></tr>";
			foreach($aux['materias'] as $key2=>$aux2){
			$h =  $util->num2letras($aux2['calificacion']);
			$contenido .= "<tr><td>".$aux2['name']."</td><td>".$aux2['calificacion']."</td><td>".$h."</td><td></td></tr>"; 
			}
			$contenido .= "</table>
			<br><br>";
		}
		
		$contenido .= "<br><br>A petición del Interesado  y para los usos legales que mejor convengan, 
		se extiende la presente en la ciudad de Tuxtla Gutiérrez, Chiapas a los  ".$fe[2]." dias del  mes de ".$mes." del año ".$fe[0]."<br><br>";
	
		$contenido .= "<br><br><br>Atentamente
		<br>
		<br>
		<br>
		".$infoSol['nombreFirma']."<br>
		".$infoSol['puestofirmante']."<br>
		";
	} 
	
	if($infoSol['tiposolicitudId'] == 1){
		
	
		
		$contenido .= "<br>
		Que  el C. <b>".$infoSol['names']." ".$infoSol['lastNamePaterno']." ".$infoSol['lastNameMaterno']."</b>,
		está inscrito al <b>".$infoSol['tipoPeriodo']." ".$prepo." ".$infoSol['nombreMajor']." </b>
		en <b>".$infoSol['name']."</b>, correspondiente a la  generación <b>".$ii[0]." - ".$if[0]."</b>  los días ...";
	
		$contenido .= "<br><br><br>A petición del Interesado  y para los usos legales que mejor convengan, 
		se extiende la presente en la ciudad de Tuxtla Gutiérrez, Chiapas a los  ".$fe[2]." dias del  mes de ".$mes." del año ".$fe[0]."";
		
		$contenido .= "<br><br><br>Atentamente
		<br>
		<br>
		".$infoSol['nombreFirma']."<br>
		".$infoSol['puestofirmante']."<br>
		";
	} 
	
	if($infoSol['tiposolicitudId'] == 6){
		
		
		$contenido .= "<br>
		Que  el C. <b>".$infoSol['names']." ".$infoSol['lastNamePaterno']." ".$infoSol['lastNameMaterno']."</b> , concluyó los estudios  
		".$prepo." <b>".$infoSol['nombreMajor']."</b> en <b>".$infoSol['name']."</b>, correspondiente a la  generación ".$ii[0]." - ".$if[0].", así mismo se encuentra 
		en proceso de certificación de estudios.";
	
		$contenido .= "<br><br><br>A petición del Interesado  y para los usos legales que mejor convengan, 
		se extiende la presente en la ciudad de Tuxtla Gutiérrez, Chiapas a los  ".$fe[2]." dias del  mes de ".$mes." del año ".$fe[0]."";
		
		$contenido .= "<br><br><br>Atentamente
		<br>
		<br>
		".$infoSol['nombreFirma']."<br>
		".$infoSol['puestofirmante']."<br>
		";
	} 
	
	if($infoSol['tiposolicitudId'] == 7){
		
		$ii = explode('-',$infoSol['initialDate']);
		$if = explode('-',$infoSol['finalDate']);
		$fe = explode('-',$infoSol['fechaEntrega']);
				
		$contenido .= "<br><br><br>Que  se ha solicitado ante la Secretaria de Educación la autorización para realizar 
		los trámites  de titulación del <b>LIC. ".$infoSol['names']." ".$infoSol['lastNamePaterno']." ".$infoSol['lastNameMaterno']."</b>, 
		quien terminó ".$prepo2."  <b>".$infoSol['nombreMajor']."</b> en <b>".$infoSol['name']."</b> generación ".$ii[0]." - ".$if[0].".";
	
		$contenido .= "<br><br><br>A petición del Interesado  y para los usos legales que mejor convengan, 
		se extiende la presente en la ciudad de Tuxtla Gutiérrez, Chiapas a los  ".$fe[2]." dias del  mes de ".$mes." del año ".$fe[0]."";
		
		$contenido .= "<br><br><br>Atentamente
		<br>
		<br>
		".$infoSol['nombreFirma']."<br> 
		".$infoSol['puestofirmante']."<br>
		";
	} 
	
	if($infoSol['tiposolicitudId'] == 4){
		
		$lstCal8 = $solicitud->buscaCalificaciones($infoSol['courseId'],$infoSol['userId']);
		include('boleta_pdf.php');
		exit;
		
	}
	
	$html .= "
	<html>
	<head>
	<title>CONSTANCIA</title>
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
	
	
	
		<table align='center' width='100%' border='0'>
			<tr>
				<td  align='right'>
					<img src='".DOC_ROOT."/images/logo_correo.jpg'>
				</td>
			</tr>
			<tr>
				<td align='right'>
					<table align='right'  border='0'>
							<tr>
								<td>Area:</td>
								<td>Dirección Académica</td>
							</tr>
							<tr>
								<td>Constancia:</td>
								<td>".$infoSol['folioSolicitud']."</td>
							</tr>
							<tr>
								<td>Fecha:</td>
								<td>".$infoSol['fechaEntrega']."</td>
							</tr>
					</table>
					<br>
					<br>
					<br>
					<br>
				</td>
			</tr>
			<tr>
				<td>
					<b>A QUIEN CORRESPONDA:</b>
					<br>
					<br>
					El que suscribe C. ".$infoSol['nombreFirma']." ".$infoSol['puestofirmante']." del Instituto de Administración  Pública del Estado de Chiapas.
					<br>
					<br>
					<center><b>H A C E &nbsp;&nbsp;&nbsp;&nbsp; C O N S T A R </b> </center>
				</td>
			</tr>
			<tr>
			<td>
			";

	$html .= $contenido;	
	
	$html .= "</td></tr>";	
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