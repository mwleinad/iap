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

$optionPx = '250px';
$optionSize = '9pt';
$option = 'POR PROMEDIO';
$line = '<p><b>_______________________________________________________________________________________</b></p>';
if($_POST['opcionExamen'] == 'Tesis')
{
    $optionPx = '40px';
    $optionSize = '8pt';
    $option = '<label style="text-align: center; font-family: times;">TESIS DE GRADO: "' . mb_strtoupper($_POST['tesis']) . '"</label>';
    $line = '<p>&nbsp;</p>';
}
/* echo "<pre>";
print_r($infoCourse);
exit; */


$html .="<html>
	        <head>
	            <title>Acta de Examen</title>
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
                        width: 90px;
                        position: absolute;
                        top: 16px;
                        left: -65px;
                    }
                    #mignon {
                        width: 3cm;
                        position: absolute;
                        top: 240px;
                        left: 0px;
                    }
                    .bg-gray {
                        background-color: #dddddd;
                    }
                    @page {
                        margin: 1.5cm 3cm 0cm 3cm;
                    }
		        </style>
	        </head>
	        <body>
                <table width='100%'>
                    <tr>
                        <img src='" . DOC_ROOT . "/images/Escudo.jpg' id='mexico' />
                        <td width='10'>&nbsp;</td>
                        <td width='90'>
                            <span style='font-size: 6pt; position: absolute; left: 525px; top: -15px; width: 80px;'>AEG-16-" . str_replace('20', '', $array_date[0]) . "</span>
                            <p style='line-height: 17px; text-align: center; font-family: Times;'>
                                <label style='font-size: 13pt;'><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                                <label style='font-size: 13pt;'><b>SECRETARÍA DE EDUCACIÓN</b></label><br>
                                <label style='font-size: 13pt;'><b>SUBSECRETARÍA DE EDUCACIÓN ESTATAL</b></label><br>
                                <label style='font-size: 13pt;'><b>DIRECCIÓN DE EDUCACIÓN SUPERIOR</b></label><br>
                                <label style='font-size: 13pt;'><b>DEPARTAMENTO DE SERVICIOS ESCOLARES</b></label><br>
                                <label style='font-size: 8pt; font-family: sans-serif;'>RVOE: <b>" . $rvoe . "</b> ACUERDO NÚMERO VIGENTE: A PARTIR DEL <b>" . mb_strtoupper($util->FormatReadableDate($fechaRvoe)) . "</b></label><br>
                                <label style='font-size: 9pt; font-family: sans-serif;'>RÉGIMEN PARTICULAR</label>
                            </p>
                        </td>
                    </tr>
                </table><br><br>
                <label style='font-size: 9pt; position: absolute; left: 353px; top: 215px; width: 500px; font-weight: bold;'>
                    " . $_POST['noActa'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 500px; top: 215px; width: 500px; font-weight: bold;'>
                    " . $_POST['noAutorizacion'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 320px; top: 245px; width: 500px; font-weight: bold;'>
                    " . $myInstitution['ubication'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 273px; top: 276px; width: 500px; font-weight: bold;'>
                    " . $_POST['hora'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 475px; top: 276px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($util->num2letras($array_date[2])) . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 273px; top: 306px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($util->ConvertirMes(intval($array_date[1]))) . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 273px; top: 336px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($util->num2letras(str_replace('20', '', $array_date[0]))) . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 180px; top: 368px; width: 500px; font-weight: bold;'>
                    " . $_POST['ubicacion'] . "
                </label>
                <label style='font-size: 8pt; position: absolute; left: 180px; top: 398px; width: 500px; font-weight: bold;'>
                    " . $myInstitution['name_long'] . "
                </label>
                <table width='100%'>
                    <tr style='font-size: 9pt;'>
                        <img src='" . DOC_ROOT . "/images/new/docs/mignon.jpg' id='mignon' />
                        <td width='25%'>&nbsp;</td>
                        <td width='75%'>
                            <p>ACTA DE EXAMEN DE GRADO No. <b>____</b> AUTORIZACIÓN No. <b>_____________</b></p>
                            <p>EN LA CIUDAD DE <b>_________________________________________________</b></p>
                            <p>SIENDO LAS <b>____________________</b> HORAS DEL DÍA <b>___________________</b></p>
                            <p>DEL MES DE <b>______________________________________________________</b></p>
                            <p>DE DOS MIL <b>______________________________________________________</b></p>
                            <p>EN <b>______________________________________________________________</b></p>
                            <p>DEL <b>_____________________________________________________________</b></p>
                        </td>
                    </tr>
                </table>
                <label style='font-size: 9pt; position: absolute; left: 100px; top: 450px; width: 500px; font-weight: bold;'>
                    " . $myInstitution['identifier'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 285px; top: 450px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($infoCourse['turn']) . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 480px; top: 450px; width: 500px; font-weight: bold;'>
                    " . $modality . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 95px; top: 512px; width: 500px; font-weight: bold;'>
                    " . $_POST['nombrePresidente'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 95px; top: 542px; width: 500px; font-weight: bold;'>
                    " . $_POST['nombreSecretario'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 95px; top: 572px; width: 500px; font-weight: bold;'>
                    " . $_POST['nombreVocal'] . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 200px; top: 635px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 180px; top: 665px; width: 500px; font-weight: bold;'>
                    " . $student->GetMatricula($infoCourse['courseId']) . "
                </label>
                <label style='font-size: " . $optionSize . "; position: absolute; left: " . $optionPx . "; top: 696px; width: 500px; font-weight: bold;'>
                    " . $option . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 192px; top: 726px; width: 500px; font-weight: bold;'>
                    " . $title . " EN " . mb_strtoupper($infoCourse['name']) . "
                </label>
                <label style='font-size: 9pt; position: absolute; left: 265px; top: 832px; width: 500px; font-weight: bold;'>
                    APROBARLO
                </label>
                <label style='font-size: 8pt; position: absolute; left: 268px; top: 892px; width: 500px; font-weight: bold;'>
                    " . $title . " EN " . mb_strtoupper($infoCourse['name']) . "
                </label>
                <table width='100%'>
                    <tr>
                        <td style='font-size: 9pt;'>
                            <p style='text-align: justify;'>
                                CON CLAVE: <b>__________________</b> TURNO: <b>__________________</b> MODALIDAD: <b>___________________</b>
                            </p>
                            <p>SE REUNIÓ EL JURADO INTEGRADO POR LOS CC.</p>
                            <p><b>PRESIDENTE: __________________________________________________________________________</b></p>
                            <p><b>SECRETARIO: __________________________________________________________________________</b></p>
                            <p><b>VOCAL: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__________________________________________________________________________</b></p>
                            <p>PARA REALIZAR EL EXAMEN DE GRADO AL (A) C. SUSTENTANTE:</p>
                            <p><b>_______________________________________________________________________________________</b></p>
                            <p>CON NÚMERO DE CONTROL: <b>____________</b> A QUIEN SE EXAMINÓ CON BASE A LA OPCIÓN:</p>
                            " . $line . "
                            <p>PARA OBTENER EL GRADO DE: <b>___________________________________________________________</b></p>
                            <p style='text-align: justify;'>ACTO EFECTUADO DE ACUERDO A LAS NORMAS ESTABLECIDAS POR LA DIRECCIÓN DE EDUCACIÓN SUPERIOR DE LA SUBSECRETARÍA DE EDUCACIÓN ESTATAL, UNA VEZ CONCLUIDO EL EXAMEN, EL JURADO DELIBERÓ SOBRE LOS CONOCIMIENTOS Y APTITUDES DEMOSTRADAS Y DETERMINÓ:</p>
                            <p><b>_______________________________________________________________________________________</b></p>
                            <p style='text-align: justify;'>A CONTINUACIÓN EL PRESIDENTE DEL JURADO COMUNICÓ AL (A) C. SUSTENTANTE EL RESULTADO OBTENIDO Y LE TOMÓ PROTESTA DE LEY EN LOS TÉRMINOS SIGUIENTES: ¿PROTESTA USTED EJERCER EL GRADO DE <b>_______________________________________________</b></p>
                            <p style='text-align: justify;'>CON ENTUSIASMO Y HONRADEZ, VELAR SIEMPRE POR EL PRESTIGIO Y BUEN NOMBRE DEL INSTITUTO Y CONTINUAR ESFORZÁNDOSE POR MEJORAR SU PREPARACIÓN EN TODOS LOS ÓRDENES, PARA GARANTIZAR LOS INTERESES DEL PUEBLO Y DE LA PATRIA?</p><br><br>
                            <p style='text-align: center;'><b>¡SÍ PROTESTO!</b></p><br><br>
                            <p style='text-align: center;'><b>____________________________________________</b></p>
                            <p style='text-align: center;'><b>" . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "</b></p><br><br><br>
                            <p style='text-align: center; font-size: 7pt;'><b>SI ASÍ LO HICIERE, QUE LA SOCIEDAD Y LA NACIÓN SE LO PREMIEN Y SI NO, SE LO DEMANDEN</b></p>
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
