<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$spreadsheet = new Spreadsheet();
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Reporte de Pagos por Grupos')
    ->setSubject('Grupos')
    ->setDescription('Reporte de estado de cuenta del grupo')
    ->setKeywords('Alumnos, Reportes, Pagos, Periodos')
    ->setCategory('Reportes');
$spreadsheet->getDefaultStyle()->getFont()->setName('Times New Roman');
$spreadsheet->getDefaultStyle()->getFont()->setSize(12);
$curso = $course->Info();
$intervalo = new DateInterval("P3M");
if ($curso['tipoCuatri'] == "Semestre") {
    $intervalo = new DateInterval("P5M");
}
$cicloText = "";
$ciclo = new DateTime($curso['initialDate']);
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

$sheet->mergeCells('D1:N1')->getStyle('D1:N1')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D1')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D2:N2')->getStyle('D2:N2')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D2')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D3:N3')->getStyle('D3:N3')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D3')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D4:N4')->getStyle('D4:N4')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D4')->getFont()->setSize(15)->setBold(true);

$sheet->getRowDimension(6)->setRowHeight(30);
$sheet->setCellValue("A6", "NIVEL ACADÉMICO:")->mergeCells("A6:C6")->getStyle("A6")->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle("A6")->getFont()->setBold(true);
$sheet->setCellValue("D6", $curso['majorName'] . " " . $curso['name'])->mergeCells("D6:H6")->getStyle("D6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);
$sheet->setCellValue("I6", "GRUPO:")->mergeCells("I6:J6")->getStyle("I6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);
$sheet->getStyle("I6")->getFont()->setBold(true);
$sheet->setCellValue("K6", $curso['group'])->getStyle("K6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$fila = 7;
$infoActual = [];
$infoTotales = [];
$fechaActual = new DateTime();
foreach ($resultado['periodicos'] as $item) {
    $sheet->setCellValue("A{$fila}", "CICLO ESCOLAR:")->mergeCells("A{$fila}:B{$fila}");
    $sheet->setCellValue("C{$fila}", "{$ciclo->format('Y')}-" . ($ciclo->format('Y') + 1));
    $sheet->getStyle("A{$fila}")->getFont()->setBold(true);

    $cicloText .= $util->GetMonthByKey($ciclo->format('n')) . " - ";
    $ciclo->add($intervalo);
    $cicloText .= $util->GetMonthByKey($ciclo->format('n'));
    $ciclo = $ciclo->add(new DateInterval("P1M"));

    $sheet->setCellValue("D{$fila}", "PERIODO:");
    $sheet->getColumnDimension('D')->setWidth(20, 'pt');
    $sheet->getColumnDimension('M')->setWidth(11, 'pt');
    $sheet->getColumnDimension('N')->setWidth(11, 'pt');
    $sheet->setCellValue("E{$fila}", $cicloText)->mergeCells("E{$fila}:F{$fila}");
    $sheet->getStyle("D{$fila}")->getFont()->setBold(true);
    $fila++;
    $filaConcepto = 0;
    $flag = true;
    if ($flag) {
        $sheet->setCellValue("A{$fila}", "FECHA")->mergeCells("A{$fila}:B{$fila}");
        $sheet->setCellValue("C{$fila}", "CONCEPTO")->mergeCells("C{$fila}:D{$fila}");
        $sheet->setCellValue("E{$fila}", "IMPORTE INICIAL")->mergeCells("E{$fila}:F{$fila}");
        $sheet->setCellValue("G{$fila}", "DESCUENTO")->mergeCells("G{$fila}:H{$fila}");
        $sheet->setCellValue("I{$fila}", "IMPORTE FINAL")->mergeCells("I{$fila}:J{$fila}");
        $sheet->setCellValue("K{$fila}", "IMPORTE PAGADO")->mergeCells("K{$fila}:L{$fila}");
        $sheet->setCellValue("M{$fila}", "IMPORTE PENDIENTE")->mergeCells("M{$fila}:N{$fila}");
        $sheet->getStyle("A{$fila}:M{$fila}")->getFont()->setBold(true);
        $sheet->getRowDimension($fila)->setRowHeight(25);
        $fila++;
        $filaConcepto = $fila;
        $flag = false;
    }
    foreach ($item as $data) {
        $pendiente = $data['total'] - $data['pagado'];
        $sheet->setCellValue("A{$fila}", $data['fecha_limite'])->mergeCells("A{$fila}:B{$fila}")->getStyle("A{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY);

        $sheet->setCellValue("C{$fila}", $data['concepto'] . " " . $data['indice'])->mergeCells("C{$fila}:D{$fila}");

        $sheet->setCellValue("E{$fila}", $data['subtotal'])->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

        $sheet->setCellValue("G{$fila}", $data['descuento'])->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

        $sheet->setCellValue("I{$fila}", $data['total'])->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

        $sheet->setCellValue("K{$fila}", $data['pagado'])->mergeCells("K{$fila}:L{$fila}")->getStyle("K{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

        $sheet->setCellValue("M{$fila}", $pendiente)->mergeCells("M{$fila}:N{$fila}")->getStyle("M{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

        $fechaLimite = new DateTime($data['fecha_limite']);
        $vigente = $fechaLimite < $fechaActual ? true : false;
        if ($vigente) {
            $infoActual['importeInicial'] .= "E{$fila},";
            $infoActual['descuento'] .= "G{$fila},";
            $infoActual['importeFinal'] .= "I{$fila},";
            $infoActual['importePagado'] .= "K{$fila},";
            $infoActual['importePendiente'] .= "M{$fila},";
        }

        $fila++;
    }
    $sheet->setCellValue("E{$fila}", "=SUM(E{$filaConcepto}:E" . ($fila - 1) . ")")->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $infoTotales['importeInicial'] .= "E{$fila},";
    $sheet->setCellValue("G{$fila}", "=SUM(G{$filaConcepto}:G" . ($fila - 1) . ")")->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $infoTotales['descuento'] .= "G{$fila},";
    $sheet->setCellValue("I{$fila}", "=SUM(I{$filaConcepto}:I" . ($fila - 1) . ")")->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $infoTotales['importeFinal'] .= "I{$fila},";
    $sheet->setCellValue("K{$fila}", "=SUM(K{$filaConcepto}:K" . ($fila - 1) . ")")->mergeCells("K{$fila}:L{$fila}")->getStyle("K{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $infoTotales['importePagado'] .= "K{$fila},";
    $sheet->setCellValue("M{$fila}", "=SUM(M{$filaConcepto}:M" . ($fila - 1) . ")")->mergeCells("M{$fila}:N{$fila}")->getStyle("M{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $infoTotales['importePendiente'] .= "M{$fila},";
    $fila++;
    $cicloText = "";
}
$fila = $fila + 2;
$sheet->setCellValue("E{$fila}", "COBRANZA GENERAL")->mergeCells("E{$fila}:N{$fila}");
$fila++;
$sheet->setCellValue("E{$fila}", "IMPORTE INICIAL TOTAL")->mergeCells("E{$fila}:F{$fila}");
$sheet->setCellValue("G{$fila}", "DESCUENTO TOTAL")->mergeCells("G{$fila}:H{$fila}");
$sheet->setCellValue("I{$fila}", "IMPORTE FINAL TOTAL")->mergeCells("I{$fila}:J{$fila}");
$sheet->setCellValue("K{$fila}", "PAGO TOTAL")->mergeCells("K{$fila}:L{$fila}");
$sheet->setCellValue("M{$fila}", "DEUDA TOTAL")->mergeCells("M{$fila}:N{$fila}");
$fila++;
$sheet->setCellValue("E{$fila}", "=SUM(" . substr($infoTotales['importeInicial'], 0, -1) . ")")->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("G{$fila}", "=SUM(" . substr($infoTotales['descuento'], 0, -1) . ")")->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("I{$fila}", "=SUM(" . substr($infoTotales['importeFinal'], 0, -1) . ")")->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("K{$fila}", "=SUM(" . substr($infoTotales['importePagado'], 0, -1) . ")")->mergeCells("K{$fila}:L{$fila}")->getStyle("K{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("M{$fila}", "=SUM(" . substr($infoTotales['importePendiente'], 0, -1) . ")")->mergeCells("M{$fila}:N{$fila}")->getStyle("M{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);  

$fechaLimite = new DateTime($curso['finalDate']); 
if ($fechaLimite > $fechaActual) { //Grupo vigente
    $fila = $fila + 2;    
    $sheet->setCellValue("E{$fila}", "COBRANZA HASTA EL DÍA ".date('Y-m-d'))->mergeCells("E{$fila}:N{$fila}");
    $fila++;
    $sheet->setCellValue("E{$fila}", "IMPORTE INICIAL")->mergeCells("E{$fila}:F{$fila}");
    $sheet->setCellValue("G{$fila}", "DESCUENTO")->mergeCells("G{$fila}:H{$fila}");
    $sheet->setCellValue("I{$fila}", "IMPORTE FINAL")->mergeCells("I{$fila}:J{$fila}");
    $sheet->setCellValue("K{$fila}", "PAGO")->mergeCells("K{$fila}:L{$fila}");
    $sheet->setCellValue("M{$fila}", "DEUDA")->mergeCells("M{$fila}:N{$fila}");
    $fila++;
    $sheet->setCellValue("E{$fila}", "=SUM(" . substr($infoActual['importeInicial'], 0, -1) . ")")->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $sheet->setCellValue("G{$fila}", "=SUM(" . substr($infoActual['descuento'], 0, -1) . ")")->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $sheet->setCellValue("I{$fila}", "=SUM(" . substr($infoActual['importeFinal'], 0, -1) . ")")->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $sheet->setCellValue("K{$fila}", "=SUM(" . substr($infoActual['importePagado'], 0, -1) . ")")->mergeCells("K{$fila}:L{$fila}")->getStyle("K{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $sheet->setCellValue("M{$fila}", "=SUM(" . substr($infoActual['importePendiente'], 0, -1) . ")")->mergeCells("M{$fila}:N{$fila}")->getStyle("M{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
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
