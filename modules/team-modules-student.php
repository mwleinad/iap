<?php
		
	/* For Session Control - Don't remove this */
//	$user->allow_access(8);	

	if($_POST)
	{

		$group->SendMailTeam();
	}
	
	$module->setCourseModuleId($_GET["id"]);
	$myModule = $module->InfoCourseModule();
	
	$empleados = $personal->Enumerate();
	$smarty->assign('empleados', $empleados);
	
	$date = date("d-m-Y");
	$smarty->assign('date', $date);

	$smarty->assign('invoiceId', $_GET["id"]);
	$smarty->assign('myModule', $myModule);

	$majorModality = $activity->GetMajorModality();
	$smarty->assign('majorModality', $majorModality);

	$smarty->assign('id', $_GET["id"]);
	
	$smarty->assign('mnuMain', "modulo");

	$myTeam = $group->MyTeam($_SESSION["User"]["userId"], $_GET["id"]);
	//print_r($myTeam);
	$smarty->assign('myTeam', $myTeam);

	$smarty->assign('mnuSubmain','miequipo');	
?>