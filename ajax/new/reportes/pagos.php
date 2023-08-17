<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$spreadsheet = new Spreadsheet();
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Reporte de Pagos')
    ->setSubject('Alumnos')
    ->setDescription('Reporte de pagos realizados por el alumno, seccionado por periodes.')
    ->setKeywords('Alumnos, Reportes, Pagos, Periodos')
    ->setCategory('Reportes');
$spreadsheet->getDefaultStyle()->getFont()->setName('Times New Roman');
$spreadsheet->getDefaultStyle()->getFont()->setSize(12);

$pagos = $conceptos->historial_pagos("periodo, status = 2 ASC, fecha_limite");
$curso = $course->Info();
$student->setUserId($alumno);
$infoAlumno = $student->GetInfo();
// echo "<pre>";
// print_r($curso);
// exit;
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
$sheet->setCellValue('D4', 'ESTADO DE CUENTA');

$sheet->mergeCells('D1:O1')->getStyle('D1:O1')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D1')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D2:O2')->getStyle('D2:O2')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D2')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D3:O3')->getStyle('D3:O3')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D3')->getFont()->setSize(14)->setBold(true);
$sheet->mergeCells('D4:O4')->getStyle('D4:O4')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D4')->getFont()->setSize(15)->setBold(true);

$sheet->getRowDimension(6)->setRowHeight(30);
$sheet->setCellValue("A6", "ALUMNO:")->mergeCells("A6:B6")->getStyle("A6")->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle("A6")->getFont()->setBold(true);
$sheet->setCellValue("C6", mb_strtoupper($infoAlumno['names']) . " " . mb_strtoupper($infoAlumno['lastNamePaterno']) . " " . mb_strtoupper($infoAlumno['lastNameMaterno']))->mergeCells("C6:F6")->getStyle("C6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$sheet->setCellValue("G6", "NIVEL ACADÉMICO:")->mergeCells("G6:I6")->getStyle("G6")->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle("G6")->getFont()->setBold(true);
$sheet->setCellValue("J6", $curso['majorName'] . " " . $curso['name'])->mergeCells("J6:M6")->getStyle("J6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$sheet->setCellValue("N6", "GRUPO:")->getStyle("N6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);
$sheet->getStyle("N6")->getFont()->setBold(true);
$sheet->setCellValue("O6", $curso['group'])->getStyle("O6")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);;

$fila = 7;
$importeActual = 0;
$descuentoActual = 0;
$pagoTotalActual = 0;
$deudaTotalActual = 0;
for ($periodo = 1; $periodo <= $curso['totalPeriods']; $periodo++) {
    $sheet->setCellValue("A{$fila}", "CICLO ESCOLAR:")->mergeCells("A{$fila}:B{$fila}");
    $sheet->setCellValue("C{$fila}", "{$ciclo->format('Y')}-" . ($ciclo->format('Y') + 1));
    $sheet->getStyle("A{$fila}")->getFont()->setBold(true);

    $cicloText .= $util->GetMonthByKey($ciclo->format('n')) . " - ";
    $ciclo->add($intervalo);
    $cicloText .= $util->GetMonthByKey($ciclo->format('n'));
    $ciclo = $ciclo->add(new DateInterval("P1M"));

    $sheet->setCellValue("D{$fila}", "PERIODO:")->mergeCells("D{$fila}:E{$fila}");
    $sheet->setCellValue("F{$fila}", $cicloText)->mergeCells("F{$fila}:G{$fila}");
    $sheet->getStyle("D{$fila}")->getFont()->setBold(true);

    $fila++;
    $deuda = 0;
    $pagot = 0;
    $flag = true;
    $existeDeuda = false;
    //Adeudos
    foreach ($pagos['periodicos'] as $key => $pago) {
        if ($pago['status'] == 2 || $pago['periodo'] != $periodo) {
            break;
        }
        if ($flag) {
            $sheet->setCellValue("A{$fila}", "FECHA")->mergeCells("A{$fila}:B{$fila}");
            $sheet->setCellValue("C{$fila}", "CONCEPTO")->mergeCells("C{$fila}:D{$fila}");
            $sheet->setCellValue("E{$fila}", "IMPORTE")->mergeCells("E{$fila}:F{$fila}");
            $sheet->setCellValue("G{$fila}", "DESCTO")->mergeCells("G{$fila}:H{$fila}");
            $sheet->setCellValue("I{$fila}", "BECA")->mergeCells("I{$fila}:J{$fila}");
            $sheet->setCellValue("K{$fila}", "ABONO")->mergeCells("K{$fila}:L{$fila}");
            $sheet->setCellValue("M{$fila}", "DIAS ATRASO")->mergeCells("M{$fila}:N{$fila}");
            $sheet->setCellValue("O{$fila}", "TOTAL");
            $sheet->getStyle("A{$fila}:O{$fila}")->getFont()->setBold(true);
            $fila++;
            $sheet->mergeCells("A{$fila}:O{$fila}");
            $sheet->setCellValue("A{$fila}", "DEUDA");
            $fila++;
            $flag = false;
            $existeDeuda = true;
        }
        $abonos = 0;
        if ($pago['cobros'][0] != $pago['total']) { //No fue un cobro único
            foreach ($pago['cobros'] as $item) {
                $abonos += $item['monto'];
            }
        }

        $pendiente = $pago['total'] - $abonos;
        $deuda += $pendiente;
        $descuento = $pago['descuento'] == 1 ? $pago['subtotal'] * ($pago['beca'] / 100) : 0;
        $fechaLimite = new DateTime($pago['fecha_limite']);
        $fechaActual = new DateTime();
        $dias_atraso = $fechaLimite < $fechaActual ? $fechaLimite->diff($fechaActual)->format("%a") : 0;
        if ($fechaLimite < $fechaActual) {
            $importeActual += $pago['subtotal'];
            $descuentoActual += $descuento;
            $deudaTotalActual += $pendiente;
        }
        $sheet->setCellValue("A{$fila}", $pago['fecha_limite'])->mergeCells("A{$fila}:B{$fila}")->getStyle("A{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_DDMMYYYY);;
        $sheet->setCellValue("C{$fila}", $pago['concepto_nombre'])->mergeCells("C{$fila}:D{$fila}");
        $sheet->setCellValue("E{$fila}", $pago['subtotal'])->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("G{$fila}", $descuento)->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("I{$fila}", ($pago['beca'] / 100))->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_PERCENTAGE);
        $sheet->setCellValue("K{$fila}", $abonos)->mergeCells("K{$fila}:L{$fila}")->getStyle("K{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);;
        $sheet->setCellValue("M{$fila}", $dias_atraso)->mergeCells("M{$fila}:N{$fila}")->mergeCells("M{$fila}:M{$fila}");
        $sheet->setCellValue("O{$fila}", $pendiente)->getStyle("O{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);;

        $fila++;
        unset($pagos['periodicos'][$key]);
    }
    $sheet->setCellValue("M{$fila}", "DEUDA TOTAL")->mergeCells("M{$fila}:N{$fila}")->getStyle("M{$fila}")->getAlignment()->setHorizontal('right');
    $sheet->setCellValue("O{$fila}", $deuda)->getStyle("O{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $deuda = 0;
    $flag = true;
    $fila++;
    //Pagos
    foreach ($pagos['periodicos'] as $key => $pago) {
        if ($pago['periodo'] != $periodo)
            break;
        if ($flag) {
            $sheet->setCellValue("A{$fila}", "PAGOS");
            $sheet->mergeCells("A{$fila}:O{$fila}");
            $fila++;
            $flag = false;
        } 
        $pagot += $pago['total'];
        $fechaLimite = new DateTime($pago['fecha_limite']);
        $fechaActual = new DateTime();
        $descuento = $pago['descuento'] == 1 ? $pago['subtotal'] * ($pago['beca'] / 100) : 0;
        if ($fechaLimite < $fechaActual) {
            $importeActual += $pago['subtotal'];
            $descuentoActual += $descuento;
            $pagoTotalActual += $pago['total'];
        }
        $sheet->setCellValue("A{$fila}", $pago['fecha_limite'])->mergeCells("A{$fila}:B{$fila}")->getStyle("A{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_DATE_YYYYMMDD);
        $sheet->setCellValue("C{$fila}", $pago['concepto_nombre'])->mergeCells("C{$fila}:D{$fila}");
        $sheet->setCellValue("E{$fila}", $pago['subtotal'])->mergeCells("E{$fila}:F{$fila}")->getStyle("E{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("G{$fila}", $descuento)->mergeCells("G{$fila}:H{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $sheet->setCellValue("I{$fila}", ($pago['beca'] / 100))->mergeCells("I{$fila}:J{$fila}")->getStyle("I{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_PERCENTAGE);
        $sheet->setCellValue("K{$fila}", "");
        $sheet->setCellValue("M{$fila}", "")->mergeCells("M{$fila}:N{$fila}");
        $sheet->setCellValue("O{$fila}", $pago['total'])->getStyle("O{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
        $fila++;
        unset($pagos['periodicos'][$key]);
    }
    $sheet->setCellValue("M{$fila}", "PAGO TOTAL")->mergeCells("M{$fila}:N{$fila}")->getStyle("M{$fila}")->getAlignment()->setHorizontal('right');
    $sheet->setCellValue("O{$fila}", $pagot)->getStyle("O{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
    $pagot = 0;
    $fila++;
    $fila++;
    $cicloText = "";
}
$sheet->setCellValue("A{$fila}", "COBRANZA GENERAL")->mergeCells("A{$fila}:O{$fila}");
$fila++;
$sheet->setCellValue("A{$fila}", "IMPORTE INICIAL TOTAL")->mergeCells("A{$fila}:C{$fila}");
$sheet->setCellValue("D{$fila}", "DESCUENTO TOTAL")->mergeCells("D{$fila}:F{$fila}");
$sheet->setCellValue("G{$fila}", "IMPORTE FINAL TOTAL")->mergeCells("G{$fila}:I{$fila}");
$sheet->setCellValue("J{$fila}", "PAGO TOTAL")->mergeCells("J{$fila}:L{$fila}");
$sheet->setCellValue("M{$fila}", "DEUDA TOTAL")->mergeCells("M{$fila}:O{$fila}");
$fila++;
$sheet->setCellValue("A{$fila}", "=SUM(E10:E" . ($fila - 4) . ")")->mergeCells("A{$fila}:C{$fila}")->getStyle("A{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("D{$fila}", "=SUM(G10:G" . ($fila - 4) . ")")->mergeCells("D{$fila}:F{$fila}")->getStyle("D{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("G{$fila}", "=A{$fila}-D{$fila}")->mergeCells("G{$fila}:I{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("J{$fila}", "=SUMIF(M10:M" . ($fila - 4) . ",\"PAGO TOTAL\",O10:O" . ($fila - 4) . ") + SUM(K8:K" . ($fila - 4) . ")")->mergeCells("J{$fila}:L{$fila}")->getStyle("J{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("M{$fila}", "=SUMIF(M10:M" . ($fila - 4) . ",\"DEUDA TOTAL\",O10:O" . ($fila - 4) . ")")->mergeCells("M{$fila}:O{$fila}")->getStyle("M{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

$fila = $fila + 2;
$sheet->setCellValue("A{$fila}", "COBRANZA HASTA EL DÍA " . date('Y-m-d'))->mergeCells("A{$fila}:O{$fila}");
$fila++;
$sheet->setCellValue("A{$fila}", "IMPORTE INICIAL")->mergeCells("A{$fila}:C{$fila}");
$sheet->setCellValue("D{$fila}", "DESCUENTO")->mergeCells("D{$fila}:F{$fila}");
$sheet->setCellValue("G{$fila}", "IMPORTE FINAL")->mergeCells("G{$fila}:I{$fila}");
$sheet->setCellValue("J{$fila}", "PAGO")->mergeCells("J{$fila}:L{$fila}");
$sheet->setCellValue("M{$fila}", "DEUDA")->mergeCells("M{$fila}:O{$fila}");
$fila++;
// $sheet->setCellValue("A{$fila}", '\'=SUMIF(A10:A51,"<"&TEXT(TODAY(), "aaaa-mm-dd"),E10:E51)\'')->mergeCells("A{$fila}:C{$fila}")->getStyle("A{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE); // No me reconoció la fórmula :(
$sheet->setCellValue("A{$fila}", $importeActual)->mergeCells("A{$fila}:C{$fila}")->getStyle("A{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE); // No me reconoció la fórmula :(
$sheet->setCellValue("D{$fila}", $descuentoActual)->mergeCells("D{$fila}:F{$fila}")->getStyle("D{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE); // No me reconoció la fórmula :(
$sheet->setCellValue("G{$fila}", "=A{$fila}-D{$fila}")->mergeCells("G{$fila}:I{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("J{$fila}", $pagoTotalActual)->mergeCells("J{$fila}:L{$fila}")->getStyle("J{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->setCellValue("M{$fila}", $deudaTotalActual)->mergeCells("M{$fila}:O{$fila}")->getStyle("M{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);

// $sheet->setCellValue("G{$fila}","=E{$fila}-F{$fila}")->getStyle("G{$fila}")->getNumberFormat()->setFormatCode(\PhpOffice\PhpSpreadsheet\Style\NumberFormat::FORMAT_CURRENCY_USD_SIMPLE);
$sheet->getStyle("A7:O{$fila}")->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);


// $deudaTotal = number_format($deudaTotal, 2);  
// echo "Deuda Total: \${$deudaTotal} <br>"; 

// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="alumnos.xls"');
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
