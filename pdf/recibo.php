<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/spa.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');
$pago = $_GET['pago'];
$conceptos->setPagoId($pago);
$pagoInfo = $conceptos->pago();
$student->setUserId($pagoInfo['alumno_id']);
$alumno = $student->GetInfo();
$course->setCourseId($pagoInfo['course_id']);
$curso = $course->Info();
$conceptos->setConcepto($pagoInfo['concepto_id']);
$concepto = $conceptos->getConcepto();
// print_r($curso);
// exit;
class MYPDF extends TCPDF
{  
    public function Header()
    { 
        $logo = DOC_ROOT . "/images/logo_correo.jpg";
        $this->Image($logo, 15, 7.5, 50, 20, 'JPG', WEB_ROOT, 'T', false, 150, '', false, false, 0, false, false, false); 
        $this->writeHTMLCell('', '', 170, 10, "Folio {$this->pago}", 0, 0, 0, true, 'L', false); 
    }
} 

$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, 'LETTER', true, 'UTF-8', false); 
$pdf->pago = $pago;
$pdf->SetCreator("William Ramírez");
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Recibo');
$pdf->SetSubject('Generación de recibo para becas de 100%');
$pdf->SetKeywords('recibo, beca'); 
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING); 
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA)); 
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED); 
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER); 
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM); 
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO); 
$pdf->AddPage(); 

// $widthPage = 216
// writeHTML($html, $ln=true, $fill=false, $reseth=false, $cell=false, $align='')
// writeHTMLCell($w, $h, $x, $y, $html='', $border=0, $ln=0, $fill=0, $reseth=true, $align='', $autopadding=true)


$html = ' 
<div></div>
<table style="border:2px black solid; " cellpadding="4">
    <tr>
        <td><strong>NOMBRE:</strong> '.$alumno['names'].' '.$alumno['lastNamePaterno'].' '.$alumno['lastNameMaterno'].'</td>
        <td><strong>ESPECIALIDAD:</strong> '.$curso['majorName'].' EN '.str_replace("EN", "", $curso['name']).'</td>
    </tr>
    <tr>
        <td><strong>GRADO:</strong> '.$curso['group'].'</td>
        <td><strong>CICLO:</strong> </td>
    </tr>
</table>
<div></div>
<table style="border:2px black solid;text-align:center; " cellpadding="4">
    <thead>
        <tr>
            <th style="font-weight: bold;">CONCEPTO</th>
            <th style="font-weight: bold;">DESCRIPCIÓN</th>
            <th style="font-weight: bold;">CARGO</th>
            <th style="font-weight: bold;">DESCUENTO</th>
            <th style="font-weight: bold;">IMPORTE</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>'.$concepto['nombre'].' '.$pagoInfo['indice'].'</td>
            <td>'.$pagoInfo['fecha_limite'].'</td>
            <td>$0.00</td>
            <td>$0.00</td>
            <td>$0.00</td>
        </tr>
    </tbody>
</table>
';
$pdf->writeHTML($html, true, false, true, true, '');
$pdf->Output("recibo.pdf", 'I');
