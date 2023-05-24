<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/spa.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Calendario de pagos');
$pdf->SetSubject('Motrar las fechas de pagos del alumno');
$pdf->SetKeywords('fechas, IAP, pagos, calendario');
$alumno = $_GET['alumno'];
$curso = $_GET['curso'];
$conceptos->setAlumno($alumno);
$conceptos->setCourseId($curso);
$course->setCourseId($curso);
$cursoInfo = $course->Info();
$pagos = $conceptos->historial_pagos();
$meses = ["ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"];
$agrupacion = [];

foreach ($pagos['periodicos'] as $item) {
    $anio = date("Y", strtotime($item['fecha_cobro']));
    $mes = date('m', strtotime($item['fecha_cobro'])); 
    $agrupacion[$anio][$meses[intval($mes) - 1]][] = $item;
}
echo "<pre>";
// print_r($agrupacion);
// exit;

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
//echo PDF_MARGIN_TOP;
//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 10, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, 10);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);
// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 10, '', true);
// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->AddPage();
$logo = DOC_ROOT . "/images/logo_correo.jpg";
$body = ""; 
foreach ($agrupacion as $year => $months) {  
    foreach ($months as $month => $pagos) {
        $body.='<tr>
                    <td style="border:1px solid black;text-align:center;">'.$year.' '.$month.'</td>
                ';
        foreach ($pagos as $pago) {
            $body.=' 
                    <td style="border:1px solid black;text-align:center;">'.$pagos['concepto_nombre'].'</td>
                    <td style="border:1px solid black;text-align:center;">'.$pagos['fecha_cobro'].'</td>
                    <td style="border:1px solid black;text-align:center;">'.$pagos['total'].'</td>
                </tr>                
                ';
        } 
    } 
}   

echo $body;
exit;
$html = '<table style="width:100%; border-collapse: collapse; border-spacing: 0px;" cellpadding="10" >
    <tr>
        <td colspan="5" style="text-align:center; font-size:40px"><b>CALENDARIO DE PAGOS</b></td>
    </tr>
    <tr>
        <td colspan="5"style="text-align:center;"><b>"' . mb_strtoupper($cursoInfo['majorName'], 'UTF-8') . " EN " . mb_strtoupper($cursoInfo['name'], 'UTF-8') . '"</b></td>
    </tr>
    <tr>
        <td style="border:1px solid black; text-align:center;">Periodo</td>
        <td style="border:1px solid black; text-align:center;">Nombre</td>
        <td style="border:1px solid black; text-align:center;">Fecha de pago</td>
        <td style="border:1px solid black; text-align:center;">Monto</td>
    </tr>
    '.$body.'
</table>';

// Print text using writeHTMLCell()
$pdf->writeHTMLCell($w = 0, $h = 0, $x = '', $y = '', $html, $border = 0, $ln = 1, $fill = 0, $reseth = true, $align = '', $autopadding = false);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output(DOC_ROOT . "/files/solicitudes/calendario" . $alumno. "_" . $curso . ".pdf", 'I');
// echo "<pre>";
// print_r($agrupacion);
// echo "Calendario pagos";
