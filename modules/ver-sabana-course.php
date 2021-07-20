<?php
	$user->allow_access(37);
	
	$course->setCourseId($_GET["id"]);
	$courseInfo = $course->Info();
	$smarty->assign('courseInfo', $courseInfo);
	/* echo "<pre>";
	print_r($courseInfo['totalPeriods']);
	exit; */

	//modulos conformando el curso
	/* $course->setCourseId($_GET["id"]);
	$addedModules = $course->AddedCourseModules();
	
	$cuatrimesters = $course->HowManyCuatrimesters();
	$smarty->assign('cuatrimesters', $cuatrimesters);

	foreach($addedModules as $keyModule => $myModule)
	{
		$group->setCourseId($_GET["id"]);
		$group->setCourseModuleId($myModule["courseModuleId"]);			
		$theGroup = $group->DefaultGroup();
		
		//print_r($theGroup);
		foreach($theGroup as $keyGroup => $member)
		{
			$mark = $student->GetAcumuladoCourseModule($myModule["courseModuleId"], $member["userId"]);
			$marks[$member["userId"]]["marks"][$myModule["courseModuleId"]] = $mark;
		}
		
	}

	if(!is_array($marks))
	{
		$marks = [];
	}

	foreach($marks as $keyMark => $mark)
	{
		$realMark = array_sum($mark["marks"]) / count($mark["marks"]);
		$marks[$keyMark]["marks"]["finalMark"] = $realMark;
		$user->setUserId($keyMark);
		$userInfo = $user->InfoUser();
		$marks[$keyMark]["info"] = $userInfo;
	}

	$smarty->assign('addedModules', $addedModules);
	$smarty->assign('marks', $marks);
	$smarty->assign('id', $_GET["id"]); */
	
?>