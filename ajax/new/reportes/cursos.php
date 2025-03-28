<?php
include_once('../../../init.php');
include_once('../../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;

// $students = $student->evaluaciones_diplomado(); 
$headings = $course->getHeadersActivities("AND course_module.courseId = {$_GET['curso']}"); 
$students = $course->getStudents("AND user_subject.courseId = {$_GET['curso']}"); 
$spreadsheet = new Spreadsheet();
$spreadsheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(30);
// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Evaluaciones Curso')
    ->setSubject('Alumnos')
    ->setDescription('Evaluaciones del Curso Formación Académica Continua')
    ->setKeywords('Alumnos')
    ->setCategory('Cursos');
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Usuario');
$sheet->setCellValue('B1', 'Contraseña');
$sheet->setCellValue('C1', 'Nombre');
$sheet->setCellValue('D1', 'Apellido Paterno');
$sheet->setCellValue('E1', 'Apellido Materno'); 
$sheet->setCellValue('F1', 'Telefono');
$sheet->setCellValue('G1', 'Lugar de Trabajo');
$sheet->setCellValue('H1', 'Curp');
$sheet->setCellValue('I1', 'Curp Archivo');

$auxHeading = "J";

foreach ($headings as $item) {
    $sheet->setCellValue("{$auxHeading}1", $item['resumen']);
    $auxHeading++;
}
$sheet->setCellValue("{$auxHeading}1", 'Pago');
$auxHeading++;
$sheet->setCellValue("{$auxHeading}1", 'Evaluación');
$auxRow = 2;
for ($i = 0; $i < (count($students)); $i++) {
    $curp = json_decode($students[$i]['curpDrive'], true);
    $sheet->setCellValue("A" . ($i + 2), $students[$i]['controlNumber']);
    $sheet->setCellValue("B" . ($i + 2), $students[$i]['password']);
    $sheet->setCellValue("C" . ($i + 2), mb_strtoupper($students[$i]['names']));
    $sheet->setCellValue("D" . ($i + 2), mb_strtoupper($students[$i]['lastNamePaterno']));
    $sheet->setCellValue("E" . ($i + 2), mb_strtoupper($students[$i]['lastNameMaterno'])); 
    $sheet->setCellValue("F" . ($i + 2), $students[$i]['mobile']);
    $sheet->setCellValue("G" . ($i + 2), $students[$i]['workplace']);
    $sheet->setCellValue("H" . ($i + 2), $students[$i]['curp']);
    $sheet->setCellValue("I" . ($i + 2), $curp['urlBlank']);
    $sheet->getCell('I' . ($i + 2))->getHyperlink()->setUrl($curp['urlBlank']);
    $auxColumn = "J";
    foreach ($headings as $heading) {
        if ($heading['activityType'] == "Tarea") {
            $data = $student->getActivityScore($heading['activityType'], "AND userId = {$students[$i]['userId']} AND activityId = {$heading['activityId']}");  
            $sheet->setCellValue("{$auxColumn}{$auxRow}", (!isset($data['homeworkId'])  ? "NO ENTREGÓ" : WEB_ROOT."/homework/".$data['path']));
            if (isset($data['homeworkId'])) {
                $sheet->getCell("{$auxColumn}{$auxRow}")->getHyperlink()->setUrl(WEB_ROOT."/homework/".$data['path']);
            }
        }
        if ($heading['activityType'] == "Examen") {
            $data = $student->getActivityScore($heading['activityType'], "AND userId = {$students[$i]['userId']} AND activityId = {$heading['activityId']}");  
            $sheet->setCellValue("{$auxColumn}{$auxRow}", ($data ? $data['ponderation'] : "NO PRESENTÓ"));
        }
        $auxColumn++;
    }
    $statusPayment = $students[$i]['status_payment'] == 1 ? "Pagado" : "Pendiente";
    $statusEvaluation = $students[$i]['status_evaluation'] == 1 ? "Sí" : "No";
    $sheet->setCellValue("{$auxColumn}{$auxRow}", $statusPayment);
    $auxColumn++;
    $sheet->setCellValue("{$auxColumn}{$auxRow}", $statusEvaluation);
    $auxRow++;
}
 

$sheet->getStyle("A2:$auxHeading" . (count($students) + 1))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="evaluaciones_cursos_' . $fileName . '.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header('Pragma: public'); // HTTP/1.0

$writer = IOFactory::createWriter($spreadsheet, 'Xls');
$writer->save('php://output');
