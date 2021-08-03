<?php
	if($_GET['id'] == 'test')
	{
		$paises=$student->EnumeratePaises();	
		$smarty->assign('paises',$paises);
		$prof = $profesion->Enumerate();
		$prof = $util->EncodeResult($prof);
		$smarty->assign('prof',$prof);
		$activeCourses = $course->EnumerateActive();
		$smarty->assign("activeCourses", $activeCourses);	
	}
	else
		header('Location: ' . WEB_ROOT . '/mantenimiento');
?>