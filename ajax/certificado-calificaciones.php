<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);

$array_date = explode('-', $_GET['fe']);
$total_modules = 0;
$course->setCourseId($_GET['co']);
$infoCourse = $course->Info();
// Tipo de Curso
if($infoCourse['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semester';
if($infoCourse['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'quarter';
// Calificacion Minima Aprobatoria
$minCal = 7;
if($infoCourse['majorId'] == 18)
    $minCal = 8;
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

$position = [
    1 => 'PRIMER',
    2 => 'SEGUNDO',
    3 => 'TERCER',
    4 => 'CUARTO'
];
/* echo "<pre>";
print_r($infoCourse);
exit; */


$student->setUserId($_GET['al']);
$infoStudent = $student->GetInfo();
// $modules = $student->BoletaCalificacion($_GET['co'], $_GET['cu'], false);

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/**
 * $infoCourse
 * $infoStudent
 */
$has_modules_repeat = $student->hasModulesRepeat();
$qualifications_repeat = [];
if($has_modules_repeat)
{
    $tmp = $student->StudentModulesRepeat();
    foreach($tmp as $item)
    {
        $qualifications_repeat[$item['subjectModuleId']] = [
            'name' => $item['subjectModuleName'],
            'score' => $item['score']
        ];
    }
}
$qualifications = [];
for($period = 1; $period <= $infoCourse['totalPeriods']; $period++)
{
    $tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, false);
    foreach($tmp as $item)
    {
        if( array_key_exists($item['subjectModuleId'], $qualifications_repeat) )
        {
            $qualifications[$period][] = [
                'subjectModuleId' => $item['subjectModuleId'],
                'name' => $qualifications_repeat[$item['subjectModuleId']]['name'],
                'score' => $qualifications_repeat[$item['subjectModuleId']]['score'],
                'comments' => 'R'
            ];
        }
        else
        {
            $qualifications[$period][] = [
                'subjectModuleId' => $item['subjectModuleId'],
                'name' => $item['name'],
                'score' => $item['score'],
                'comments' => ''
            ];
        }
        $total_modules++;
    }
}
/* echo "<pre>";
print_r($qualifications);
exit; */
$tbody = '';
for($period = 1; $period <= $infoCourse['totalPeriods']; $period += 2)
{
    $max_modules = count($qualifications[$period]);
    $next = false;
    if(array_key_exists($period + 1, $qualifications))
    {
        $next = true;
        $b2 = count($qualifications[$period + 1]);
        if($b2 > $max_modules)
            $max_modules = $b2;
    }
    $tbody .= '<tr style="border-style: none;">
                    <td colspan="4" style="text-align: center; border-style: none;"><b>' . mb_strtoupper($position[$period] . ' ' . $infoCourse['tipoCuatri']) . '</b></td>
                    <td colspan="4" style="text-align: center; border-style: none;"><b>' . ($next ? mb_strtoupper($position[$period + 1] . ' ' . $infoCourse['tipoCuatri']) : '') . '</b></td>
                </tr>';
    for($element = 0; $element < $max_modules; $element++)
    {
        $tbody .= '<tr style="border-style: none;">';
        $tbody .= '<td style="border-style: none;">' . $qualifications[$period][$element]['name'] . '</td>
                    <td style="text-align: center; border-style: none;">' . $qualifications[$period][$element]['score'] . '</td>
                    <td style="text-align: center; border-style: none;">' . mb_strtoupper($util->num2letras($qualifications[$period][$element]['score'])) . '</td>
                    <td style="border-style: none; text-align: center;">' . mb_strtoupper($qualifications[$period][$element]['comments']) . '</td>
                    <td style="border-style: none;">' . ($next ? $qualifications[$period + 1][$element]['name'] : '') . '</td>
                    <td style="text-align: center; border-style: none;">' . ($next ? $qualifications[$period + 1][$element]['score'] : '') . '</td>
                    <td style="text-align: center; border-style: none;">' . mb_strtoupper($util->num2letras($qualifications[$period + 1][$element]['score'])) . '</td>
                    <td style="border-style: none; text-align: center;">' . mb_strtoupper($qualifications[$period][$element + 1]['comments']) . '</td>';
        $tbody .= '</tr>';
    }
}
/* echo "<pre>";
print_r($next); 
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
                            <p style='line-height: 14px; text-align: center;'>
                                <label style='font-size: 14pt;'><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                                <label style='font-size: 12pt;'>SECRETARÍA DE EDUCACIÓN</label><br>
                                <label style='font-size: 10pt;'>SUBSECRETARÍA DE EDUCACIÓN ESTATAL</label><br>
                                <label style='font-size: 10pt;'>DIRECCIÓN DE EDUCACIÓN SUPERIOR</label><br>
                                <label style='font-size: 10pt;'>DEPARTAMENTO DE SERVICIOS ESCOLARES</label>
                            </p>
                            <p style='font-size: 8pt; text-align: justify;'>
                                LA DIRECCIÓN DEL INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, RÉGIMEN PARTICULAR, TURNO " . mb_strtoupper($infoCourse['turn']) . " MODALIDAD " . $modality . ", CLAVE " . $myInstitution['identifier'] . ", CERTIFICA QUE:<br>
                                EL (LA) C. <b>" . mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']) . "</b><br>
                                CON No. DE CONTROL: <b>" . $student->GetMatricula($infoCourse['courseId']) . "</b> ACREDITÓ LAS MATERIAS QUE INTEGRAN EL PLAN DE ESTUDIOS DE LA " . $infoCourse['majorName'] . " EN:
                            </p>
                            <p style='font-size: 8pt; text-align: center;'><b>" . $infoCourse['name'] . "</b></p>
                            <p style='font-size: 8pt; text-align: center;'>
                                ACUERDO NÚMERO: <b>" . $rvoe . "</b>, VIGENTE A PARTIR DEL " . mb_strtoupper($util->FormatReadableDate($fechaRvoe)) . ", DURANTE EL PERIODO:<br>
                                <b>" . mb_strtoupper($_GET['pe']) . "</b>
                            </p>
                            <p style='font-size: 8pt; text-align: center;'>CON LOS RESULTADOS QUE A CONTINUACIÓN SE ANOTAN:</p>
                        </td>
                    </tr>
                </table>
                <table align='center' width='100%' style='font-size: 6pt; border-collapse: collapse; border: 1px solid white;' border='1'>
                    <thead>
                        <tr>
                            <th class='text-center' rowspan='2'>MATERIAS</th>
                            <th class='text-center' colspan='2'>CALIFICACIÓN</th>
                            <th class='text-center' rowspan='2'>OBSERVACIÓN</th>
                            <th class='text-center' rowspan='2'>MATERIAS</th>
                            <th class='text-center' colspan='2'>CALIFICACIÓN</th>
                            <th class='text-center' rowspan='2'>OBSERVACIÓN</th>
                        </tr>
                        <tr>
                            <th class='text-center'>Cifra</th>
                            <th class='text-center'>Letra</th>
                            <th class='text-center'>Cifra</th>
                            <th class='text-center'>Letra</th>
                        </tr>
                    </thead>
                    <tbody>
                        " . $tbody . "
                    </tbody>
                </table>
                <p style='font-size: 8pt;'>La escala oficial de calificaciones es de 6 (SEIS) a 10 (DIEZ), considerando como mínima aprobatoria " . $minCal . " (" . mb_strtoupper($util->num2letras($minCal)) . "). Este certificado ampara <b>" . mb_strtoupper($util->num2letras($total_modules)) . "</b> materias del plan de estudios vigente y en cumplimiento a las prescripciones legales, se expide en Tuxtla Gutiérrez, Chiapas a los " . $array_date[2] . " días del mes de " . mb_strtolower($util->ConvertirMes(intval($array_date[1]))) . " del año " . mb_strtolower($util->num2letras($array_date[0])) . ".</p>
                <table width='100%'>
                    <tr>
                        <td style='font-size: 8px; text-align: center;'>
                            <b>PRESIDENTE</b>
                            <br><br><br>
                            DR. FERNANDO ÁLVAREZ SIMÁN
                        </td>
                        <td style='font-size: 8px; text-align: center;'>
                            <b>SECRETARIO EJECUTIVO</b>
                            <br><br><br>
                            MTRO. OSMAR FERNANDO SALAZAR CISNEROS
                        </td>
                    </tr>
                    <tr>
                        <td style='font-size: 8px; text-align: center;'>
                            <br><br>
                            <b>JEFA DEL DEPARTEMENTO DE SERVICIOS ESCOLARES</b>
                            <br><br><br>
                            ING. MARTHA MARLENE ESTRADA ESTRADA
                        </td>
                        <td style='font-size: 8px; text-align: center;'>
                            <br><br>
                            <b>DIRECTOR DE EDUCACIÓN SUPERIOR</b>
                            <br><br><br>
                            DR. ANTONIO MAGDIEL VELÁZQUEZ MÉNDEZ
                        </td>
                    </tr>
                </table><br>
                <table width='100%'>
                    <tr style='border-spacing: 0px !important;'>
                        <td>
                            <table align='center' border='1' class='border'>
                                <tr>
                                    <td class='text-center bg-gray border' style='font-size: 7pt;'>
                                        DEPARTAMENTO DE SERVICIOS ESCOLARES
                                    </td>
                                </tr>
                                <tr>
                                    <td class='border'>
                                        <p style='text-align: right; font-size: 7pt;'>
                                            NO. ____________________________________<br>
                                            LIBRO. ____________________________________<br>
                                            FOJA. ____________________________________<br>
                                            FECHA. ____________________________________<br>
                                        </p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class='text-center bg-gray border' style='font-size: 7pt;'>
                                        COTEJÓ
                                    </td>
                                </tr>
                                <tr>
                                    <td class='border'>
                                        <p><br><br><br></p>
                                    </td>
                                </tr>
                                <tr>
                                    <td class='text-center bg-gray border' style='font-size: 7pt;'>JEFE DE LA OFICINA</td>
                                </tr>
                                <tr>
                                    <td class='border'>
                                        <p><br><br></p>
                                    </td>
                                </tr>
                            </table>                        
                        </td>
                        <td>
                            <p style='font-size: 7pt;'>
                                POR ACUERDO DEL SECRETARIO GENERAL DE GOBIERNO Y CON FUNDAMENTO EN EL ARTÍCULO 29; FRACCIÓN X DE LA LEY ORGÁNICA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS.
                            </p>
                            <p style='font-size: 7pt;'>
                                SE <b>LEGALIZA,</b> PREVIO COTEJO CON LA EXISTENTE EN EL CONTROL RESPECTIVO, LA FIRMA QUE ANTECEDE CORRESPONDIENTE AL DIRECTOR DE EDUCACIÓN SUPERIOR:
                            </p>
                            <p style='font-size: 7pt; text-align: center;'>
                                DR. ANTONIO MAGDIEL VELÁZQUEZ MÉNDEZ
                            </p>
                            <p style='font-size: 7pt; text-align: center;'>
                                TUXTLA GUTIÉRREZ, CHIAPAS A: ____________________________________ 
                            </p>
                            <p style='font-size: 7pt; text-align: center;'>
                                COORDINADOR DE ASUNTOS JURÍDICOS DE GOBIERNO
                            </p><br>
                            <p style='font-size: 7pt; text-align: center;'>
                                MARÍA GUADALUPE SÁNCHEZ ZENTENO
                            </p>
                        </td>
                    </tr>
                </table>
                <p style='font-size: 6pt; text-align: center;'><b>ESTE DOCUMENTO NO ES VÁLIDO SI PRESENTA RASPADURAS O ENMENDADURAS</b></p>
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
