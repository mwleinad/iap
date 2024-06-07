<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
include_once(DOC_ROOT . "/properties/messages.php");
session_start(); 
$students = $_POST['student']; 
$sendmail = new SendMail; 
$details_subject = array();
$course->setCourseId($_POST['course']);
$infoCurso = $course->Info();
foreach ($students as $itemStudent) {
    $folio = $_POST['folio'][$itemStudent];
    $where = "studentId = {$itemStudent} AND courseId = {$_POST['course']}";
    $constanciaAlumno = $constancias->getConstanciaConocer($where); 
    if(!isset($constanciaAlumno['id'])){ //No se ha guardado, hay que crearlo 
        $constancias->setCurso($_POST['course']);
        $constancias->setAlumno($itemStudent);
        $constancias->setFolio($_POST['folio'][$itemStudent]);
        $constancias->crearConstanciaConocer(); 

    }else{//Actualizar registro 
        $constancias->setCurso($_POST['course']);
        $constancias->setAlumno($itemStudent);
        $constancias->setFolio($_POST['folio'][$itemStudent]);
        $constancias->actualizarConstanciaConocer();
    } 

    // $hecho = $_SESSION['User']['userId'] . "p";
    // $vista = "p," . $hecho . "," . $itemStudent. "u";
    // $actividad = "Se ha generado tu constancia de evaluación";
    // $notificacion->setActividad($actividad);
    // $notificacion->setVista($vista);
    // $notificacion->setHecho($hecho);
    // $notificacion->setTablas("reply");
    // $notificacion->setEnlace("/pdf/constancia.php?courseId={$_POST['course']}&studentId={$itemStudent}");
    // $notificacion->saveNotificacion(); 

    $student->setUserId($itemStudent); 
    $alumno = $student->GetInfo();  
   
    $details_body = array(
        'major'     => $infoCurso['name'],
        'usuario'   => $alumno['controlNumber'], 
        'password'  => $alumno['password']
    );
    //$sendmail->Prepare($message[11]["subject"], $message[11]["body"], $details_body, $details_subject, $alumno['email'], $alumno['names']." ".$alumno['lastNamePaterno']." ".$alumno['lastNameMaterno']);
}
$curso = $_POST['course'];
$students = $course->getStudentsConocer("AND user_subject.courseId = $curso ORDER BY user.lastNamePaterno, user.lastNameMaterno");
$smarty->assign("students", $students);
$smarty->assign("curso", $curso);
echo json_encode([
    'growl'         => true,
    'message'       => 'Constancias generadas',
    // 'modal_close'   => true,
    'selector'      => "#alumnos",
    'html'          => $smarty->fetch(DOC_ROOT . "/templates/items/new/constancias-conocer.tpl"),
]);