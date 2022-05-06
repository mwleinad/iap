<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);

$array_date = explode('-', $_GET['date']);
$total_modules = 0;
$course->setCourseId($_GET['course']);
$infoCourse = $course->Info();
// Tipo de Curso
if($infoCourse['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semestral';
if($infoCourse['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'cuatrimestral';

// Modalidad y RVOE
if($infoCourse['modality'] == 'Online')
{
    $modality = 'no escolar';
    $rvoe = $infoCourse['rvoeLinea'];
    $fechaRvoe = $infoCourse['fechaRvoeLinea'];
}
if($infoCourse['modality'] == 'Local')
{
    $modality = 'escolar';
    $rvoe = $infoCourse['rvoe'];
    $fechaRvoe = $infoCourse['fechaRvoe'];
}

$student->setUserId($_GET['student']);
$infoStudent = $student->GetInfo();

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/**
 * $infoCourse
 * $infoStudent
 */

$html .="<html>
            <head>
                <title>Boleta de Calificaciones</title>
                <style type='text/css'>
                    body {
                        font-family: sans-serif;
                    }
                    .txtTicket {
                        font-size: 9pt;
                        font-family: sans-serif;
                        /*font:bold 12px 'Trebuchet MS';*/ 
                    }
                    table,td {
                        border: 1px solid black;
                        border-collapse: collapse;
                    }
                    table,td {
                        border: 1px solid black;
                        border-collapse: collapse;
                    }
                    .line {
                        border-bottom: 1px solid; border-left: 0px; border-right: 0px;	
                    }
                    .text-center {
                        text-align: center;
                    }
                    .text-right {
                        text-align: right;
                    }
                    .img-header {
                        width: 790px;
                        position: fixed;
                        top: -40px;
                        left: -50px;
                        right: 0px;
                    }
                    .img-footer {
                        width: 790px;
                        position: fixed;
                        bottom: 20px;
                        left: -50px;
                        right: 0px;
                    }
                    .text-danger {
                        color: red;
                    }
                    #qr {
                        width: 120px;
                        position: fixed;
                        bottom: 200px;
                        right: 20px;
                    }
                    #signature {
                        width: 230px;
                        position: fixed;
                        bottom: 390px;
                        right: 210px;
                    }
                </style>
            </head>
            <body>
                <img src='" . DOC_ROOT . "/images/new/docs/doc_header.png' class='img-header'>
                <br><br><br><br><br><br><br>
                <p class='text-center' style='font-size: 10pt; color: #328A32;'>
                    <b>\"2022, CUMPLIMOS 45 AÑOS FORTALECIENDO LAS CAPACIDADES DE LOS SERVIDORES PÚBLICOS\"</b>
                </p>
                <p class='text-right'>
                    <b>SECRETARÍA ACADÉMICA/DIRECCIÓN ACADÉMICA</b><br>
                    <b>CONSTANCIA No. IAP/DA/" . $_GET['consecutive'] . "/" . $array_date[0] . "</b><br>
                    Tuxtla Gutiérrez, Chiapas;
                </p><br>
                <p><b>A QUIEN CORRESPONDA:</b></p><br>
                <p>
                    La que suscribe Directora Académica del Instituto de Administración Pública del Estado de Chiapas, hace constar que la:
                </p>
                <p>
                    Con número de matrícula está inscrita a la \"\" modalidad plan, generación.
                </p>
                <center>
                    <p>Tuxtla Gutiérrez, Chiapas; " . mb_strtolower($util->FormatReadableDate($qualification['date'])) . ".</p>
                </center><br><br>
                <center>
                    <p>ATENTAMENTE</p>
                </center><br><br>
                <center>
                    <p>
                        " . $myInstitution['directorAcademico'] . "<br>
                        <b>DIRECTORA ACADÉMICA</b>
                    </p>
                </center>
                <img src='" . DOC_ROOT . "/images/new/docs/signature_agcc.png' id='signature'>
                <img src='" . $target_path . "' id='qr'>
                <img src='" . DOC_ROOT . "/images/new/docs/doc_footer.png' class='img-footer'>
            </body>
            </html>";
	/* echo $html;
	exit; */
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	 
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	$mipdf ->set_paper("A4", "portrait");
	 
	# Cargamos el contenido HTML.
	$mipdf ->load_html($html);
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('Certificado.pdf', array('Attachment' => 0));
			


?>
