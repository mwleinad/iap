<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();
	
		// actualizar ruta de documento adjunto
		$solicitud->actulizarRutaBoleta($_GET['q']);
		

		$contenido .=	"<center><b>Instituto de administración pública del estado de chiapas</b></center><br>";
		$contenido .=	"<font class='titilosmall'>";
		$contenido .=	"<center>incorporada a la secretaria de educacion pública del estado</center><br>";
		$contenido .=	"<center>lave: 07psu0129j</center><br>";
		$contenido .=	"<center>Libramiento norte Pte. No. 2718 Col. ladera de la loma, tuxtla Gutiérrez, chiapas</center>
		<br><br><br>";
		$contenido .=	"</font>";
		$contenido .=	"<center><b>Boleta de Calificaciones</b></center><br><br>";


		$contenido .=	"<table width='100%' >
                         <tr>
                            <td>Nombre del Alumno</td>
                            <td>".$infoSol['names']." ".$infoSol['lastNamePaterno']." ".$infoSol['lastNameMaterno']."</td>
                            <td>Matricula</td>
                            <td>".$infoSol['controlNumber']." </td>
                         </tr>
                         <tr>
                            <td>Posgrado:</td>
                            <td>".$infoSol['name']."</td>
                            <td>Ciclo</td>
                            <td>".$ii[0]." - ".$if[0]." </td>
                         </tr>
                          <tr>
                            <td>Cuatrimestre:</td>
                            <td>".$infoSol['tipoPeriodo']."</td>
                            <td>Periodo</td>
                            <td>".$infoSol['periodo']." Grupo: ".$infoSol['group']."</td>
                         </tr>
                        </table>";

		$contenido .= "<table width='100%' >";
			$contenido .= "
				<tr>
				<td width='70%'><b>Materias</b></td>
				<td colspan='2' style='text-align:center'><b>Calificacion</b></td>
				</tr>";
		$contenido .= "
		
			<tr>
				<td></td>
				<td style='text-align:center'><b>En numero</b></td>
				<td style='text-align:center'><b>En Letra</b></td></tr>";
				
	
			
			
			foreach($lstCal8 as $key2=>$aux2){
					if( $aux2['calificacionValida'] > 0){
						$h =  $util->num2letras($aux2['calificacionValida']);
						$contenido .= "
						<tr>
						<td>".$aux2['name']."</td>
						<td style='text-align:center'>".$aux2['calificacionValida']."</td>
						<td style='text-align:center'>".$h."</td>
						</tr>";
					}	
			}
			
		$contenido .= "</table>
			<br><br>";
		
		$fee = date('m');
		if($fee < 10){
		$fee = str_replace('0','',$fee);
			
		}
		
		$mes = $util->ConvertirMes($fee);
		
		$contenido .= "<center><font class='txtTicket'>Tuxtla Gutiérrez, Chiapas; ".date('d')." ".$mes." de  ".date('Y')."</font></center><br><br>";
		$contenido .= "<br><br><br><br><center><table width='100%' border='0' align='center' class='txtTicket'>
		<tr><td><center><b>C.P. y L.D. Orfanel toalá ramos<br>Director Academico</b></center></td>
		<td><center><b>Lic. Eric Velázquez Areola<br>Control Escolar</b></center></td></tr></table>";

	
	
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
	.titilosmall{
		font-size:5px;
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
	
	
	
		<table align='center' width='100%' border='0' class ='txtTicket'>
			<tr>
				<td  align='left'>
					<img src='".DOC_ROOT."/images/logo_correo.jpg'>
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
	// $mipdf ->stream('certificadodeValidez.pdf',array('Attachment' => 0));
	$pdf = $mipdf->output();
	file_put_contents(DOC_ROOT.'/alumnos/solicitud/solicitud_'.$_GET['q'].'.pdf', $pdf);		
	header("Location:".WEB_ROOT."/alumnos/solicitud/solicitud_".$_GET["q"].".pdf");
	exit;

?>