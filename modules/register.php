<?php
	$paises=$student->EnumeratePaises();	
	$smarty->assign('paises',$paises);
	$prof = $profesion->Enumerate();
	$prof = $util->EncodeResult($prof);
	$smarty->assign('prof',$prof);
	$activeCourses = $course->EnumerateActive();
	$smarty->assign("activeCourses", $activeCourses);
	$smarty->assign("no_admin",true);
?>