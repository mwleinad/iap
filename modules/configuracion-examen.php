<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

	if($_POST)
	{ 
		$activity->setActivityId($_GET["id"]);
		$activity->setTimeLimit($_POST["timeLimit"]);
		$activity->setNoQuestions($_POST["noQuestions"]);
		$activity->setNoQuestionTotals($_POST["noQuestionTotals"]);
		$activity->EditExamen();
	}

	$activity->setActivityId($_GET["id"]);
	$activity = $activity->Info();
	$smarty->assign('activity', $activity);
	
	$test->setActivityId($_GET["id"]);
	$tests = $test->Enumerate();
	$smarty->assign('tests', $tests);

	$smarty->assign('ponderationPerQuestion', $test->PonderationPerQuestion());
	
		
	
	$smarty->assign('activityId', $_GET["id"]);
	$smarty->assign('mnuMain', "cursos");

?>
