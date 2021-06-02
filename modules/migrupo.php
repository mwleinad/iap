<?php
	$lstGrupo = $group->getGrupo($_GET['id']);
	$smarty->assign("lstGrupo", $lstGrupo);
	
	if($_SESSION['User']['perfil'] == 'Administrador' or $_SESSION['User']['perfil'] == 'Docente'){
		$smarty->assign('mnuMain', "cursos");
	}else{
		$smarty->assign('mnuMain', "modulo");
		$smarty->assign('mnuSubmain','docente');
	}

    $module->setCourseModuleId($_GET["id"]);
	$myModule = $module->InfoCourseModule();
	
	$smarty->assign('rand', rand());
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('myModule', $myModule);
?>