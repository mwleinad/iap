<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;

$students = $student->evaluaciones_diplomado(); 
$spreadsheet = new Spreadsheet();
$spreadsheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(30);
// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Evaluaciones Curso Cobach')
    ->setSubject('Alumnos')
    ->setDescription('Evaluaciones del Curso Formación Académica Continua')
    ->setKeywords('Alumnos')
    ->setCategory('Cursos');
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Usuario');
$sheet->setCellValue('B1', 'Nombre');
$sheet->setCellValue('C1', 'Apellido Paterno');
$sheet->setCellValue('D1', 'Apellido Materno');
$sheet->setCellValue('E1', 'Evaluación Módulo 1 | Semana 1'); 
$sheet->setCellValue('F1', 'Evaluación Módulo 1 | Semana 2');
$sheet->setCellValue('G1', 'Evaluación Módulo 2 | Semana 1');
$sheet->setCellValue('H1', 'Evaluación Módulo 2 | Semana 2');
$sheet->setCellValue('I1', 'Evaluación Módulo 2 | Semana 3');
$sheet->setCellValue('J1', 'Evaluación Módulo 2 | Semana 4');
$sheet->setCellValue('K1', 'Evaluación Módulo 2 | Semana 5');
$sheet->setCellValue('L1', 'Evaluación Módulo 3 | Semana 1');
$sheet->setCellValue('M1', 'Evaluación Módulo 3 | Semana 2');
$sheet->setCellValue('N1', 'Evaluación Módulo 3 | Semana 3');
$sheet->setCellValue('O1', 'Evaluación Módulo 4 | Semana 1');
$sheet->setCellValue('P1', 'Evaluación Módulo 4 | Semana 2');
$sheet->setCellValue('Q1', 'Evaluación Módulo 4 | Semana 3');
$sheet->setCellValue('R1', 'Evaluación Módulo 5 | Semana 1');
$sheet->setCellValue('S1', 'Evaluación Módulo 6 | Semana 1'); 

$sheet->getStyle('A')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('A')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('B')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('B')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('C')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('C')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('D')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('E')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('E')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('F')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('F')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('G')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('G')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('H')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('H')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('I')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('I')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('J')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('J')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('K')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('K')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('L')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('L')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('M')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('M')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('N')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('N')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('O')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('O')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('P')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('P')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('Q')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('Q')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('R')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('R')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('S')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('S')->getFont()->setSize(14)->setBold(true);


for ($i = 0; $i < (count($students)); $i++) {
    $sheet->setCellValue("A" . ($i + 2), $students[$i]['usuario']);
    $sheet->setCellValue("B" . ($i + 2), mb_strtoupper($students[$i]['names']));
    $sheet->setCellValue("C" . ($i + 2), mb_strtoupper($students[$i]['lastNamePaterno']));
    $sheet->setCellValue("D" . ($i + 2), mb_strtoupper($students[$i]['lastNameMaterno']));
    $sheet->setCellValue("E" . ($i + 2), $students[$i]['actividad_1']); 
    $sheet->setCellValue("F" . ($i + 2), $students[$i]['actividad_2']); 
    $sheet->setCellValue("G" . ($i + 2), $students[$i]['actividad_3']); 
    $sheet->setCellValue("H" . ($i + 2), $students[$i]['actividad_4']); 
    $sheet->setCellValue("I" . ($i + 2), $students[$i]['actividad_5']); 
    $sheet->setCellValue("J" . ($i + 2), $students[$i]['actividad_6']); 
    $sheet->setCellValue("K" . ($i + 2), $students[$i]['actividad_7']); 
    $sheet->setCellValue("L" . ($i + 2), $students[$i]['actividad_8']); 
    $sheet->setCellValue("M" . ($i + 2), $students[$i]['actividad_9']); 
    $sheet->setCellValue("N" . ($i + 2), $students[$i]['actividad_10']); 
    $sheet->setCellValue("O" . ($i + 2), $students[$i]['actividad_11']); 
    $sheet->setCellValue("P" . ($i + 2), $students[$i]['actividad_12']); 
    $sheet->setCellValue("Q" . ($i + 2), $students[$i]['actividad_13']); 
    $sheet->setCellValue("R" . ($i + 2), $students[$i]['actividad_14']); 
    $sheet->setCellValue("S" . ($i + 2), $students[$i]['actividad_15']); 
}

$sheet->getStyle("A2:S" . (count($students) + 1))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="evaluaciones_diplomado_' . $fileName . '.xls"');
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
