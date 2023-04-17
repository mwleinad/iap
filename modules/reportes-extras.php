<?php
include_once('init.php');
include_once('config.php');
include_once(DOC_ROOT.'/libraries.php');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;
$util->Util()->DB()->setQuery("SELECT
user_subject.courseId,
user_subject.alumnoId,
user_subject.status,
subject.name AS name,
major.name AS majorName,
subject.icon,
course.group,
course.modality,
course.initialDate,
course.finalDate,
user.lastNamePaterno,
user.lastNameMaterno,
user.names
FROM
user_subject
INNER JOIN user ON user.userId = user_subject.alumnoId
LEFT JOIN course ON course.courseId = user_subject.courseId
LEFT JOIN subject ON subject.subjectId = course.subjectId
LEFT JOIN major ON major.majorId = subject.tipo
WHERE
course.active = 'si' AND CURDATE() <= course.finalDate AND user_subject.status = 'activo' AND course.courseId NOT IN(61, 81, 82, 98, 80, 59, 137, 97)
ORDER BY
course.courseId,
user.lastNamePaterno,
user.lastNameMaterno"); 
$result = $util->Util()->DB()->GetResult(); 
$spreadsheet = new Spreadsheet();
$spreadsheet->getProperties()->setCreator('William Ramírez')
    ->setLastModifiedBy('William Ramírez')
    ->setTitle('Promedios')
    ->setSubject('Promedios')
    ->setDescription('Promedios | IAP Chiapas')
    ->setKeywords('Promedios')
    ->setCategory('Calificaciones');
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1','Currícula');
$sheet->setCellValue('B1','Grupo');
$sheet->setCellValue('C1','Nombre');
$sheet->setCellValue('D1','Apellido Paterno'); 
$sheet->setCellValue('E1','Apellido Materno'); 
$sheet->setCellValue('F1','Promedio'); 
// $sheet->setCellValue('G1','Materias'); 
$i = 2;
foreach ($result as $alumnos) { 
    $course->setCourseId($alumnos['courseId']);
    $student->setUserId($alumnos['alumnoId']);
    $infoCourse = $course->Info(); 

    $recursamiento = true;
    $qualifications_repeat = [];
    if ($recursamiento) {
        $has_modules_repeat = $student->hasModulesRepeat(); 
        if ($has_modules_repeat) {
            $tmp = $student->StudentModulesRepeat(); 
            foreach ($tmp as $item) {
                $qualifications_repeat[$item['subjectModuleId']] = [ 
                    'score' => $item['score']
                ];
            }
        }
    }

    $sumCal = 0;
    $materias = 0;
    $esRecursada = "no";
    for ($period = 1; $period <=  $infoCourse['totalPeriods']; $period++) { 
        $tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, false); 
        foreach ($tmp as $item) { 
            if (array_key_exists($item['subjectModuleId'], $qualifications_repeat) && $recursamiento) {
                $sumCal+=$qualifications_repeat[$item['subjectModuleId']]['score']; 
                $esRecursada = "si";
            }else{
                $sumCal+=$item['score'];
            }
            $materias++;  
        }
    } 
    $materias = $materias == 0 ? 1 : $materias;
    $sheet->setCellValue('A'.$i,$alumnos['majorName']." - ".$alumnos['name']);
    $sheet->setCellValue('B'.$i,$alumnos['group']);
    $sheet->setCellValue('C'.$i,$alumnos['names']);
    $sheet->setCellValue('D'.$i,$alumnos['lastNamePaterno']);
    $sheet->setCellValue('E'.$i,$alumnos['lastNameMaterno']);
    $sheet->setCellValue('F'.$i,bcdiv($sumCal, $materias, 1)); 
    $sheet->setCellValue('G'.$i,$esRecursada); 
    // $sheet->setCellValue('G'.$i, $materias ); 
    $i++; 
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