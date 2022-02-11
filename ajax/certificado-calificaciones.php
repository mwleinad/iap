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
    $rvoe = $infoCourse['rvo'];
    $fechaRvoe = $infoCourse['fechaRvoe'];
}

$position = [
    1 => 'PRIMER',
    2 => 'SEGUNDO',
    3 => 'TERCER',
    4 => 'CUARTO'
];


$student->setUserId($_GET['al']);
$infoStudent = $student->GetInfo();
// $modules = $student->BoletaCalificacion($_GET['co'], $_GET['cu'], false);

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/**
 * $infoCourse
 * $infoStudent
 */
$qualifications = [];
for($period = 1; $period <= $infoCourse['totalPeriods']; $period++)
{
    $tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, false);
    foreach($tmp as $item)
    {
        $qualifications[$period][] = [
            'name' => $item['name'],
            'score' => $item['score']
        ];
    }
}
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
    $tbody .= '<tr>
                    <td colspan="4" style="text-align: center;"><b>' . mb_strtoupper($position[$period] . ' ' . $infoCourse['tipoCuatri']) . '</b></td>
                    <td colspan="4" style="text-align: center;"><b>' . ($next ? mb_strtoupper($position[$period + 1] . ' ' . $infoCourse['tipoCuatri']) : '') . '</b></td>
                </tr>';
    for($element = 0; $element < $max_modules; $element++)
    {
        $tbody .= '<tr>';
        $tbody .= '<td>' . $qualifications[$period][$element]['name'] . '</td>
                    <td style="text-align: center;">' . $qualifications[$period][$element]['score'] . '</td>
                    <td>' . mb_strtoupper($util->num2letras($qualifications[$period][$element]['score'])) . '</td>
                    <td></td>
                    <td>' . ($next ? $qualifications[$period + 1][$element]['name'] : '') . '</td>
                    <td style="text-align: center;">' . ($next ? $qualifications[$period + 1][$element]['score'] : '') . '</td>
                    <td>' . mb_strtoupper($util->num2letras($qualifications[$period][$element]['score'])) . '</td>
                    <td></td>';
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
                                <label style='font-size: 12pt;'><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                                <label style='font-size: 10pt;'>SECRETARÍA DE EDUCACIÓN</label><br>
                                <label style='font-size: 8pt;'>SUBSECRETARÍA DE EDUCACIÓN ESTATAL</label><br>
                                <label style='font-size: 8pt;'>DIRECCIÓN DE EDUCACIÓN SUPERIOR</label><br>
                                <label style='font-size: 8pt;'>DEPARTAMENTO DE SERVICIOS ESCOLARES</label>
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
                <table align='center' width='100%' style='font-size: 5pt;' border='1' class='border'>
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
                    " . $tbody . "
                </table>
                <p style='font-size: 8pt;'>La escala oficial de calificaciones es de 6 (SEIS) a 10 (DIEZ), considerando como mínima aprobatoria " . $minCal . " (" . mb_strtoupper($util->num2letras($minCal)) . "). Este certificado ampara ______ materias del plan de estudios vigente y en cumplimiento a las prescripciones legales, se expide en Tuxtla Gutiérrez, Chiapas a los ______.</p>
                <table width='100%'>
                    <tr style='border-spacing: 0px !important;'>
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
                                SE <b>LAGALIZA,</b> PREVIO COTEJO CON LA EXISTENTE EN EL CONTROL RESPECTIVO, LA FIRMA QUE ANTECEDE CORRESPONDIENTE AL DIRECTOR DE EDUCACIÓN SUPERIOR:
                            </p>
                            <div style='text-decoration: underline;'>
                                <p style='font-size: 5pt;'>
                                    DR. ANTONIO MAGDIEL VELÁZQUEZ MÉNDEZ
                                </p>
                                <p style='font-size: 5pt;'>
                                    TUXTLA GUTIÉRREZ, CHIAPAS A: 
                                </p>
                                <p style='font-size: 5pt;'>
                                    COORDINADOR DE ASUNTOS JURÍDICOS DE GOBIERNO 
                                </p>
                                <p style='font-size: 5pt;'>
                                    MARÍA GUADALUPE SÁNCHEZ ZENTENO 
                                </p>
                            </div>
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
