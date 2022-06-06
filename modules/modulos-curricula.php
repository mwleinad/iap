<?php
	$course->setCourseId($_GET["id"]);
	
	$date = date("d-m-Y");
	$infoCourses = $course->Info();
	$addedModules = $course->StudentCourseModules();
	$minCal = 70;
	$minCalInt = 7;
	if($infoCourses['majorId'] == 18)
	{
		$minCal = 80;
		$minCalInt = 8;
	}
	/* echo "<pre>";
	var_dump($addedModules);
	exit; */
	
	$smarty->assign('minCal', $minCal);
	$smarty->assign('minCalInt', $minCalInt);
	$smarty->assign('infoCourses', $infoCourses);
	$smarty->assign('date', $date);
	$smarty->assign('invoiceId', $_GET["id"]);
	$smarty->assign('subjects', $addedModules);
?>