<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	
	
	// echo "<pre>"; print_r($_POST);
	// exit;

	if($_POST)
	{
		$errors = [];
		
		if(empty($_POST['resumen'])){
			$errors["resumen"] = "El campo titulo es requerido.";
		}
		if (empty($_POST['description'])) {
			$errors["description"] = "El campo descripcion es requerido.";
		}
		if ($_POST['descripcionValida'] == "false") {
			$errors["description"] = "Solo se permiten 2500 caracteres máximo";
		}
		if(empty($_POST['ponderation'])){
			$errors["ponderation"] = "El campo ponderación es requerido.";
		}
		if (!empty($errors)) {
			header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
			echo json_encode([
				'errors'    =>$errors
			]);
			exit;
		}
		$activity->setCourseModuleId($_GET["id"]);
		$activity->setActivityType($_POST["activityType"]);

		$activity->setInitialDate($_POST["initialDate"]);
		$activity->setFinalDate($_POST["finalDate"]);
		$activity->setHora($_POST["hora"]);
		$activity->setModality($_POST["modality"]);
		$activity->setResumen($_POST["resumen"]);
		$activity->setDescription($_POST["description"]);
		$activity->setRequiredActivity($_POST["requiredActivity"]);
		$activity->setPonderation($_POST["ponderation"]);
		$activity->setHoraInicial($_POST["horaInicial"]);
		$actidadCreada = $activity->Save();

		$module->setCourseModuleId($_GET['id']);
		$infoModulo = $module->InfoCourseModule();
		$forum->setSubject($_POST['resumen']);
		$forum->setReply($_POST['description']);
		$forum->setCourseModuleId($_GET['id']);
		$forum->setCourseId($infoModulo['courseId']);
		$forum->setUserId($User['userId']);
		$forum->setActividadId($actidadCreada);
		$foroDiscucion = $forum->foroDiscusion();
		$forum->setTopicId($foroDiscucion);
		$respuesta = $forum->AddTopic();

		$mensaje = $_POST == "Foro" ? "Actividad y foro creados" : "Actividad creada";
		if($_POST["auxTpl"]=="admin"){
			echo json_encode([
				'growl'		=>true,
				'message'	=>$mensaje,
				'type'		=>'success',
				'duracion'	=>3000,
				'reload'	=>true, 
				'respuesta'	=>$respuesta
			]);
			// header("Location:".WEB_ROOT."/edit-modules-course/id/".$_POST["id"]."");
			exit;
		}
		
	}
	
	$date = date("d-m-Y");
	$smarty->assign('date', $date);
	$smarty->assign('id', $_GET["id"]);

	$activity->setCourseModuleId($_GET["id"]);
	$actividades = $activity->Enumerate();
	$smarty->assign('actividades', $actividades);
	

?>