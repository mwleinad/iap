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

	 //if($_POST['courseId']){
	 
	  // $student->AddUserToCurriculaFromCatalog($_POST["userId"], $_POST["courseId"],"Ninguno",0);
	 
     // $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
	 // print_r($_POST);exit;
	// $x=1;
	
	//}	
//  	print_r($_SESSION);exit;
	
		$smarty->assign("x",$x);	
	$user->allow_access();	
	/* End Session Control */
	$student->setUserId($_SESSION["User"]["userId"]);
	$info = $student->GetInfo();
	//userId
	$smarty->assign("id",$_SESSION["User"]["userId"]);	
	//tipo de usuario
	$smarty->assign("positionId", $_SESSION['positionId']);	
	
	$curricula = $course->EnumerateActive();
	$smarty->assign("curricula", $curricula);	
	
	//$student->setUserId($_GET["id"]);
	$activeCourses = $student->StudentCourses();
	$smarty->assign("courses", $activeCourses);	
	
	// $activeCourses = $student->StudentCourses("activo", "si");
	// echo "<pre>"; print_r($activeCourses);
	// exit;
	$smarty->assign("activeCourses", $activeCourses);	

	$inactiveCourses = $student->StudentCourses("inactivo", "si");
	$smarty->assign("inactiveCourses", $inactiveCourses);	

	$finishedCourses = $student->StudentCourses("finalizado");
	
	
	 $student->setCountry(1);
	$lstEstados = $student->EnumerateEstados();
	
	
	
	$smarty->assign("lstEstados", $lstEstados);	
	$smarty->assign("finishedCourses", $finishedCourses);	
	
	$announcements = $announcement->Enumerate(0, 0);
	$smarty->assign('announcements', $announcements);
	
	
	$lstSolicitante=$student->EnumerateSolicitantes();	
	$lstSector = $student->EnumerateSector();	
	$smarty->assign('info', $info);
	$smarty->assign('lstSector', $lstSector);
	$smarty->assign('lstSolicitante', $lstSolicitante);
	// echo '_'.$_SESSION['msjC'];
// exit;

	$lst = $student->enumerateMunicipio(7);
			$smarty->assign("lst", $lst);	

	$notificaciones=$notificacion->Enumerate();
	$smarty->assign('notificaciones', $notificaciones);
	$smarty->assign('msjC', $_SESSION['msjC']);
	$smarty->assign('msjCc', $_SESSION['msjCc']);
	$smarty->assign('aparecConfirma', "si");
		unset($_SESSION['msjC']);
		unset($_SESSION['msjCc']);
	// echo '<pre>'; print_r($lstEstados);
	// exit;
	/*
	$subforos=$forum->Enumeratesubf();
    $smarty->assign('subforos', $subforos);
	
	$foros=$forum->Enumerateforos();
    $smarty->assign('foros', $foros);
	
	
	$respuestasforos=$forum->RepliesEnumerate();
	$smarty->assign('replyforum', $respuestasforos);
	
 */
?>