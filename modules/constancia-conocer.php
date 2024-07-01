<?php
$curso = $_GET['id'];
$course->setCourseId($curso);
$infoCurso = $course->Info(); 
$smarty->assign("curso", $infoCurso);
if ($infoCurso['constancia']) {
    $students = $course->getStudentsConocer("AND user_subject.courseId = $curso ORDER BY user.lastNamePaterno, user.lastNameMaterno");
    $smarty->assign("students", $students);
}
