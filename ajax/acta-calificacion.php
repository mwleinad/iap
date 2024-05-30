<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');

use Dompdf\Dompdf;

session_start();
$util = new Util;
$module->setCourseModuleId($_GET["Id"]);
$info = $module->InfoCourseModule();

$isEnglish = false;
if ($info['materia'] == 0)
	$isEnglish = true;

if ($info['modality'] == 'Online') {
	$rov = $info['rvoeLinea'];
	$fecharov = $info['fechaRvoeLinea'];
} else {

	$rov = $info['rvoe'];
	$fecharov = $info['fechaRvoe'];
}

$course->setCourseId($info["courseId"]);
$infoCo = $course->Info();
$group->setCourseModuleId($_GET["Id"]);
$group->setCourseId($info["courseId"]);
$group->setTipoMajor($info["majorName"]);
$noTeam = $group->actaCalificacion();
$studentsRepeat = $group->actaCalificacionRepeat();
$infoFirma = $personal->extraeFirmaActa();
$personal->setPersonalId($info['access'][1]);
$infoPersonal = $personal->Info();
$breakAlways = $studentsRepeat ? "page-break-after:avoid" : "";
$main = "";
$main .= "<table  width='100%' class='txtTicket' style='border: none'>
			<tr>
				<td style='width:11px'><center>Num.</center></td>
				<td ><center>Nombre</center></td>
				<td style='width:100px'><center>Calificación Final</center></td>
				<td style='width:100px'><center>Letra</center></td>
			</tr>";
foreach ($noTeam as $key => $aux) {
	$main .= "<tr>";
	$main .= "<td>" . ($key + 1) . "</td>";
	$main .= "<td>" . $aux['lastNamePaterno'] . " " . $aux['lastNameMaterno'] . " " . $aux['names'] . "</td>";
	$h =  $util->num2letras($aux['score']);

	if ($aux['score'] == 0) {
		$main .= "<td><center><font color='red'>NP</font></center></td>";
		$main .= "<td><center><font color='red'>NO PRESENTÓ</font></center></td>";
	} else if ($aux['score'] < 7  and $info['majorName'] == 'MAESTRÍA') {
		if ($isEnglish) {
			$main .= "<td><center><font color='red'>NA</font></center></td>";
			$main .= "<td><center><font color='red'>No Aprobado</font></center></td>";
		} else {
			$main .= "<td><center><font color='red'>" . 6 . "</font></center></td>";
			$main .= "<td><center><font color='red'>SEIS</font></center></td>";
		}
	} else if ($aux['score'] < 8  and $info['majorName'] == 'DOCTORADO') {
		if ($isEnglish) {
			$main .= "<td><center><font color='red'>NA</font></center></td>";
			$main .= "<td><center><font color='red'>No Aprobado</font></center></td>";
		} else {
			$main .= "<td><center><font color='red'>" . 7 . "</font></center></td>";
			$main .= "<td><center><font color='red'>SIETE</font></center></td>";
		}
	} else {
		if ($isEnglish) {
			$main .= "<td><center>A</center></td>";
			$main .= "<td><center>Aprobado</center></td>";
		} else {
			$main .= "<td><center>" . $aux['score'] . "</center></td>";
			$main .= "<td><center>" . $h . "</center></td>";
		}
	}
	$main .= "</tr>";
}
$main .= '	<tr style="border: none">
				<td colspan="4" align="center" style="border: none">
					<br><br><br>
					' . $infoPersonal["profesion"] . ' ' . $infoPersonal["name"] . ' ' . $infoPersonal["lastname_paterno"] . ' ' . $infoPersonal["lastname_materno"] . '<br>
					Catedrático (a)
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center" style="border: none;">
					<div style="width:49%; display:inline-block;">
						<br><br><br><br>' . $infoFirma['director'] . '<br>
						Directora Academica
					</div>
					<div style="width:49%; display:inline-block;">
						<br><br><br><br>' . $infoFirma['controlEscolar'] . '<br>
						Servicios Escolares
					</div>
				</td> 
			</tr>';
$main .= "</table>";
if ($studentsRepeat) {
	$main .= "<table  width='100%' class='txtTicket' style='page-break-after: never;'>
	<tr>
		<td style='width:11px'><center>Num.</center></td>
		<td ><center>Nombre</center></td>
		<td style='width:100px'><center>Calificación Final</center></td>
		<td style='width:100px'><center>Letra</center></td>
	</tr>";
	foreach ($studentsRepeat as $key => $aux) {
		$main .= "<tr>";
		$main .= "<td>" . ($key + 1) . "</td>";
		$main .= "<td>" . $aux['lastNamePaterno'] . " " . $aux['lastNameMaterno'] . " " . $aux['names'] . "</td>";
		$h =  $util->num2letras($aux['score']);

		if ($aux['score'] == 0) {
			$main .= "<td><center><font color='red'>NP</font></center></td>";
			$main .= "<td><center><font color='red'>NO PRESENTÓ</font></center></td>";
		} else if ($aux['score'] < 7  and $info['majorName'] == 'MAESTRÍA') {
			if ($isEnglish) {
				$main .= "<td><center><font color='red'>NA</font></center></td>";
				$main .= "<td><center><font color='red'>No Aprobado</font></center></td>";
			} else {
				$main .= "<td><center><font color='red'>" . $aux['score'] . "</font></center></td>";
				$main .= "<td><center><font color='red'>" . $h . "</font></center></td>";
			}
		} else if ($aux['score'] < 8  and $info['majorName'] == 'DOCTORADO') {
			if ($isEnglish) {
				$main .= "<td><center><font color='red'>NA</font></center></td>";
				$main .= "<td><center><font color='red'>No Aprobado</font></center></td>";
			} else {
				$main .= "<td><center><font color='red'>" . $aux['score'] . "</font></center></td>";
				$main .= "<td><center><font color='red'>" . $h . "</font></center></td>";
			}
		} else {
			if ($isEnglish) {
				$main .= "<td><center>A</center></td>";
				$main .= "<td><center>Aprobado</center></td>";
			} else {
				$main .= "<td><center>" . $aux['score'] . "</center></td>";
				$main .= "<td><center>" . $h . "</center></td>";
			}
		}
		$main .= "</tr>";
	}
	$main .= "</table>";
}

$logo = file_get_contents(DOC_ROOT . "/images/logo_correo.jpg");
$base64 = 'data:image/jpg;base64,' . base64_encode($logo);
$html = '<html>
			<head>
				<style>
					@page {
						margin: 320px 50px 100px 50px;
						border: 1px solid black;
					} 
					
					header {
						position: fixed;
						top:-280px;
						left: 0px;
						right: 0px;  
					} 

					footer {
						position: fixed;
						bottom: 0px;
						left: 0px;
						right: 0px;
					}

					.txtTicket{
			 			font-size:12px;
						font-family: sans-serif;
						text-transform: uppercase;  
					}

					table,td {
						border: 1px solid black;
						border-collapse: collapse;
					} 
				</style>
			</head>
			<body> 
				<header>
					<img src="' .$base64.'">
					<center>	
						<b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, A.C.</b>
						<br>
						<b>' . $info['majorName'] . ': ' . $info['subjectName'] . '</b><br>
						<b>ACTA DE CALIFICACIÓN FINAL</b><br>
					</center>	
					<br>
					<table class="txtTicket" width="100%">
						<tr>
							<td>Acuerdo: No.: </td>
							<td>' . $rov . ' de fecha ' . $fecharov . '</td>
						</tr>
						<tr>
							<td>Ciclo: </td>
							<td>' . $infoCo['scholarCicle'] . '</td>
						</tr>
						<tr>
							<td>Materia:</td>
							<td>' . $info['claveMateria'] . ' ' . $info['name'] . '</td>
						</tr>	
						<tr>
							<td>' . mb_strtoupper($infoCo['tipoCuatri']) . ':</td>
							<td>' . $info['semesId'] . '</td>
						</tr>
						<tr>
							<td>Grupo:</td>
							<td>' . $info['groupA'] . '</td>
						</tr>
						<tr>
							<td>Periodo:</td>
							<td>' . $info['initialDate'] . ' - ' . $info['finalDate'] . '</td>
						</tr> 
					</table>
				</header>
				<footer> 
				</footer> 
				<main>
					' . $main . '
				</main>
			</body> 
		</html>';
$mipdf = new DOMPDF();

# Definimos el tamaño y orientación del papel que queremos.
# O por defecto cogerá el que está en el fichero de configuración.
$mipdf->set_paper("A4", "");

# Cargamos el contenido HTML.
$mipdf->load_html($html);

# Renderizamos el documento PDF.
$mipdf->render();

# Enviamos el fichero PDF al navegador.
$mipdf->stream('ActaDeCalificaciones.pdf', array('Attachment' => 0));
