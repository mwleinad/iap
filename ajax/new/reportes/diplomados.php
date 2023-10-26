<?php
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$group->setCourseId(162);
$students = $group->DefaultGroup();
// echo "<pre>";
// print_r($students);
// Create new Spreadsheet object
$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Registros Diplomado')
    ->setSubject('Alumnos')
    ->setDescription('Registro del Diplomado Gestión Documental y Administración de Archivos')
    ->setKeywords('Alumnos')
    ->setCategory('Diplomados');
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1','Numero de Control'); 
$sheet->setCellValue('B1','Nombre'); 
$sheet->setCellValue('C1','Correo'); 
$sheet->setCellValue('D1', 'Telefono');
$sheet->setCellValue('E1', 'Función');
$sheet->setCellValue('F1', 'Foto');
$sheet->setCellValue('G1', 'Curp');
$sheet->setCellValue('H1', 'Curp Archivo');
$funciones = [
    0 =>"",
    1 =>"Coordinador de archivos",
    2 =>"Correspondencia",
    3 => "Archivo de trámite",
    4 => "Archivo de concentración",
    5 => "Archivo histórico",
    6 => "Grupo interdisciplinario",
    7 => "Ninguna de las anteriores",    
];
for ($i=0; $i < (count($students)); $i++) {
    $foto = json_decode($students[$i]['foto'], true); 
    $curp = json_decode($students[$i]['curpDrive'], true); 
    $sheet->setCellValue('A'.($i+2), $students[$i]['controlNumber']);
    $sheet->setCellValue('B'.($i+2), mb_strtoupper($students[$i]['names'])." ".mb_strtoupper($students[$i]['lastNamePaterno'])." ".mb_strtoupper($students[$i]['lastNameMaterno'])); 
    $sheet->setCellValue("C".($i+2), $students[$i]['email']);
    $sheet->setCellValue("D".($i+2), $students[$i]['mobile']);
    $sheet->setCellValue("E".($i+2), $funciones[$students[$i]["funcion"]]);
    $sheet->setCellValue("F".($i+2), $foto['urlBlank']);
    $sheet->setCellValue("G".($i+2), $students[$i]['curp']);
    $sheet->setCellValue("H".($i+2), $curp['urlBlank']);
}

$sheet->getStyle("A2:H".(count($students)))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="registros_diplomado_'.$fileName.'.xls"');
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
