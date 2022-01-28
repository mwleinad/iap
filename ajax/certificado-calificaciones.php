<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);

$course->setCourseId($_GET['co']);
$infoCourse = $course->Info();
if($infoCourse['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semester';
if($infoCourse['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'quarter';
$minCal = 7;
if($infoCourse['majorId'] == 18)
    $minCal = 8;

$student->setUserId($_GET['al']);
$infoStudent = $student->GetInfo();
$modules = $student->BoletaCalificacion($_GET['co'], $_GET['cu'], false);

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/* echo "<pre>";
print_r($infoCourse); 
exit; */

$html_modules = "";
$i = 1;
foreach($modules as $item)
{
    $text_color = '';
    if($item['score'] < $minCal)
        $text_color = 'text-danger';
    $html_modules .= "";
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
                        top: 0px;
                        left: 0px;
                    }
                    .bg-gray {
                        background-color: #dddddd;
                    }
		        </style>
	        </head>
	        <body>
		        <center>
                    <img src='" . DOC_ROOT . "/images/Escudo.jpg' id='mexico' />
                    <p style='line-height: 14px;'><label style='font-size: 12pt;'><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                    <label style='font-size: 10pt;'>SECRETARÍA DE EDUCACIÓN</label><br>
                    <label style='font-size: 8pt;'>SUBSECRETARÍA DE EDUCACIÓN ESTATAL</label><br>
                    <label style='font-size: 8pt;'>DIRECCIÓN DE EDUCACIÓN SUPERIOR</label><br>
                    <label style='font-size: 8pt;'>DEPARTAMENTO DE SERVICIOS ESCOLARES</label></p>
                </center>
                <p style='font-size: 8pt;'>LA DIRECCIÓN DEL INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, RÉGIMEN PARTICULAR, TURNO ___ MODALIDAD ___, CLAVE " . $myInstitution['identifier'] . ", CERTIFICA QUE:<br>
                EL (LA) C. " . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "<br>
                CON No. DE CONTROL: " . $student->GetMatricula($infoCourse['courseId']) . " ACREDITÓ LAS MATERIAS QUE INTEGRAN EL PLAN DE ESTUDIOS DE LA " . $infoCourse['majorName'] . " EN:</p>
                <p>" . $infoCourse['name'] . "</p>
                <p style='font-size: 8pt;'>ACUERDO NÚMERO: ______, VIGENTE A PARTIR DEL _______, DURANTE EL PERIODO:</p>
                <table align='center' width='100%' border='1' style='font-size: 5pt;' class='border'>
                    <tr>
                        <td class='text-center border' rowspan='2'>MATERIAS</td>
                        <td class='text-center border' colspan='2'>CALIFICACIÓN</td>
                        <td class='text-center border' rowspan='2'>OBSERVACIÓN</td>
                        <td class='text-center border' rowspan='2'>MATERIAS</td>
                        <td class='text-center border' colspan='2'>CALIFICACIÓN</td>
                        <td class='text-center border' rowspan='2'>OBSERVACIÓN</td>
                    </tr>
                    <tr>
                        <td class='text-center border'>Cifra</td>
                        <td class='text-center border'>Letra</td>
                        <td class='text-center border'>Cifra</td>
                        <td class='text-center border'>Letra</td>
                    </tr>
			    </table>
                <p style='font-size: 8pt;'>La escala oficial de calificaciones es de ______, considerando como mínima aprobatoria ______. Este certificado ampara ______ materias del plan de estudios vigente y en cumplimiento a las prescripciones legales, se expide en Tuxtla Gutiérrez, Chiapas a los ______.</p>
                <table width='100%'>
                    <tr>
                        <td>
                            <table align='center' border='1' style='font-size: 5pt;' class='border'>
                                <tr>
                                    <td class='text-center bg-gray border'>DEPARTAMENTO DE SERVICIOS ESCOLARES</td>
                                </tr>
                                <tr>
                                    <td class='border'>
                                        <p style='text-align: right'>
                                            NO. ____________________________________<br>
                                            LIBRO. ____________________________________<br>
                                            FOJA. ____________________________________<br>
                                            FECHA. ____________________________________<br>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class='text-center bg-gray border'>COTEJÓ</td>
                                </tr>
                                <tr>
                                    <td class='border'>
                                        <p><br><br><br></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class='text-center bg-gray border'>JEFE DE LA OFICINA</td>
                                </tr>
                                <tr>
                                    <td class='border'>
                                        <p><br><br></p>
                                    </td>
                                </tr>
                            </table>                        
                        </td>
                        <td>
                            <p style='font-size: 5pt;'>
                                POR ACUERDO DEL SECRETARIO GENERAL DE GOBIERNO Y CON FUNDAMENTO EN EL ARTÍCULO 29, FRACCIÓN X DE LA LEY ORGÁNICA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS.
                            </p>
                            <p style='font-size: 5pt;'>
                                SE <br>LAGALIZA,</br> PREVIO COTEJO CON LA EXISTENTE EN EL CONTROL RESPECTIVO, LA FIRMA QUE ANTECEDE CORRESPONDIENTE AL DIRECTOR DE EDUCACIÓN SUPERIOR:
                            </p>
                        </td>
                    </tr>
                </table>
                <p style='font-size: 6pt; text-align: center;'><b>ESTE DOCUMENTO NO ES VÁLIDO SI PRESENTA RASPADURAS O ENMENDADURAS</b></p>





		        <table align='center' width='100%' border='1' class='txtTicket'>
                    <tr>
                        <td class='text-center'><b>Nombre del Alumno:</b> </td>
                        <td colspan='2'></td>
                        <td class='text-center'><b>Matrícula:</b></td>
                    </tr>
                    <tr>
                        <td class='text-center'><b>Ciclo:</b> " . $_GET['ci'] . "</td>
                    </tr>
                    <tr>
                        <td class='text-center' style='text-transform: capitalize;'><b>" . $infoCourse['tipoCuatri'] . ":</b></td>
                        <td> " . $util->num2order($_GET['cu']) . "</td>
                        <td class='text-center'><b>Periodo:</b> " . $_GET['pe'] . ' ' . $_GET['year'] . "</td>
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
	$mipdf ->stream('BoletaCalificaciones.pdf', array('Attachment' => 0));
			


?>
