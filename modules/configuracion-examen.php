<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

	if($_POST)
	{
		// echo "<pre>"; print_r($_POST);
		// exit;
		$activity->setActivityId($_POST["activityId"]);
		$activity->setTimeLimit($_POST["timeLimit"]);
		$activity->setNoQuestions($_POST["noQuestions"]);
		$activity->EditExamen();
	}
	
	$id = $activity->crearActividad($_GET["courseId"]);

	$activity->setActivityId($id);
	$activity = $activity->Info();
	$smarty->assign('activity', $activity);
	
	$test->setActivityId($id);
	$tests = $test->Enumerate();
	$smarty->assign('tests', $tests);

	$smarty->assign('ponderationPerQuestion', $test->PonderationPerQuestion());
	
		
	
	$smarty->assign('activityId', $id);
	$smarty->assign('mnuMain', "cursos");

?>
