<?php
	/* For Session Control - Don't remove this */
	$x=0;	
	// echo '<pre>'; print_r($_SESSION);
	// exit;
	
	if ($_GET['id']!=NULL)
	{
		$announcement->setAnnouncementId($_GET['id']);
   		$announcement->Delete();
	}
	
	$tipo_curricula = 'Activa'; 
	if($User['type'] == 'student')
	{
		if($User['actualizado'] == 'no')
		{
			// Datos del Alumno
			$student->setUserId($User['userId']);
			$data_student = $student->GetInfo();
			$smarty->assign('dataStudent', $data_student);
			// Pais
			$paises = $student->EnumeratePaises();	
			$smarty->assign('paises',$paises);
			// Estados (Domicilio)
			$student->setCountry($data_student['pais']);
			$estados = $student->EnumerateEstados();
			$smarty->assign('estados',$estados);
			// Municipios (Domicilio)
			$student->setState($data_student['estado']);
			$ciudades = $student->EnumerateCiudades();
			$smarty->assign('ciudades',$ciudades);
			// Estados (Datos Laborales)
			$student->setCountry($data_student['paist']);
			$estadost = $student->EnumerateEstados();
			$smarty->assign('estadost',$estadost);
			// Municipios (Datos Laborales)
			$student->setState($data_student['estadot']);
			$ciudadest = $student->EnumerateCiudades();
			$smarty->assign('ciudadest',$ciudadest);
			$prof = $profesion->Enumerate();
			$prof = $util->EncodeResult($prof);
			$smarty->assign('prof',$prof);
		}
	}
	//if($_POST['courseId']){ 
	// $student->AddUserToCurriculaFromCatalog($_POST["userId"], $_POST["courseId"],"Ninguno",0);
    // $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
	// print_r($_POST); exit;
	// $x=1;
	//}	
	// print_r($_SESSION);exit;
	
	$smarty->assign("x",$x);	
	$user->allow_access();	
	/* End Session Control */
	$student->setUserId($_SESSION["User"]["userId"]);
	//userId
	$smarty->assign("id",$_SESSION["User"]["userId"]);	
	//tipo de usuario
	$smarty->assign("positionId", $_SESSION['positionId']);	
	
	$curricula = $course->EnumerateActive();
	$smarty->assign("curricula", $curricula);	  
	$activeCourses = $student->StudentCourses("activo", "si"); 
	$inactiveCourses = $student->StudentCourses("inactivo", "si");
	if ($User['bloqueado'] == 1) {
		foreach ($activeCourses as $item) {
			$inactiveCourses[] = $item;
		}
		$activeCourses = [];
	}
	// print_r($activeCourses);
	$smarty->assign("activeCourses", $activeCourses); 
	$smarty->assign("inactiveCourses", $inactiveCourses);	

	$finishedCourses = $student->StudentCourses("finalizado");
	$smarty->assign("finishedCourses", $finishedCourses);	
	 	

	$showRegulation = $student->blockRegulation("activo", "si", "119, 129");
	$smarty->assign("showRegulation", $showRegulation);
	$announcements = $announcement->Enumerate(0, 0);
	$smarty->assign('announcements', $announcements);
	$smarty->assign("tipo_curricula", $tipo_curricula); 
	$notificaciones=$notificacion->Enumerate();
	$smarty->assign('notificaciones', $notificaciones);
	$smarty->assign('msjC', $_SESSION['msjC']);
	$smarty->assign('msjCc', $_SESSION['msjCc']);
	unset($_SESSION['msjC']);
	unset($_SESSION['msjCc']);
	$smarty->assign("referencia", $student->GetInfo()["referenciaBancaria"]);
