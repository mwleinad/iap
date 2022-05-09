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
/* echo "<pre>";
print_r($infoCourse);
exit; */

$verb = 'inscrita';
if($infoStudent['sexo'] == 'm')
    $verb = 'inscrito';

$subject = 'a la';
if($infoCourse['majorId'] == 18)
    $verb = 'a el';

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/**
 * $infoCourse
 * $infoStudent
 */
$date = explode('-', $_GET['date']);

$html .="<html>
            <head>
                <title>Constancia Sencilla</title>
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
                </style>
            </head>
            <body>
                <img src='" . DOC_ROOT . "/images/new/docs/doc_header.png' class='img-header'>
                <br><br><br><br><br><br><br>
                <p class='text-center' style='font-size: 10pt; color: #328A32;'>
                    <b>\"2022, CUMPLIMOS 45 AÑOS FORTALECIENDO LAS CAPACIDADES DE LOS SERVIDORES PÚBLICOS\"</b>
                </p>
                <p class='text-right'>
                    <b>DIRECCIÓN ACADÉMICA</b><br>
                    <b>CONSTANCIA No. IAP/DA/" . $_GET['consecutive'] . "/" . $array_date[0] . "</b><br>
                    Tuxtla Gutiérrez, Chiapas; " . mb_strtolower($util->FormatReadableDate($_GET['date'])) . "
                </p><br>
                <p><b>A QUIEN CORRESPONDA:</b></p><br>
                <p>
                    La que suscribe Directora Académica del Instituto de Administración Pública del Estado de Chiapas, hace constar que la:
                </p>
                <p class='text-center'><b>C. " . $infoStudent['names'] . " " . $infoStudent['lastNamePaterno'] . " " . $infoStudent['lastNameMaterno'] . "</b></p><br>
                <p>
                    Con número de matrícula <b>" . $student->GetMatricula($_GET['course']) . "</b> está " . $verb . " " . $subject . " <b>\"" . $infoCourse['majorName'] . " EN " . $infoCourse['name'] . "\"</b> modalidad " . $modality . " plan " . $typeCourse . ", generación " . $infoCourse['scholarCicle'] . ".
                </p>
                <p>
                    A petición de la parte interesada y para los usos legales que mejor convengan, se extiende la presente en la ciudad de Tuxtla Gutiérrez, Chiapas; a los " . $date[2] . " días del mes de " . mb_strtolower($util->GetMonthByKey(intval($date[1]))) . " del año " . mb_strtolower($util->num2letras($date[0])) . ".
                </p>
                <br><br>
                <p><b>ATENTAMENTE</b></p>
                <br><br>
                <p><b>LIC. " . mb_strtoupper($myInstitution['directorAcademico']) . "</b></p>
                <p>DIRECTORA ACADÉMICA</p>
                <br><br>
                <small>L*MNC/Archivominutario.</small>
                <img src='" . DOC_ROOT . "/images/new/docs/doc_footer.png' class='img-footer'>
            </body>
            </html>";
	/* echo $html;
	exit; */
	$mipdf = new DOMPDF();
	$mipdf ->set_paper("A4", "portrait");
	$mipdf ->load_html($html);
	$mipdf ->render();
	$mipdf ->stream('ConstanciaSencilla.pdf', array('Attachment' => 0));
?>
