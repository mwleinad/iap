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
	

	$personals = $subject->getMateriasImpartida($_GET['Id']);
	
	$personal->setPersonalId($_GET['Id']);
	// $infoPerso = $personal->InfoBasica();
	$info = $personal->Info();
	
	if(file_exists(DOC_ROOT."/".$info['foto'])){
		$foto = DOC_ROOT."/".$info['foto'];
	}else{
		$foto = DOC_ROOT."/images/no_foto.jpg";
	}
	
	// echo '<pre>'; print_r($personals);
	// exit;

	$html .= "
	<html>
	<head>
	<title>REPORTE DOCENTE-MATERIAS</title>
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
		<br>	
		<center>
			<img src='".$foto."?".rand()."' style='width: 100px !important'><br>
			<b class='txtTicket'>".$info['name']." ".$info['lastname_paterno']." ".$info['lastname_materno']."</b>
		</center><br>
		<br>	
		<br>	
		<br>	
		<center><b class='txtTicket'>Materias Impartidas</b></center>
		<br>	
		<br>
	


			";

	
		$html .= "<br>";
		$html .= "<br>";
		
	
		$html .= "<table align='center' width='100%' border='1' class='txtTicket'>";
		$html .= "
		";
		$html .= "<tr>";

		$html .= "<td>Tipo</td>";
		$html .= "<td>Posgrado</td>";
		$html .= "<td>Materia</td>";
		$html .= "<td>Grupo</td>";
		$html .= "<td>Modalidad</td>";
		$html .= "<td>Fecha Inicio</td>";
		$html .= "<td>Fecha Fin</td>";
		$html .= "</tr>";
		foreach($personals as $key=>$aux){
			
			$personal->setPersonalId($aux['personalId']);
			$infoPerso = $personal->InfoBasica();
			
			$html .= "<tr>";
			$html .= "<td>".$aux['tipoc']."</td>";  
			$html .= "<td>".$aux['nameS']."</td>";  
			$html .= "<td>".$aux['name']."</td>";
			$html .= "<td>".$aux['group']."</td>";
			$html .= "<td>".$aux['modality']."</td>";
			$html .= "<td>".$aux['initialDate']."</td>";
			$html .= "<td>".$aux['finalDate']."</td>";

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
	$mipdf ->set_paper("A4", "landscape");
	 
	# Cargamos el contenido HTML.
	$mipdf ->load_html(utf8_decode($html));
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('certificadodeValidez.pdf',array('Attachment' => 0));
			


?>