<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

	// if($_GET["delete"] > 0)
	// {
	// 	$group->setCourseModuleId($_GET["id"]);
	// 	$group->DeleteTeam($_GET["delete"]);
	// 	header("Location:".WEB_ROOT."/edit-modules-course/id/".$_GET["id"]);
	// }
	$smarty->assign('id', $_GET["id"]);
	$module->setCourseModuleId($_GET["id"]);
	$info = $module->InfoCourseModule();
	$periodoActual = $info["semesId"];
	$group->setCourseModuleId($_GET["id"]);
	$group->setCourseId($info["courseId"]); 
	if($_POST)
	{  
		switch ($_POST['opcion']) {
			case 'crear-equipo':
				if (isset($_POST['number']) && !empty($_POST['number'])) { 
					$group->AgregarEquipo($_POST["inTeam"], $_POST['number']);
					$mensaje = "Grupo agregado al equipo {$_POST['number']}";
					$type = "success";
				}else{
					$group->CreateTeam($_POST["inTeam"]);
					$mensaje = "Grupo creado";
					$type = "success"; 
					 
				} 
			break; 
			case 'eliminar-de-equipo':
				$group->quitarDeEquipo($_POST['alumno']);
				$mensaje = "Se ha quitado al alumno del equipo";
				$type = "success";
			break;
			default:
				$group->AgregarEquipo($_POST["inTeam"], $_POST['number']);
				$mensaje = "Grupo agregado al equipo {$_POST['number']}";
				$type = "success";
			break;
		}  
	}  
	$noTeam = $group->NoTeam();
	// print_r($noTeam);
	foreach ($noTeam as $key => $value) {
		$student->setUserId($value['userId']);
		$periodo = $student->periodoAltaCurso($info['courseId']);
		if($periodoActual < $periodo){
			if($value['situation'] != "Recursador"){
				unset($noTeam[$key]);
			}
		} 
	}
	$smarty->assign('noTeam', $noTeam);
	$numberTeams = $group->maxTeam(); 
	$smarty->assign('numberTeams', $numberTeams);
	$group->setCourseModuleId($_GET["id"]);
	$teams = $group->TeamsModule();
	$smarty->assign('teams', $teams);
	if($_POST){
		echo json_encode([
			'selector'	=>'#container-team',
			'html'		=>$smarty->fetch(DOC_ROOT."/templates/new/config-teams.tpl"),
			'growl'		=>true,
			'message'	=>$mensaje,
			'type'		=>$type
		]); 
		exit;
	}
?>