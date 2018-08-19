<?php
		
/* For Session Control - Don't remove this */
//	$user->allow_access(8);	
	
	$myUnicoModulo = $module->moduloDeCurso($_GET["id"]);
	$infoUSubject = $module->infoUserSubject($_GET["id"],$_SESSION['User']['userId']);
	
	if($myUnicoModulo == null){
		exit;
	}

	$module->setCourseModuleId($myUnicoModulo["courseModuleId"]);
	$myModule = $module->InfoCourseModule();
    $courseId=$myModule["courseId"];

	if($infoUSubject["acuseDerecho"]=="si"){

		if($myModule["evalDocenteCompleta"]=="si"){
			$verResultado = true;
			$resEstadoisticas = $test->estadisticas($myModule["infoActivity"]["activityId"]);
		}
		
		$test->setActivityId($myModule["infoActivity"]["activityId"]);
		$myTest = $test->Enumerate($verResultado);
	}
	
	$smarty->assign('resEstadoisticas', $resEstadoisticas);
	$smarty->assign('infoUSubject', $infoUSubject);
	$smarty->assign('myModule', $myModule);
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('myTest',$myTest);
	$smarty->assign('userId',$_SESSION['User']['userId']);
	$smarty->assign('UserType',$_SESSION['User']['type']);
	$smarty->assign('activityId',$myModule["infoActivity"]["activityId"]);
	$smarty->assign('mnuSubmain','anuncios');

?>