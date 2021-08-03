<?php
	$user->allow_access(37);
	
	$group->setCourseId($_GET['id']);
    $students = $group->DefaultGroup();
    $smarty->assign('students', $students);
    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    $smarty->assign('info', $info);
    //var_dump($info); exit;
?>