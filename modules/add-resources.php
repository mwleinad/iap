<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

	if($_POST)
	{
		print_r($resource);
		exit();
		$activity->setCourseModuleId($_GET["id"]);
		$activity->setActivityType($_POST["activityType"]);

		$activity->setInitialDate($_POST["initialDate"]);
		$activity->setFinalDate($_POST["finalDate"]);

		$activity->setModality($_POST["modality"]);
		$activity->setResumen($_POST["resumen"]);
		$activity->setDescription($_POST["description"]);
		$activity->setRequiredActivity($_POST["requiredActivity"]);
		$activity->setPonderation($_POST["ponderation"]);
		$activity->Save();
	}

	$date = date("d-m-Y");
	$smarty->assign('date', $date);
	
	

?>