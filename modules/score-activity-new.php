<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

//	print_r($_SESSION); EXIT;
	if($_POST)
	{
	
		// echo "<pre>"; print_r($_POST);
		// echo "<pre>"; print_r($_FILES);
		// exit;
  	    $activity->setActivityId($_GET["id"]);
		$actividad = $activity->Info();
		$group->setCourseModuleId($actividad["courseModuleId"]);
		$group->EditScore($_POST["modality"], $_GET["id"], $_POST["ponderation"], $_POST["retro"]);
		
		if($_POST["auxTpl"] == "admin"){ 
			header("Location:".WEB_ROOT."/edit-modules-course/id/". $_POST["cId"]."");
			exit;
		}
	 
	 }
	// echo "<pre>";
	$activity->setActivityId($_GET["id"]);
	$actividad = $activity->Info();
	$smarty->assign('actividad', $actividad);
	$smarty->assign('id', $_GET["id"]);

	// print_r($actividad);
	$module->setCourseModuleId($actividad["courseModuleId"]);
	$info = $module->InfoCourseModule();
	// echo $actividad["courseModuleId"];
	// exit;
	//grupo
	// print_r($info);
	$group->setCourseModuleId($actividad["courseModuleId"]);
	$group->setCourseId($info["courseId"]);
	$theGroup = $group->ScoreGroup($actividad["modality"], $actividad["activityType"], $_GET["id"]);
	// echo "<pre>"; print_r($theGroup);
	// exit;
	$smarty->assign("periodoActual", $info["semesId"]);
	$smarty->assign('theGroup', $theGroup);
	$smarty->assign('cId', $_GET["cId"]);
?>