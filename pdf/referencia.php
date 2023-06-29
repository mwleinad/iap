<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/spa.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');

$concepto = $_GET['concepto'];
$indice = $_GET['num'];
$curso = $_GET['curso'];
$institution->setInstitutionId(1);
$infoInstituto = $institution->Info();
$student->setUserId($_SESSION['User']['userId']);
$alumno = $student->GetInfo();
$nombre = $alumno['names'] . " " . $alumno['lastNamePaterno'] . " " . $alumno['lastNameMaterno'];
$matricula = $student->GetMatricula($curso);
$conceptos->setPagoId($concepto);
$pagoInfo = $conceptos->pago();
$conceptos->setConcepto($pagoInfo['concepto_id']);
$conceptoInfo = $conceptos->getConcepto();
$nombreConcepto =  $conceptoInfo['cobros'] > 1 ? $conceptoInfo['nombre'] . " " . $indice : $$conceptoInfo['nombre'];
// echo "<pre>";
// print_r($alumno);
// exit;
//Sección inicial del PDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator("William Ramírez");
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Referencia Bancaria');
$pdf->SetSubject('Generar una boleta para referencia bancaria');
$pdf->SetKeywords('referencia, banco, pago, concepto');
$pdf->SetMargins(PDF_MARGIN_LEFT, 10, PDF_MARGIN_RIGHT);
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->AddPage();


$logo = DOC_ROOT . "/images/logo_correo.jpg";
$xInicial = $pdf->getX();
$y = $pdf->getY();
$pdf->Image($logo, $xInicial, $y, 50, 20, 'JPG', WEB_ROOT, '', true, 150, '', false, false, 0, false, false, false);

// Texto inicial 
$html = "<h3>BOLETA DE PAGO REFERENCIADO(Ventanilla)</h3>";
$x = $xInicial + 55;
$pdf->writeHTMLCell(120, '', $x, $y, $html, 0, 0, 0, true, 'L', false);

// Fecha
$fecha = new DateTimeImmutable();
$meses = ["Jan" => "enero", "Feb" => "febrero", "Mar" => "marzo", "Apr" => "abril", "May" => "mayo", "Jun" => "junio", "Jul" => "julio", "Aug" => "agosto", "Sep" => "septiembre", "Oct" => "octubre", "Nov" => "noviembre", "Dec" => "diciembre"];
$html = "Fecha: {$fecha->format('d')} de {$meses[$fecha->format('M')]} de {$fecha->format('Y')}";
$y = $y + 7;
$pdf->setFont('arial', '', '10', '', 'default', true);
$pdf->writeHTMLCell(120, '', $x, $y, $html, 0, 0, 0, true, 'L', false);

// Línea separadora texto inicial
$html = "<hr>";
$pdf->writeHTMLCell('', '', $x, $y, $html, 0, 0, 0, true, 'L', false);

// Línea separadora logo
$y = $y + 15;
$pdf->writeHTMLCell('', '', $xInicial, $y, $html, 0, 0, 0, true, 'L', false);

// Nombre del alumno
$html = "<h2>{$nombre}</h2>";
$pdf->writeHTMLCell('', '', $xInicial, $y, $html, 0, 0, 0, true, 'C', false);

// Matrícula del alumno
// $html = "<h3>Matrícula: {$matricula}</h3>"; 
// $pdf->writeHTMLCell('', '', $xInicial, $y+6, $html, 0, 0, 0, true, 'C', false);

// Nombre del concepto
$html = "<h1>{$nombreConcepto}</h1>";
$pdf->setFont('arial', '', '16', '', 'default', true);
$pdf->writeHTMLCell('', '', $xInicial, $y += 7, $html, 0, 0, 0, true, 'C', false);

// Total 
$pdf->setFont('arial', '', '10', '', 'default', true);
$pdf->writeHTMLCell('', '', $xInicial, $y += 25, "Total", 0, 0, 0, true, 'C', false);
$pdf->writeHTMLCell('', '', $xInicial, $y, "$" . number_format($pagoInfo['subtotal'], 2), 0, 0, 0, true, 'R', false);

// Importe con letras
$pagoLetra = "(" . $util->Util()->num2letras($pagoInfo['subtotal']) . " pesos)";
$pdf->writeHTMLCell('', '', $xInicial, $y += 5, "Importe con letras", 0, 0, 0, true, 'C', false);
$pdf->writeHTMLCell('', '', $xInicial, $y, $pagoLetra, 0, 0, 0, true, 'R', false);

// Línea divisora
$html = "<hr>";
$pdf->writeHTMLCell('', '', $x, $y+=5, $html, 0, 0, 0, true, 'C', false);

// Advertencias
$pdf->setFont('arial', '', '8', '', 'default', true);
$html = "*Una vez realizado el pago, bajo ninguna circunstancia se tramitarán devoluciones.";
$pdf->writeHTMLCell('', '', $x, $y+=2, $html, 0, 0, 0, true, 'L', false);

$html = "**Este comprobante es de control interno, no tiene validez fiscal, puede ser canjeado en el departamento de Finanzas y Contabilidad de la Secretaria Administrativa";
$pdf->writeHTMLCell('', '', $x, $y+=4, $html, 0, 0, 0, true, 'L', false);

//Referencia de pago
$logo_banorte = DOC_ROOT . "/images/logos/banorte.png";
$pdf->Image($logo_banorte, $xInicial+120, $y+=30, 50, 6, 'PNG', '', '', true, 150, '', false, false, 0, false, false, false);

// Emisora

$pdf->setFont('arial', '', '12', '', 'default', true);
$html = "<b>Emisora: 0148126</b>";
$pdf->writeHTMLCell('', '', $x-20, $y, $html, 0, 0, 0, true, 'L', true);
$html = "<b>Referencia: {$alumno['referenciaBancaria']}</b>";
$pdf->writeHTMLCell('', '', $x-20, $y+=6, $html, 0, 0, 0, true, 'L', true);
$html = "<b>Para pago en ventanilla en <br>sucursal BANORTE</b>";
$pdf->writeHTMLCell('', '', $x-20, $y+=6, $html, 0, 0, 0, true, 'L', true);

$pdf->Output("referencia_de_pago.pdf", 'I');
