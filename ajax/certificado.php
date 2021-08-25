<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

// use PhpOffice\PhpWord;

session_start();
$user->allow_access(37);

$course->setCourseId($_GET['co']);
$infoCourse = $course->Info();
if($infoCourse['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semester';
if($infoCourse['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'quarter';
$minCal = 7;
if($infoCourse['majorId'] == 18)
    $minCal = 8;

$student->setUserId($_GET['al']);
$infoStudent = $student->GetInfo();
$modules = $student->BoletaCalificacion($_GET['co'], $_GET['cu'], false);

$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
/* echo "<pre>";
print_r($infoCourse); 
exit; */

/* $html_modules = "";
$i = 1;
foreach($modules as $item)
{
    $text_color = '';
    if($item['score'] < $minCal)
        $text_color = 'text-danger';
    $html_modules .= "<tr>
                        <td class='text-center'>" . $i . "</td>
                        <td style='text-transform: capitalize;'>" . mb_strtolower($item['name']) . "</td>
                        <td class='text-center " . $text_color . "'>" . $item['score'] . "</td>
                        <td class='text-center " . $text_color . "' style='text-transform: uppercase;'><i>" . $util->num2letras($item['score']) . "</i></td>
                    </tr>";
    $i++;
} */

$phpWord = new \PhpOffice\PhpWord\PhpWord();
$phpWord->setDefaultFontName('Arial');
$section = $phpWord->addSection();
$section->addText("GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS", ['size' => 14, 'bold' => true], ['align' => 'center']);
$section->addText("SECRETARÍA DE EDUCACIÓN", ['size' => 13, 'bold' => false], ['align' => 'center']);
$text = "SUBSECRETARÍA DE EDUCACIÓN ESTATAL<w:br/>
        DIRECCIÓN DE EDUCACIÓN SUPERIOR<w:br/>
        DEPARTAMENTO DE SERVICIOS ESCOLARES";
$section->addText($text, ['size' => 10.5, 'bold' => false], ['align' => 'center']);

// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment;filename="Certificado.docx"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header('Pragma: public'); // HTTP/1.0

$writer = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord, 'Word2007');
//$writer->save('Certificado.docx');
$writer->save('php://output');
?>