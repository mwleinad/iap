<?php
	$course->setCourseId($_GET["id"]);
	
	$date = date("d-m-Y");
	$infoCourses = $course->Info();
	$addedModules = $course->StudentCourseModulesRepeat();
	
	$smarty->assign('infoCourses', $infoCourses);
	$smarty->assign('date', $date);
	$smarty->assign('subjects', $addedModules);
?>