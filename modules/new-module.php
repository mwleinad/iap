<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	
	/* End Session Control */
	
	if($_POST)
	{
		$module->setSubjectId($_POST['subjectId']);
		$module->setClave(strtoupper($_POST['frmClave']));
		$module->setName(strtoupper($_POST['frmName']));
		$module->setWelcomeText($_POST['welcomeText']);
		$module->setIntroduction($_POST['introduction']);
		$module->setIntentions($_POST['intentions']);
		$module->setObjectives($_POST['objectives']);
		$module->setThemes($_POST['themes']);
		$module->setScheme($_POST['scheme']);
		$module->setMethodology($_POST['methodology']);
		$module->setPolitics($_POST['politics']);
		$module->setEvaluation($_POST['evaluation']);
		$module->setBibliography($_POST['bibliography']);
		$module->setSemesterId($_POST['semesterId']);
		
		$module->Save();

		header("Location:" . WEB_ROOT . "/subject");
		exit;
	}

	$smarty->assign('mnuMain','cursos');
	$smarty->assign('id',$_GET["id"]);

	$subject->setSubjectId($_GET["id"]);
	$mySubject = $subject->Info($_GET["id"]);
	$smarty->assign('subject',$mySubject);

	//$smarty->assign('major',$major->Enumerate());
	
?>