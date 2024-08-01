<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
include_once(DOC_ROOT . "/properties/messages.php");
session_start();
$alumno = $_POST['student'];
$details_subject = array();
$course->setCourseId($_POST['course']);
$infoCurso = $course->Info();
$folio = $_POST['folio'];
$where = "studentId = {$alumno} AND courseId = {$_POST['course']}";
$constanciaAlumno = $constancias->getConstanciaConocer($where);
if (!isset($constanciaAlumno['id'])) { //No se ha guardado, hay que crearlo 
    $constancias->setCurso($_POST['course']);
    $constancias->setAlumno($alumno);
    $constancias->setFolio($_POST['folio']);
    $constancias->crearConstanciaConocer();
} else { //Actualizar registro 
    $constancias->setCurso($_POST['course']);
    $constancias->setAlumno($alumno);
    $constancias->setFolio($_POST['folio']);
    $constancias->actualizarConstanciaConocer();
}

$hecho = $_SESSION['User']['userId'] . "p";
$vista = "p," . $hecho . "," . $alumno . "u";
$actividad = "Se ha generado tu constancia de evaluación";
$notificacion->setActividad($actividad);
$notificacion->setVista($vista);
$notificacion->setHecho($hecho);
$notificacion->setTablas("reply");
$notificacion->setEnlace("/pdf/constancia.php?courseId={$_POST['course']}&studentId={$alumno}");
$notificacion->saveNotificacion();

$student->setUserId($alumno);
$alumno = $student->GetInfo();

$details_body = array(
    'major'     => $infoCurso['name'],
    'usuario'   => $alumno['controlNumber'],
    'password'  => $alumno['password']
);
$sendmail = new SendMail;
$sendmail->Prepare($message[11]["subject"], $message[11]["body"], $details_body, $details_subject, $alumno['email'], $alumno['names'] . " " . $alumno['lastNamePaterno'] . " " . $alumno['lastNameMaterno']);
$curso = $_POST['course'];
$students = $course->getStudentsConocer("AND user_subject.courseId = $curso ORDER BY user.lastNamePaterno, user.lastNameMaterno");
$smarty->assign("students", $students);
$smarty->assign("curso", $curso);
echo json_encode([
    'growl'         => true,
    'message'       => 'Constancia generada', 
    'dtreload'      => "#datatable"
]);
