<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(44);	
	/* End Session Control */
	//check if docente, 2 == docente
	
	
	
	
	
	$result = $course->reporteRegion();
	$lstSolicitudes = $course->enumerateCer();
	$lstR = $course->regiones();


	
	$smarty->assign('perfil', $_SESSION['User']['perfil']);
	$smarty->assign('lstR', $lstR);
	$smarty->assign('lstMajor', $lstMajor);
	$smarty->assign('result', $result);
	$smarty->assign('lstSolicitudes', $lstSolicitudes);
	$smarty->assign('arrPage', $arrPage);
	$smarty->assign('coursesCount', $coursesCount);
	// -------------------------------------------------------------------------------------------------
	
	$smarty->assign('mnuMain','cursos');
	$smarty->assign('mnuSubmain','historial');
?>