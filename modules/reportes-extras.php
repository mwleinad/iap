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
user.lastNameMaterno;"); 
$result = $util->Util()->DB()->GetResult(); 
echo "<pre>";

foreach ($result as $item) {
    $course->setCourseId($item['courseId']);
    $infoCourse = $course->Info(); 
    for ($period = 1; $period <=  $infoCourse['totalPeriods']; $period++) { 
        $tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, true); 
        foreach ($tmp as $item) { 
            $qualifications[$period][] = [
                'subjectModuleId' => $item['subjectModuleId'],
                'name' => $item['name'],
                'addepUp' => $item['addepUp'],						
                'score' => $item['score'],
                'comments' => ''
            ]; 
        }
    } 
    $cursos[$key]["calificaciones"] = $qualifications;  
}
print_r($result);
// $group->setCourseId($_GET['curso']);
// $students = $group->DefaultGroup();
// // Create new Spreadsheet object
// $spreadsheet = new Spreadsheet();

// // Set document properties
// $spreadsheet->getProperties()->setCreator('William Ramírez')
//     ->setLastModifiedBy('William Ramírez')
//     ->setTitle('Alumnos')
//     ->setSubject('Alumnos')
//     ->setDescription('Alumnos | IAP Chiapas')
//     ->setKeywords('Alumnos')
//     ->setCategory('Calificaciones');
// $sheet = $spreadsheet->getActiveSheet();
// $sheet->setCellValue('A1','Nombre(s)');
// $sheet->setCellValue('B1','Apellidos');
// $sheet->setCellValue('C1','Correo');
// $sheet->setCellValue('D1','Contraseña'); 

// for ($i=2; $i < count($students) ; $i++) {
//     $sheet->setCellValue('A'.$i,$students[$i-2]['names']);
//     $sheet->setCellValue('B'.$i,$students[$i-2]['lastNamePaterno']." ".$students[$i-2]['lastNameMaterno']);
//     $sheet->setCellValue('C'.$i,$students[$i-2]['controlNumber']."@iapchiapas.edu.mx"); 
//     $password = "iap2023_".rand(100,999);
//     $sheet->setCellValue('D'.$i,$password);
// }

// // Redirect output to a client’s web browser (Xls)
// header('Content-Type: application/vnd.ms-excel; charset=utf-8');
// header('Content-Disposition: attachment;filename="alumnos.xls"');
// header('Cache-Control: max-age=0');
// // If you're serving to IE 9, then the following may be needed
// header('Cache-Control: max-age=1');

// // If you're serving to IE over SSL, then the following may be needed
// header('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
// header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT'); // always modified
// header('Cache-Control: cache, must-revalidate'); // HTTP/1.1
// header('Pragma: public'); // HTTP/1.0

// $writer = IOFactory::createWriter($spreadsheet, 'Xls');
// $writer->save('php://output');