<?php
		
	/* For Session Control - Don't remove this */
//	$user->allow_access(8);	

	$module->setCourseModuleId($_GET["id"]);
	$myModule = $module->InfoCourseModule();
	
	$empleados = $personal->Enumerate();
	$smarty->assign('empleados', $empleados);
	
	$date = date("d-m-Y");
	$smarty->assign('date', $date);

	$smarty->assign('myModule', $myModule);
	//actividades
	$activity->setCourseModuleId($_GET["id"]);
	//$smarty->assign('id_act',$_GET["id"] );
	$actividades = $activity->Enumerate("Tarea");
	$smarty->assign('actividades', $actividades);
	
	$realScore = 0;
	
	foreach($actividades as $res)
	{
		$totalScore += $res["realScore"];
	}
	
	$examenes = $activity->Enumerate("Examen");
	
	foreach($examenes as $res)
	{
		$totalScore += $res["realScore"];
	}
	
	if($_SESSION["exito"] == "si"){
		
		$smarty->assign('exito', "si");
		$smarty->assign('tareaId', $_SESSION["tareaId"]);
		unset($_SESSION["exito"]);
		unset($_SESSION["tareaId"]);
	}
	
	$smarty->assign('totalScore', $totalScore);

	$totalPonderation = $activity->TotalPonderation();
	$smarty->assign('totalPonderation', $totalPonderation);

	$majorModality = $activity->GetMajorModality();
	$smarty->assign('majorModality', $majorModality);

	$smarty->assign('id', $_GET["id"]);
	
	$smarty->assign('mnuMain', "modulo");

?>