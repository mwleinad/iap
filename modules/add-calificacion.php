<?php
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	 
// echo "<pre>"; print_r($_POST);
	$user->setUserId($_SESSION['User']['userId']);// exit;
	$infoUser = $user->Info();// exit;

	$smarty->assign('id', $_GET["id"]);
	
	$module->setCourseModuleId($_GET["id"]);
	$info = $module->InfoCourseModule();
	$periodoActual = $info["semesId"]; 
	// echo "<pre>"; print_r($info["majorName"]);
	// exit;
	$group->setTipoMajor($info["majorName"]);
	$group->setCourseModuleId($_GET["id"]);
	$group->setCourseId($info["courseId"]);
	$noTeam = $group->actaCalificacion(); 
	foreach ($noTeam as $key => $value) {
		$student->setUserId($value['alumnoId']);
		$periodo = $student->periodoAltaCurso($info['courseId']);
		if($periodoActual < $periodo){
			unset($noTeam[$key]);
		} 
	}
	$smarty->assign('noTeam', $noTeam);
	$studentsRepeat = $group->actaCalificacionRepeat();
	$smarty->assign('studentsRepeat', $studentsRepeat);
	/* echo "<pre>";
	var_dump($noTeam);
	exit; */
	
	$numberTeams = $group->GetNumberOfTeams();
	$smarty->assign('numberTeams', $numberTeams);

	$teams = $group->Teams();
	$smarty->assign('info', $info);
	$smarty->assign('infoUser', $infoUser);
	$smarty->assign('majorName', $info["majorName"]);
	$smarty->assign('teams', $teams);

?>