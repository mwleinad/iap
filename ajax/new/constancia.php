<?php
include_once('../../initPdf.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);

$total_modules = 0;
$course->setCourseId($_POST['course']);
$infoCourse = $course->Info();
$settingCertificate = $certificates->getSettings();
$rector['name'] = mb_strtoupper($settingCertificate['rector']);
$rector['genre'] = $settingCertificate['genre_rector'] == 1 ? "RECTOR" : "RECTORA";
// Calificacion Minima Aprobatoria
$minCal = 7; 
$minCalOf = 6;
if ($infoCourse['majorId'] == 18) { 
    $minCal = 8;
    $minCalOf = 7;
}
// Modalidad y RVOE
$rvoe = $_POST['rvoe']; 
$fechaRvoe = $_POST['fecha_rvoe'];
if ($infoCourse['modality'] == 'Online') {
    $modality = 'NO ESCOLAR'; 
}
if ($infoCourse['modality'] == 'Local' || $infoCourse['modality'] == "Mixta") {
    $modality = $infoCourse['modality'] == "Local" ? 'ESCOLAR' : "MIXTA"; 
} 

$infoCourse['tipoCuatri'] = $infoCourse['tipoCuatri'] == '' ? "Cuatrimestre" : $infoCourse['tipoCuatri'];

$position = [
    1 => 'PRIMER',
    2 => 'SEGUNDO',
    3 => 'TERCER',
    4 => 'CUARTO',
    5 => 'QUINTO',
    6 => 'SEXTO'
];

$students = $_POST['student'];
$institution->setInstitutionId(1);
$myInstitution = $institution->Info();  

$html = '<html>
            <head>
                <style type="text/css">
                    @font-face {
                        font-family: "Arial";
                        font-style: normal;
                        font-weight: normal;
                        src: url("' . WEB_ROOT . '/assets/vcz/fonts/Calibri/calibri-regular.ttf") format("truetype");
                    }
                    body {
                        font-family: "Arial", sans-serif; 
                        line-height: 1;
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
                    #logo {
                        width: 8cm; 
                    } 
                    .bg-gray {
                        background-color: #dddddd;
                    }
                    .page_break { page-break-before: always; }
                </style>
            </head>
            <body style="boder:1px solid;">';

foreach ($students as $itemStudent) {
    $folio = $_POST['folio'][$itemStudent];
    $where = "alumno_id = {$itemStudent} AND course_id = {$_POST['course']}";
    $constanciaAlumno = $constancias->getConstancia($where);
    $fechaExpedicion = $_POST['date'];
    $periodo = $_POST['period']; 
    if(!$constanciaAlumno){ //No se ha guardado, hay que crearlo
        $constancias->setFechaExpedicion($fechaExpedicion);
        $constancias->setPeriodo($periodo);
        $constancias->setRvoe($rvoe);
        $constancias->setFechaRvoe($fechaRvoe);
        $constancias->setCurso($_POST['course']);
        $constancias->setAlumno($itemStudent);
        $constancias->setFolio($_POST['folio'][$itemStudent]);
        $constancias->crearConstancia();
    }else{//Actualizar registro
        $fechaExpedicion = empty($fechaExpedicion) ? $constanciaAlumno['fecha_expedicion'] : $fechaExpedicion;
        $periodo = empty($periodo) ? $constanciaAlumno['periodo'] : $periodo;
        $rvoe = empty($rvoe) ? $constanciaAlumno['rvoe'] : $rvoe; 
        $fechaRvoe = empty($fechaRvoe) ? $constanciaAlumno['fechaRvoe'] : $fechaRvoe; 
        $constancias->setFechaExpedicion($fechaExpedicion);
        $constancias->setPeriodo($periodo);
        $constancias->setRvoe($rvoe);
        $constancias->setFechaRvoe($fechaRvoe);
        $constancias->setCurso($_POST['course']);
        $constancias->setAlumno($itemStudent);
        $constancias->setFolio($_POST['folio'][$itemStudent]);
    }
    $total_modules = 0;
    $student->setUserId($itemStudent);
    $infoStudent = $student->GetInfo();
    $has_modules_repeat = $student->hasModulesRepeat();
    $qualifications_repeat = [];
    if ($has_modules_repeat) {
        $tmp = $student->StudentModulesRepeat();
        foreach ($tmp as $item) {
            $qualifications_repeat[$item['subjectModuleId']] = [
                'name' => $item['subjectModuleName'],
                'score' => $item['score']
            ];
        }
    }

    $period_course = [];
    $group_history = $student->GroupHistory($infoCourse['subjectId']);
    // print_r($group_history);
    $has_history = count($group_history) > 1 ? true : false;
    if ($has_history) {
        foreach ($group_history as $item) {
            if ($item['type'] == 'baja') {
                for ($i = 1; $i <= $item['semesterId']; $i++) {
                    if (empty($period_course[$i])) {
                        $period_course[$i] = $item['courseId'];
                    }
                }
            }
            if ($item['type'] == "alta") {
                for ($i = $item['semesterId']; $i <= $infoCourse['totalPeriods']; $i++) {
                    $period_course[$i] = $item['courseId'];
                }
            }
        }
    }
    // print_r($period_course);

    $qualifications = [];
    for ($period = 1; $period <= $infoCourse['totalPeriods']; $period++) {
        if ($has_history)
            $tmp = $student->BoletaCalificacion($period_course[$period], $period, false);
        else
            $tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, false);
        foreach ($tmp as $item) {
            if (array_key_exists($item['subjectModuleId'], $qualifications_repeat)) {
                $qualifications[$period][] = [
                    'subjectModuleId' => $item['subjectModuleId'],
                    'name' => $qualifications_repeat[$item['subjectModuleId']]['name'],
                    'score' => $qualifications_repeat[$item['subjectModuleId']]['score'],
                    'comments' => 'REC.'
                ];
            } else {
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
    $array_date = explode('-', $fechaExpedicion);
    $tbody = '';
    $sumCal = 0;
    $materias = 0;
    $fuenteMateria = $infoCourse['totalPeriods'] <= 4 ? "10px" : "7px";

    for ($period = 1; $period <= $infoCourse['totalPeriods']; $period += 2) {
        $max_modules = count($qualifications[$period]);
        $next = false;
        if ($qualifications[$period + 1]) {
            $next = true;
        }
        $tbody .= ' <tr style="border-style: none;">
                        <td style="text-align: center; border-style: none; padding:7px 0;font-size:' . $fuenteMateria . '"><b>' . mb_strtoupper($position[$period] . ' ' . $infoCourse['tipoCuatri']) . '</b></td>
                        <td colspan="3" style="border-style: none; padding:5px 0;"></td>
                        <td style="text-align: center; border-style: none; padding:7px 0;font-size:' . $fuenteMateria . '"><b>' . ($next ? mb_strtoupper($position[$period + 1] . ' ' . $infoCourse['tipoCuatri']) : '') . '</b></td>
                        <td colspan="3" style="border-style: none; padding:5px 0;"></td>
                    </tr>';
        for ($element = 0; $element < $max_modules; $element++) {
            $next = false;
            if ($qualifications[$period + 1][$element]) {
                $next = true;
            }
            $tbody .= '<tr style="border-style: none;">';
            $tbody .= '<td style="border-style: none; font-size:' . $fuenteMateria . '">' . $qualifications[$period][$element]['name'] . '</td>
                        <td style="text-align: center; border-style: none; font-size:' . $fuenteMateria . '">' . $qualifications[$period][$element]['score'] . '</td>
                        <td style="text-align: center; border-style: none; font-size:' . $fuenteMateria . '">' . mb_strtoupper($util->num2letras($qualifications[$period][$element]['score'])) . '</td>
                        <td style="border-style: none; text-align: center; font-size:' . $fuenteMateria . '">' . mb_strtoupper($qualifications[$period][$element]['comments']) . '</td>
                        <td style="border-style: none; font-size:' . $fuenteMateria . '">' . ($next ? $qualifications[$period + 1][$element]['name'] : '') . '</td>
                        <td style="text-align: center; border-style: none; font-size:' . $fuenteMateria . '">' . ($next ? $qualifications[$period + 1][$element]['score'] : '') . '</td>
                        <td style="text-align: center; border-style: none; font-size:' . $fuenteMateria . '">' . ($next ? mb_strtoupper($util->num2letras($qualifications[$period + 1][$element]['score'])) : '') . '</td>
                        <td style="border-style: none; text-align: center; font-size:' . $fuenteMateria . '">' . mb_strtoupper($qualifications[$period + 1][$element]['comments']) . '</td>';
            $tbody .= '</tr>';
            $sumCal += $qualifications[$period][$element]['score'] + ($next ? $qualifications[$period + 1][$element]['score'] : 0);
            $materias++;
            $materias = $next ? $materias + 1 : $materias;
            // print_r($qualifications[$period+1][$element]);
        }
        $promedio = bcdiv($sumCal, $materias, 1);
        if (intval($promedio) == 10) {
            $promedioLetras = $util->num2letras(10, false, false);
        } else {
            $promedioLetras = $util->num2letras($promedio, false, true);
        }
        $promedio = intval($promedio) == 10 ? intval($promedio) : $promedio;
    }
    $plan = ($infoCourse['majorName'] == "DOCTORADO" ? "DEL " : "DE LA ");
    $prefijoDirector = $director['genre'] == "DIRECTOR" ? "DEL " : "A LA " . $director['genre'];
    $nameStudent =  mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']);
    $nameStudent = $util->eliminar_acentos($nameStudent);
    $curso = str_replace("EN", "", $infoCourse["name"]);
    $letraAnio =  $array_date[0] == 2023 ? "dos mil veintitrés" : mb_strtolower($util->num2letras($array_date[0])); 
    $imagen = file_get_contents(DOC_ROOT . "/images/logos/Logo_3.jpg");
    $logo = 'data:image/jpg;base64,' . base64_encode($imagen); 
    $html .= '<table width="100%">
                 <tr>
                    <td style="padding-top:0px;">
                        <img src="'.$logo.'" id="logo" style="width:250px;"/> 
                    </td>
                </tr>
                <tr>
                    <td>  
                        <h4 style="text-align:center; padding-top:0px;">INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS,  A.C.</h4>
                        <div style="text-align:right; margin-top:0;font-size:12px;">IAP/SE/DA/<span style="color:red;">' . $folio . '</span>/'.date('Y').'</div>
                        <div> 
                            <p style="font-size:11px; text-align: justify;line-height:1.2; margin-top:0.2cm;">
                                LA DIRECCIÓN ACADÉMICA DEL INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, RÉGIMEN PARTICULAR, TURNO ' . mb_strtoupper($infoCourse["turn"]) . ' MODALIDAD ' . $modality . ', CLAVE ' . $myInstitution["identifier"] . ', HACE CONSTAR QUE: <br>
                            </p>
                            <div style="font-size: 13px; text-align: center; padding:10px 0;">
                                <b>' . $nameStudent . '</b>
                            </div>
                            <p style="font-size:11px; text-align: center; line-height:1.2; margin-top:0.4cm;">
                                CON No. DE CONTROL: <b>' . $student->GetMatricula($infoCourse["courseId"]) . '</b> ACREDITÓ LAS MATERIAS QUE INTEGRAN EL PLAN DE ESTUDIOS ' . $plan . ':
                            </p>
                            <p style="font-size: 13px; text-align: center;">
                                <b>' .  $infoCourse['majorName'] . ' EN ' . $curso . '</b>
                            </p>
                            <p style="font-size: 11px; text-align: center; line-height:1.5">
                                ACUERDO NÚMERO: <b>' . mb_strtoupper($rvoe) . '</b>, VIGENTE A PARTIR DEL ' . mb_strtoupper($util->FormatReadableDate($fechaRvoe)) . ', DURANTE EL PERIODO:<br> 
                            </p>
                            <p class="text-center" style="font-size:11px;"><b>' . mb_strtoupper($periodo) . '</b></p>
                            <p style="font-size: 11px; text-align: center; margin-bottom:20px; line-height:1">CON LOS RESULTADOS QUE A CONTINUACIÓN SE ANOTAN:</p> 
                        </div>
                    </td>
                </tr>
            </table>
            <table align="center" width="100%" style="font-size: 9px; border-collapse: collapse; border: 1px solid white;" border="1">
                <thead>
                    <tr>
                        <th class="text-center" rowspan="2" width="5.8cm" style="padding:5px">MATERIAS</th>
                        <th class="text-center" colspan="2">CALIFICACIÓN</th>
                        <th class="text-center" rowspan="2">OBSERVACIÓN</th>
                        <th class="text-center" rowspan="2" width="5.5cm">MATERIAS</th>
                        <th class="text-center" colspan="2">CALIFICACIÓN</th>
                        <th class="text-center" rowspan="2">OBSERVACIÓN</th>
                    </tr>
                    <tr>
                        <th class="text-center">Cifra</th>
                        <th class="text-center">Letra</th>
                        <th class="text-center">Cifra</th>
                        <th class="text-center">Letra</th>
                    </tr>
                </thead>
                <tbody>
                    ' . $tbody . '
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="8" style="border:none; text-align:right; padding: 15px 0 0 0; font-weight: 900; font-size:11px; font-family:arial;">PROMEDIO GENERAL ' . $promedio . ' ' . mb_strtoupper($promedioLetras) . '</td>
                    </tr>
                </tfoot>
            </table>
            <p style="font-size:10px; line-height:13px;">La escala oficial de calificaciones es de '.$minCalOf.' ('. mb_strtoupper($util->num2letras($minCalOf)).') a 10 (DIEZ), considerando como mínima aprobatoria ' . $minCal . ' (' . mb_strtoupper($util->num2letras($minCal)) . '). Esta constancia ampara <b>' . mb_strtoupper($util->num2letras($total_modules)) . '</b> materias del plan de estudios vigente y en cumplimiento a las prescripciones legales, se expide en Tuxtla Gutiérrez, Chiapas a los ' . $array_date[2] . ' días del mes de ' . mb_strtolower($util->ConvertirMes(intval($array_date[1]))) . ' del año ' . $letraAnio . '.</p>
            <table width="100%">
                <tr>
                    <td style="font-size: 12px; text-align: center;"> 
                        <br><br><br><br><br><br><br><br>
                        _________________________________________________
                        <br>
                        <div style="margin-top:5px;">
                            <b>' . $rector["name"] . '</b><br>
                        </div>
                        <div style="margin-top:5px;">
                            <b>' . $rector["genre"] . '</b>
                        </div>
                    </td> 
                </tr>
                 
            </table>';
    if ($itemStudent != end($students)) {
        $html .= '<div class="page_break"></div>';
    }
}
$html .= "</body>
</html>";
// echo $html;
// echo "</pre>";  
$mipdf = new DOMPDF();
# Definimos el tamaño y orientación del papel que queremos.
# O por defecto cogerá el que está en el fichero de configuración.
$mipdf->set_paper("letter", "portrait");
# Cargamos el contenido HTML.
$mipdf->load_html($html);
# Renderizamos el documento PDF.
$mipdf->render();
# Enviamos el fichero PDF al navegador.
$nameStudent = str_replace(" ", "_", $nameStudent);
$mipdf->stream("Constancia_{$nameStudent}.pdf", array('Attachment' => 0));
