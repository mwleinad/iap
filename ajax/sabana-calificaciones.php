<?php
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');
/* echo "<pre>";
print_r($_GET);
exit; */
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

session_start();
$user->allow_access(37);

$period = intval($_GET['period']);
$typeXlsx = intval($_GET['type']);
$courseId = intval($_GET['course']);
$totalScores = 20;
$modality = '';
$typeCourse = '';

$course->setCourseId($courseId);
$courseInfo = $course->Info();
$courseModules = $course->ListModules($period, true, " ORDER BY cm.initialDate");
$modulesRepeat = [];
if($typeXlsx == 1 || $typeXlsx == 3)
    $students = $course->SabanaCalificacionesFrontal($period, true, " ORDER BY cm.initialDate", 'final');
if($typeXlsx == 2 || $typeXlsx == 4)
{
    foreach($courseModules as $item)
        $modulesRepeat[] .= $item['courseModuleId']; 
    $students = $course->SabanaCalificacionesTrasera($period, true, " ORDER BY cm.initialDate", 'final', $modulesRepeat);
}
/* echo "<pre>";
var_dump($students);
exit; */

$minCal = 7;
$claveSE = 5036;
if($courseInfo['majorId'] == 18)
{
    $minCal = 8;
    $claveSE = 6024;
}
if($courseInfo['modality'] == 'Online')
    $modality = 'ESCOLAR';
if($courseInfo['modality'] == 'Local')
    $modality = 'NO ESCOLAR';
if($courseInfo['subjectId'] == 22)
    $modality = 'MIXTA';
if($courseInfo['tipoCuatri'] == 'Semestre')
    $typeCourse = 'semester';
if($courseInfo['tipoCuatri'] == 'Cuatrimestre')
    $typeCourse = 'quarter';
$institution->setInstitutionId(1);
$myInstitution = $institution->Info();
$studentKeys = array_keys($students);
echo "<pre>";
var_dump($studentKeys);
exit;
// Prueba Grupo Temporal
/* $group->setCourseId($courseId);
$students = $group->DefaultGroup(); */
$totalStudents = count($students);
$totalPages = intval(ceil($totalStudents / 25));

// Funcion para generar estilos
function CellStyle($fontSize, $fontName, $fontBold, $borderType, $borderStyle, $vAlignment, $hAlignment, $textRotation, $wrapText = true, $fontColor = '000000')
{
    /**
     * $fontBold = true | false
     * $borderType = top | bottom | left | right | allBorders
     */
    switch($borderStyle)
    {
        case 'thick':
            $borderStyle = \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THICK;
            break;
        case 'thin':
            $borderStyle = \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN;
            break;
        case 'none':
            $borderStyle = \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_NONE;
            break;
    }

    switch($vAlignment)
    {
        case 'left':
            $vAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_LEFT;
            break;
        case 'right':
            $vAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_RIGHT;
            break;
        case 'center':
            $vAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER;
            break;
        case 'top':
            $vAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_TOP;
            break;
        case 'bottom':
            $vAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_BOTTOM;
            break;
        default:
            $vAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_LEFT;
    }

    switch($hAlignment)
    {
        case 'left':
            $hAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT;
            break;
        case 'right':
            $hAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_RIGHT;
            break;
        case 'center':
            $hAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER;
            break;
        default:
            $hAlignment = \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_LEFT;
    }

    $style = [
        'font' => [
            'size' => $fontSize,
            'name' => $fontName,
            'bold' => $fontBold,
            'color' => ['rgb' => $fontColor]
        ],
        'borders' => [
            $borderType => [
                'borderStyle' => $borderStyle,
                'color' => ['argb' => '00000000']
            ],
        ],
        'alignment' => [
            'vertical' => $vAlignment,
            'horizontal' => $hAlignment,
            'textRotation' => $textRotation,
            //'shrinkToFit' => true,
            'wrapText' => $wrapText,
            'indent' => false
        ]
    ];
    return $style;
}

// Create new Spreadsheet object
$spreadsheet = new Spreadsheet();

// Set document properties
$spreadsheet->getProperties()->setCreator('Carlos Zenteno')
    ->setLastModifiedBy('Carlos Zenteno')
    ->setTitle('Sabana de Calificaciones')
    ->setSubject('Sabana de Calificaciones')
    ->setDescription('Sabana de Calificaciones | IAP Chiapas')
    ->setKeywords('Sabana')
    ->setCategory('Calificaciones');

/**
 * 1 - Frontal (Inicial) -  Sin Calificaciones
 * 2 - Trasera (Inicial)
 * 3 - Frontal (Final) - Con Calificaciones
 * 4 - Trasera (Final)
 */
// echo "Tipo: " . $type; exit;
// Sabana de Calificaciones (Iniciales)
if($typeXlsx == 1 || $typeXlsx == 3)
{
    $indexStudent = 0;
    $numberStudent = 1;
    $firstEmptyRow = 0;
    $totalHombres = 0;
    $bajasHombre = 0;
    $totalMujeres = 0;
    $bajasMujer = 0;
    for($iteration = 1; $iteration <= $totalPages; $iteration++)
    {
        if($iteration > 1)
            $spreadsheet->createSheet();
        $spreadsheet->setActiveSheetIndex($iteration - 1);
        $sheet = $spreadsheet->getActiveSheet();

        $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
        $sheet->getPageSetup()->setPaperSize(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::PAPERSIZE_LEGAL);
        $sheet->getPageSetup()->setHorizontalCentered(true);
        $sheet->getPageMargins()->setTop(0.3);
        $sheet->getPageMargins()->setRight(0.2);
        $sheet->getPageMargins()->setLeft(0.2);
        $sheet->getPageMargins()->setBottom(0.2);
        $sheet->getPageMargins()->setHeader(0.3);
        $sheet->getPageMargins()->setFooter(0);
        // Configuracion General
        $sheet->getRowDimension('1')->setRowHeight(8);
        $sheet->getRowDimension('2')->setRowHeight(9.42);
        $sheet->getRowDimension('3')->setRowHeight(9.42);
        $sheet->getRowDimension('4')->setRowHeight(9.42);
        $sheet->getRowDimension('5')->setRowHeight(9.42);
        $sheet->getRowDimension('6')->setRowHeight(9.42);
        $sheet->getRowDimension('7')->setRowHeight(2.57);
        $sheet->getRowDimension('8')->setRowHeight(9.42);
        $sheet->getRowDimension('9')->setRowHeight(9.71);
        $sheet->getRowDimension('10')->setRowHeight(12);
        $sheet->getRowDimension('11')->setRowHeight(11.71);
        $sheet->getRowDimension('12')->setRowHeight(10.28);
        $sheet->getRowDimension('13')->setRowHeight(9.71);
        $sheet->getRowDimension('14')->setRowHeight(10.28);
        $sheet->getRowDimension('15')->setRowHeight(9.42);
        $sheet->getRowDimension('16')->setRowHeight(9.42);
        $sheet->getRowDimension('17')->setRowHeight(66.28);
        $sheet->getRowDimension('18')->setRowHeight(18.28);
        for($nR = 19; $nR < 44; $nR++)
            $sheet->getRowDimension($nR)->setRowHeight(12.85);
        //$sheet->getColumnDimension('A')->setWidth(3); -> 5
        $sheet->getColumnDimension('A')->setWidth(3.2);
        $sheet->getColumnDimension('B')->setWidth(4.7);
        $sheet->getColumnDimension('C')->setWidth(4.4);
        $sheet->getColumnDimension('D')->setWidth(10.05);
        $sheet->getColumnDimension('E')->setWidth(12.35);
        $sheet->getColumnDimension('F')->setWidth(12.35);
        $sheet->getColumnDimension('G')->setWidth(18.9);
        $sheet->getColumnDimension('H')->setWidth(3);
        $sheet->getColumnDimension('I')->setWidth(3.6);
        $sheet->getColumnDimension('J')->setWidth(3.6);
        $sheet->getColumnDimension('K')->setWidth(3.6);
        $sheet->getColumnDimension('L')->setWidth(3.6);
        $sheet->getColumnDimension('M')->setWidth(3.6);
        $sheet->getColumnDimension('N')->setWidth(3.6);
        $sheet->getColumnDimension('O')->setWidth(3.6);
        $sheet->getColumnDimension('P')->setWidth(3.6);
        $sheet->getColumnDimension('Q')->setWidth(3.6);
        $sheet->getColumnDimension('R')->setWidth(3.6);
        $sheet->getColumnDimension('S')->setWidth(3.6);
        $sheet->getColumnDimension('T')->setWidth(3.6);
        $sheet->getColumnDimension('U')->setWidth(3.6);
        $sheet->getColumnDimension('V')->setWidth(3.6);
        $sheet->getColumnDimension('W')->setWidth(3.6);
        $sheet->getColumnDimension('X')->setWidth(3.6);
        $sheet->getColumnDimension('Y')->setWidth(3.6);
        $sheet->getColumnDimension('Z')->setWidth(3.6);
        $sheet->getColumnDimension('AA')->setWidth(3.6);
        $sheet->getColumnDimension('AB')->setWidth(3.6);
        $sheet->getColumnDimension('AC')->setWidth(3.6);
        $sheet->getColumnDimension('AD')->setWidth(3.6);
        $sheet->getColumnDimension('AE')->setWidth(3.6);
        //$sheet->getColumnDimension('AE')->setAutoSize(true);
        $drawing = new Drawing();
        $drawing->setWorksheet($sheet);
        $drawing->setName('Escudo Chiapas');
        $drawing->setPath(DOC_ROOT . '/images/new/docs/logoChiapas.png');
        $drawing->setHeight(132);
        $drawing->setCoordinates('B2');
        $sheet->mergeCells('G2:O2');
        $sheet->setCellValue('G2', 'GOBIERNO CONSTITUCIONAL DEL ESTADO DE CHIAPAS');
        $sheet->getStyle('G2:O2')->applyFromArray(CellStyle(9, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('G3:O3');
        $sheet->setCellValue('G3', 'SECRETARÍA DE EDUCACIÓN');
        $sheet->getStyle('G3:O3')->applyFromArray(CellStyle(9, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('G4:O4');
        $sheet->setCellValue('G4', 'SUBSECRETARÍA DE EDUCACIÓN ESTATAL');
        $sheet->getStyle('G4:O4')->applyFromArray(CellStyle(9, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('G5:O5');
        $sheet->setCellValue('G5', 'DIRECCIÓN DE EDUCACIÓN SUPERIOR');
        $sheet->getStyle('G5:O5')->applyFromArray(CellStyle(9, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('G6:O6');
        $sheet->setCellValue('G6', 'REGISTRO DE CALIFICACIÓN');
        $sheet->getStyle('G6:O6')->applyFromArray(CellStyle(9, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
        $drawing2 = new Drawing();
        $drawing2->setWorksheet($sheet);
        $drawing2->setName('Logo IAP');
        $drawing2->setPath(DOC_ROOT . '/images/new/docs/logoIap.jpg');
        $drawing2->setHeight(75);
        $drawing2->setCoordinates('Q2');

        // Datos Generales
        $sheet->setCellValue('E9', 'ESCUELA');
        $sheet->getStyle('E9')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('F9:S9');
        $sheet->setCellValue('F9', 'INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS');
        $sheet->getStyle('F9:S9')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('U9:V9');
        $sheet->setCellValue('U9', 'CLAVE');
        $sheet->getStyle('U9:V9')->applyFromArray(CellStyle(6, 'Arial', false, 'bottom', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('W9:Y9');
        $sheet->setCellValue('W9', $myInstitution['identifier']);
        $sheet->getStyle('W9:Y9')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->setCellValue('E10', 'LOCALIDAD');
        $sheet->getStyle('E10')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('F10:H10');
        $sheet->setCellValue('F10', 'TUXTLA GUTIERREZ');
        $sheet->getStyle('F10:H10')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('I10:K10');
        $sheet->setCellValue('I10', $courseInfo['majorName'] . ' EN');
        $sheet->getStyle('I10')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('L10:S10');
        $sheet->setCellValue('L10', $courseInfo['name']);
        $sheet->getStyle('L10:S10')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0, false));
        $sheet->mergeCells('U10:V10');
        $sheet->setCellValue('U10', 'RVOE');
        $sheet->getStyle('U10:V10')->applyFromArray(CellStyle(6, 'Arial', false, 'bottom', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('W10:Y10');
        $sheet->setCellValue('W10', $courseInfo['rvoe']);
        $sheet->getStyle('W10:Y10')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->setCellValue('E11', 'MUNICIPIO');
        $sheet->getStyle('E11')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('F11:H11');
        $sheet->setCellValue('F11', 'TUXTLA GUTIERREZ');
        $sheet->getStyle('F11:H11')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('I11:K11');
        $sheet->setCellValue('I11', 'CICLO ESCOLAR');
        $sheet->getStyle('I11')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('L11:N11');
        $sheet->setCellValue('L11', $courseInfo['scholarCicle']);
        $sheet->getStyle('L11:N11')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('O11:Q11');
        $sheet->setCellValue('O11', mb_strtoupper($courseInfo['tipoCuatri']));
        $sheet->getStyle('O11:Q11')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'left', 0, false));
        $sheet->setCellValue('R11', $period);
        $sheet->getStyle('R11')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('S11:T11');
        $sheet->setCellValue('S11', 'GRUPO');
        $sheet->getStyle('S11:T11')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'left', 0));
        $sheet->setCellValue('U11', $courseInfo['group']);
        $sheet->getStyle('U11')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('V11:W11');
        $sheet->setCellValue('V11', 'TURNO');
        $sheet->getStyle('V11:W11')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('X11:Z11');
        $sheet->setCellValue('X11', $courseInfo['turn']);
        $sheet->getStyle('X11:Z11')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('AA10:AE11');
        $sheet->setCellValue('AA10', 'A PARTIR DEL ' . $util->FormatReadableDate($courseInfo['fechaRvoe']));
        $sheet->getStyle('AA10:AE11')->applyFromArray(CellStyle(5, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->setCellValue('E12', 'MODALIDAD');
        $sheet->getStyle('E12')->applyFromArray(CellStyle(6, 'Arial', false, 'none', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('F12:H12');
        $sheet->setCellValue('F12', $modality);
        $sheet->getStyle('F12:H12')->applyFromArray(CellStyle(6, 'Arial', true, 'bottom', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('K12:U12');
        $sheet->setCellValue('K12', $util->DeterminePeriod($courseModules[0]['initialDate'], $typeCourse));
        $sheet->getStyle('K12:U12')->applyFromArray(CellStyle(7, 'Arial', true, 'bottom', 'thin', 'center', 'center', 0));

        // Tabla Principal (Calificaciones)
        $sheet->mergeCells('A15:A18');
        $sheet->setCellValue('A15', 'NÚMERO PROGRESIVO');
        $sheet->getStyle('A15:A18')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('B15:C18');
        $sheet->setCellValue('B15', 'CURP');
        $sheet->getStyle('B15:C18')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('D15:D18');
        $sheet->setCellValue('D15', 'CLAVE D S.E. ' . $claveSE);
        $sheet->getStyle('D15:D18')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('E15:G17');
        $sheet->setCellValue('E15', 'NOMBRE DEL ALUMNO');
        $sheet->getStyle('E15:G17')->applyFromArray(CellStyle(8, 'Arial', true, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->setCellValue('E18', 'APELLIDO PATERNO');
        $sheet->getStyle('E18')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0, false));
        $sheet->setCellValue('F18', 'APELLIDO MATERNO');
        $sheet->getStyle('F18')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0, false));
        $sheet->setCellValue('G18', 'NOMBRE (S)');
        $sheet->getStyle('G18')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('H15:H18');
        $sheet->setCellValue('H15', 'SEXO');
        $sheet->getStyle('H15:H18')->applyFromArray(CellStyle(5, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('I15:P15');
        $sheet->setCellValue('I15', 'CALIFICACIONES FINALES');
        $sheet->getStyle('I15:P15')->applyFromArray(CellStyle(6, 'Arial', true, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('Q15:AB15');
        $sheet->setCellValue('Q15', 'CALIFICACIONES DE REGULARIZACIÓN');
        $sheet->getStyle('Q15:AB15')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AC15:AC18');
        $sheet->setCellValue('AC15', 'ASIGNATURAS NO ACREDITADAS');
        $sheet->getStyle('AC15:AC18')->applyFromArray(CellStyle(5, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('AD15:AD18');
        $sheet->setCellValue('AD15', 'SITUACIÓN ESCOLAR');
        $sheet->getStyle('AD15:AD18')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        // Listado de Estudiantes
        $noRow = 19;
        $maxStudents = 25;
        for($noItem = 1; $noItem <= $maxStudents; $noItem++)
        {
            $column = 'A';
            $lastNamePaterno = '';
            $lastNameMaterno = '';
            $names = '';
            $sexo = '';
            $baja = '';
            $clave_se = '';
            $bajaPeriodo = 0;
            $fails = 0;
            $modulesScore = [];
            if($indexStudent < $totalStudents)
            {
                $clave_se = $claveSE;
                $lastNamePaterno = mb_strtoupper($students[$indexStudent]['lastNamePaterno']);
                $lastNameMaterno = mb_strtoupper($students[$indexStudent]['lastNameMaterno']);
                $names = mb_strtoupper($students[$indexStudent]['names']);
                $sexo = ($students[$indexStudent]['sexo'] == 'm' ? 'H' : 'M');
                $baja = $students[$indexStudent]['type'];
                $bajaPeriodo = $students[$indexStudent]['semesterId'];
                $modulesScore = $students[$indexStudent]['modules'];
                if($sexo == 'H')
                    $totalHombres++;
                if($sexo == 'M')
                    $totalMujeres++;
            }
            if($indexStudent >= $totalStudents && $firstEmptyRow == 0)
                $firstEmptyRow = $noRow;
            // Consecutivo
            $sheet->setCellValue($column . $noRow, $numberStudent);
            $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            // CURP
            $mergeCells = ++$column . $noRow . ':' . ++$column . $noRow;
            $sheet->mergeCells($mergeCells);
            $sheet->setCellValue($column . $noRow, '');
            $sheet->getStyle($mergeCells)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            // Matricula
            $sheet->setCellValue(++$column . $noRow, $clave_se);
            $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            // Apellido Paterno
            $sheet->setCellValue(++$column . $noRow, $lastNamePaterno);
            $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            // Apellido Materno
            $sheet->setCellValue(++$column . $noRow, $lastNameMaterno);
            $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            // Nombre(s)
            $sheet->setCellValue(++$column . $noRow, $names);
            $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            // Nombre(s)
            $sheet->setCellValue(++$column . $noRow, $sexo);
            $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            if($typeXlsx == 1)
            {
                for($is = 0; $is < 22; $is++) 
                {
                    $sheet->setCellValue(++$column . $noRow, '');
                    $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                }
            }
            if($typeXlsx == 3)
            {
                for($is = 0; $is < count($courseModules); $is++) 
                {
                    $color = '000000';
                    $calificacion = $minCal - 1;
                    if($modulesScore != null)
                    {
                        if(array_key_exists($is, $modulesScore))
                        $calificacion = $modulesScore[$is]['calificacion'];
                        else
                            $calificacion = 0;
                    }
                    else
                        $calificacion = 0;
                    if($calificacion < $minCal)
                    {
                        $color = 'FF0000';
                        $fails++;
                    }
                    if($calificacion == 0)
                        $calificacion = 'NP';
                    if($lastNamePaterno == '')
                        $calificacion = '';
                    // Calificacion
                    $sheet->setCellValue(++$column . $noRow, $calificacion);
                    $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0, false, $color));
                }
                ++$column;
                if($baja == 'baja' && $period == $bajaPeriodo)
                {
                    if($sexo == 'H')
                        $bajasHombre++;
                    if($sexo == 'M')
                        $bajasMujer++;
                    $sheet->mergeCells($column . $noRow . ':AC' . $noRow);
                    $sheet->setCellValue($column . $noRow, 'BAJA TEMPORAL');
                    $sheet->getStyle($column . $noRow . ':AC' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0, true, 'FF0000'));
                    $sheet->setCellValue('AD' . $noRow, 'BT');
                    $sheet->getStyle('AD' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                }
                else
                {
                    if($fails > 1)
                    {
                        if($lastNamePaterno != '')
                        {
                            if($sexo == 'H')
                                $bajasHombre++;
                            if($sexo == 'M')
                                $bajasMujer++;
                            $sheet->mergeCells($column . $noRow . ':AC' . $noRow);
                            $sheet->setCellValue($column . $noRow, 'BAJA POR DESERCIÓN');
                            $sheet->getStyle($column . $noRow . ':AC' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0, true, 'FF0000'));
                            $sheet->setCellValue('AD' . $noRow, 'BD');
                            $sheet->getStyle('AD' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                        }
                        else
                        {
                            while($column != 'AE')
                            {
                                $sheet->setCellValue($column . $noRow, '');
                                $sheet->getStyle($column++ . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                            }
                        }
                    }
                    else
                    {
                        $colLimit = ($fails == 1 ? 'AC' : 'AD');
                        while($column != $colLimit)
                        {
                            $sheet->setCellValue($column . $noRow, '');
                            $sheet->getStyle($column++ . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                        }
                        if($fails == 1)
                        {
                            $sheet->setCellValue('AC' . $noRow, $fails);
                            $sheet->getStyle('AC' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                        }
                        $sheet->setCellValue('AD' . $noRow, 'P');
                        $sheet->getStyle('AD' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                    }
                }
            }
            $noRow++;
            $indexStudent++;
            $numberStudent++;
        }
        $maxColumns = 20;
        $noColumn = 1;
        $beginColumn = 'I';
        foreach($courseModules as $item)
        {
            $sheet->mergeCells($beginColumn . '16:' . $beginColumn . '18');
            $sheet->setCellValue($beginColumn . '16', $item['subjectModuleName']);
            $sheet->getStyle($beginColumn . '16:' . $beginColumn . '18')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
            $noColumn++;
            $beginColumn++;
        }
        for($i = $noColumn; $i <= $maxColumns; $i++)
        {
            $sheet->mergeCells($beginColumn . '16:' . $beginColumn . '18');
            $sheet->setCellValue($beginColumn . '16', '');
            $sheet->getStyle($beginColumn . '16:' . $beginColumn . '18')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
            $beginColumn++;
        }

        // Datos Estadisticos
        $sheet->mergeCells('Z1:AD1');
        $sheet->setCellValue('Z1', 'DATOS ESTADISTICOS');
        $sheet->getStyle('Z1:AD1')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('Z2:AA4');
        $sheet->setCellValue('Z2', 'CONCEPTO');
        $sheet->getStyle('Z2:AA4')->applyFromArray(CellStyle(5, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AB2:AB4');
        $sheet->setCellValue('AB2', 'HOMBRES');
        $sheet->getStyle('AB2:AB4')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('AC2:AC4');
        $sheet->setCellValue('AC2', 'MUJERES');
        $sheet->getStyle('AC2:AC4')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('AD2:AD4');
        $sheet->setCellValue('AD2', 'TOTAL');
        $sheet->getStyle('AD2:AD4')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('Z5:AA6');
        $sheet->setCellValue('Z5', 'INSCRITOS INICIO DE CURSOS');
        $sheet->getStyle('Z5:AA6')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('AB5:AB6');
        $sheet->setCellValue('AB5', $totalHombres); // Hombres
        $sheet->getStyle('AB5:AB6')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AC5:AC6');
        $sheet->setCellValue('AC5', $totalMujeres); // Mujeres
        $sheet->getStyle('AC5:AC6')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AD5:AD6');
        $sheet->setCellValue('AD5', $totalHombres + $totalMujeres); // Total
        $sheet->getStyle('AD5:AD6')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('Z8:AA9');
        $sheet->setCellValue('Z8', 'FIN DE CURSOS');
        $sheet->getStyle('Z8:AA9')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('AB8:AB9');
        $sheet->setCellValue('AB8', ($typeXlsx == 1 ? '' : ($totalHombres - $bajasHombre))); // Hombres
        $sheet->getStyle('AB8:AB9')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AC8:AC9');
        $sheet->setCellValue('AC8', ($typeXlsx == 1 ? '' : ($totalMujeres - $bajasMujer))); // Mujeres
        $sheet->getStyle('AC8:AC9')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AD8:AD9');
        $sheet->setCellValue('AD8', ($typeXlsx == 1 ? '' : ($totalHombres - $bajasHombre) + ($totalMujeres - $bajasMujer))); // Total
        $sheet->getStyle('AD8:AD9')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));

        // Rename worksheet
        $spreadsheet->setActiveSheetIndex($iteration - 1)->setTitle('Hoja ' . $iteration);
    }
    //echo $firstEmptyRow; exit;
}



// Sabana de Calificaciones (Traseras)
if($typeXlsx == 2 || $typeXlsx == 4)
{
    $indexStudent = 0;
    $numberStudent = 1;
    $firstEmptyRow = 0;
    // for($iteration = 1; $iteration <= $totalPages; $iteration++)
    if($iteration > 1)
        $spreadsheet->createSheet();
    $spreadsheet->setActiveSheetIndex(0);
    $sheet = $spreadsheet->getActiveSheet();

    $sheet->getPageSetup()->setOrientation(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::ORIENTATION_LANDSCAPE);
    $sheet->getPageSetup()->setPaperSize(\PhpOffice\PhpSpreadsheet\Worksheet\PageSetup::PAPERSIZE_LEGAL);
    $sheet->getPageSetup()->setHorizontalCentered(true);
    $sheet->getPageMargins()->setTop(0.3);
    $sheet->getPageMargins()->setRight(0.2);
    $sheet->getPageMargins()->setLeft(0.2);
    $sheet->getPageMargins()->setBottom(0.2);
    $sheet->getPageMargins()->setHeader(0.3);
    $sheet->getPageMargins()->setFooter(0);
    // Configuracion General
    $rowFactor = 0.47;
    $sheet->getRowDimension('1')->setRowHeight($rowFactor * 42);
    $sheet->getRowDimension('2')->setRowHeight($rowFactor * 35.3);
    $sheet->getRowDimension('3')->setRowHeight($rowFactor * 89.3);
    $sheet->getRowDimension('4')->setRowHeight($rowFactor * 50.3);
    $sheet->getRowDimension('5')->setRowHeight($rowFactor * 23.2);
    $sheet->getRowDimension('6')->setRowHeight($rowFactor * 9.8);
    for($nR = 7; $nR < 14; $nR++)
        $sheet->getRowDimension($nR)->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('14')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('15')->setRowHeight($rowFactor * 23.2);
    $sheet->getRowDimension('16')->setRowHeight($rowFactor * 23.3);
    $sheet->getRowDimension('17')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('18')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('19')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('20')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('21')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('22')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('23')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('24')->setRowHeight($rowFactor * 17.2);
    $sheet->getRowDimension('25')->setRowHeight($rowFactor * 36);
    $sheet->getRowDimension('26')->setRowHeight($rowFactor * 16);
    $sheet->getRowDimension('27')->setRowHeight($rowFactor * 36);
    $sheet->getRowDimension('28')->setRowHeight($rowFactor * 23.2);
    $sheet->getRowDimension('29')->setRowHeight($rowFactor * 35.3);
    $sheet->getRowDimension('30')->setRowHeight($rowFactor * 23.2);
    $sheet->getRowDimension('31')->setRowHeight($rowFactor * 209.3);
    $sheet->getRowDimension('32')->setRowHeight($rowFactor * 24.9);
    $sheet->getRowDimension('33')->setRowHeight($rowFactor * 18);
    $sheet->getRowDimension('34')->setRowHeight($rowFactor * 168);
    $sheet->getRowDimension('35')->setRowHeight($rowFactor * 30);
    $sheet->getRowDimension('36')->setRowHeight($rowFactor * 32.3);
    //$sheet->getColumnDimension('A')->setWidth(3); -> 5
    $columnFactor = 0.49;
    $sheet->getColumnDimension('A')->setWidth($columnFactor * 0.56);
    $sheet->getColumnDimension('B')->setWidth($columnFactor * 1.73);
    $sheet->getColumnDimension('C')->setWidth($columnFactor * 6.36);
    $sheet->getColumnDimension('D')->setWidth($columnFactor * 5.73);
    $sheet->getColumnDimension('E')->setWidth($columnFactor * 5.73);
    $sheet->getColumnDimension('F')->setWidth($columnFactor * 26.73);
    $sheet->getColumnDimension('G')->setWidth($columnFactor * 45.73);
    $sheet->getColumnDimension('H')->setWidth($columnFactor * 13.55);
    $sheet->getColumnDimension('I')->setWidth($columnFactor * 14.18);
    $sheet->getColumnDimension('J')->setWidth($columnFactor * 5.73);
    $sheet->getColumnDimension('K')->setWidth($columnFactor * 9);
    $sheet->getColumnDimension('L')->setWidth($columnFactor * 7);
    $sheet->getColumnDimension('M')->setWidth($columnFactor * 7);
    $sheet->getColumnDimension('N')->setWidth($columnFactor * 7);
    $sheet->getColumnDimension('O')->setWidth($columnFactor * 7);
    $sheet->getColumnDimension('P')->setWidth($columnFactor * 45.82);
    $sheet->getColumnDimension('Q')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('R')->setWidth($columnFactor * 5);
    $sheet->getColumnDimension('S')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('T')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('U')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('V')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('W')->setWidth($columnFactor * 5.36);
    $sheet->getColumnDimension('X')->setWidth($columnFactor * 6.73);
    $sheet->getColumnDimension('Y')->setWidth($columnFactor * 6.73);
    $sheet->getColumnDimension('Z')->setWidth($columnFactor * 6.73);
    $sheet->getColumnDimension('AA')->setWidth($columnFactor * 7.45);
    $sheet->getColumnDimension('AB')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('AC')->setWidth($columnFactor * 3.73);
    $sheet->getColumnDimension('AD')->setWidth($columnFactor * 48.73);
    
    $sheet->mergeCells('C1:C4');
    $sheet->setCellValue('C1', 'NÚMERO PROGRESIVO');
    $sheet->getStyle('C1:C4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('D1:E2');
    $sheet->setCellValue('D1', 'ANTECEDENTES');
    $sheet->getStyle('D1:E2')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('D3:D4');
    $sheet->setCellValue('D3', 'ASIGNATURAS NO ACREDITADAS');
    $sheet->getStyle('D3:D4')->applyFromArray(CellStyle(10, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('E3:E4');
    $sheet->setCellValue('E3', 'SITUACIÓN ESCOLAR');
    $sheet->getStyle('E3:E4')->applyFromArray(CellStyle(10, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('F1:F3');
    $sheet->setCellValue('F1', 'NÚMERO DE CONTROL');
    $sheet->getStyle('F1:F3')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('F4', 'CLAVE DE S.E.');
    $sheet->getStyle('F4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('G1:I3');
    $sheet->setCellValue('G1', 'NOMBRE DEL ALUMNO');
    $sheet->getStyle('G1:I3')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('G4:I4');
    $sheet->setCellValue('G4', 'APELLIDO PATERNO MATERNO NOMBRE (S)');
    $sheet->getStyle('G4:I4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('J1:J4');
    $sheet->setCellValue('J1', 'SEXO');
    $sheet->getStyle('J1:J4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('K1:P1');
    $sheet->setCellValue('K1', 'CALIFICACIONES FINALES');
    $sheet->getStyle('K1:P1')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('P2:P4');
    $sheet->setCellValue('P2', '');
    $sheet->getStyle('P2:P4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $beginColumn = 'K';
    foreach($courseModules as $item)
    {
        $sheet->mergeCells($beginColumn . '2:' . $beginColumn . '4');
        $sheet->setCellValue($beginColumn . '2', $item['subjectModuleName']);
        $sheet->getStyle($beginColumn . '2:' . $beginColumn . '4')->applyFromArray(CellStyle(5, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $beginColumn++;
    }
    while($beginColumn != 'P')
    {
        $sheet->mergeCells($beginColumn . '2:' . $beginColumn . '4');
        $sheet->setCellValue($beginColumn . '2', '');
        $sheet->getStyle($beginColumn . '2:' . $beginColumn . '4')->applyFromArray(CellStyle(5, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $beginColumn++;
    }
    $sheet->mergeCells('Q1:AB1');
    $sheet->setCellValue('Q1', 'CALIFICACIONES DE REGULARIZACIÓN');
    $sheet->getStyle('Q1:AB1')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('Q2:Q4');
    $sheet->setCellValue('Q2', 'CLAVE MATERIA');
    $sheet->getStyle('Q2:Q4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('R2:R4');
    $sheet->setCellValue('R2', 'CALIFICACIÓN');
    $sheet->getStyle('R2:R4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('S2:S4');
    $sheet->setCellValue('S2', 'TIPO DE EXAMEN');
    $sheet->getStyle('S2:S4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('T2:T4');
    $sheet->setCellValue('T2', 'CLAVE MATERIA');
    $sheet->getStyle('T2:T4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('U2:U4');
    $sheet->setCellValue('U2', 'CALIFICACIÓN');
    $sheet->getStyle('U2:U4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('V2:V4');
    $sheet->setCellValue('V2', 'TIPO DE EXAMEN');
    $sheet->getStyle('V2:V4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('W2:W4');
    $sheet->setCellValue('W2', 'CLAVE MATERIA');
    $sheet->getStyle('W2:W4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('X2:X4');
    $sheet->setCellValue('X2', 'CALIFICACIÓN');
    $sheet->getStyle('X2:X4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('Y2:Y4');
    $sheet->setCellValue('Y2', 'TIPO DE EXAMEN');
    $sheet->getStyle('Y2:Y4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('Z2:Z4');
    $sheet->setCellValue('Z2', 'CLAVE MATERIA');
    $sheet->getStyle('Z2:Z4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('AA2:AA4');
    $sheet->setCellValue('AA2', 'CALIFICACIÓN');
    $sheet->getStyle('AA2:AA4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('AB2:AB4');
    $sheet->setCellValue('AB2', 'TIPO DE EXAMEN');
    $sheet->getStyle('AB2:AB4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('AC1:AC4');
    $sheet->setCellValue('AC1', 'ASIGNATURAS NO ACREDITADAS');
    $sheet->getStyle('AC1:AC4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('AD1:AD4');
    $sheet->setCellValue('AD1', 'SITUACIÓN ESCOLAR');
    $sheet->getStyle('AD1:AD4')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
    $sheet->mergeCells('H5:M5');
    $sheet->setCellValue('H5', 'ALUMNOS QUE REPITEN CURSO');
    $sheet->getStyle('H5:M5')->applyFromArray(CellStyle(10, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
    /**
     * ALUMNOS RECURSADORES
     */
    $nR = 7;
    $indexStudent = 0;
    for($row = 7; $row <= 13; $row++)
    {
        $lastNamePaterno = '';
        $lastNameMaterno = '';
        $names = '';
        $sexo = '';
        $modulesScore = [];
        if($indexStudent < $totalStudents)
        {
            $lastNamePaterno = mb_strtoupper($students[$indexStudent]['lastNamePaterno']);
            $lastNameMaterno = mb_strtoupper($students[$indexStudent]['lastNameMaterno']);
            $names = mb_strtoupper($students[$indexStudent]['names']);
            $sexo = ($students[$indexStudent]['sexo'] == 'm' ? 'H' : 'M');
            $baja = $students[$indexStudent]['type'];
            $bajaPeriodo = $students[$indexStudent]['semesterId'];
            $modulesScore = $students[$indexStudent]['modules'];
        }
        $sheet->getStyle('C' . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('D' . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('E' . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('F' . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('G' . $row . ':' . 'I' . $row);
        $sheet->setCellValue('G' . $row, $lastNamePaterno . ' ' . $lastNameMaterno . ' ' . $names);
        $sheet->getStyle('G' . $row . ':' . 'I' . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'left', 0));
        $sheet->setCellValue('J' . $row, $sexo);
        $sheet->getStyle('J' . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        /**
         * CALIFICACIONES
         */
        $column = 'J';
        /* echo "<pre>";
        print_r($modulesScore);
        exit; */
        if($typeXlsx == 4)
        {
            for($is = 0; $is < count($courseModules); $is++) 
            {
                $calificacion = $minCal - 1;
                if(array_key_exists($is, $modulesScore))
                    $calificacion = $modulesScore[$is]['calificacion'];
                if($lastNamePaterno == '')
                    $calificacion = '';
                // Calificacion
                $sheet->setCellValue(++$column . $row, $calificacion);
                $sheet->getStyle($column . $row)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            }
            ++$column;
        }
        while($column != 'AE')
        {
            $sheet->getStyle($column . $row)->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
            $column++;
        }
        $indexStudent++;
    }

    $sheet->mergeCells('H15:M15');
    $sheet->setCellValue('H15', 'ALUMNOS DADOS DE ALTA');
    $sheet->getStyle('H15:M15')->applyFromArray(CellStyle(10, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
    for($row = 17; $row <= 23; $row++)
    {
        $sheet->getStyle('C' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('D' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('E' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('F' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('G' . $row . ':' . 'I' . $row);
        $sheet->getStyle('G' . $row . ':' . 'I' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('J' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('K' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('L' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('M' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('N' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('O' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('P' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('Q' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('R' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('S' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('T' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('U' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('V' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('W' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('X' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('Y' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('Z' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('AA' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('AB' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('AC' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->getStyle('AD' . $row)->applyFromArray(CellStyle(8, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    }
    // INSCRIPCIÓN O REINSCRIPCIÓN
    $sheet->mergeCells('C25:G25');
    $sheet->setCellValue('C25', 'INSCRIPCIÓN O REINSCRIPCIÓN');
    $sheet->getStyle('C25:G25')->applyFromArray(CellStyle(7, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('C27:F32');
    $sheet->getStyle('C27:F32')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('C33:F33');
    $sheet->setCellValue('C33', 'SELLO INSTITUCIÓN');
    $sheet->getStyle('C33:F33')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('C34:F34');
    $sheet->getStyle('C34:F34')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('C35:F35');
    $sheet->setCellValue('C35', mb_strtoupper($myInstitution['directorAcademico']));
    $sheet->getStyle('C35:F35')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('C36:F36');
    $sheet->setCellValue('C36', 'DIRECTORA ACADÉMICA');
    $sheet->getStyle('C36:F36')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('G27', 'DEPARTAMENTO DE SERVICIOS ESCOLARES');
    $sheet->getStyle('G27')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('G28:G31');
    $sheet->getStyle('G28:G31')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('G32', 'FECHA: ');
    $sheet->getStyle('G32')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('G33', 'FECHA Y SELLO DE VALIDACIÓN');
    $sheet->getStyle('G33')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->getStyle('G34')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('G35', 'ROMEO GUZMÁN VILLARREAL');
    $sheet->getStyle('G35')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('G36', 'NOMBRE Y FIRMA DE QUIEN VALIDA');
    $sheet->getStyle('G36')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));

    // ACREDITACIÓN Y REGULARIZACIÓN
    $sheet->mergeCells('J25:P25');
    $sheet->setCellValue('J25', 'ACREDITACIÓN Y REGULARIZACIÓN');
    $sheet->getStyle('J25:P25')->applyFromArray(CellStyle(7, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('J27:O32');
    $sheet->getStyle('J27:O32')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('J33:O33');
    $sheet->setCellValue('J33', 'SELLO INSTITUCIÓN');
    $sheet->getStyle('J33:O33')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('J34:O34');
    $sheet->getStyle('J34:O34')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('J35:O35');
    $sheet->setCellValue('J35', mb_strtoupper($myInstitution['directorAcademico']));
    $sheet->getStyle('J35:O35')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('J36:O36');
    $sheet->setCellValue('J36', 'DIRECTORA ACADÉMICA');
    $sheet->getStyle('J36:O36')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('P27', 'DEPARTAMENTO DE SERVICIOS ESCOLARES');
    $sheet->getStyle('P27')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('P28:P31');
    $sheet->getStyle('P28:P31')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('P32', 'FECHA: ');
    $sheet->getStyle('P32')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('P33', 'FECHA Y SELLO DE VALIDACIÓN');
    $sheet->getStyle('P33')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->getStyle('P34')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('P35', 'ROMEO GUZMÁN VILLARREAL');
    $sheet->getStyle('P35')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('P36', 'NOMBRE Y FIRMA DE QUIEN VALIDA');
    $sheet->getStyle('P36')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));

    // LEGALIZACIÓN DEL DOCUMENTO
    $sheet->mergeCells('W25:AD25');
    $sheet->setCellValue('W25', 'LEGALIZACIÓN DEL DOCUMENTO');
    $sheet->getStyle('W25:AD25')->applyFromArray(CellStyle(7, 'Arial', true, 'none', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W27:AD27');
    $sheet->setCellValue('W27', 'DEPARTAMENTO DE SERVICIOS ESCOLARES');
    $sheet->getStyle('W27:AD27')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W28:AD28');
    $sheet->setCellValue('W28', 'PERIODO LEGALIZADO: ');
    $sheet->getStyle('W28:AD28')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W29:AD31');
    $sheet->getStyle('W29:AD31')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W32:AD32');
    $sheet->setCellValue('W32', 'FECHA: ');
    $sheet->getStyle('W32:AD32')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'left', 0));
    $sheet->mergeCells('W33:AD33');
    $sheet->setCellValue('W33', 'FECHA Y SELLO DE LEGALIZACIÓN');
    $sheet->getStyle('W33:AD33')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W34:AC34');
    $sheet->getStyle('W34:AC34')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->getStyle('AD34')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W35:AC35');
    $sheet->getStyle('W35:AC35')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->getStyle('AD35')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->mergeCells('W36:AC36');
    $sheet->setCellValue('W36', 'JEFE DE LA OFICINA');
    $sheet->getStyle('W36:AC36')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
    $sheet->setCellValue('AD36', 'JEFE DEL DEPARTAMENTO DE SERVICIOS ESCOLARES');
    $sheet->getStyle('AD36')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));

    // Rename worksheet
    $spreadsheet->setActiveSheetIndex(0)->setTitle('Hoja 1');
}




// Set active sheet index to the first sheet, so Excel opens this as the first sheet
$spreadsheet->setActiveSheetIndex(0);

// Redirect output to a client’s web browser (Xls)
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="Sabana.xls"');
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
exit;
?>