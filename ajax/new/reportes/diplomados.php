<?php

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

$group->setCourseId(162);
$students = $group->DefaultGroup(); 
// Create new Spreadsheet object
$spreadsheet = new Spreadsheet();
$spreadsheet->getActiveSheet()->getDefaultColumnDimension()->setWidth(30);
// Set document properties
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Registros Diplomado')
    ->setSubject('Alumnos')
    ->setDescription('Registro del Diplomado Gestión Documental y Administración de Archivos')
    ->setKeywords('Alumnos')
    ->setCategory('Diplomados');
$sheet = $spreadsheet->getActiveSheet();

$sheet->setCellValue('A1', 'Numero de Control');
$sheet->setCellValue('B1', 'Nombre');
$sheet->setCellValue('C1', 'Correo');
$sheet->setCellValue('D1', 'Telefono');
$sheet->setCellValue('E1', 'Lugar de Trabajo');
$sheet->setCellValue('F1', 'Funcion');
$sheet->setCellValue('G1', 'Foto');
$sheet->setCellValue('H1', 'Curp');
$sheet->setCellValue('I1', 'Curp Archivo');
$sheet->setCellValue('J1', 'Contraseña');
$sheet->setCellValue('K1', 'Sexo');
$sheet->setCellValue('L1', 'Estado');

$sheet->getStyle('A')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('A')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('B')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('B')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('C')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('C')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('D')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('D')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('E')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('E')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('F')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('F')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('G')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('G')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('H')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('H')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('I')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('I')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('J')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('J')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('K')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('K')->getFont()->setSize(14)->setBold(true);
$sheet->getStyle('L')->getAlignment()->setHorizontal('center')->setVertical('center');
$sheet->getStyle('L')->getFont()->setSize(14)->setBold(true);

$funciones = [
    0 => "",
    1 => "Coordinador de archivos",
    2 => "Correspondencia",
    3 => "Archivo de trámite",
    4 => "Archivo de concentración",
    5 => "Archivo histórico",
    6 => "Grupo interdisciplinario",
    7 => "Ninguna de las anteriores",
];

$estados = $util->estados_iap(); 
for ($i = 0; $i < (count($students)); $i++) {
    $foto = json_decode($students[$i]['foto'], true);
    $curp = json_decode($students[$i]['curpDrive'], true);
    $sexo = $students[$i]['sexo'] == "m" ? "Masculino" : "Femenino"; 
    $estado = $estados[($students[$i]['estado'] - 1)]['nombre'];
    $sheet->setCellValue('A' . ($i + 2), $students[$i]['controlNumber']);
    $sheet->setCellValue('B' . ($i + 2), mb_strtoupper($students[$i]['names']) . " " . mb_strtoupper($students[$i]['lastNamePaterno']) . " " . mb_strtoupper($students[$i]['lastNameMaterno']));
    $sheet->setCellValue("C" . ($i + 2), $students[$i]['email']);
    $sheet->setCellValue("D" . ($i + 2), $students[$i]['mobile']);
    $sheet->setCellValue("E" . ($i + 2), $students[$i]['workplace']);
    $sheet->setCellValue("F" . ($i + 2), $funciones[$students[$i]["funcion"]]);
    $sheet->setCellValue("G" . ($i + 2), $foto['urlBlank']);
    $sheet->getCell('G' . ($i + 2))->getHyperlink()->setUrl($foto['urlBlank']);
    $sheet->setCellValue("H" . ($i + 2), $students[$i]['curp']);
    $sheet->setCellValue("I" . ($i + 2), $curp['urlBlank']);
    $sheet->getCell('I' . ($i + 2))->getHyperlink()->setUrl($curp['urlBlank']);
    $sheet->setCellValue("J" . ($i + 2), $students[$i]['password']);
    $sheet->setCellValue("K" . ($i + 2), $sexo);
    $sheet->setCellValue("L" . ($i + 2), $estado);
}

$sheet->getStyle("A2:L" . (count($students) + 1))->getAlignment()->setHorizontal('center')->setVertical('center')->setWrapText(true);

$fileName = bin2hex(random_bytes(4));
// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment;filename="registros_diplomado_' . $fileName . '.xls"');
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
