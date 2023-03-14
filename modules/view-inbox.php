<?php		
	/* For Session Control - Don't remove this */
	// $user->allow_access(8);	

	$module->setStatusIn('activo');
	$module->setTipoReporte('entrada');
	$module->setQuienEnviaId('personal');
	$module->setRecibeId($_SESSION['User']['userId']);
	$module->setCMId($_GET["id"]);
	$lstMsj = $module->EnumerateInbox();
	
	
	
	if ($_GET["cId"]<>0){
		$infoC = $module->infoChat($_GET["cId"]);
		$module->actualizaALeido($_GET["cId"]);
	}
	
	
	

	if($_GET["cId"] == 0){
		$module->setCourseModuleId($_GET["id"]);
		$in = $module->InfoCourseModule();
		
	}else{
		
		// echo '<pre>'; print_r($infoC); 
		// exit;
		$util = New Util;
		$module->setCourseModuleId($infoC["courseModuleId"]);
		$in = $module->InfoCourseModule();
		$dataEnviado = 'De: '.$infoC['envio'].'<br>
		Enviado: '.$util->FormatDateMySql($infoC['fechaEnvio']).'<br>
		Para: '.$infoC['recibe'].'<br>
		Asunto: '.$infoC['asunto'].'<br>
		<br>
		<br>
		'.$infoC['mensaje'].'
		';
	}
	$course->setCourseId($in['courseId']);
	$infoCourse = $course->Info();
	
	$numVacios = substr_count($in['name'],' ');
	$palabra = explode(' ',$in['name']);
	$palabras = '';
	for($i=0;$i<=$numVacios; $i++){
		$palabras .= substr($palabra[$i],0,1);
	}
	$subject = $palabras.'|'.$infoCourse['group'].'|';

		
	if($infoC['yoId']==null){
		$module->setCourseModuleId($_GET["id"]);
		$infoCM = $module->InfoCourseModule();
		$infoC['yoId'] = $infoCM['access'][1];
		$infoC['courseModuleId'] = $infoCM['courseModuleId'];
		$personal->setPersonalId($infoCM['access'][1]);
		$infoPersonal = $personal->Info();
		$para = $infoPersonal['name'].' '.$infoPersonal['lastname_materno'].' '.$infoPersonal['lastname_paterno'];
	}else{
		
		if ($infoC['quienEnvia']=='alumno'){
			 $infoPersonal = $student->InfoEstudiate($infoC['yoId']);
			 $para = $infoPersonal['names'].' '.$infoPersonal['lastNamePaterno'].' '.$infoPersonal['lastNameMaterno'];
		}else{
			$personal->setPersonalId($infoC['yoId']);
			$infoPersonal = $personal->Info();
			$para = $infoPersonal['name'].' '.$infoPersonal['lastname_materno'].' '.$infoPersonal['lastname_paterno'];
		}
		
	}


	$smarty->assign('de', $_SESSION['User']["nombreCompleto"]);
	$smarty->assign('subject', $subject);
	$smarty->assign('dataEnviado', $dataEnviado);
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('para', $para);
	$smarty->assign('infoPersonal', $infoPersonal);
	$smarty->assign('chatId', $_GET["cId"]);
	$smarty->assign('infoC', $infoC);
	$smarty->assign('courseMId', $_GET["id"]);
	$smarty->assign('lstMsj', $lstMsj);
	$smarty->assign('userType',$_SESSION['User']['type']);
	$smarty->assign('mnuSubmain','foro');
	
	if($_GET["or"]<>'h'){
		$smarty->assign('mnuMain', "modulo");
		
	}
	
	if($_GET["or"]=='h'){
		$smarty->assign('or', "h");
		
	}
	
	

?>