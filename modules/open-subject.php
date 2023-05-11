<?php

/* For Session Control - Don't remove this */
$user->allow_access(37);
/* End Session Control */

if ($_POST) {
	if ($_POST["apareceT"] == "on") {
		$_POST["apareceT"]  = 'si';
	} else {
		$_POST["apareceT"]  = 'no';
	}

	if ($_POST["listar"] == "on") {
		$_POST["listar"]  = 'si';
	} else {
		$_POST["listar"]  = 'no';
	}
	if (empty($_POST['initialDate'])) {
		$errors["initialDate"] = "Falta indicar la fecha de inicio";
	}
	if (empty($_POST['finalDate'])) {
		$errors["finalDate"] = "Falta indicar la fecha de finalización";
	}
	if (!empty($errors)) {
		header('HTTP/1.1 422 Unprocessable Entity');
		header('Content-Type: application/json; charset=UTF-8');
		echo json_encode([
			'errors'    => $errors
		]);
		exit;
	}
	$subjectId = $_POST['subjectId'];
	$course->setSubjectId($subjectId);
	$course->setModality($_POST["modality"]);
	$course->setInitialDate($_POST["initialDate"]);
	$course->setFinalDate($_POST["finalDate"]);
	$course->setDaysToFinish($_POST["daysToFinish"]);
	$course->setPersonalId($_POST["personalId"]);
	$course->setTeacherId($_POST["teacherId"]);
	$course->setTutorId($_POST["tutorId"]);
	$course->setExtraId($_POST["extraId"]);
	$course->setActive($_POST["active"]);
	$course->setGroup($_POST["group"]);
	$course->setTurn($_POST["turn"]);
	$course->setFolio($_POST["folio"]);
	$course->setLibro($_POST["libro"]);
	$course->setScholarCicle($_POST["scholarCicle"]);
	$course->setDias($_POST["dias"]);
	$course->setHorario($_POST["horario"]);
	$course->setAparece($_POST["apareceT"]);
	$course->setListar($_POST["listar"]);
	$course->setTipoCuatri($_POST["tipoCuatri"]);
	$course->setTemporalGroup($_POST["temporalGroup"]);
	$conceptos->setSubjectId($subjectId); 
	$existeConceptos = $conceptos->conceptos_subjects_count();
	$curso = $course->Open(); 
	$conceptos->setCourseId($curso);
	$subject->setSubjectId($subjectId);
	$conceptos->setSubjectId($subjectId);
	$periodos = $subject->periodos();
	if ($existeConceptos > 0 && $curso > 0) {
		$relacionados = $conceptos->conceptos_subjects_relacionados();
		$conceptoActual = $relacionados[0]['concepto_id'];
		$fecha_inicial =  "";
		foreach ($relacionados as $item) {
			$conceptos->setConcepto($item['concepto_id']);
			$conceptos->setCourseId($curso);
			$conceptos->setCosto($item['total']);
			$conceptos->setBeca($item['descuento']);
			if ($item['cobros'] > 0) {
				$conceptos->setPeriodo($item['periodo']);
				if ($conceptoActual != $item['concepto_id']) {
					$fecha_inicial = ""; 
					$conceptoActual = $item['concepto_id'];
				} 
				$fecha_inicial = $fecha_inicial == "" ? date("Y-m-d", strtotime($_POST['initialDate'] . "+ " . $item['periodicidad'] . " days")) : date("Y-m-d", strtotime($fecha_inicial . "+ " . $item['periodicidad'] . " days"));
				// echo "$fecha_inicial<br>"; 
				$fecha_limite = $item['tolerancia'] > 0 ? date("Y-m-d", strtotime($fecha_inicial . "+ " . $item['tolerancia'] . " days")) : $fecha_inicial;
				$conceptos->setFechaCobro("'$fecha_inicial'");
				$conceptos->setFechaLimite("'$fecha_limite'");
				$conceptos->crear_relacion_curso();
			} else {
				$conceptos->setPeriodo(0);
				$conceptos->setFechaCobro("NULL");
				$conceptos->setFechaLimite("NULL");
				$conceptos->crear_relacion_curso();
			}
		}
		$listConceptos = $conceptos->conceptos_cursos_relacionados();
		// print_r($listConceptos);
		$smarty->assign("subjectId", $subjectId); 
		$smarty->assign("opcion", "conceptos-curso");
		$smarty->assign("conceptos", $listConceptos);
		$course->setCourseId($curso);
		$info = $course->Info();
		$smarty->assign('info', $info);
		echo json_encode([
			'growl'		=>true,
			'message'	=>"Currícula creada",
			'html'		=>$smarty->fetch(DOC_ROOT."/templates/forms/new/conceptos-curso.tpl"),
			'modal'		=>true,
		]);
		exit;
	}
	echo json_encode([
		'growl'		=> true,
		'message'	=> "Currícula creada",
		'reload'	=> true
	]);
	exit;
}

$cursos = $subject->Enumerate();
$smarty->assign('cursos', $cursos);
$empleados = $personal->Enumerate('lastname_paterno');
$smarty->assign('empleados', $empleados);
$subject->setSubjectId($_GET['id']);
$smarty->assign('post', $subject->Info());
$smarty->assign('mnuMain', 'cursos');
$activeCourses = $course->EnumerateActive();
$smarty->assign('activeCourses', $activeCourses);
