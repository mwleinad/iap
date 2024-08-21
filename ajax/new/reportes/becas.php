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
$spreadsheet->getDefaultStyle()->getFont()->setSize(14);
$sheet = $spreadsheet->getActiveSheet();

$posgrado = $courseData['major_name'] . " EN " . str_replace("NUEVO PROGRAMA", "", $courseData['subject_name']);

$sheet->setCellValue('A1', 'POSGRADO:');
$sheet->getStyle('A1')->getAlignment()->setHorizontal('right')->setVertical('center');
$sheet->getStyle('A1')->getFont()->setBold(true);
$sheet->setCellValue('B1', $posgrado);
$sheet->mergeCells('B1:H1');

$sheet->setCellValue('A2', 'GRUPO:');
$sheet->getStyle('A2')->getAlignment()->setHorizontal('right')->setVertical('center');
$sheet->setCellValue('B2', $courseData['group']);
$sheet->getStyle('A2')->getFont()->setBold(true);

$sheet->setCellValue('A3', mb_strtoupper($courseData['tipo']) . ":");
$sheet->getStyle('A3')->getAlignment()->setHorizontal('right')->setVertical('center');
$sheet->getStyle('A3')->getFont()->setBold(true);
$sheet->setCellValue('B3', $periodoActual);
$sheet->getStyle('B3')->getAlignment()->setHorizontal('left')->setVertical('center');

$sheet->setCellValue("C5", "BECAS");

$sheet->setCellValue("A6", "USUARIO");
$sheet->setCellValue("B6", "NOMBRE");
$auxColumnBegin = "B";
foreach ($conceptosData['periodicos'] as $data) {
    $auxColumnBegin++;
    $sheet->setCellValue("{$auxColumnBegin}6", mb_strtoupper($data['concepto_nombre']));
}
$sheet->mergeCells("C5:{$auxColumnBegin}5");
$sheet->getStyle('C5')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('C5')->getFont()->setBold(true);
$sheet->getStyle("A6:{$auxColumnBegin}6")->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle("A6:{$auxColumnBegin}6")->getFont()->setBold(true);

$auxRow = 6;
$auxColumnDeuda = 0;
$auxColumnProximos = 0;
$auxColumnProximosPago = 0;
foreach ($alumnos as $alumno) {
    $auxColumn = "B";
    $auxRow++;
    $sheet->setCellValue("A{$auxRow}", $alumno['controlNumber']);
    $sheet->setCellValue("B{$auxRow}", $alumno['names'] . " " . $alumno['lastNamePaterno'] . " " . $alumno['lastNameMaterno']);
    $adeudo = 0;
    foreach ($alumno['becas'] as $beca) {
        $auxColumn++;
        $sheet->setCellValue("{$auxColumn}{$auxRow}", $beca['beca'] . "%");
    }
    $auxColumn++;
    $auxColumnDeuda = $auxColumn;
    $sheet->setCellValue("{$auxColumn}{$auxRow}", "$" . number_format($alumno['pagado'], 2));

    $auxColumn++;
    $sheet->setCellValue("{$auxColumn}{$auxRow}", "$" . number_format($alumno['deuda'], 2));

    foreach ($alumno['proximos'] as $proximo) {
        $auxColumn++;
        $sheet->setCellValue("{$auxColumn}{$auxRow}", $proximo);
    }
    $auxColumnProximosPago = $auxColumn;
    $auxColumn++;
    $sheet->setCellValue("{$auxColumn}{$auxRow}", "$" . number_format($alumno['proximo'], 2));
}

$sheet->setCellValue("{$auxColumnDeuda}6", "MONTO PAGADO");
$sheet->getStyle("{$auxColumnDeuda}6")->getFont()->setBold(true);
$sheet->getStyle("{$auxColumnDeuda}6")->getAlignment()->setHorizontal('center')->setVertical('center');

$auxColumnDeuda++;
$sheet->setCellValue("{$auxColumnDeuda}6", "DEUDA ACTUAL");
$sheet->getStyle("{$auxColumnDeuda}6")->getFont()->setBold(true);
$sheet->getStyle("{$auxColumnDeuda}6")->getAlignment()->setHorizontal('center')->setVertical('center');

$auxColumnDeuda++;
$auxColumnProximos = $auxColumnDeuda;
$sheet->setCellValue("{$auxColumnProximos}5", "PRÓXIMOS PAGOS");
$sheet->getStyle("{$auxColumnProximos}5")->getFont()->setBold(true);
$sheet->getStyle("{$auxColumnProximos}5")->getAlignment()->setHorizontal('center')->setVertical('center');

$sheet->mergeCells("{$auxColumnProximos}5:{$auxColumnProximosPago}5");
foreach ($conceptosProximos as $concepto) {
    $sheet->setCellValue("{$auxColumnProximos}6", mb_strtoupper($concepto['nombre']));
    $sheet->getStyle("{$auxColumnProximos}6")->getFont()->setBold(true);
    $sheet->getStyle("{$auxColumnProximos}6")->getAlignment()->setHorizontal('center')->setVertical('center');
    $auxColumnProximos++;
}

$sheet->setCellValue("{$auxColumnProximos}6","INGRESO ESTIMADO");
$sheet->getStyle("{$auxColumnProximos}6")->getFont()->setBold(true);
$sheet->getStyle("{$auxColumnProximos}6")->getAlignment()->setHorizontal('center')->setVertical('center');

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
