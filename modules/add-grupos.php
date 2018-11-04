<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	
	/* End Session Control */
	$rsubjects =$major->Enumerate();

	
	// echo "<pre>"; print_r($_GET );
	// exit;
	

	$resultC = $course->EnumerateCertificacions();

	$cursos = $subject->Enumerate();
	$smarty->assign('rsubjects', $rsubjects);
	$smarty->assign('cursos', $cursos);
	$empleados = $personal->Enumerate('lastname_paterno');
	$smarty->assign('empleados', $empleados);
	$smarty->assign('resultC', $resultC);
	$course->setCourseId($_GET['id']);
	$smarty->assign('post', $course->Info());
	$smarty->assign('mnuMain','cursos');

// exit;
?>