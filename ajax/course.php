<?php
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();

$specialities = $util->EncodeResult($speciality->Enumerate());
$semesters = $util->EncodeResult($semester->Enumerate());

$smarty->assign("DOC_ROOT", DOC_ROOT);

switch($_POST["type"])
{

	case 'viewAlumn': 
		$students = $course->EnumerateAlumn($_POST['id'], $_POST["filter"]);
		//echo $_POST["filter"];  activo  Y/O    inactivo
		$smarty->assign("students", $students);
		$smarty->assign("page", "course-student");
		$smarty->assign("status", $_POST["filter"]);
		$smarty->assign("course", $_POST["id"]);
		$smarty->display(DOC_ROOT . '/templates/boxes/view-course-alumn-popup.tpl');
		break;
		
		
		
	case 'deleteCourse':
	
		$course->setCourseId($_POST['courseId']);
		
		if($course->Delete())
		{
			echo 'Ok|';
			$smarty->display(DOC_ROOT . '/templates/boxes/status.tpl');
			echo '|';
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$subjects = $course->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/curriculas', $arrPage);
					$subjects = $util->EncodeResult($subjects);
					$smarty->assign('subjects', $subjects);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/courses.tpl');
		}
		else
		{
			echo 'Fail|';
			$smarty->display(DOC_ROOT . '/templates/boxes/status.tpl');
		}
		
	break;
	
	case 'onMaterias':
	
		
		$lstMats = $subject->getMaterias($_POST['Id']);
		// echo '<pre>'; print_r($lstMats);
		$smarty->assign("lstMats", $lstMats);
		$smarty->display(DOC_ROOT . '/templates/boxes/materias.tpl');
	break;
	
	case 'onBuscar':
	
		$personals = $subject->getMateriasProfesor($_POST['materia']);
		// echo '<pre>'; print_r($personals);
		// exit;
		$smarty->assign("personals", $personals);
		$smarty->display(DOC_ROOT . '/templates/lists/report-materia.tpl');
		
	
	break;

	case 'getModules':
		$course->setCourseId($_POST['courseId']);
		$modules = $course->ListModules();
		$smarty->assign("modules", $modules);
		$smarty->display(DOC_ROOT . '/templates/boxes/modulos.tpl');
		break;
		
}
?>