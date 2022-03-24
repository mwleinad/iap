<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);

$array_date = explode('-', $_POST['fecha']);
$course->setCourseId($_POST['course']);
$infoCourse = $course->Info();
// Tipo de Curso
if($infoCourse['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semester';
if($infoCourse['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'quarter';
// Calificacion Minima Aprobatoria
$title = 'MAESTRO';
if($infoCourse['majorId'] == 18)
    $title = 'DOCTOR';
// Modalidad y RVOE
if($infoCourse['modality'] == 'Online')
{
    $modality = 'NO ESCOLAR';
    $rvoe = $infoCourse['rvoeLinea'];
    $fechaRvoe = $infoCourse['fechaRvoeLinea'];
}
if($infoCourse['modality'] == 'Local')
{
    $modality = 'ESCOLAR';
    $rvoe = $infoCourse['rvoe'];
    $fechaRvoe = $infoCourse['fechaRvoe'];
}

$student->setUserId($_POST['student']);
$infoStudent = $student->GetInfo();

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/* echo "<pre>";
print_r($infoCourse);
exit; */


$html .="<html>
	        <head>
	            <title>Certificado</title>
	            <style type='text/css'>
                    body {
                        font-family: sans-serif;
                    }
	                .txtTicket {
			            font-size: 9pt;
			            font-family: sans-serif;
			            /*font:bold 12px 'Trebuchet MS';*/ 
		            }
		            table.border,td.border {
		                border: 1px solid black;
		                border-collapse: collapse;
	                }
		            table.border,td.border {
		                border: 1px solid black;
		                border-collapse: collapse;
	                }
	                .line {
		                border-bottom: 1px solid; border-left: 0px; border-right: 0px;	
	                }
                    .text-center {
                        text-align: center;
                    }
                    .text-danger {
                        color: red;
                    }
                    #mexico {
                        width: 80px;
                        position: absolute;
                        top: 16px;
                        left: 20px;
                    }
                    .bg-gray {
                        background-color: #dddddd;
                    }
		        </style>
	        </head>
	        <body>
                <table width='100%''>
                    <tr>
                        <img src='" . DOC_ROOT . "/images/Escudo.jpg' id='mexico' />
                        <td width='20'>
                        </td>
                        <td width='80'>
                            <span style='font-size: 6pt; position: absolute; left: 645px; top: -15px; width: 80px;'>SE-CEIAP-" . $array_date[0] . "</span>
                            <p style='line-height: 14px; text-align: center;'>
                                <label style='font-size: 14pt;'><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                                <label style='font-size: 12pt;'>SECRETARÍA DE EDUCACIÓN</label><br>
                                <label style='font-size: 10pt;'>SUBSECRETARÍA DE EDUCACIÓN ESTATAL</label><br>
                                <label style='font-size: 10pt;'>DIRECCIÓN DE EDUCACIÓN SUPERIOR</label><br>
                                <label style='font-size: 10pt;'>DEPARTAMENTO DE SERVICIOS ESCOLARES</label><br>
                                <label style='font-size: 7pt;'>RVOE: <b>" . $rvoe . "</b> ACUERDO NÚMERO VIGENTE: A PARTIR DEL <b>" . mb_strtoupper($util->FormatReadableDate($fechaRvoe)) . "</b></label><br>
                                <label style='font-size: 9pt;'>RÉGIMEN PARTICULAR</label>
                            </p>
                            <p style='font-size: 8pt;'>ACTA DE EXAMEN DE GRADO No. <b></b> AUTORIZACIÓN No. <b></b></p>
                            <p style='font-size: 8pt;'>EN LA CIUDAD DE <b>" . $myInstitution['ubication'] . "</b></p>
                            <p style='font-size: 8pt;'>SIENDO LAS <b></b> HORAS DEL DÍA <b>" . mb_strtoupper($util->num2letras($array_date[0])) . "</b></p>
                            <p style='font-size: 8pt;'>DEL MES DE <b>" . mb_strtoupper($util->ConvertirMes(intval($array_date[1]))) . "</b></p>
                            <p style='font-size: 8pt;'>DE DOS MIL <b>" . mb_strtoupper($util->num2letras(str_replace('20', '', $array_date[2]))) . "</b></p>
                            <p style='font-size: 8pt;'>EN <b></b></p>
                            <p style='font-size: 8pt;'>DEL <b>" . $myInstitution['name_long'] . "</b></p>
                            <p style='font-size: 8pt; text-align: justify;'>
                                CON CLAVE: <b>" . $myInstitution['identifier'] . "</b> TURNO: <b>" . mb_strtoupper($infoCourse['turn']) . "</b> MODALIDAD: <b>" . $modality . "</b>
                            </p>
                            <p>SE REUNIÓ EL JURADO INTEGRADO POR LOS CC.</p>
                            <p><b>PRESIDENTE:</b></p>
                            <p><b>SECRETARIO:</b></p>
                            <p><b>VOCAL:</b></p>
                            <p>PARA REALIZAR EL EXAMEN DE GRADO AL (A) C. SUSTENTANTE:</p>
                            <p>" . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "</p>
                            <p>CON NÚMERO DE CONTROL: <b>" . $student->GetMatricula($infoCourse['courseId']) . "</b> A QUIEN SE EXAMINÓ CON BASE A LA OPCIÓN:</p>

                            <p>PARA OBTENER EL GRADO DE: " . $title . " EN " . mb_strtoupper($infoCourse['name']) . "</p>
                            <p>ACTO EFECTUADO DE ACUERDO A LAS NORMAS ESTABLECIDAS POR LA DIRECCIÓN DE EDUCACIÓN SUPERIOR DE LA SUBSECRETARÍA DE EDUCACIÓN ESTATAL, UNA VEZ CONCLUIDO EL EXAMEN, EL JURADO DELIBERÓ SOBRE LOS CONOCIMIENTOS Y APTITUDES DEMOSTRADAS Y DETERMINÓ:</p>
                        </td>
                    </tr>
                </table>
	        </body>
	    </html>";
	/* echo $html;
	exit; */
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	$mipdf ->set_paper("Legal", "portrait");
	# Cargamos el contenido HTML.
	$mipdf ->load_html($html);
	# Renderizamos el documento PDF.
	$mipdf ->render();
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('ActaExamen.pdf', array('Attachment' => 0));
?>
