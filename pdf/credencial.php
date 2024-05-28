<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/spa.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');
require_once(DOC_ROOT.'/libs/phpqrcode/qrlib.php');
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF
{

    //Page header
    public function Header()
    {
        $logo = DOC_ROOT . "/images/logo_correo.jpg"; 
        $this->Image($logo, 15, 10, 50, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        $this->SetFont('dejavusans', '', 16, '', true); 
        $this->writeHTMLCell($w = 0, $h = 0, $x = 80, $y = '', "Mi Credencial Digital" , $border = 0, $ln = 1, $fill = 0, $reseth = true, $align = '', $autopadding = false);
    }

    // Page footer
    public function Footer()
    {
    }
}
 
$pdf = new MYPDF("P", PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false); 
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Credencial Digital');
$pdf->SetSubject('Mostrar la credencial en formato digital');
$pdf->SetKeywords('credencial, IAP, credencial, digital');  
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING); 
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA)); 
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
$pdf->SetMargins(PDF_MARGIN_LEFT, 10, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER); 
$pdf->SetAutoPageBreak(TRUE, 10); 
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO); 
$pdf->setLanguageArray($l); 
$pdf->setFontSubsetting(true); 
$pdf->SetFont('dejavusans', '', 10, '', true); 
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->AddPage();
$credencial = $_GET['credencial'];
$credentials->setCredential($credencial);
$credencial = $credentials->getCredential();
 
$target_path = $credencial['files']['token']['qr']['urlEmbed']; 
$html =  ' <div style="border-style:dashed dashed dashed dashed;"><img src="'.$credencial['files']['credential']['urlEmbed'].'"></div>
            <img src="'.DOC_ROOT.'/images/credencial/atras.png" style="border-style:dashed dashed dashed dashed;">'; 

$pdf->writeHTMLCell($w = 0, $h = 0, $x = '', $y = '', $html , $border = 0, $ln = 0, $fill = 0, $reseth = true, $align = '', $autopadding = false);

$pdf->Image($target_path, 150, 196, 35, '', 'PNG', '', 'T', false, 300, '', false, false, 0, false, false, false);

$pdf->Output("mi-credencial-digital.pdf", 'I');