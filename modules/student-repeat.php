<?php
	$user->allow_access();
	
	$curricula = $course->EnumerateOfficial();
	$smarty->assign("curricula", $curricula);

	$student->setUserId($_GET["id"]);
	$modulesRepeat = $student->StudentModulesRepeat();
	$smarty->assign('modulesRepeat', $modulesRepeat);
?>