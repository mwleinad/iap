<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	
	/* End Session Control */
	
	if($_POST)
	{
		$subject->setSubjectId($_GET['id']);
		$subject->setTipo($_POST['tipo']);
		$subject->setClave(strtoupper($_POST['frmClave']));
		$subject->setRvoe(strtoupper($_POST['rvoe']));
		$subject->setRvoeLinea(strtoupper($_POST['rvoeLinea']));
		$subject->setName(strtoupper($_POST['frmName']));
		$subject->setWelcomeText($_POST['welcomeText']);
		$subject->setIntroduction($_POST['introduction']);
		$subject->setIntentions($_POST['intentions']);
		$subject->setObjectives($_POST['objectives']);
		$subject->setThemes($_POST['themes']);
		$subject->setScheme($_POST['scheme']);
		$subject->setMethodology($_POST['methodology']);
		$subject->setPolitics($_POST['politics']);
		$subject->setEvaluation($_POST['evaluation']);
		$subject->setBibliography($_POST['bibliography']);
		$subject->setCost($_POST['cost']);
		$subject->setPayments($_POST['payments']);
		$subject->setFechaRvoe($_POST['fechaRvoe']);
		$subject->setFechaRvoeLinea($_POST['fechaRvoeLinea']);
		$subject->setTotalPeriods($_POST['totalPeriods']);
		
		$subject->Update();

		header("Location:" . WEB_ROOT . "/subject");
		exit;
	}

	$subject->setSubjectId($_GET['id']);
	$smarty->assign('post', $subject->Info());

	$smarty->assign('mnuMain','cursos');

	$smarty->assign('major',$major->Enumerate());	
?>