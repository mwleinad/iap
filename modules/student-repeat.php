<?php

	/* For Session Control - Don't remove this */
	
	if($_POST["tipo_beca"] && $_POST["edit"]!=1)
	{
		$student->AddUserToCurriculaFromCatalog($_GET["id"], $_POST["courseId"],$_POST["tipo_beca"],$_POST["por_beca"]);
	}
	
	if($_POST['alumnoId'] && $_POST['id_course'] && $_POST['epor_beca'])
	  {
	    //echo  $_POST['alumnoId'];
		//echo $_POST['id_course'];
		//echo $_POST['epor_beca'];
	     $student->editarPor($_POST['alumnoId'],$_POST['id_course'],$_POST['epor_beca'],$_POST['tipo_beca']);
	  }
	  
	  
	$student->setUserId($_GET["id"]);
	
	$activeCourses = $student->StudentCourses("activo", "si");
	$inactiveCourses = $student->StudentCourses("inactivo", "si");
	$finishedCourses = $student->StudentCourses("finalizado");
		
	$smarty->assign("finishedCourses", $finishedCourses);	
	$smarty->assign("inactiveCourses", $inactiveCourses);	
	$smarty->assign("activeCourses", $activeCourses);
	
	
	
	
	$user->allow_access();	
	/* End Session Control */
	$student->setUserId($_GET["id"]);
	$activeCourses = $student->StudentCourses();
	$smarty->assign("courses", $activeCourses);	

	$curricula = $course->EnumerateOfficial();
	$smarty->assign("curricula", $curricula);	

	$smarty->assign("id", $_GET["id"]);	

?>