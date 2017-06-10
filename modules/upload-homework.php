<?php

		
	/* For Session Control - Don't remove this */
	//$user->allow_access(8);	

	if($_POST)
	{
		$homework->setActivityId($_GET["id"]);
		$homework->setModality($_POST["modality"]);
		$homework->setNombre($_POST["nombre"]);
		$homework->setUserId($_SESSION["User"]["userId"]);
		$homework->Upload($_FILES["path"]);

		header("Location:http://www.iapchiapasenlinea.mx/calendar-modules-student/id/".$_POST["courseId"]);
	}

	$activity->setActivityId($_GET["id"]);
	$actividad = $activity->Info();
	$smarty->assign('actividad', $actividad);

	$homework->setActivityId($_GET["id"]);
	$homework->setUserId($_SESSION["User"]["userId"]);
	$homework = $homework->Uploaded();
	$smarty->assign('homework', $homework);
	
?>