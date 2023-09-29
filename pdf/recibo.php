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

$User = $_SESSION['User'];
if($User['type'] == "student"){
    $student->setUserId($User['studentId']);
}else{
    $student->setUserId($pagoInfo['alumno_id']); 
}
$alumno = $student->GetInfo();
$course->setCourseId($pagoInfo['course_id']);
$curso = $course->Info();
$conceptos->setConcepto($pagoInfo['concepto_id']);
$concepto = $conceptos->getConcepto();
$recibo = $payments->recibo($pago);
if ($recibo == 0) {
    $recibo = $payments->crear_recibo($pago);
}
// print_r($curso);
// exit;
class MYPDF extends TCPDF
{
    public function Header()
    {
        $logo = DOC_ROOT . "/images/logo_correo.jpg";
        $this->Image($logo, 15, 7.5, 50, 20, 'JPG', WEB_ROOT, 'T', false, 150, '', false, false, 0, false, false, false);
        $this->writeHTMLCell('', '', 170, 10, "Folio {$this->pago}", 0, 0, 0, true, 'L', false);
        $this->SetAlpha(0.3);
        $this->SetFont('', 'B', 40);
        $this->SetTextColor(165, 203, 73);
        $this->RotatedText(30, 190, 'COMPROBANTE BECA 100%', 45);

        $this->SetAlpha(0.3);
        $this->SetFont('', 'B', 26);
        $this->SetTextColor(165, 203, 73);
        $this->RotatedText(50, 200, '(COMP. SIN REQUISITOS FISCALES.)', 45);
        $this->SetAlpha(0.5);
    }

    function Rotate($angle, $x = -1, $y = -1)
    {
        if ($x == -1)
            $x = $this->x;
        if ($y == -1)
            $y = $this->y;
        if ($this->angle != 0)
            $this->_out('Q');
        $this->angle = $angle;
        if ($angle != 0) {
            $angle *= M_PI / 180;
            $c = cos($angle);
            $s = sin($angle);
            $cx = $x * $this->k;
            $cy = ($this->h - $y) * $this->k;
            $this->_out(sprintf('q %.5F %.5F %.5F %.5F %.2F %.2F cm 1 0 0 1 %.2F %.2F cm', $c, $s, -$s, $c, $cx, $cy, -$cx, -$cy));
        }
    }

    function RotatedText($x, $y, $txt, $angle)
    {
        //Text rotated around its origin
        $this->Rotate($angle, $x, $y);
        $this->Text($x, $y, $txt);
        $this->Rotate(0);
    }
}

$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, 'LETTER', true, 'UTF-8', false);
$pdf->pago = str_pad($recibo, 6, '0', STR_PAD_LEFT);
$pdf->SetCreator("William Ramírez");
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Recibo');
$pdf->SetSubject('Generación de recibo para becas de 100%');
$pdf->SetKeywords('recibo, beca');
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE, PDF_HEADER_STRING);
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
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
        <td><strong>NOMBRE:</strong> ' . $alumno['names'] . ' ' . $alumno['lastNamePaterno'] . ' ' . $alumno['lastNameMaterno'] . '</td>
        <td><strong>ESPECIALIDAD:</strong> ' . $curso['majorName'] . ' EN ' . str_replace("EN", "", $curso['name']) . '</td>
    </tr>
    <tr>
        <td><strong>GRADO:</strong> ' . $curso['group'] . '</td>
        <td><strong>PERIODO:' . $pagoInfo['periodo'] . '</strong> </td>
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
            <td>' . $concepto['nombre'] . ' ' . $pagoInfo['indice'] . '</td>
            <td>' . $pagoInfo['fecha_limite'] . '</td>
            <td>$0.00</td>
            <td>$0.00</td>
            <td>$0.00</td>
        </tr>
    </tbody>
</table>
';
$pdf->writeHTML($html, true, false, true, true, '');
$pdf->Output("recibo.pdf", 'I');
