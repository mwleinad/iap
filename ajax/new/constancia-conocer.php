<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start(); 
$students = $_POST['student']; 
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