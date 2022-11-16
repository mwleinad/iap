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

$testHistory = $test->getTestHistory($_POST['course'],$_POST['student']);
if($testHistory){
    $test->updateTestHistory($_POST['course'],$_POST['student'], $_POST['fecha'], $_POST['folio'],$_POST['noActa'],$_POST['noAutorizacion'],$_POST['hora'],$_POST['ubicacion'],$_POST['opcionExamen'],$_POST['tesis'],$_POST['nombrePresidente'],$_POST['nombreSecretario'],$_POST['nombreVocal'],$_POST['cedulaPresidente'],$_POST['cedulaSecretario'],$_POST['cedulaVocal']);
}else{
    //$date, $folio, $act, $auth, $hour, $location, $option, $tesis, $president, $secretary, $vocal, $presidentCedula, $secretaryCedula, $vocalCedula
    $test->addTestHistory($_POST['course'],$_POST['student'], $_POST['fecha'], $_POST['folio'],$_POST['noActa'],$_POST['noAutorizacion'],$_POST['hora'],$_POST['ubicacion'],$_POST['opcionExamen'],$_POST['tesis'],$_POST['nombrePresidente'],$_POST['nombreSecretario'],$_POST['nombreVocal'],$_POST['cedulaPresidente'],$_POST['cedulaSecretario'],$_POST['cedulaVocal']);
}
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
print_r($_POST);
exit; */
$settingCertificate = $certificates->getSettings();
$rector['name'] = mb_strtoupper($settingCertificate['rector']);
$rector['genre'] = $settingCertificate['genre_rector'] == 1 ? "RECTOR" : "RECTORA";
$schoolService['name'] = mb_strtoupper($settingCertificate['school_services']);
$schoolService['genre'] = $settingCertificate['genre_school'] == 1 ? "JEFE" : "JEFA";
$director['name'] = mb_strtoupper($settingCertificate['director_education']);
$director['genre'] = $settingCertificate['genre_director'] == 1 ? "DIRECTOR" : "DIRECTORA";
$head['name'] = mb_strtoupper($settingCertificate['head_office']);
$head['genre'] = $settingCertificate['genre_head'] == 1 ? "JEFE" : "JEFA";
$comparison['name'] = mb_strtoupper($settingCertificate['comparison']);

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
                    .wrapper-page {
                        page-break-after: always;
                    }
                    
                    .wrapper-page:last-child {
                        page-break-after: avoid;
                    }
		        </style>
	        </head>
	        <body>
                <table width='100%'>
                    <tr>
                        <img src='" . DOC_ROOT . "/images/Escudo.jpg' id='mexico' />
                        <td width='10'>&nbsp;</td>
                        <td width='90'>
                            <span style='font-size: 6pt; position: absolute; left: 525px; top: -15px; width: 80px;'>AEG-16-" . str_replace('20', '', date('Y')) . "</span>
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
                <label style='font-size: 9pt; position: absolute; left: 535px; top: 170px; width: 500px; font-weight: bold;'>
                    No. <span style='color: red;'>" . $_POST['folio'] . "</span>
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

                <div class='wrapper-page'>
                    <p style='font-size: 9pt; text-align: center;'>TERMINADO EL ACTO SE LEVANTA PARA CONSTANCIA LA PRESENTE ACTA</p>
                    <p style='font-size: 9pt; text-align: center;'>FIRMANDO DE CONFORMIDAD LOS INTEGRANTES DEL JURADO Y EL RECTOR DEL INSTITUTO QUE DA FE.</p><br>
                    <p style='font-size: 9pt; text-align: center;'><b>JURADO DEL EXAMEN</b></p>
                    <table width='100%'>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                <b>NOMBRE</b>
                                <br><br><br><br>
                                " . $_POST['nombrePresidente'] . "
                                ___________________________________
                                <br>
                                PRESIDENTE
                                <br><br>
                            </td>
                            <td style='width: 40%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                <b>FIRMA</b>
                                <br><br><br><br>
                                ___________________________________
                                <br>
                                CÉDULA PROFESIONAL No. " . $_POST['cedulaPresidente'] . "
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br>
                                " . $_POST['nombreSecretario'] . "
                                ___________________________________
                                <br>
                                SECRETARIO
                                <br><br>
                            </td>
                            <td style='width: 40%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br>
                                ___________________________________
                                <br>
                                CÉDULA PROFESIONAL No. " . $_POST['cedulaSecretario'] . "
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br>
                                " . $_POST['nombreVocal'] . "
                                ___________________________________
                                <br>
                                VOCAL
                                <br><br>
                            </td>
                            <td style='width: 40%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br>
                                ___________________________________
                                <br>
                                CÉDULA PROFESIONAL No. " . $_POST['cedulaVocal'] . "
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;' colspan='3'>
                                <br><br><br>
                                <b>{$rector['genre']}</b>
                                <br><br><br><br>
                                ___________________________________
                                <br>
                                {$rector['name']}
                                <br><br><br><br><br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                {$schoolService['genre']} DEL DEPARTAMENTO DE SERVICIOS ESCOLARES 
                                <br><br><br><br>
                                ___________________________________
                                <br>
                                {$schoolService['name']}
                            </td>
                            <td style='width: 40%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                {$director['genre']} DE EDUCACIÓN SUPERIOR
                                <br><br><br><br>
                                ___________________________________
                                <br>
                                {$director['name']}
                            </td>
                        </tr>
                    </table>
                    <br><br><br><br><br>
                    <table width='100%'>
                        <tr style='border-spacing: 0px !important;'>
                            <td style='width: 40%;'>
                                <table align='center' border='1' class='border'>
                                    <tr>
                                        <td class='text-center bg-gray border' style='font-size: 7pt;'>
                                            REGISTRADO EN EL DEPARTAMENTO DE SERVICIOS ESCOLARES
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='border'>
                                            <p style='text-align: left; font-size: 7pt;'>
                                                NO. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;___________________________________<br>
                                                LIBRO. &nbsp;___________________________________<br>
                                                FOJA. &nbsp;&nbsp;&nbsp;___________________________________<br>
                                                FECHA. ___________________________________<br>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center bg-gray border' style='font-size: 7pt;'>
                                            COTEJÓ
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='border' style='text-align: center;'>
                                            <br><br><br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center bg-gray border' style='font-size: 7pt;'>{$head['genre']} DE LA OFICINA</td>
                                    </tr>
                                    <tr>
                                        <td class='border' style='text-align: center;'>
                                            <br><br><br>
                                            <span style='font-size: 6pt;'>
                                                {$head['name']}
                                            </span>
                                        </td>
                                    </tr>
                                </table>                        
                            </td>
                            <td style='width: 60%; padding-left: 20px;'>
                                <p style='font-size: 7pt; text-align: justify;'>
                                    CON FUNDAMENTO EN EL ARTÍCULO 29, FRACCIÓN X DE LA LEY ÓRGANICA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, 27 FRACCIÓN XX DEL REGLAMENTO INTERIOR DE LA SECRETARÍA GENERAL DE GOBIERNO.
                                </p>
                                <p style='font-size: 7pt; text-align: justify;'>
                                    SE LEGALIZA, PREVIO COTEJO CON LA EXISTENTE EN EL CONTROL RESPECTIVO, LA FIRMA QUE ANTECEDE CORRESPONDE A LA DIRECTORA DE EDUCACIÓN SUPERIOR:
                                </p>
                                <p style='font-size: 7pt; text-align: center;'>
                                    MTRA. XÓCHITL CLEMENTE PARRA<br>
                                    _____________________________________________________________
                                </p>
                                <p style='font-size: 7pt; text-align: center;'>
                                    TUXTLA GUTIÉRREZ, CHIAPAS A: _________________________________ 
                                </p>
                                <p style='font-size: 7pt; text-align: center;'>
                                    COORDINADORA DE ASUNTOS JURÍDICOS DE GOBIERNO
                                </p><br>
                                <p style='font-size: 7pt; text-align: center;'>
                                    MARÍA GUADALUPE SÁNCHEZ ZENTENO
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p style='font-size: 6pt; text-align: center;'><b>Este documento no es válido si presenta raspaduras o enmendaduras</b></p>
                </div>
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
