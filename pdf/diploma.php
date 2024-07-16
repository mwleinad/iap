<?php
header('Content-type: application/pdf');
session_start();
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php'); 
require_once(DOC_ROOT . '/tcpdf/tcpdf.php'); 
// Extend the TCPDF class to create custom Header and Footer
class MYPDF extends TCPDF
{
    protected $backgroundImages = [];
    protected $token = "";
    // Establece las imágenes de fondo
    public function setBackgroundImages($images)
    {
        $this->backgroundImages = $images;
    }

    public function setToken($token){
        $this->token = $token;
    }

    public function Header()
    {
        // get the current page break margin
        $bMargin = $this->getBreakMargin();
        // get current auto-page-break mode
        $auto_page_break = $this->AutoPageBreak;
        // disable auto-page-break
        $this->SetAutoPageBreak(false, 0);
        // set bacground image

        $page = $this->getPage();
        if (isset($this->backgroundImages[$page])) {
            $img_file = $this->backgroundImages[$page];
            // echo $img_file;
            $this->Image($img_file, 0, 0, 210, 297, '', '', '', false, 300, '', false, false, 0);
        }
        // restore auto-page-break status
        $this->SetAutoPageBreak($auto_page_break, $bMargin);
        // set the starting point for the page content
        $this->setPageMark();
    }
    
    public function Footer()
    {
        // Position at 15 mm from bottom
        $this->SetY(-15);
        // Set font
        $this->SetFont('helvetica', 'I', 8);
        // Page number
        $this->Cell(0, 10, 'Diploma Digital', 0, false, 'C', 0, '', 0, false, 'T', 'M');
        $page = $this->getPage();
        if ($page == 1) {
            $style = array(
                'border' => 0,
                'vpadding' => 'auto',
                'hpadding' => 'auto',
                'fgcolor' => array(0, 0, 0),
                'bgcolor' => false, //array(255,255,255)
                'module_width' => 1, // width of a single module in points
                'module_height' => 1 // height of a single module in points
            );
            $qrCodeText = WEB_ROOT."/verificar/token/".$this->token; // texto o URL del QR
            $this->write2DBarcode($qrCodeText, 'QRCODE,H', 15, 273, 22, 22, $style, 'N');
        }
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

// // set header and footer fonts
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(0);
$pdf->SetFooterMargin(0); 
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
$pdf->SetFont('times', '', 18);
$backgroundImages = [
    1 => WEB_ROOT . '/images/diploma_162.png',
    2 => WEB_ROOT . '/images/diploma_atras_162.jpg',
];

// Establece las imágenes de fondo en el PDF
$pdf->setBackgroundImages($backgroundImages);

$pdf->AddPage();

$course->setUserId($_GET['alumno']);
$course->setCourseId($_GET['curso']);
$diploma = $course->getDiploma();

$student->setUserId($_GET['alumno']);
$infoAlumno = $student->GetInfo();
$nombreAlumno = $infoAlumno['names'] . ' ' . $infoAlumno['lastNamePaterno'] . ' ' . $infoAlumno['lastNameMaterno'];
$nombreAlumno = $util->eliminar_acentos($nombreAlumno);
$nombreAlumno = mb_strtoupper($nombreAlumno, 'UTF-8');
$pdf->setToken($diploma['token']);

$html = '<div style="width:100%; text-align:center;">' . $nombreAlumno . '</div>';
$pdf->writeHTMLCell('', '', 15, 105, $html, 0, 0, 0, true, 'C', false);
$pdf->AddPage();
$pdf->Output('diploma.pdf', 'I');
