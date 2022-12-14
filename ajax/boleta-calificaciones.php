<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);

/* echo "<pre>";
print_r($_POST);
exit; */

$course->setCourseId($_POST['course']);
$infoCourse = $course->Info();
if($infoCourse['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semester';
if($infoCourse['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'quarter';
$minCal = 7;
if($infoCourse['majorId'] == 18)
    $minCal = 8;

$students = $_POST['students'];
if(count($students) > 1)
{
    foreach($students as $item)
    {
        $flag = true;
        $student->setUserId($item);
        $infoStudent = $student->GetInfo();
        $modules = $student->BoletaCalificacion($_POST['course'], $_POST['semester'], false);
        foreach($modules as $element)
        {
            if($element['calificacionValida'] == 'no')
                $flag = false;
        }
        if(!$flag)
        {
            echo "<script>
                    alert('No se pudo generar la boleta, no se han publicado todas las calificaciones...');
                    window.close();
                </script>";
            exit;
        }
        $qualificationsId = $student->SaveQualifications($_POST['course'], $_POST['semester'], $_POST['cycle'], $_POST['period'], $_POST['date'], $_POST['year'], $modules, $infoCourse, $_POST['notification']);
        echo "<script>
                alert('Las boletas se guardaron de manera correcta...');
                window.close();
            </script>";
    }
}
else
{
    $flag = true;
    $student->setUserId($students[0]);
    $infoStudent = $student->GetInfo();
    $modules = $student->BoletaCalificacion($_POST['course'], $_POST['semester'], true);
    foreach($modules as $item)
    {
        if($item['calificacionValida'] == 'no')
            $flag = false;
    }
    $qualificationsId = $student->SaveQualifications($_POST['course'], $_POST['semester'], $_POST['cycle'], $_POST['period'], $_POST['date'], $_POST['year'], $modules, $infoCourse, $_POST['notification']);
    $qualifications = $student->GetQualifications($qualificationsId);
    $target_path = DOC_ROOT . '/tmp/' . $qualifications['id'] . '.jpg';
    if (!file_exists($target_path))
        QRcode::png($qualifications['qr'], $target_path);
    /* echo "<pre>";
    print_r($modules);
    exit; */
    if(!$flag)
    {
        echo "<script>
                alert('No se pudo generar la boleta, no se han publicado todas las calificaciones...');
                window.close();
            </script>";
        exit;
    }
    $institution->setInstitutionId(1);
    $myInstitution = $institution->Info();
    $html_modules = "";
    $html_extra_modules = "";    
    $i = 1;
    foreach($modules as $item)
    {
        if($item['extra'] == 0)
        {
            $text_color = '';
            if($item['score'] < $minCal)
                $text_color = 'text-danger';
            $score = $item['score'];
            $score_txt = $util->num2letras($item['score']);
            if($score == 0) 
            {
                $score = 'NP';
                $score_txt = 'NO PRESENTÓ';
            }
            $html_modules .= "<tr>
                                <td class='text-center'>" . $i . "</td>
                                <td>" . mb_strtoupper($item['name']) . "</td>
                                <td class='text-center " . $text_color . "'>" . $score . "</td>
                                <td class='text-center " . $text_color . "' style='text-transform: uppercase;'><i>" . $score_txt . "</i></td>
                            </tr>";
            $i++;
        }
    }
    foreach($modules as $item)
    {
        if($item['extra'] == 1)
        {
            $text_color = '';
            if($item['score'] < $minCal)
            {
                $text_color = 'text-danger';
                $score = 'NA';
                $score_txt = 'NO APROBADO';
            }
            if($item['score'] >= $minCal)
            {
                $text_color = '';
                $score = 'A';
                $score_txt = 'APROBADO';
            }
            if($item['score'] == 0) 
            {
                $text_color = 'text-danger';
                $score = 'NP';
                $score_txt = 'NO PRESENTÓ';
            }
            $html_extra_modules .= "<tr>
                                <td class='text-center'>" . $i . "</td>
                                <td>" . mb_strtoupper($item['name']) . "</td>
                                <td class='text-center " . $text_color . "'>" . $score . "</td>
                                <td class='text-center " . $text_color . "' style='text-transform: uppercase;'><i>" . $score_txt . "</i></td>
                            </tr>";
            $i++;
        }
    }
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
                    <center>
                        <p>
                            <b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS</b><br>
                            Incorporada a la Secretaría de Educación Pública del Estado<br>
                            CLAVE: " . $myInstitution['identifier'] . "<br>
                            Libramiento Norte Pte. No. 2718, Col. Ladera de la Loma, Tuxtla Gutiérrez, Chiapas.
                        </p>
                        <p><b class='txtTicket'>BOLETA DE CALIFICACIONES</b></p>
                    </center><br>
                    <table align='center' width='100%' border='1' class='txtTicket'>
                        <tr>
                            <td class='text-center'><b>Nombre del Alumno:</b> </td>
                            <td colspan='2'>" . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "</td>
                            <td class='text-center'><b>Matrícula:</b> " . $student->GetMatricula($infoCourse['courseId']) . "</td>
                        </tr>
                        <tr>
                            <td class='text-center'><b>Posgrado:</b> </td>
                            <td colspan='2'>" . $infoCourse['majorName'] . " " . $infoCourse['name'] . "</td>
                            <td class='text-center'><b>Ciclo:</b> " . $_POST['cycle'] . "</td>
                        </tr>
                        <tr>
                            <td class='text-center' style='text-transform: capitalize;'><b>" . $infoCourse['tipoCuatri'] . ":</b></td>
                            <td> " . mb_strtoupper($util->num2order($_POST['semester'])) . "</td>
                            <td class='text-center'><b>Periodo:</b> " . mb_strtoupper($_POST['period']) . ' ' . $_POST['year'] . "</td>
                            <td class='text-center'><b>Grupo:</b> " . $infoCourse['group'] . "</td>
                        </tr>
                    </table>
                    <table align='center' width='100%' border='1' class='txtTicket'>
                        <tr>
                            <td rowspan='2' class='text-center'><b>No.</b></td>
                            <td rowspan='2' class='text-center'><b>Materias</b></td>
                            <td class='text-center'><b>Calificación</b></td>
                            <td class='text-center'><b>Calificación</b></td>
                        </tr>
                        <tr>
                            <td class='text-center'><b>En Número</b></td>
                            <td class='text-center'><b>En Letra</b></td>
                        </tr>
                        " . $html_modules . "
                    </table><br>
                    <table align='center' width='100%' border='1' class='txtTicket'>
                        <tr>
                            <td colspan='4' class='text-center'><b>ASIGNATURAS EXTRACURRICULARES (SIN CRÉDITOS)</b></td>
                        </tr>
                        <tr>
                            <td rowspan='2' class='text-center'><b>No.</b></td>
                            <td rowspan='2' class='text-center'><b>Materias</b></td>
                            <td class='text-center'><b>Calificación</b></td>
                            <td class='text-center'><b>Calificación</b></td>
                        </tr>
                        <tr>
                            <td class='text-center'><b>En Número</b></td>
                            <td class='text-center'><b>En Letra</b></td>
                        </tr>
                        " . $html_extra_modules . "
                    </table><br>
                    <center>
                        <p>Tuxtla Gutiérrez, Chiapas; " . mb_strtolower($util->FormatReadableDate($_POST['date'])) . ".</p>
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
	$mipdf = new DOMPDF();
	$mipdf ->set_paper("A4", "portrait");
	$mipdf ->load_html($html);
	$mipdf ->render();
	$mipdf ->stream('BoletaCalificaciones.pdf', array('Attachment' => 0));
    unlink($target_path);
}
?>
