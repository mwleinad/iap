<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/spa.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF
{

    //Page header
    public function Header()
    {
        $logo = DOC_ROOT . "/images/logos/logo-humanismo.jpeg"; 
        $this->Image($logo, 15, 10, 50, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
    }

    // Page footer
    public function Footer()
    {
    }
}

// create new PDF document
$pdf = new MYPDF("L", PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Calendario de pagos');
$pdf->SetSubject('Motrar las fechas de pagos del alumno');
$pdf->SetKeywords('fechas, IAP, pagos, calendario');
$alumno = $_GET['alumno'];
$curso = $_GET['curso'];
$student->setUserId($alumno);
$conceptos->setAlumno($alumno);
$conceptos->setCourseId($curso);
$course->setCourseId($curso);
$cursoInfo = $course->Info();
$alumnoInfo = $student->GetInfo();
// print_r($alumnoInfo);
// exit;
$pagos = $conceptos->historial_pagos();
$meses = ["ENERO", "FEBRERO", "MARZO", "ABRIL", "MAYO", "JUNIO", "JULIO", "AGOSTO", "SEPTIEMBRE", "OCTUBRE", "NOVIEMBRE", "DICIEMBRE"];
$agrupacion = [];

foreach ($pagos['periodicos'] as $item) {
    $anio = date("Y", strtotime($item['fecha_cobro']));
    $mes = date('m', strtotime($item['fecha_cobro']));
    $agrupacion[$anio][$meses[intval($mes) - 1]][] = $item;
}
// echo "<pre>";
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
$pdf->SetPrintHeader(true);
$pdf->SetPrintFooter(false);
$pdf->AddPage();

$body = "";
foreach ($agrupacion as $year => $months) {
    $body .= '<tr>
                <td colspan="6" style="border:1px solid black;text-align:center;">' . $year . '</td>
            </tr>
            <tr>
                <td style="border:1px solid black; text-align:center; width:18%;">Periodo</td>
                <td style="border:1px solid black; text-align:center; width:18%;">Nombre</td>
                <td style="border:1px solid black; text-align:center; width:18%;">Fecha de pago</td>
                <td style="border:1px solid black; text-align:center; width:18%;">Monto sin beca</td>
                <td style="border:1px solid black; text-align:center; width:10%;">Beca</td>
                <td style="border:1px solid black; text-align:center; width:18%;">Monto a pagar</td>
            </tr>
            ';
    foreach ($months as $month => $pagos) {
        foreach ($pagos as $pago) {
            $contador[$pago['concepto_id']] = $contador[$pago['concepto_id']] + 1;
            $nombres .= '<div style="line-height:3px;">' . $pago['concepto_nombre'] . ' ' . $contador[$pago['concepto_id']] . '</div>';
            $fechas .= '<div style="line-height:3px;">' . $pago['fecha_cobro'] . ' - ' . $pago['fecha_limite'] . '</div>';
            $subtotales .= '<div style="line-height:3px;">$' . number_format($pago['subtotal'], 2) . '</div>';
            $becas .= '<div style="line-height:3px;">' . $pago['beca'] . '%</div>';
            $totales .= '<div style="line-height:3px;">$' . number_format($pago['total'], 2) . '</div>';
        }
        $body .= '<tr >
            <td style="text-align:center;border:1px solid black; width:18%;">' . $month . '</td>
            <td style="text-align:center;border:1px solid black; width:18%;">' . $nombres . '</td>
            <td style="text-align:center;border:1px solid black; width:18%;">' . $fechas . '</td>
            <td style="text-align:center;border:1px solid black; width:18%;">' . $subtotales . '</td>
            <td style="text-align:center;border:1px solid black; width:10%;">' . $becas . '</td>
            <td style="text-align:center;border:1px solid black; width:18%;">' . $totales . '</td>
        </tr>';
        $nombres = "";
        $fechas = "";
        $totales = "";
        $subtotales = "";
        $becas = "";
    }
}
//<img style="" src="' . $logo . '" width="150px">
$html = '<table style="width:100%; border-collapse: collapse; border-spacing: 0px;" cellpadding="5">
        <thead>
            <tr>
                <td colspan="6" style="text-align:center; font-size:40px;">
                    <b>CALENDARIO DE PAGOS</b>
                </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:center; font-size:40px;">
                <b>' . mb_strtoupper($alumnoInfo['names'], 'UTF-8') . ' ' . mb_strtoupper($alumnoInfo['lastNamePaterno'], 'UTF-8') . ' ' . mb_strtoupper($alumnoInfo['lastNameMaterno'], 'UTF-8') . '</b>
                </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align:center;"><b>"' . mb_strtoupper($cursoInfo['majorName'], 'UTF-8') . " EN " . trim(preg_replace('/[0-9]/', '', mb_strtoupper($cursoInfo['name'], 'UTF-8'))) . '"</b></td>
            </tr> 
        </thead> 
        <tbody>
        ' . $body . '
        </tbody>
    </table>';
// echo $html;
// exit;
// Print text using writeHTMLCell() 
$pdf->writeHTMLCell($w = 0, $h = 0, $x = '', $y = '', $html, $border = 0, $ln = 1, $fill = 0, $reseth = true, $align = '', $autopadding = false);



// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output($alumno . "_" . $curso . ".pdf", 'I');
// echo "<pre>";
// print_r($agrupacion);
// echo "Calendario pagos";
