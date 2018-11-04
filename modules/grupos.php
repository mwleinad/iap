<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(8);	
	/* End Session Control */
	//check if docente, 2 == docente
	
	
	
	
	$resultC = $course->EnumerateCourse();
	$smarty->assign('resultC', $resultC);
?>