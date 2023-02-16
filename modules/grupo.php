<?php
		
	// $student->setUserId($_SESSION['User']["userId"]);
	$lstGrupo = $group->getGrupo($_GET['id']);
	$module->setCourseModuleId($_GET['id']);
	$info = $module->InfoCourseModule();
	$periodoActual = $info["semesId"];  
	foreach ($lstGrupo as $key => $value) {
		$student->setUserId($value['userId']);
		$periodo = $student->periodoAltaCurso($info['courseId']);
		if($periodoActual < $periodo){
			if($value['situation'] != "Recursador"){
				unset($lstGrupo[$key]);
			}
		} 
	}
	$smarty->assign("lstGrupo", $lstGrupo);
	
	if($_SESSION['User']['perfil'] == 'Administrador' or $_SESSION['User']['perfil'] == 'Docente'){
		$smarty->assign('mnuMain', "cursos");
	}else{
		$smarty->assign('mnuMain', "modulo");
		$smarty->assign('mnuSubmain','docente');
	}
	
	$smarty->assign('rand', rand());
	$smarty->assign('id', $_GET["id"]);
	
?>