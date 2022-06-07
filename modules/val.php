<?php
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	


	$user->setUserId($_SESSION['User']['userId']);// exit;
	$infoUser = $user->Info();// exit;

	if ($_GET["id"]){
		$smarty->assign('id', $_GET["id"]);
		
		$module->setCourseModuleId($_GET["id"]);
		$info = $module->InfoCourseModule();
	}
	
	if ($_GET["id"]){
		$lstPreguntas = $encuesta->promedioXRubro($info['courseModuleId'],$info['courseId']);   
	}else{
		
		$lstPreguntas = $encuesta->promedioXRubroAdmin($_GET['personalId']);   
	}

	
	/* echo '<pre>'; print_r($lstPreguntas);
	exit; */
	$smarty->assign('mId', $_GET["id"]);
	$smarty->assign('lstPreguntas', $lstPreguntas);


?>