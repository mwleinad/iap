<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$group->setCourseId($_GET['curso']);
$students = $group->DefaultGroup();
// Create new Spreadsheet object
$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Alumnos')
    ->setSubject('Alumnos')
    ->setDescription('Alumnos | IAP Chiapas')
    ->setKeywords('Alumnos')
    ->setCategory('Calificaciones');
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1','Nombre(s)');
$sheet->setCellValue('B1','Apellidos');
$sheet->setCellValue('C1','Correo');
$sheet->setCellValue('D1','Contraseña'); 

for ($i=0; $i < (count($students)) ; $i++) {
    $sheet->setCellValue('A'.($i+2),mb_strtoupper($students[$i]['names']));
    $sheet->setCellValue('B'.($i+2),mb_strtoupper($students[$i]['lastNamePaterno'])." ".mb_strtoupper($students[$i]['lastNameMaterno']));
    $sheet->setCellValue('C'.($i+2),$students[$i]['controlNumber']."@iapchiapas.edu.mx"); 
    $password = "iap2023_".rand(100,999);
    $sheet->setCellValue('D'.($i+2),$password);
}

// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="alumnos.xls"');
header('Cache-Control: max-age=0');
// If you're serving to IE 9, then the following may be needed
header('Cache-Control: max-age=1');

// If you're serving to IE over SSL, then the following may be needed
header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
header('Pragma: public'); // HTTP/1.0

$writer = IOFactory::createWriter($spreadsheet, 'Xls');
$writer->save('php://output');