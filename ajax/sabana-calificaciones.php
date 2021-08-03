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
//echo $type; exit;
$course->setCourseId($courseId);
$courseInfo = $course->Info();
$courseModules = $course->ListModules($period, true, " ORDER BY cm.initialDate");
$students = $course->SabanaCalificacionesFrontal($period, true, " ORDER BY cm.initialDate", $type = 'final');
$minCal = 7;
if($courseInfo['majorId'] == 18)
    $minCal = 8;
/* echo "<pre>";
var_dump($students);
exit; */
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
// Prueba Grupo Temporal
/* $group->setCourseId($courseId);
$students = $group->DefaultGroup(); */
$totalStudents = count($students);
$totalPages = intval(ceil($totalStudents/25));

// Funcion para generar estilos
function CellStyle($fontSize, $fontName, $fontBold, $borderType, $borderStyle, $vAlignment, $hAlignment, $textRotation, $wrapText = true)
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
            'bold' => $fontBold
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
if($typeXlsx == 1 || $typeXlsx == 3)
{
    $indexStudent = 0;
    $numberStudent = 1;
    $firstEmptyRow = 0;
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
        $sheet->setCellValue('AB5', '');
        $sheet->getStyle('AB5:AB6')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AC5:AC6');
        $sheet->setCellValue('AC5', '');
        $sheet->getStyle('AC5:AC6')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AD5:AD6');
        $sheet->setCellValue('AD5', '');
        $sheet->getStyle('AD5:AD6')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('Z8:AA9');
        $sheet->setCellValue('Z8', 'FIN DE CURSOS');
        $sheet->getStyle('Z8:AA9')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'left', 0));
        $sheet->mergeCells('AB8:AB9');
        $sheet->setCellValue('AB8', '');
        $sheet->getStyle('AB8:AB9')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AC8:AC9');
        $sheet->setCellValue('AC8', '');
        $sheet->getStyle('AC8:AC9')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('AD8:AD9');
        $sheet->setCellValue('AD8', '');
        $sheet->getStyle('AD8:AD9')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));

        // Tabla Principal (Calificaciones)
        $sheet->mergeCells('A15:A18');
        $sheet->setCellValue('A15', 'NÚMERO PROGRESIVO');
        $sheet->getStyle('A15:A18')->applyFromArray(CellStyle(4, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 90));
        $sheet->mergeCells('B15:C18');
        $sheet->setCellValue('B15', 'CURP');
        $sheet->getStyle('B15:C18')->applyFromArray(CellStyle(6, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
        $sheet->mergeCells('D15:D18');
        $sheet->setCellValue('D15', 'CLAVE D S.E. ');
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
            $bajaPeriodo = 0;
            $fails = 0;
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
            $sheet->setCellValue(++$column . $noRow, '');
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
                    $calificacion = $minCal - 1;
                    if(array_key_exists($is, $modulesScore))
                        $calificacion = $modulesScore[$is]['calificacion'];
                    if($calificacion < $minCal)
                        $fails++;
                    if($lastNamePaterno == '')
                        $calificacion = '';
                    // Calificacion
                    $sheet->setCellValue(++$column . $noRow, $calificacion);
                    $sheet->getStyle($column . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                }
                ++$column;
                if($baja == 'baja' && $period == $bajaPeriodo)
                {
                    $sheet->mergeCells($column . $noRow . ':AC' . $noRow);
                    $sheet->setCellValue($column . $noRow, 'BAJA TEMPORAL');
                    $sheet->getStyle($column . $noRow . ':AC' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                    $sheet->setCellValue('AD' . $noRow, 'BT');
                    $sheet->getStyle('AD' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
                }
                else
                {
                    if($fails > 1)
                    {
                        if($lastNamePaterno != '')
                        {
                            $sheet->mergeCells($column . $noRow . ':AC' . $noRow);
                            $sheet->setCellValue($column . $noRow, 'BAJA POR DESERCIÓN');
                            $sheet->getStyle($column . $noRow . ':AC' . $noRow)->applyFromArray(CellStyle(7, 'Arial', false, 'allBorders', 'thin', 'center', 'center', 0));
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

        // Rename worksheet
        $spreadsheet->setActiveSheetIndex($iteration - 1)->setTitle('Hoja ' . $iteration);
    }
    //echo $firstEmptyRow; exit;
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