<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$spreadsheet = new Spreadsheet();
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Reporte de Pagos por Grupos entre Fechas')
    ->setSubject('Grupos')
    ->setDescription('Reporte de estado de cuenta de grupos')
    ->setKeywords('Alumnos, Reportes, Pagos, Periodos')
    ->setCategory('Reportes');
$spreadsheet->getDefaultStyle()->getFont()->setName('Times New Roman');
$spreadsheet->getDefaultStyle()->getFont()->setSize(12);
$sheet = $spreadsheet->getActiveSheet();
$drawing = new Drawing();
$drawing->setName('LOGO IAP');
$drawing->setPath('../../images/logos/Logo_3.png');
$drawing->setHeight(70);
$drawing->setCoordinates('A1');
$drawing->setOffsetX(10);
$drawing->setWorksheet($sheet);
$sheet->mergeCells('A1:C4');

// $sheet->getColumnDimension('I')->setWidth(20);  
$sheet->setCellValue('D1', 'INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS');
$sheet->setCellValue('D2', 'Libramiento Norte Poniente 2718 Fracc. Ladera de la Loma');
$sheet->setCellValue('D3', 'Tuxtla Gutiérrez, Chiapas');
$sheet->setCellValue('D4', 'ESTADO DE CUENTA GRUPAL');

$sheet->mergeCells('D1:L1')->getStyle('D1:L1')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D1')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D2:L2')->getStyle('D2:L2')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D2')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D3:L3')->getStyle('D3:L3')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D3')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D4:L4')->getStyle('D4:L4')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D4')->getFont()->setSize(15)->setBold(true);
$sheet->setCellValue("A6", $fecha_inicio." - ".$fecha_fin)->mergeCells("A6:L6")->getStyle('A6:L6')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('A6')->getFont()->setSize(15)->setBold(true);;

$fila = 7;
$infoActual = [];
$infoTotales = [];

$sheet->setCellValue("A{$fila}", "CONCEPTO")->mergeCells("A{$fila}:B{$fila}");
$sheet->setCellValue("C{$fila}", "IMPORTE INICIAL")->mergeCells("C{$fila}:D{$fila}");
$sheet->setCellValue("E{$fila}", "DESCUENTO")->mergeCells("E{$fila}:F{$fila}");
$sheet->setCellValue("G{$fila}", "IMPORTE FINAL")->mergeCells("G{$fila}:H{$fila}");
$sheet->setCellValue("I{$fila}", "IMPORTE PAGADO")->mergeCells("I{$fila}:J{$fila}");
$sheet->setCellValue("K{$fila}", "IMPORTE PENDIENTE")->mergeCells("K{$fila}:L{$fila}");
$sheet->getStyle("A{$fila}:L{$fila}")->getFont()->setBold(true);
$sheet->getRowDimension($fila)->setRowHeight(25);
$fila++;
foreach ($resultado['periodicos'] as $item) {
    foreach ($item as $data) {
        $pendiente = $data['total'] - $data['pagado'];
        $sheet->setCellValue("A{$fila}", $data['concepto'])->mergeCells("A{$fila}:B{$fila}");
        $sheet->setCellValue("C{$fila}", $data['subtotal'])->mergeCells("C{$fila}:D{$fila}")->getStyle("C{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("E{$fila}", $data['descuento'])->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("G{$fila}", $data['total'])->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("I{$fila}", $data['pagado'])->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("K{$fila}", $pendiente)->mergeCells("K{$fila}:L{$fila}")->getStyle("K{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $fila++;
    }
}
$sheet->getStyle("A7:N{$fila}")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true); 
// Redirect output to a client’s web browser (Xls)
$fileName = bin2hex(random_bytes(4));
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="grupo' . $fileName . '.xls"');
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
