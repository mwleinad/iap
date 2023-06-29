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
$html = "<html>
<head>
    <title>Acta de Examen</title>
    <style type='text/css'>
        body {
            font-family: sans-serif;
            width:100%;
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
            width: 100px;
            position: absolute;
            top: 16px;
            left: 0px;
        }
        #mignon {
            width: 3.5cm;
            height: 5cm;
            position: absolute;
            top: 200px;
            left: 0px;
        }
        .bg-gray {
            background-color: #dddddd;
        }
        @page {
            margin: 1.5cm 1.5cm 0cm 1.5cm;
        }
        .wrapper-page {
            page-break-after: always;
        }
        
        .wrapper-page:last-child {
            page-break-after: avoid;
        }
    </style>
</head>
<body>";
$optionPx = '325px';
$optionSize = '9pt';
$option = 'POR PROMEDIO';
$line = '<p><b>________________________________________________________________________________________________________</b></p>';
if($_POST['opcionExamen'] == 'Tesis')
{
    $optionPx = '40px';
    $optionSize = '8pt';
    $option = '<label style="text-align: center; font-family: times;">TESIS DE GRADO: "' . mb_strtoupper($_POST['tesis']) . '"</label>';
    $line = '<p>&nbsp;</p>';
}
$institution->setInstitutionId(1);
$myInstitution = $institution->Info(); 
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
$coordinator['name'] = mb_strtoupper($settingCertificate['coordinator']);
$coordinator['genre'] = $settingCertificate['genre_coordinator'] == 1 ? "COORDINADOR" : "COORDINADORA";

if ($_POST['student'] == 0) {
    $group->setCourseId($_POST['course']);
    $students = $group->DefaultGroup();
}else{
    $students[0]['userId'] = $_POST['student'];
}
foreach ($students as $item) {
    $student->setUserId($item['userId']);
    $infoStudent = $student->GetInfo();
    $testHistory = $test->getTestHistory($_POST['course'],$item['userId']);
    if($testHistory){
        $test->updateTestHistory($_POST['course'], $item['userId'], $_POST['fecha'], $_POST['folio'],$_POST['noActa'],$_POST['noAutorizacion'],$_POST['hora'],$_POST['ubicacion'],$_POST['opcionExamen'],$_POST['tesis'],$_POST['nombrePresidente'],$_POST['nombreSecretario'],$_POST['nombreVocal'],$_POST['cedulaPresidente'],$_POST['cedulaSecretario'],$_POST['cedulaVocal'], $_POST['nombreJefe']);
    }else{
        //$date, $folio, $act, $auth, $hour, $location, $option, $tesis, $president, $secretary, $vocal, $presidentCedula, $secretaryCedula, $vocalCedula
        $test->addTestHistory($_POST['course'], $item['userId'], $_POST['fecha'], $_POST['folio'],$_POST['noActa'],$_POST['noAutorizacion'],$_POST['hora'],$_POST['ubicacion'],$_POST['opcionExamen'],$_POST['tesis'],$_POST['nombrePresidente'],$_POST['nombreSecretario'],$_POST['nombreVocal'],$_POST['cedulaPresidente'],$_POST['cedulaSecretario'],$_POST['cedulaVocal'],$_POST['nombreJefe']);
    }
    $curriculaNombre = " EN ".str_replace("EN", "", mb_strtoupper($infoCourse['name']));
    $html.="<div>
                <table width='100%'>
                    <tr>
                        <img src='" . DOC_ROOT . "/images/Escudo.jpg' id='mexico' />
                        <td width='10%'>&nbsp;</td>
                        <td width='90%'>
                            <span style='font-size: 12pt; position: absolute; right: 40px; top: -15px;'>AEG-16-" . str_replace('20', '', date('Y')) . "</span>
                            <p style='line-height: 20px; text-align: center; font-family: Times;'>
                                <label style='font-size: 15pt;'><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                                <label style='font-size: 15pt;'><b>SECRETARÍA DE EDUCACIÓN</b></label><br>
                                <label style='font-size: 14pt;'><b>SUBSECRETARÍA DE EDUCACIÓN ESTATAL</b></label><br>
                                <label style='font-size: 14pt;'><b>DIRECCIÓN DE EDUCACIÓN SUPERIOR</b></label><br>
                                <label style='font-size: 13pt;'><b>DEPARTAMENTO DE SERVICIOS ESCOLARES</b></label><br>
                                <label style='font-size: 8pt; font-family: sans-serif;'>RVOE: <b> ACUERDO NÚMERO " . $rvoe . "</b> VIGENTE: A PARTIR DEL <b>" . mb_strtoupper($util->FormatReadableDate($fechaRvoe)) . "</b></label><br>
                                <label style='font-size: 9pt; font-family: sans-serif;'>RÉGIMEN PARTICULAR</label>
                            </p>
                        </td>
                    </tr>
                </table><br>
                <div style='font-size: 9pt; position: absolute; left: 385px; top: 215px; width: 500px; font-weight: bold;'>
                    " . $_POST['noActa'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 560px; top: 215px; width: 500px; font-weight: bold;'>
                    " . $_POST['noAutorizacion'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 320px; top: 245px; width: 500px; font-weight: bold;'>
                    " . $myInstitution['ubication'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 285px; top: 276px; width: 500px; font-weight: bold;'>
                    " . $_POST['hora'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 550px; top: 276px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($util->num2letras($array_date[2])) . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 285px; top: 306px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($util->ConvertirMes(intval($array_date[1]))) . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 285px; top: 336px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($util->num2letras(str_replace('20', '', $array_date[0]))) . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 210px; top: 368px; width: 500px; font-weight: bold;'>
                    " . $_POST['ubicacion'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 210px; top: 398px; width: 500px; font-weight: bold;'>
                    " . $myInstitution['name_long'] . "
                </div>
                <div style='font-size: 10pt; position: absolute; left: 650px; top: 170px; width: 500px; font-weight: bold;'>
                    No. <span style='color: red;'>" . $_POST['folio'] . "</span>
                </div>
                <table width='100%'>
                    <tr style='font-size: 9pt;'>
                        <img src='" . DOC_ROOT . "/images/new/docs/mignon.jpg' id='mignon' />
                        <td width='23%'>&nbsp;</td>
                        <td width='72%'>
                            <p>ACTA DE EXAMEN DE GRADO No. <b>_______</b> AUTORIZACIÓN No. <b>________________________</b></p>
                            <p>EN LA CIUDAD DE &nbsp;&nbsp; <b>_____________________________________________________________</b></p>
                            <p>SIENDO LAS &nbsp;&nbsp; <b>________________________</b> &nbsp; HORAS DEL DÍA &nbsp;&nbsp; <b>________________________</b></p>
                            <p>DEL MES DE &nbsp;&nbsp; <b>_________________________________________________________________</b></p>
                            <p>DE DOS MIL &nbsp;&nbsp; <b>__________________________________________________________________</b></p>
                            <p>EN &nbsp;&nbsp;&nbsp;&nbsp; <b>_________________________________________________________________________</b></p>
                            <p>DEL &nbsp;&nbsp; <b>_________________________________________________________________________</b></p>
                        </td>
                    </tr>
                </table>
                <div style='font-size: 9pt; position: absolute; left: 100px; top: 450px; width: 500px; font-weight: bold;'>
                    " . $myInstitution['identifier'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 300px; top: 450px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($infoCourse['turn']) . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 550px; top: 450px; width: 500px; font-weight: bold;'>
                    " . $modality . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 95px; top: 512px; width: 500px; font-weight: bold;'>
                    " . $_POST['nombrePresidente'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 95px; top: 542px; width: 500px; font-weight: bold;'>
                    " . $_POST['nombreSecretario'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 95px; top: 572px; width: 500px; font-weight: bold;'>
                    " . $_POST['nombreVocal'] . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 230px; top: 635px; width: 500px; font-weight: bold;'>
                    " . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 180px; top: 665px; width: 500px; font-weight: bold;'>
                    " . $student->GetMatricula($infoCourse['courseId']) . "
                </div>
                <div style='font-size: " . $optionSize . "; position: absolute; left: 0px; top: 696px; width: 100%; font-weight: bold; text-align:center'>
                    " . $option . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 0px; top: 729px; width: 100%; font-weight: bold; text-align:center;'>
                &nbsp;&nbsp;&nbsp;" . $title . $curriculaNombre . "
                </div>
                <div style='font-size: 9pt; position: absolute; left: 0px; top: 840px; width: 100%; font-weight: bold; text-align:center;'>
                APROBARLO
                </div>
                <div style='font-size: 9pt; position: absolute; left: 0px; top: 930px; width: 100%; font-weight: bold; text-align:center;'>
                &nbsp;&nbsp;&nbsp;" . $title . $curriculaNombre . "
                </div>
                <table width='100%'>
                    <tr>
                        <td style='font-size: 9pt;'>
                            <p style='text-align: justify;'>
                                CON CLAVE: <b>______________________</b> &nbsp;&nbsp;&nbsp;TURNO: <b>_______________________</b> &nbsp;&nbsp;&nbsp;MODALIDAD: <b>________________________</b>
                            </p>
                            <p>SE REUNIÓ EL JURADO INTEGRADO POR LOS CC.</p>
                            <p><b>PRESIDENTE: ___________________________________________________________________________________________</b></p>
                            <p><b>SECRETARIO: ___________________________________________________________________________________________</b></p>
                            <p><b>VOCAL: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;____________________________________________________________________________________________</b></p>
                            <p>PARA REALIZAR EL EXAMEN DE GRADO AL (A) C. SUSTENTANTE:</p>
                            <p><b>________________________________________________________________________________________________________</b></p>
                            <p>CON NÚMERO DE CONTROL: <b>__________________</b> A QUIEN SE EXAMINÓ CON BASE A LA OPCIÓN:</p>
                            " . $line . "
                            <p>PARA OBTENER EL GRADO DE: <b>____________________________________________________________________________</b></p>
                            <p style='text-align: justify; line-height:16pt;'>ACTO EFECTUADO DE ACUERDO A LAS NORMAS ESTABLECIDAS POR LA DIRECCIÓN DE EDUCACIÓN SUPERIOR DE LA SUBSECRETARÍA DE EDUCACIÓN ESTATAL, UNA VEZ CONCLUIDO EL EXAMEN, EL JURADO DELIBERÓ SOBRE LOS CONOCIMIENTOS Y APTITUDES DEMOSTRADAS Y DETERMINÓ:</p>
                            ".$line."
                            <p style='text-align: justify; line-height:16pt;'>A CONTINUACIÓN EL PRESIDENTE DEL JURADO COMUNICÓ AL (A) C. SUSTENTANTE EL RESULTADO OBTENIDO Y LE TOMÓ PROTESTA DE LEY EN LOS TÉRMINOS SIGUIENTES: ¿PROTESTA USTED EJERCER EL GRADO DE".$line."</p>
                            <p style='text-align: justify; line-height:16pt;'>CON ENTUSIASMO Y HONRADEZ, VELAR SIEMPRE POR EL PRESTIGIO Y BUEN NOMBRE DEL INSTITUTO Y CONTINUAR ESFORZÁNDOSE POR MEJORAR SU PREPARACIÓN EN TODOS LOS ÓRDENES, PARA GARANTIZAR LOS INTERESES DEL PUEBLO Y DE LA PATRIA?</p><br>
                            <p style='text-align: center;'><b>¡SÍ PROTESTO!</b></p><br>
                            <p style='text-align: center;'><b>____________________________________________</b></p>
                            <p style='text-align: center;'><b>" . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "</b></p><br>
                            <p style='text-align: center;'><b>SI ASÍ LO HICIERE, QUE LA SOCIEDAD Y LA NACIÓN SE LO PREMIEN Y SI NO, SE LO DEMANDEN</b></p>
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
                                _________________________________________________
                                <br>
                                PRESIDENTE
                                <br><br>
                            </td>
                            <td style='width: 10%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                <b>FIRMA</b>
                                <br><br><br><br><br>
                                _____________________________________________
                                <br>
                                CÉDULA PROFESIONAL No. " . $_POST['cedulaPresidente'] . "
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br>
                                " . $_POST['nombreSecretario'] . "
                                __________________________________________________
                                <br>
                                SECRETARIO
                                <br><br>
                            </td>
                            <td style='width: 10%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br><br>
                                ______________________________________________
                                <br>
                                CÉDULA PROFESIONAL No. " . $_POST['cedulaSecretario'] . "
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br>
                                " . $_POST['nombreVocal'] . "
                                _________________________________________________
                                <br>
                                VOCAL
                                <br><br>
                            </td>
                            <td style='width: 10%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                <br><br><br><br>
                                _____________________________________________
                                <br>
                                CÉDULA PROFESIONAL No. " . $_POST['cedulaVocal'] . "
                                <br><br>
                            </td>
                        </tr> 
                    </table>
                    <table style='width:100%; text-align:center;'>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;' colspan='3'>
                                <br><br><br>
                                <b>{$rector['genre']} DEL INSTITUTO</b>
                                <br><br><br><br>
                                ______________________________________________________
                                <br>
                                {$rector['name']}
                                <br><br><br><br><br><br>
                            </td>
                        </tr> 
                    </table>
                    <table style='width:100%'>
                        <tr>
                            <td style='font-size: 9pt; text-align: center;'>
                                {$schoolService['genre']} DEL DEPARTAMENTO DE SERVICIOS ESCOLARES 
                                <br><br><br><br>
                                _____________________________________________
                                <br>
                                {$schoolService['name']}
                            </td>
                            <td style='width: 10%'></td>
                            <td style='font-size: 9pt; text-align: center;'>
                                {$director['genre']} DE EDUCACIÓN SUPERIOR
                                <br><br><br><br><br>
                                ______________________________________________
                                <br>
                                {$director['name']}
                            </td>
                        </tr>
                    </table>
                    <br><br><br>
                    <table width='100%' vertical='top'>
                        <tr style='border-spacing: 0px !important;'>
                            <td style='width: 40%;'>
                                <table align='center' border='1' class='border'>
                                    <tr>
                                        <td class='text-center bg-gray border' style='font-size: 8pt;'>
                                            <div style='padding:5px 50px;'>
                                                REGISTRADO EN EL DEPARTAMENTO DE SERVICIOS ESCOLARES
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='border' style='padding:0; margin:0'>
                                            <p style='text-align: left; font-size: 8pt; line-height:25px; padding-left:10px; margin:0; border:none;'>
                                                CON EL No: __________________________________<br>
                                                EN EL LIBRO:&nbsp; ________________________________<br>
                                                FOJA: _______________________________________<br>
                                                FECHA:
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center bg-gray border' style='font-size: 8pt; padding:5px 0;'>
                                            COTEJÓ
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='border' style='text-align: center;'>
                                            <br><br><br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class='text-center bg-gray border' style='font-size: 8pt; padding:5px;'>{$head['genre']} DE LA OFICINA</td>
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
                            <td style='width: 60%; padding:0px 0px 0px 20px; vertical-align: top;'>
                                <p style='font-size: 7.5pt; text-align: justify;'>
                                    CON FUNDAMENTO EN EL ARTÍCULO 29, FRACCIÓN X DE LA LEY ÓRGANICA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, 27 FRACCIÓN XX DEL REGLAMENTO INTERIOR DE LA SECRETARÍA GENERAL DE GOBIERNO:
                                </p>
                                <p style='font-size: 7.5pt; text-align: justify;'>
                                    SE LEGALIZA, PREVIO COTEJO CON LA EXISTENTE EN EL CONTROL RESPECTIVO, LA FIRMA QUE ANTECEDE CORRESPONDE A LA DIRECTORA DE EDUCACIÓN SUPERIOR:<br><br><br>
                                </p>
                                <p style='font-size: 8pt; text-align: center; border-bottom:.5px solid;'> 
                                    {$director['name']}
                                </p><br>
                                <p style='font-size: 8pt;'>
                                    TUXTLA GUTIÉRREZ, CHIAPAS A: &nbsp;&nbsp;&nbsp;___________________________________
                                </p>
                                <p style='font-size: 8pt; text-align: center;'>
                                    <b>{$coordinator['genre']} DE ASUNTOS JURÍDICOS DE GOBIERNO</b>
                                </p><br>
                                <p style='font-size: 8pt; text-align: center;'>
                                ____________________________________________<br>
                                    <label style='padding-top: 20px;'>{$coordinator['name']}</label>
                                </p>
                            </td>
                        </tr>
                    </table>
                    <p style='font-size: 9pt; text-align: center; margin-top:40px;'><b>Este documento no es válido si presenta raspaduras o enmendaduras</b></p>
                </div>
            </div>"; 
}
$html.="</body>
</html>";

// echo "<pre>";
// echo $html;
// exit;


// exit; */
// # Instanciamos un objeto de la clase DOMPDF.
$mipdf = new DOMPDF();
# Definimos el tamaño y orientación del papel que queremos.
# O por defecto cogerá el que está en el fichero de configuración.
$mipdf ->set_paper("legal", "portrait");
# Cargamos el contenido HTML.
$mipdf ->load_html($html);
# Renderizamos el documento PDF.
$mipdf ->render();
# Enviamos el fichero PDF al navegador.
$mipdf ->stream('ActaExamen.pdf', array('Attachment' => 0));
?>
