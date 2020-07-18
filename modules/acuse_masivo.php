<?php
	/* For Session Control - Don't remove this */
	// $user->allow_access(37);	


	// $user->setUserId($_SESSION['User']['userId']);// exit;
	// $infoUser = $user->Info();// exit;

	// $smarty->assign('id', $_GET["id"]);
	
	// $module->setCourseModuleId($_GET["id"]);
	// $info = $module->InfoCourseModule();
	
	$personal->setPersonalId($info['access'][1]);
	$infoP = $personal->Info();
	// echo '<pre>'; print_r($info);
	// exit;

	// $lstPreguntas = $encuesta->promedioXRubro($info['courseModuleId'],$info['courseId']);       

	$smarty->assign('mId', $_GET["id"]);
	$smarty->assign('lstPreguntas', $lstPreguntas);
	$smarty->assign('infoP', $infoP);
	$smarty->assign('info', $info);


?>