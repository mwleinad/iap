<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();
	
	// echo '<pre>';print_r($_GET);
	// exit;
	
	$_POST['activo']  = $_GET['activo']; 
	$_POST['programado']  = $_GET['programado']; 
	$_POST['linea']  = $_GET['linea']; 
	$_POST['presencial']  = $_GET['presencial']; 
	
	$lsReporte = $docente->onBuscarMacth();

	// echo '<pre>'; print_r($lsReporte);
	// exit;
	$html .= "
	<html>
	<head>
	<title>REPORTE DOCENTES/MATERIAS</title>
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
		<br>";

	
		$html .= "<br>";
		$html .= "<br>";
		
	
		$html .= "<table align='center' width='100%' border='1' class='txtTicket'>";
		$html .= "";
		$html .= "<tr>";
		$html .= "<td ></td>";
		$html .= "<td >Docente</td>";
		$html .= "<td >Posgrado</td>";
		$html .= "<td >Modalidad</td>";
		$html .= "<td >Grupo</td>";
		$html .= "<td >Materia</td>";
		$html .= "<td >Vigenia</td>";
		$html .= "<td >Estatus</td>";
		$html .= "</tr>";

		foreach($lsReporte as $key=>$aux){
			
			if(file_exists(DOC_ROOT."/".$aux['foto'])){
				$foto = DOC_ROOT."/".$aux['foto'];
			}else{
				$foto = DOC_ROOT."/images/no_foto.jpg";
			}
			
			if($aux['foto']==''){
				$foto = DOC_ROOT."/images/no_foto.jpg";
			}
			
			$html .= "<tr>"; 
			$html .= "<td><img src='".$foto."' style='width: 100px !important'></td>";
			$html .= "<td>".$aux['name']." ".$aux['lastname_paterno']." ".$aux['lastname_materno']."</td>";
			$html .= "<td> ".$aux['tipoC']." EN ".$aux['nameS']."</td>";
			$html .= "<td>".$aux['modality']."</td>";
			$html .= "<td>".$aux['group']."</td>";
			$html .= "<td>".$aux['nameM']."</td>";
			$html .= "<td>".$aux['initialDate']." - ".$aux['initialDate']."</td>";
			$html .= "<td>".$aux['estatusMateria']."</td>";

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