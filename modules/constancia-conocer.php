<?php
$curso = $_GET['id'];
$course->setCourseId($curso);
$infoCurso = $course->Info(); 
$smarty->assign("curso", $infoCurso);