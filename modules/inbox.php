<?php
		
	/* For Session Control - Don't remove this */
	//	$user->allow_access(8);	
	
	// echo '<pre>'; print_r($_SESSION);
// exit;	

	if ($_SESSION['User']['type']=='student'){
		
		$student->setUserId($_SESSION["User"]["userId"]);
		$activeCourses = $student->StudentCourses("activo", "si");		
		$module->setQuienEnviaId('personal');
			
		$smarty->assign('userType',$_SESSION['User']['type']);
		$smarty->assign('mnuSubmain','foro');
		$smarty->assign('activeCourses',$activeCourses);
		$smarty->assign('countCourses',count($activeCourses));
	}else{
		$module->setQuienEnviaId('alumno');
		$smarty->assign('mnuMain', "cursos");
	}
	$module->setStatusIn('activo');
	$module->setTipoReporte('entrada');
	$module->setRecibeId($_SESSION['User']['userId']);
	$module->setCMId($_GET["id"]);
	
	if ($_SESSION['User']['perfil'] == 'Administrador' || $_SESSION['User']['perfil'] == 'Departamento de Publicaciones'){
		$module->setQuienEnviaId('alumno');
		$lstMsj = $module->EnumerateInboxAdmin();
	}else{
		$lstMsj = $module->EnumerateInbox(); 
	}
	
	
	
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('infoC', $infoC);
	$smarty->assign('courseMId', $_GET["id"]);
	$smarty->assign('lstMsj', $lstMsj);
	$smarty->assign('or', $_GET['or']);
	$smarty->assign('tipo', 'entrada');
	

?>