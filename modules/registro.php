<?php
	$paises=$student->EnumeratePaises();	
	$smarty->assign('paises',$paises);
	$prof = $profesion->Enumerate();
	$prof = $util->EncodeResult($prof);
	$smarty->assign('prof',$prof);
	$activeCourses = $course->EnumerateActive('AND course.courseId = 162');
	$smarty->assign("activeCourses", $activeCourses);
	$smarty->assign("no_admin",true);
?>