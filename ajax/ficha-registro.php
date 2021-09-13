<?php
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

// ?courseId=&userId=
session_start();
$user->allow_access(37);

$course->setCourseId($_GET['courseId']);
$courseInfo = $course->Info();
$student->setUserId($_GET['userId']);
$student->setCourseId($_GET['courseId']);
$student->setSubjectId($courseInfo['subjectId']);
$student->AddUserToCurriculaFromCatalog($_GET['userId'], $_GET['courseId'], 'Ninguno', 0);
/* var_dump($student->getNames()); exit;

$files  = new Files;
$files->CedulaInscripcion($_GET['userId'], $_GET['courseId'], $student, $courseInfo["majorName"], $courseInfo["name"]); */
//  AddUserToCurricula($id, $curricula, $nombre, $email, $password, $major, $course,$tipo_beca,$por_beca,$matricula)
?>