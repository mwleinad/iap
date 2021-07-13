<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();

$course->setCourseId($_GET['co']);
$infoCourse = $course->Info();

$student->setUserId($_GET['al']);
$infoStudent = $student->GetInfo();
$modules = $student->BoletaCalificacion($_GET['co'], $_GET['cu'], false);

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/* echo "<pre>";
print_r($modules); 
exit; */

$html_modules = "";
$i = 1;
foreach($modules as $item)
{
    $html_modules .= "<tr>
                        <td class='text-center'>" . $i . "</td>
                        <td style='text-transform: capitalize;'>" . mb_strtolower($item['name']) . "</td>
                        <td class='text-center'>" . $item['score'] . "</td>
                        <td class='text-center' style='text-transform: uppercase;'><i>" . $util->num2letras($item['score']) . "</i></td>
                    </tr>";
    $i++;
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
		        </style>
	        </head>
	        <body>
		        <img src='" . DOC_ROOT . "/images/new/docs/doc_header.png' class='img-header'>
                <br><br><br><br><br><br><br>
		        <center>
                    <p>
                        <b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS</b><br>
                        Incorporada a la Secreatria de Educación Pública del Estado<br>
                        CLAVE: " . $myInstitution['identifier'] . "<br>
                        Libramiento Norte Pte. No. 2718, Col. Ladera de la Loma, Tuxtla Gutiérrez, Chiapas.
                    </p>
                    <p><b class='txtTicket'>BOLETA DE CALIFICACIONES</b></p>
                </center><br>
		        <table align='center' width='100%' border='1' class='txtTicket'>
                    <tr>
                        <td class='text-center'><b>Nombre del Alumno:</b> </td>
                        <td colspan='2' style='text-transform: capitalize;'>" . $infoStudent['names'] . " " . $infoStudent['lastNamePaterno'] . " " . $infoStudent['lastNameMaterno'] . "</td>
                        <td class='text-center'><b>Matrícula:</b> " . $student->GetMatricula($infoCourse['courseId']) . "</td>
                    </tr>
                    <tr>
                        <td class='text-center'><b>Posgrado:</b> </td>
                        <td colspan='2' style='text-transform: capitalize;'>" . mb_strtolower($infoCourse['majorName'] . " " . $infoCourse['name']) . "</td>
                        <td class='text-center'><b>Ciclo:</b> " . $infoCourse['scholarCicle'] . "</td>
                    </tr>
                    <tr>
                        <td class='text-center'><b>Cuatrimestre:</b></td>
                        <td> " . $util->num2order($_GET['cu']) . "</td>
                        <td class='text-center'><b>Periodo:</b> " . $util->DeterminePeriod($modules[0]['initialDate'], 'quarter') . "</td>
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
                <center>
                    <p>Tuxtla Gutiérrez, Chiapas; " . mb_strtolower($util->FormatReadableDate($_GET['fe'])) . ".</p>
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

                <img src='" . DOC_ROOT . "/images/new/docs/doc_footer.png' class='img-footer'>
	        </body>
	    </html>";
	//echo $html;
	//exit;
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
	$mipdf ->stream('BoletaCalificaciones.pdf', array('Attachment' => 0));
			


?>
