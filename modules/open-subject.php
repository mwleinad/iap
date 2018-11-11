<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	
	/* End Session Control */
	$rsubjects =$major->Enumerate();
	// $smarty->assign('rsubjects', $rsubjects);
	
	// echo "<pre>"; print_r($rsubjects );
	// exit;
	// exit;
	if($_POST)
	{
	
		
		if($_POST["apareceT"]=="on"){
			$_POST["apareceT"]  = 'si';
		}else{
			$_POST["apareceT"]  = 'no';
		}
		
		if($_POST["listar"]=="on"){
			$_POST["listar"]  = 'si';
		}else{
			$_POST["listar"]  = 'no';
		}
		
		$course->setSubjectId($_POST["subjectId"]);
		// $course->setModality($_POST["modality"]);
		// $course->setInitialDate($_POST["initialDate"]);
		// $course->setFinalDate($_POST["finalDate"]);
		// $course->setDaysToFinish($_POST["daysToFinish"]);
		// $course->setPersonalId($_POST["personalId"]);
		// $course->setTeacherId($_POST["teacherId"]);
		// $course->setTutorId($_POST["tutorId"]);
		// $course->setExtraId($_POST["extraId"]);
		// $course->setActive($_POST["active"]);
		// $course->setGroup($_POST["group"]);
		// $course->setTurn($_POST["turn"]);
		// $course->setFolio($_POST["folio"]);
		// $course->setLibro($_POST["libro"]);
		// $course->setScholarCicle($_POST["scholarCicle"]);
		// $course->setDias($_POST["dias"]);
		// $course->setHorario($_POST["horario"]);
		// $course->setAparece($_POST["apareceT"]);
		// $course->setListar($_POST["listar"]);
		// $course->setTipoCuatri($_POST["tipoCuatri"]);
		$course->setName($_POST["nombre"]);
		// $course->setNumero($_POST["numero"]);

		$course->Open();
		header('Location: history-subject'); 
		//TODO add heeder location when we finish the template change

	}
// exit;
	$cursos = $subject->Enumerate();
	$smarty->assign('rsubjects', $rsubjects);
	$smarty->assign('cursos', $cursos);

	$empleados = $personal->Enumerate('lastname_paterno');
	$smarty->assign('empleados', $empleados);

	$subject->setSubjectId($_GET['id']);
	$smarty->assign('post', $subject->Info());
	
	$smarty->assign('mnuMain','cursos');

// exit;
?>