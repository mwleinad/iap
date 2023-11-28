<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

 
$spreadsheet = new Spreadsheet();
$spreadsheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(30);
// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Reporte de Becas')
    ->setSubject('Alumnos')
    ->setDescription('Reporte de cuántos alumnos tienen cierta beca por grupos')
    ->setKeywords('Alumnos')
    ->setCategory('Reportes');
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Posgrado');
$sheet->setCellValue('B1', 'Currícula');
$sheet->setCellValue('C1', 'Grupo');
$sheet->setCellValue('D1', 'Periodo');
$sheet->setCellValue('E1', 'Concepto');
$sheet->setCellValue('F1', 'Beca');
$sheet->setCellValue('G1', 'Cantidad');

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

$row = 2;
$rowInicial = 2;
$rowCollapse = 0;
foreach ($data as $key => $cursos) { //cursos
    foreach ($cursos as $periodos => $periodo) { //Periodos
        foreach ($periodo as $conceptos => $concepto) {
            foreach ($concepto as $becas => $beca) { 
                $sheet->setCellValue('D' .$row, $periodos);
                $sheet->setCellValue('E' .$row, $conceptos);
                $sheet->setCellValue('F' .$row, $becas);
                $sheet->setCellValue('G' .$row, $beca);
                $row++;
            } 
        } 
    }
    $sheet->setCellValue('A' .$rowInicial, $curricula[$key]['posgrado']);
    $sheet->setCellValue('B' .$rowInicial, $curricula[$key]['curricula']);
    $sheet->setCellValue('C' .$rowInicial, $curricula[$key]['group']);
    $sheet->mergeCells('A'.$rowInicial.':A'.($row-1)); 
    $sheet->mergeCells('B'.$rowInicial.':B'.($row-1)); 
    $sheet->mergeCells('C'.$rowInicial.':C'.($row-1)); 
    $sheet->getStyle('A')->getAlignment()->setHorizontal('center')->setVertical('center');
    $sheet->getStyle('B')->getAlignment()->setHorizontal('center')->setVertical('center');
    $sheet->getStyle('C')->getAlignment()->setHorizontal('center')->setVertical('center');
    $rowInicial = $row;
} 

// $sheet->getStyle("A2:I" . (count($students) + 1))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="becas' . $fileName . '.xls"');
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
