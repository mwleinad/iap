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
	
	$subject->setSubjectId($_GET['posgrado']);
	$infoS = $subject->Info();
	$module->setSubjectModuleId($_GET['materia']);
	$infoM  = $module->Info();
	// echo '<pre>'; print_r($infoM);
	// exit;

	$personals = $subject->getMateriasProfesor($_GET['materia']);

	$html .= "
	<html>
	<head>
	<title>REPORTE MATERIAS</title>
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
	


			";

	
		$html .= "<br>";
		$html .= "<br>";
		
	
		$html .= "<table align='center' width='100%' border='1' class='txtTicket'>";
		$html .= "";
		$html .= "<tr>";
		$html .= "<td >Posgrado:</td>";
		$html .= "<td colspan='4'>".$infoS['name']."</td>";
		$html .= "</tr>";
		$html .= "<tr>";
		$html .= "<td >Materia:</td>";
		$html .= "<td colspan='4'>".$infoM['name']."</td>";
		$html .= "</tr>";
		$html .= "<tr>";
		$html .= "<td>Foto</td>";
		$html .= "<td>Nombre</td>";
		$html .= "<td>Licenciatura</td>";
		$html .= "<td>Maestria</td>";
		$html .= "<td>Doctorado</td>";
		$html .= "</tr>";
		foreach($personals as $key=>$aux){
			
			$personal->setPersonalId($aux['personalId']);
			$infoPerso = $personal->InfoBasica();
			
			if(file_exists(DOC_ROOT."/".$aux['foto'])){
				$foto = DOC_ROOT."/".$aux['foto'];
			}else{
				$foto = DOC_ROOT."/alumnos/no_foto.JPG";
			}
			
			$html .= "<tr>";
			$html .= "<td style='text-align:center'><img src='".$foto."?".rand()."' style='width: 100px !important'></td>";
			$html .= "<td>".$aux['name']." ".$aux['lastname_paterno']." ".$aux['lastname_materno']."</td>";
			$html .= "<td>".$aux['basica']['estudios'][0]['carrera']."|".$aux['basica']['estudios'][0]['escuela']."<br><br>";
			
			if ($aux['basica']['estudios'][0]['titulo'] == 'si'){
				$html .= "<b>*</b> Titulo<br>";
			} 
			if ($aux['basica']['estudios'][0]['actaExamen'] == 'si'){
				$html .= "<b>*</b>  Acta de Examen<br>";
			}
			if ($aux['basica']['estudios'][0]['cedula'] == 'si'){
				$html .= "<b>*</b>  Cedula<br>";
			}
			
			$html .= "</td>";  
			$html .= "<td>".$aux['basica']['estudios'][1]['carrera']."|".$aux['basica']['estudios'][1]['escuela']."<br><br>";
			
			if ($aux['basica']['estudios'][1]['titulo'] == 'si'){
				$html .= "<b>*</b> Titulo<br>";
			} 
			if ($aux['basica']['estudios'][1]['actaExamen'] == 'si'){
				$html .= "<b>*</b>  Acta de Examen<br>";
			}
			if ($aux['basica']['estudios'][1]['cedula'] == 'si'){
				$html .= "<b>*</b>  Cedula<br>";
			}
			
			$html .=  "</td>";
			$html .= "<td>".$aux['basica']['estudios'][2]['carrera']."|".$aux['basica']['estudios'][2]['escuela']."<br><br>";
			
			if ($aux['basica']['estudios'][2]['titulo'] == 'si'){
				$html .= "<b>*</b>  Titulo<br>";
			} 
			if ($aux['basica']['estudios'][2]['actaExamen'] == 'si'){
				$html .= "<b>*</b>  Acta de Examen<br>";
			}
			if ($aux['basica']['estudios'][2]['cedula'] == 'si'){
				$html .= "<b>*</b>  Cedula<br>";
			}
			
			$html .=  "</td>";

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