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
	//userId
	$smarty->assign("id",$_SESSION["User"]["userId"]);	
	//tipo de usuario
	$smarty->assign("positionId", $_SESSION['positionId']);	
	
	$curricula = $course->EnumerateActive();
	$smarty->assign("curricula", $curricula);	
	
	//$student->setUserId($_GET["id"]);
	$activeCourses = $student->StudentCourses();
	$smarty->assign("courses", $activeCourses);	
	
	$activeCourses = $student->StudentCourses("activo", "si");
	$showRegulation = $student->blockRegulation("activo", "si", "119, 129");
	$smarty->assign("showRegulation", $showRegulation);	
	$smarty->assign("activeCourses", $activeCourses);	

	$inactiveCourses = $student->StudentCourses("inactivo", "si");
	$smarty->assign("inactiveCourses", $inactiveCourses);	

	$finishedCourses = $student->StudentCourses("finalizado");
	
	
	
	$smarty->assign("finishedCourses", $finishedCourses);	
	
	$announcements = $announcement->Enumerate(0, 0);
	$smarty->assign('announcements', $announcements);
	
	
	
	// echo '_'.$_SESSION['msjC'];
// exit;
	$notificaciones=$notificacion->Enumerate();
	$smarty->assign('notificaciones', $notificaciones);
	$smarty->assign('msjC', $_SESSION['msjC']);
	$smarty->assign('msjCc', $_SESSION['msjCc']);
		unset($_SESSION['msjC']);
		unset($_SESSION['msjCc']);
	// echo '<pre>'; print_r($notificaciones);
	// exit;
	/*
	$subforos=$forum->Enumeratesubf();
    $smarty->assign('subforos', $subforos);
	
	$foros=$forum->Enumerateforos();
    $smarty->assign('foros', $foros);
	
	
	$respuestasforos=$forum->RepliesEnumerate();
	$smarty->assign('replyforum', $respuestasforos);
	
 */
	$diplomas = [
		'20161016',
		'20161015',
		'20213345',
		'20160985',
		'20160951',
		'20160938',
		'20213346',
		'20213347',
		'20150767',
		'20182705',
		'20213348',
		'20150766',
		'20161000'
	];
	$div_height = 340;
	$download = false;
	if(in_array($_SESSION['User']['numControl'], $diplomas))
	{
		$div_height = 500;
		$download = true;
	}
	$smarty->assign("div_height", $div_height);
	$smarty->assign("download", $download);
	$smarty->assign("fileCer", $_SESSION['User']['numControl'] . '.pdf');
	// echo "User: " . $_SESSION["User"]["userId"]; exit;

?>