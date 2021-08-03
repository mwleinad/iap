<?php
	$course->setCourseId($_GET["id"]);
	
	$date = date("d-m-Y");
	$infoCourses = $course->Info();
	$addedModules = $course->StudentCourseModules();
	
	$smarty->assign('infoCourses', $infoCourses);
	$smarty->assign('date', $date);
	$smarty->assign('invoiceId', $_GET["id"]);
	$smarty->assign('subjects', $addedModules);
?>