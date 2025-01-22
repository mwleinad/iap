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
$montoActual = $conceptos->monto();
$pagoInfo['total']  = $pagoInfo['total'] - $montoActual;
$conceptos->setConcepto($pagoInfo['concepto_id']);
$conceptoInfo = $conceptos->getConcepto();
$nombreConcepto =  $conceptoInfo['cobros'] > 1 ? $conceptoInfo['nombre'] . " " . $indice : $conceptoInfo['nombre'];
// echo "<pre>";
// print_r($pagoInfo);
// print_r($conceptoInfo);
// echo "nombre: $nombreConcepto";
// exit;
//Sección inicial del PDF
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
$pdf->SetCreator("William Ramírez");
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Pago por transferencia');
$pdf->SetSubject('Generar una boleta para pago referenciado');
$pdf->SetKeywords('spei, banco, pago, concepto, transferencia');
$pdf->SetMargins(PDF_MARGIN_LEFT, 10, PDF_MARGIN_RIGHT);
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->AddPage();


$logo = DOC_ROOT . "/images/logos/logo-humanismo.jpeg";
$xInicial = $pdf->getX();
$y = $pdf->getY();
$pdf->Image($logo, $xInicial, $y, 50, 20, 'JPEG', WEB_ROOT, '', true, 300, '', false, false, 0, false, false, false);

// Texto inicial 
$html = "<h3>PAGO POR SPEI(Transferencia)</h3>";
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
$pdf->setFont('arial', '', '12', '', 'default', true);
$pdf->writeHTMLCell('', '', $xInicial, $y += 15, "TOTAL", 0, 0, 0, true, 'C', false);
$pdf->writeHTMLCell('', '', $xInicial, $y, "<b>$" . number_format($pagoInfo['total'], 2)."</b>", 0, 0, 0, true, 'R', false);

// Importe con letras
$pagoLetra = "(" . $util->Util()->num2letras($pagoInfo['total'], false) . " pesos)";
$pdf->writeHTMLCell('', '', $xInicial, $y += 5, "Importe con letras", 0, 0, 0, true, 'C', false);
$pdf->writeHTMLCell('', '', $xInicial, $y, $pagoLetra, 0, 0, 0, true, 'R', false);

// Línea divisora
$html = "<hr>";
$pdf->writeHTMLCell('', '', $x, $y += 5, $html, 0, 0, 0, true, 'C', false);

// Advertencias
$pdf->setFont('arial', '', '8', '', 'default', true);
$html = "*Una vez realizado el pago, bajo ninguna circunstancia se tramitarán devoluciones.";
$pdf->writeHTMLCell('', '', $x, $y += 2, $html, 0, 0, 0, true, 'L', false);

$html = "**Este comprobante es de control interno, no tiene validez fiscal, puede ser canjeado en el departamento de Finanzas y Contabilidad de la Secretaria Administrativa";
$pdf->writeHTMLCell('', '', $x, $y += 4, $html, 0, 0, 0, true, 'L', false);

$html = "GUÍA DE PAGO"; 
$pdf->setFont('arial', '', '14', '', 'default', true);
$pdf->writeHTMLCell('', '', $xInicial, $y += 8, $html, 0, 0, 0, true, 'C', false);

// Ícono de BANORTE
$logo_banorte = DOC_ROOT . "/images/logos/banorte.png";
$pdf->Image($logo_banorte, $xInicial + 30, $y+=10, 50, 6, 'PNG', '', '', true, 150, '', false, false, 0, false, false, false);

//Guía desde el mismo banco
$html = "PAGO DESDE "; 
$pdf->setFont('arial', '', '12', '', 'default', true);
$pdf->writeHTMLCell('', '', $xInicial, $y += 2, $html, 0, 0, 0, true, 'L', false);

$html = "Desde tu banca electrónica:<br>
• Ingrese al apartado <b>PAGO DE SERVICIOS.</b><br>
• Seleccione la categoría <b>ESCUELAS Y UNIVERSIDADES.</b><br>
• En el buscador ingrese el número <b>148126</b><br>
• Seleccione el servicio <b>INSTITUTO DE ADMINISTRACION PUBLICA.</b><br>
• Ingrese el número de su referencia de pago: <b>{$alumno['referenciaBancaria']}</b><br>
• Ingrese el monto del pago.<br>
• Valide que los datos capturados son correctos, confirme la transferencia y guarde su comprobante.";  
$pdf->writeHTMLCell('', '', $xInicial, $y += 8, $html, 0, 0, 0, true, 'L', false);

// Guía desde otro banco
$html = "<b>PAGO DESDE OTRO BANCO</b>"; 
$pdf->setFont('arial', '', '12', '', 'default', true);
$pdf->writeHTMLCell('', '', $xInicial, $y += 60, $html, 0, 0, 0, true, 'L', false);

$html = "Desde tu banca electrónica realice el proceso de transferencia interbancaria con las siguientes recomendaciones:<br>
• Deberá dar de alta a la cuenta del INSTITUTO DE ADMINISTRACIÓN PÚBLICA.<br>
    • BANCO: BANORTE.<br>
    • CLABE: 072100010313317272<br>
    • CUENTA: 1031331727<br>
• Seleccione la CLABE o Número de Cuenta del instituto previamente registrado.<br>
• Capture el MONTO a pagar, en <b>CONCEPTO</b> capture el número de su referencia: <b>{$alumno['referenciaBancaria']}</b> y en <b>REFERENCIA</b> colocar <b>0148126</b><br>
• En algunas plataformas bancarias el \"CONCEPTO\" aparece como \"DESCRIPCIÓN\".<br>
• En caso de ser solicitado un correo electrónico ingrese su correo institucional.<br>
• Si su banca electrónica no le permite agregar o modificar la REFERENCIA, omita la captura de este dato.<br>
• Cualquier error de captura del CONCEPTO será causa de rechazo y su pago no será aplicado.<br>
• Valide que los datos capturados son correctos, confirme la transferencia y guarde su comprobante.<br>";
$pdf->writeHTMLCell('', '', $xInicial, $y += 5, $html, 0, 0, 0, true, 'L', false);
$pdf->Output("referencia_de_pago.pdf", 'I');
