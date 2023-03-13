<?php
		
	/* For Session Control - Don't remove this */
	//$user->allow_access(8);	
	
	// echo '<pre>'; print_r($_POST);
	// exit;
	// $course->setCourseId($_GET["id"]);
	
	// $date = date("d-m-Y");
	// $addedModules = $course->StudentCourseModules();
	$student->setUserId($_SESSION["User"]["userId"]);
	$activeCourses = $student->StudentCourses("activo", "si");
	foreach($activeCourses as $key=>$aux){
		$course->setCourseId($aux["courseId"]);
		$addedModules = $course->StudentCourseModulesInbox();
		$activeCourses[$key]['materias'] = $addedModules;
	}
	// echo "<pre>"; print_r($activeCourses );
	// exit;
	$smarty->assign('date', $date);
	$smarty->assign('invoiceId', $_GET["id"]);
	$smarty->assign('activeCourses', $activeCourses);
	$smarty->assign('subjects', $addedModules);

?>