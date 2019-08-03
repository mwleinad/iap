<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

	$ayDocentes = "";
	$i = 0;
	foreach($_GET as $key=>$aux){
		
		$a = explode('_',$key);
		if($a[0] == 'docente'){
			$ayDocentes[$i]['Id']  = $a[1];
			$i ++;
		}
	}
	

	foreach($ayDocentes as $key=>$aux){
		
		$personal->setPersonalId($aux['Id']);
		$infoPerso = $personal->InfoBasica();
		$info = $personal->Info();
		
		$infoUM = $personal->extraeUltimaMateria($info['personalId']);
		
		if(file_exists(DOC_ROOT."/".$info['foto'])){
			$foto = DOC_ROOT."/".$info['foto'];
		}else{
			$foto = DOC_ROOT."/images/no_foto.jpg";
		}
		
		$ayDocentes[$key]['info'] = $infoPerso;
		$ayDocentes[$key]['infoPer'] = $info;
		$ayDocentes[$key]['foto'] = $foto;
		$ayDocentes[$key]['materia'] = $infoUM['name'];
		
		
	}
		// echo '<pre>'; print_r($ayDocentes);
	// exit;

	$html .= "
	<html>
	<head>
	<title>REPORTE VEHICULO</title>
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
		<center><b class='txtTicket'></b></center>
		<br>	
		<br>
		<table align='center' width='100%' border='1' class='txtTicket'>
			<tr>
				<td style='width:34%'>Periodo:</td>
				<td>".$_GET['inicio']." - ".$_GET['fin']."</td>
			</tr>

			";
		$html .= "</table>";
	
		$html .= "<br>";
		$html .= "<br>";
		
	
		$html .= "<table align='center' width='100%' border='1' class='txtTicket'>";
		$html .= "
		";
		$html .= "<tr>";
		$html .= "<td>Foto</td>";
		$html .= "<td>Nombre</td>";
		$html .= "<td>Materia</td>";
		$html .= "<td>Vehiculo modelo</td>";
		$html .= "<td>Vehiculo Color</td>";
		$html .= "<td>Vehiculo Placas</td>";
		$html .= "</tr>";
		foreach($ayDocentes as $key=>$aux){
			
			$html .= "<tr>";
			$html .= "<td style='text-align:center'><img src='".$aux['foto']."?".rand()."' style='width: 100px !important'></td>";
			$html .= "<td>".$aux['infoPer']['name']." ".$aux['infoPer']['lastname_paterno']." ".$aux['infoPer']['lastname_materno']."</td>";
			$html .= "<td>".$aux['materia']."</td>";
			$html .= "<td>".$aux['info']['infoAuto'][0]['modelo']."</td>";
			$html .= "<td>".$aux['info']['infoAuto'][0]['color']."</td>";
			$html .= "<td>".$aux['info']['infoAuto'][0]['placas']."</td>";

			$html .= "</tr>";
		}

		
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