<?php
		//print_r($_SESSION);exit;
	/* For Session Control - Don't remove this */
	//$user->allow_access(8);	


	if(!isset($_SESSION["User"]["userId"]) or $_SESSION["User"]["userId"]==null or $_SESSION["User"]["userId"]==""){
		header('Location: '.WEB_ROOT);
		exit;
	}

	
	

	$activity->setActivityId($_GET["id"]);
	$actividad = $activity->Info();
	$smarty->assign('actividad', $actividad);

	$test->setActivityId($_GET["id"]);
	$myTest = $test->Enumerate();
	
	//access
	$test->setUserId($_SESSION["User"]["userId"]);
	$access  = $test->Access($actividad["tries"]);
	$smarty->assign('access', $access);
	
	if(!$access)
	{
		$score  = $test->TestScore();
		$smarty->assign('score', $score);
	}
	
	$myTest = $test->Randomize($myTest, $actividad["noQuestions"]);
	$smarty->assign('myTest', $myTest);
	//print_r($myTest);
	//assign time
	if(!$_SESSION["timeLimit"])
	{
		$_SESSION["timeLimit"] = time() + $actividad["timeLimit"] * 60;
	}
	
	$rest = $_SESSION["timeLimit"] - time();
	$smarty->assign('timeLeft', $rest);
//	print_r($myTest);
?>