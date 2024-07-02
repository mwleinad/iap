<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/spa.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');
require_once(DOC_ROOT . '/libs/phpqrcode/qrlib.php');
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF
{
    public function Header()
    {
        // get the current page break margin
        $bMargin = $this->getBreakMargin();
        // get current auto-page-break mode
        $auto_page_break = $this->AutoPageBreak;
        // disable auto-page-break
        $this->SetAutoPageBreak(false, 0);
        // set bacground image
        $img_file = WEB_ROOT . '/images/diploma_162.png';
        $this->Image($img_file, 0, 0, 210, 297, '', '', '', false, 300, '', false, false, 0);
        // restore auto-page-break status
        $this->SetAutoPageBreak($auto_page_break, $bMargin);
        // set the starting point for the page content
        $this->setPageMark();
    }
}

// create new PDF document
$pdf = new MYPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator("IAP");
$pdf->SetAuthor('William Ramirez');
$pdf->SetTitle('Diploma');
$pdf->SetSubject('Generación de diploma');
$pdf->SetKeywords('diploma, iap, pdf');

// set header and footer fonts
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN)); 
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED); 
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(0);
$pdf->SetFooterMargin(0); 
$pdf->setPrintFooter(false); 
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM); 
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO); 
$pdf->SetFont('times', '', 18);  
$pdf->AddPage(); 

$student->setUserId($_GET['alumno']);
$infoAlumno = $student->GetInfo();
$nombreAlumno = $infoAlumno['names'] .' '. $infoAlumno['lastNamePaterno'].' '.$infoAlumno['lastNameMaterno'] ;
$nombreAlumno = $util->eliminar_acentos($nombreAlumno);
$nombreAlumno = mb_strtoupper($nombreAlumno);
$html = '<div style="width:100%; text-align:center;">'.$nombreAlumno.'</div>';

$pdf->writeHTMLCell('', '', 15, 105, $html, 0, 0, 0, true, 'C', false); 
$pdf->Output('diploma.pdf', 'I');