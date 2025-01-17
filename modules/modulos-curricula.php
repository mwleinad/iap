<?php
	$perfilActualizado = $student->perfilActualizado();
	if ($perfilActualizado > 0) {
		header("Location:".WEB_ROOT."/perfil?update=1");
	}
	$course->setCourseId($_GET["id"]); 
	$hasSubject = $student->info_subject($_GET['id']);
	if (!$hasSubject) {
		header("Location:".WEB_ROOT);
	}
	$date = date("d-m-Y");
	$infoCourses = $course->Info();
	$addedModules = $course->StudentCourseModules();
	$alta = $student->periodoAltaCurso($_GET['id']);
	$baja = $student->bajaCurso($_GET['id']);
	$inactivo = true;
	if($baja == ""){
		$baja = $infoCourses['totalPeriods'];
		$inactivo = false;
	}elseif($baja > $alta){
		$baja--;
	}
	$minCal = 70;
	$minCalInt = 7;
	if($infoCourses['majorId'] == 18)
	{
		$minCal = 80;
		$minCalInt = 8;
	}
	// "<pre>";
	// var_dump($addedModules);
	// exit;
	$smarty->assign('alta', $alta);
	$smarty->assign('baja', $baja);
	$smarty->assign('minCal', $minCal);
	$smarty->assign('minCalInt', $minCalInt);
	$smarty->assign('infoCourses', $infoCourses);
	$smarty->assign('date', $date);
	$smarty->assign('invoiceId', $_GET["id"]);
	$smarty->assign('subjects', $addedModules);
	$smarty->assign('inactivo', $inactivo);
?>