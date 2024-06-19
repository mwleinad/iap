<?php
$curso = $_GET['id'];
$course->setCourseId($curso);
$infoCourse = $course->Info();
$smarty->assign("curso", $infoCourse);