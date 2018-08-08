<?php
	
	/* For Session Control - Don't remove this */
	//$user->allow_access(4);	
	/* End Session Control */

$student->setState(7);	
$paises=$student->EnumerateCiudades();	
$lstSolicitante=$student->EnumerateSolicitantes();	


		$smarty->assign('paises',$paises);

$prof = $profesion->Enumerate();
				$prof = $util->EncodeResult($prof);
				$smarty->assign('prof',$prof);
	$activeCourses = $course->EnumerateActive();
	$smarty->assign("lstSolicitante", $lstSolicitante);	
	$smarty->assign("activeCourses", $activeCourses);	
	
?>