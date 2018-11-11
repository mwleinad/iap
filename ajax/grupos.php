<?php
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();


$smarty->assign("DOC_ROOT", DOC_ROOT);

switch($_POST["type"])
{

	case 'onSave': 

	// echo "<pre>";print_r($_POST);
	// exit;
		
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
		
		$course->setCourseId($_POST["courseId"]);
		$course->setSubjectId($_POST["subjectId"]);
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

		$course->setNumero($_POST["numero"]);

		if($course->OpenGrupo()){
			echo "ok[#]";
		}else{
			echo "fail[#]";
		}
		
	break;
		
		
	case "onBuscar":
	
	
		$resultC = $course->EnumerateCourse();
		$smarty->assign("DOC_ROOT", DOC_ROOT);
		$smarty->assign("resultC", $resultC);
		$smarty->display(DOC_ROOT.'/templates/lists/grupos.tpl');
		

	break;	
		
		
}
?>