<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');

use Dompdf\Dompdf;
use Dompdf\Options;

setlocale(LC_TIME, 'es_ES.UTF-8');

$estudianteID = $_GET['estudiante'];
$student->setUserId($estudianteID);
$historial = $student->getHistory();
// echo "<pre>";
// print_r($historial);
// exit;
$primerCurso = $student->primerCurso(); //Obtiene el primer curso si es un temporal. 
$infoStudent = $student->GetInfo();

$imagen = file_get_contents(DOC_ROOT . "/images/logo_correo.jpg");
$logo_IAP = 'data:image/jpg;base64,' . base64_encode($imagen);

$html .= ' <table style="width:100%; font-family:arial;">
            <tr>
                <td style="width:35%"><img src="' . $logo_IAP . '" style="width:100%;"></td> 
                <td style="width:65%">
                    <div>
                        <h1 style="margin:0;padding:0">Historial de calificaciones</h1>
                        <h3 style="margin:0;padding:0;text-transform:uppercase;">' . $infoStudent['names'] . ' ' . $infoStudent['lastNamePaterno'] . ' ' . $infoStudent['lastNameMaterno'] . '</h3>
                    </div>
                </td>
            </tr> 
        </table>';
$tbody = "";
$has_modules_repeat = $student->hasModulesRepeat();
$qualifications_repeat = [];
if ($has_modules_repeat) {
    $tmp = $student->StudentModulesRepeat();
    foreach ($tmp as $item) {
        $qualifications_repeat[$item['subjectModuleId']] = [
            'name'             => $item['subjectModuleName'],
            'score'         => $item['score'],
            'period'        => $item['semesterId'],
            'courseId'        => $item['courseId']
        ];
    }
}
foreach ($historial as $key => $curso) {
    if ($curso['courseId'] == $primerCurso) {
        continue;
    }
    $course->setCourseId($curso['courseId']);
    $infoCourse = $course->Info();
    if (count($infoCourse['periodos']) == 0) { //No tiene los periodos definidos
        $tipo = $infoCourse['tipoPeriodo'] == "Cuatrimestre" ? 4 : 6;
        $periodos = $course->obtenerPeriodos($infoCourse['initialDate'], $infoCourse['finalDate'], $tipo);
        foreach ($periodos as $key => $periodo) {
            $aux = $key + 1;
            $course->savePeriod($infoCourse['courseId'], $aux, $periodo['periodBegin'], $periodo['periodEnd']);
        }
        $infoCourse['periodos'] = $periodos;
    }
    // print_r($infoCourse);
    $calificacionMinima = $infoCourse['majorName'] == "MAESTRÍA" ? 7 : 8;
    $matricula = $student->GetMatricula($curso['courseId']);
    $matricula = $matricula ? $matricula : "S/N";
    $nivelesValidos = $course->GetEnglishLevels();
    $html .= '<div style="width:100%; font-family: arial;">
                <h2 style="margin-top:0; margin-bottom:0;">' . $infoCourse['majorName'] . ' - ' . $infoCourse['name'] . '</h2> 
                <h3 style="margin-top:0; margin-bottom:0;">GRUPO: <span style="color:fca311;">' . $infoCourse['group'] . '</span></h3> 
                <h3 style="margin-top:0; margin-bottom:0;">Matrícula:' . $matricula . '</h3>  
            </div>';
    $eventos = explode(",", $curso['periodos']);
    $alta = $eventos[0];
    $baja = isset($eventos[1]) ? $eventos[1] : $infoCourse['totalPeriods'];
    for ($period = $alta; $period <= $baja; $period++) {
        $tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, true);
        $color = "";
        $etiqueta = $infoCourse['periodos'][$period - 1]['periodBegin'] . " - " . $infoCourse['periodos'][$period - 1]['periodEnd']; 
        $color = "style='padding:10px; background-color:green; color: white'"; 
        if ($baja == $period && isset($eventos[1])) {
            $color = "style='padding:10px; background-color:red; color: white'";
        }
        $html .= '<table style="width:100%; border-collapse: collapse; font-family:arial;">
                    <tbody>
                        <tr>
                            <td> 
                                <div ' . $color . '><strong>' . $infoCourse['tipoCuatri'] . ' ' . $period . ' ' . $etiqueta . '</strong></div>
                            </td>
                        </tr>
                    </tbody>
                </table>';
        if ($tmp) {
            foreach ($tmp as $item) {
                if (array_key_exists($item['subjectModuleId'], $qualifications_repeat)) {
                    $tbody .= "<tr>
                                    <td>{$qualifications_repeat[$item['subjectModuleId']]['name']}</td>
                                    <td>{$qualifications_repeat[$item['subjectModuleId']]['addepUp']}</td>
                                    <td>{$qualifications_repeat[$item['subjectModuleId']]['score']}</td>
                                    <td>REC</td>
                                </tr>";
                } else {
                    if ($item['tipo'] == 0 && isset($nivelesValidos[$estudianteID]) && in_array($period, $nivelesValidos[$estudianteID])) {
                        $item['score'] = 10;
                    }
                    $tbody .= "<tr>
                                    <td>{$item['name']}</td>
                                    <td style='text-align:center;'>" . round($item['addepUp'], 2, PHP_ROUND_HALF_DOWN) . "</td>
                                    <td style='text-align:center;'>{$item['score']}</td>
                                    <td></td>
                                </tr>";
                }
            }
            $html .= '<table style="width:100%; border-collapse: collapse; font-family:arialmt;">
                        <thead>
                            <tr>
                                <th style="width:40%">Materia</th>
                                <th style="width:25%">Calificación acumulada</th>
                                <th style="width:25%">Calificación final</th>
                                <th style="width:10%">Observación</th>
                            </tr>
                        </thead>
                        <tbody>
                            ' . $tbody . '
                        </tbody>
                    </table>';
            $tbody = "";
        } 
    }
    $html.='<div style="page-break-after:always;"></div>';
}
// exit;
$dompdf = new Dompdf();
//transform: rotate(10deg); transform-origin: 50%;
# Definimos el tamaño y orientación del papel que queremos.
# O por defecto cogerá el que está en el fichero de configuración.
$dompdf->set_paper("letter", "portrait");
# Cargamos el contenido HTML.
$dompdf->load_html($html);
# Renderizamos el documento PDF.
$dompdf->render();
# Enviamos el fichero PDF al navegador. 
$dompdf->stream("Chistorial.pdf", array('Attachment' => 0));
