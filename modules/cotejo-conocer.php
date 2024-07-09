<?php 
$curso = $_GET['id'];
$course->setCourseId($_GET['id']);
$curso = $course->Info();
$smarty->assign("curso", $curso);