<?php
	$user->allow_access(37);
	
	$course->setCourseId($_GET["id"]);
	$courseInfo = $course->Info();
	$smarty->assign('courseInfo', $courseInfo);
?>