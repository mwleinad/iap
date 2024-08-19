<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$spreadsheet = new Spreadsheet();
// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Reporte de Becas')
    ->setSubject('Alumnos')
    ->setDescription('Reporte de cuántos alumnos tienen cierta beca por grupos')
    ->setKeywords('Alumnos')
    ->setCategory('Reportes');
$sheet = $spreadsheet->getActiveSheet();

$posgrado = $courseData['major_name']." EN ". str_replace("NUEVO PROGRAMA", "", $courseData['subject_name']);

$sheet->setCellValue('A1', 'POSGRADO:');
$sheet->getStyle('A1')->getAlignment()->setHorizontal('right')->setVertical('center'); 
$sheet->getStyle('A1')->getFont()->setSize(14)->setBold(true);
$sheet->setCellValue('B1', $posgrado);
$sheet->mergeCells('B1:H1'); 

$sheet->setCellValue('A2', 'GRUPO:'); 
$sheet->getStyle('A2')->getAlignment()->setHorizontal('right')->setVertical('center'); 
$sheet->setCellValue('B2', $courseData['group']); 
$sheet->getStyle('A2')->getFont()->setSize(14)->setBold(true); 

$sheet->setCellValue('A3', mb_strtoupper($courseData['tipo']).":");
$sheet->getStyle('A3')->getAlignment()->setHorizontal('right')->setVertical('center'); 
$sheet->getStyle('A3')->getFont()->setSize(14)->setBold(true); 
$sheet->setCellValue('B3', $periodoActual); 

foreach ($variable as $key => $value) {
    # code...
}

$spreadsheet->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$spreadsheet->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$spreadsheet->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$spreadsheet->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);
// $sheet->setCellValue('A1', 'Posgrado');
// $sheet->setCellValue('B1', 'Currícula');
// $sheet->setCellValue('C1', 'Grupo');
// $sheet->setCellValue('D1', 'Alumno');
// $sheet->setCellValue('E1', 'Periodo');
// $sheet->setCellValue('F1', 'Concepto');
// $sheet->setCellValue('G1', 'Beca'); 
// $sheet->getStyle('A')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('A')->getFont()->setSize(14)->setBold(true);
// $sheet->getStyle('B')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('B')->getFont()->setSize(14)->setBold(true);
// $sheet->getStyle('C')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('C')->getFont()->setSize(14)->setBold(true);
// $sheet->getStyle('D')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('D')->getFont()->setSize(14)->setBold(true);
// $sheet->getStyle('E')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('E')->getFont()->setSize(14)->setBold(true);
// $sheet->getStyle('F')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('F')->getFont()->setSize(14)->setBold(true);
// $sheet->getStyle('G')->getAlignment()->setHorizontal('center')->setVertical('center');
// $sheet->getStyle('G')->getFont()->setSize(14)->setBold(true); 
// $row = 2;
// foreach ($data as $item) {
//     $sheet->setCellValue("A{$row}", $item['posgrado']);
//     $sheet->setCellValue("B{$row}", $item['name']);
//     $sheet->setCellValue("C{$row}", $item['group']);
//     $sheet->setCellValue("D{$row}", $item['alumno']);
//     $sheet->setCellValue("E{$row}", $item['periodo']);
//     $sheet->setCellValue("F{$row}", $item['concepto']); 
//     $sheet->setCellValue("G{$row}", $item['beca']); 
//     $row++;
// }

$sheet->getStyle("A1:C5")->getAlignment()->setWrapText(true); 

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="becas.xls"');
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
