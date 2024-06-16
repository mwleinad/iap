<?php
include_once('../initPdf.php');
include_once('../config.php');
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

$imagen = file_get_contents(DOC_ROOT . "/images/Escudo.jpg");
$escudo = 'data:image/jpg;base64,' . base64_encode($imagen);
$imagen = file_get_contents(DOC_ROOT . "/images/new/docs/mignon.jpg");
$ovalo = 'data:image/jpg;base64,' . base64_encode($imagen); 

// Calificacion Minima Aprobatoria
$minCal = 7;
$prefix = 'CM';
if ($infoCourse['majorId'] == 18) {
    $prefix = 'CD';
    $minCal = 8;
}
// Modalidad y RVOE
if ($infoCourse['modality'] == 'Online') {
    $modality = 'NO ESCOLAR';
    $rvoe = $infoCourse['rvoeLinea'];
    $fechaRvoe = $infoCourse['fechaRvoeLinea'];
}
if ($infoCourse['modality'] == 'Local' || $infoCourse['modality'] == "Mixta") {
    $modality = $infoCourse['modality'] == "Local" ? 'ESCOLAR' : "MIXTA";
    $rvoe = $infoCourse['rvoe'];
    $fechaRvoe = $infoCourse['fechaRvoe'];
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
$folios = $_POST['folio'];
$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
$datePeriod = $_POST['period'];
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
                    #mexico {
                        width: 3cm;
                        position: absolute;
                        top: 16px;
                        left: 8px;
                    }
                    #ovalo {
                        position:absolute;
                        width:3cm;
                        top: 130px;
                        height: 5cm;
                        left:3px;
                    }
                    .bg-gray {
                        background-color: #dddddd;
                    }
                </style>
            </head>
            <body style="boder:1px solid;">';

foreach ($students as $itemStudent) {
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

    // print_r($qualifications);
    $rector['name'] = mb_strtoupper($settingCertificate['rector']);
    $secretary['name'] = mb_strtoupper($settingCertificate['secretary']);
    $schoolService['name'] = mb_strtoupper($settingCertificate['school_services']);
    $director['name'] = mb_strtoupper($settingCertificate['director_education']);
    $coordinator['name'] = mb_strtoupper($settingCertificate['coordinator']);
    $comparison['name'] = mb_strtoupper($settingCertificate['comparison']);
    $head['name'] = mb_strtoupper($settingCertificate['head_office']);
    $rector['genre'] = $settingCertificate['genre_rector'] == 1 ? "RECTOR" : "RECTORA";
    $secretary['genre'] = $settingCertificate['genre_secretary'] == 1 ? "SECRETARIO ACADÉMICO" : "SECRETARIA ACADÉMICA";
    $director['genre'] = $settingCertificate['genre_director'] == 1 ? "DIRECTOR" : "DIRECTORA";
    $schoolService['genre'] = $settingCertificate['genre_school'] == 1 ? "JEFE" : "JEFA";
    $coordinator['genre'] = $settingCertificate['genre_coordinator'] == 1 ? "COORDINADOR" : "COORDINADORA";
    $head['genre'] = $settingCertificate['genre_head'] == 1 ? "JEFE" : "JEFA";
    $dataHistoryCertificate = $certificates->getHistoryCertificateStudent($_POST['course'], $itemStudent);

    if (is_null($dataHistoryCertificate)) { // Si no existe historial, se crea.
        $certificates->addHistoryCertificateStudent($_POST['course'], $itemStudent, $rector['name'], $secretary['name'], $schoolService['name'], $director['name'], $coordinator['name'], $comparison['name'], $head['name'], $settingCertificate['genre_rector'], $settingCertificate['genre_secretary'], $settingCertificate['genre_director'], $settingCertificate['genre_director'], $settingCertificate['genre_coordinator'], $settingCertificate['genre_head'], $_POST['date'], $datePeriod, $folios[$itemStudent]);
        $array_date = explode('-', $_POST['date']);
    } else { //En caso contrario, se actualiza.
        $datePeriod = empty($datePeriod) ? $dataHistoryCertificate['school_cycle'] : $datePeriod;
        $dateExpidition = empty($_POST['date']) ? $dataHistoryCertificate['expedition_date'] : $_POST['date'];
        $array_date = explode('-', $dateExpidition);

        $certificates->updateHistoryCertificateStudent($_POST['course'], $itemStudent, $rector['name'], $secretary['name'], $schoolService['name'], $director['name'], $coordinator['name'], $comparison['name'], $head['name'], $settingCertificate['genre_rector'], $settingCertificate['genre_secretary'], $settingCertificate['genre_director'], $settingCertificate['genre_director'], $settingCertificate['genre_coordinator'], $settingCertificate['genre_head'], $dateExpidition, $datePeriod, $folios[$itemStudent]);
    }
    $tbody = '';
    $sumCal = 0;
    $materias = 0;
    $fuenteMateria = $infoCourse['totalPeriods'] <= 4 ? "9px" : "7px";
    
    for ($period = 1; $period <= $infoCourse['totalPeriods']; $period += 2) {
        $max_modules = count($qualifications[$period]);
        $next = false;
        if ($qualifications[$period + 1]) {
            $next = true;
        }
        $tbody .= ' <tr style="border-style: none;">
                        <td style="text-align: center; border-style: none; padding:7px 0;font-size:'.$fuenteMateria.'"><b>' . mb_strtoupper($position[$period] . ' ' . $infoCourse['tipoCuatri']) . '</b></td>
                        <td colspan="3" style="border-style: none; padding:5px 0;"></td>
                        <td style="text-align: center; border-style: none; padding:7px 0;font-size:'.$fuenteMateria.'"><b>' . ($next ? mb_strtoupper($position[$period + 1] . ' ' . $infoCourse['tipoCuatri']) : '') . '</b></td>
                        <td colspan="3" style="border-style: none; padding:5px 0;"></td>
                    </tr>';
        for ($element = 0; $element < $max_modules; $element++) {
            $next = false;
            if ($qualifications[$period + 1][$element]) {
                $next = true;
            }
            $tbody .= '<tr style="border-style: none;">';
            $tbody .= '<td style="border-style: none; font-size:'.$fuenteMateria.'">' . $qualifications[$period][$element]['name'] . '</td>
                        <td style="text-align: center; border-style: none; font-size:'.$fuenteMateria.'">' . $qualifications[$period][$element]['score'] . '</td>
                        <td style="text-align: center; border-style: none; font-size:'.$fuenteMateria.'">' . mb_strtoupper($util->num2letras($qualifications[$period][$element]['score'])) . '</td>
                        <td style="border-style: none; text-align: center; font-size:'.$fuenteMateria.'">' . mb_strtoupper($qualifications[$period][$element]['comments']) . '</td>
                        <td style="border-style: none; font-size:'.$fuenteMateria.'">' . ($next ? $qualifications[$period + 1][$element]['name'] : '') . '</td>
                        <td style="text-align: center; border-style: none; font-size:'.$fuenteMateria.'">' . ($next ? $qualifications[$period + 1][$element]['score'] : '') . '</td>
                        <td style="text-align: center; border-style: none; font-size:'.$fuenteMateria.'">' . ($next ? mb_strtoupper($util->num2letras($qualifications[$period + 1][$element]['score'])) : '') . '</td>
                        <td style="border-style: none; text-align: center; font-size:'.$fuenteMateria.'">' . mb_strtoupper($qualifications[$period + 1][$element]['comments']) . '</td>';
            $tbody .= '</tr>';
            $sumCal += $qualifications[$period][$element]['score'] + ($next ? $qualifications[$period + 1][$element]['score'] : 0);
            $materias++;
            $materias = $next ? $materias + 1 : $materias;
            // print_r($qualifications[$period+1][$element]);
        }
        $promedio = bcdiv($sumCal, $materias, 1);
        if (intval($promedio) == 10) {
            $promedioLetras = $util->num2letras(10,false, false);
        }else{
            $promedioLetras = $util->num2letras($promedio,false, true);
        }
        $promedio = intval($promedio) == 10 ? intval($promedio) : $promedio;
        // exit;
    }
    $plan = ($infoCourse['majorName'] == "DOCTORADO" ? "DEL " : "DE LA ") . $infoCourse['majorName'];
    $prefijoDirector = $director['genre'] == "DIRECTOR" ? "DEL " : "A LA " . $director['genre'];
    $nameStudent =  mb_strtoupper($infoStudent['names']) . " " . mb_strtoupper($infoStudent['lastNamePaterno']) . " " . mb_strtoupper($infoStudent['lastNameMaterno']);
    $nameStudent = $util->eliminar_acentos($nameStudent);
    $curso = str_replace("EN", "", $infoCourse["name"]); 
    $letraAnio =  $array_date[0] == 2023 ? "dos mil veintitrés" : mb_strtolower($util->num2letras($array_date[0])); 
    $html .= '<table width="100%">
                <tr>
                    <td width="17%">
                        <img src="'.$escudo.'" id="mexico" />
                        <img src="' . $ovalo . '" id="ovalo" />
                    </td>
                    <td width="83%"> 
                        <div style="font-size: 6.5pt; position: absolute; right: -.6cm; top: -10px; width: 80px;"><b>SE-' . $prefix . 'IAP-' . $array_date[0] . '<b></div> 
                        <div style="font-size: 9pt; position:absolute; right: 0; width: 80px; top:105px; text-align:right;"><strong>Folio:</strong> <b style="color: red;">' . mb_strtoupper($folios[$itemStudent]) . '</b></div> 
                        <div style="height:8.5cm;">
                            <div class="text-center" style="margin-top:15px;">
                                <label style="font-size: 18px;"><b>GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS</b></label><br>
                                <label style="font-size: 13pt;">SECRETARÍA DE EDUCACIÓN</label><br>
                                <label style="font-size: 11pt;">SUBSECRETARÍA DE EDUCACIÓN ESTATAL</label><br>
                                <label style="font-size: 11pt;">DIRECCIÓN DE EDUCACIÓN SUPERIOR</label><br>
                                <label style="font-size: 11pt;">DEPARTAMENTO DE SERVICIOS ESCOLARES</label>
                            </div>
                            <p style="font-size:10.5px; text-align: justify;line-height:1.2; margin-top:0.4cm;">
                                LA DIRECCIÓN DEL INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, RÉGIMEN PARTICULAR, TURNO ' . mb_strtoupper($infoCourse["turn"]) . ' MODALIDAD ' . $modality . ', CLAVE ' . $myInstitution["identifier"] . ', CERTIFICA QUE:<br>
                                EL (LA) C. <b>' . $nameStudent . '</b><br>
                                CON No. DE CONTROL: <b>' . $student->GetMatricula($infoCourse["courseId"]) . '</b> ACREDITÓ LAS MATERIAS QUE INTEGRAN EL PLAN DE ESTUDIOS ' . $plan . ' EN:
                            </p>
                            <p style="font-size: 11px; text-align: center;"><b>' . $curso . '</b></p>
                            <p style="font-size: 10.5px; text-align: justify; line-height:1.5">
                                ACUERDO NÚMERO: <b>' . $rvoe . '</b>, VIGENTE A PARTIR DEL ' . mb_strtoupper($util->FormatReadableDate($fechaRvoe)) . ', DURANTE EL PERIODO:<br> 
                            </p>
                            <p class="text-center" style="font-size:11px;"><b>' . mb_strtoupper($datePeriod) . '</b></p>
                            <p style="font-size: 10.5px; text-align: center; margin-bottom:0px; line-height:1">CON LOS RESULTADOS QUE A CONTINUACIÓN SE ANOTAN:</p> 
                        </div>
                    </td>
                </tr>
            </table>
            <table align="center" width="100%" style="font-size: 9px; margin-top: -10px; border-collapse: collapse; border: 1px solid white;" border="1">
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
                        <td colspan="8" style="border:none; text-align:right; padding: 15px 0 0 0; font-weight: 900; font-size:11px;">PROMEDIO GENERAL ' . $promedio . ' ' . mb_strtoupper($promedioLetras) . '</td>
                    </tr>
                </tfoot>
            </table>
            <p style="font-size:9.5px">La escala oficial de calificaciones es de 6 (SEIS) a 10 (DIEZ), considerando como mínima aprobatoria ' . $minCal . ' (' . mb_strtoupper($util->num2letras($minCal)) . '). Este certificado ampara <b>'.mb_strtoupper($util->num2letras($total_modules
            )).'</b> materias del plan de estudios vigente y en cumplimiento a las prescripciones legales, se expide en Tuxtla Gutiérrez, Chiapas a los ' . $array_date[2] . ' días del mes de ' . mb_strtolower($util->ConvertirMes(intval($array_date[1]))) . ' del año ' . $letraAnio . '.</p>
            <table width="100%">
                <tr>
                    <td style="font-size: 9pt; text-align: center;">
                        <b>' . $rector["genre"] . '</b>
                        <br><br><br> 
                        _________________________________________________
                        <br>
                        ' . $rector["name"] . '
                    </td>
                    <td style="width: 10%"></td>
                    <td style="font-size: 9pt; text-align: center;">
                        <b>' . $secretary["genre"] . '</b>
                        <br><br><br> 
                        _________________________________________________
                        <br>
                        ' . $secretary["name"] . '
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 9pt; text-align: center; vertical-align:top;">
                        <br><br><br>
                        <b>' . $schoolService["genre"] . ' DEL DEPARTAMENTO DE SERVICIOS ESCOLARES</b>
                        <br><br><br> 
                        _________________________________________________
                        <br>
                       ' . $schoolService["name"] . '
                    </td>
                    <td style="width: 10%"></td>
                    <td style="font-size: 9pt; text-align: center; vertical-align:top;">
                        <br><br><br>
                        <label><b>'.$director["genre"].' DE EDUCACIÓN SUPERIOR</b></label>
                        <br><br><br><br>
                        _________________________________________________
                        <br>
                        ' . $director["name"] . '
                    </td>
                </tr>
            </table>
            <div style="margin-top:15px;"></div>
            <table width="100%">
                <tr style="border-spacing: 0px !important;">
                    <td style="width:45%;line-height:0.5cm;">
                        <table align="center" border="1" class="border" style="padding-right:20px; margin:0; width:100%">
                            <tr>
                                <td class="bg-gray" style="margin:0; padding:0;"> 
                                    <p style="font-size: 10px; text-align:center; line-height:1;margin-top:5px; margin-bottom:5px;">DEPARTAMENTO DE SERVICIOS ESCOLARES</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="border">
                                    <p style="text-align: right; font-size: 8pt; line-height:0.5cm">
                                        <b>
                                        No. __________________________________________<br>
                                     LIBRO: __________________________________________<br>
                                      FOJA: __________________________________________<br>
                                     FECHA: __________________________________________<br>
                                        </b>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-gray" style="margin:0; padding:0;">
                                    <p style="font-size: 10px; text-align:center; line-height:1;margin-top:5px; margin-bottom:5px;">COTEJÓ</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="border" style="text-align: center;">
                                    <br><br>
                                    <span style="font-size: 6pt;">
                                        ' . $comparison["name"] . '  
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-gray" style="margin:0; padding:0;"> 
                                    <p style="font-size: 10px; text-align:center; line-height:1;margin-top:5px; margin-bottom:5px;">' . $head["genre"] . ' DE LA OFICINA</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="border" style="text-align: center;">
                                    <br><br>
                                    <span style="font-size: 6pt;">
                                        ' . $head["name"] . '
                                    </span>
                                </td>
                            </tr>
                        </table>                        
                    </td>
                    <td style="width:55%;" valign="top">
                        <p style="font-size: 9px;line-height:1.5; text-align:justify;">
                            CON FUNDAMENTO EN EL ARTÍCULO 29, FRACCIÓN X DE LA LEY ORGÁNICA DE LA ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, 27 FRACCIÓN XX DEL REGLAMENTO INTERIOR DE LA SECRETARÍA GENERAL DE GOBIERNO:
                        </p>
                        <p style="font-size: 9px;line-height:1.5; text-align:justify;">
                            SE LEGALIZA, PREVIO COTEJO CON LA EXISTENTE EN EL CONTROL RESPECTIVO, LA FIRMA QUE ANTECEDE CORRESPONDE ' . $prefijoDirector . ' DE EDUCACIÓN SUPERIOR:
                        </p>
                        <p style="font-size: 7pt; text-align: center;">
                            ' . $director["name"] . '<br>
                            ___________________________________________________________________________
                        </p>
                        <p style="font-size: 7pt; text-align: center;">
                            TUXTLA GUTIÉRREZ, CHIAPAS; A _____________________________________________
                        </p><br>
                        <p style="font-size: 7pt; text-align: center;">
                            ' . $coordinator["genre"] . ' DE ASUNTOS JURÍDICOS DE GOBIERNO
                        </p><br><br>
                        <p style="font-size: 7pt; text-align: center;">
                        ____________________________________________<br>
                            ' . $coordinator["name"] . '
                        </p>
                    </td>
                </tr>
            </table>
            <br>
            <p style="font-size: 6pt; text-align: center;"><b>ESTE DOCUMENTO NO ES VÁLIDO SI PRESENTA RASPADURAS O ENMENDADURAS</b></p>';
    if ($itemStudent !== end($students)) {
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
$mipdf->set_paper("legal", "portrait");
# Cargamos el contenido HTML.
$mipdf->load_html($html);
# Renderizamos el documento PDF.
$mipdf->render();
# Enviamos el fichero PDF al navegador.
$mipdf->stream('Certificado.pdf', array('Attachment' => 0));
