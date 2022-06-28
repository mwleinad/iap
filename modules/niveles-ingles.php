<?php
	$user->allow_access(37);
	
	if($_POST)
	{
        $course->setCourseId($_POST['courseId']);
        $course->SaveEnglishLevels($_POST['levels']);
		header("Location:" . WEB_ROOT . "/history-subject");
		exit;
	}
	$group->setCourseId($_GET['id']);
    $course->setCourseId($_GET['id']);
    $students = $group->DefaultGroup();
    $courseInfo = $course->Info();
    $english_levels = $course->GetEnglishLevels();
    $smarty->assign('students', $students);
    $smarty->assign('courseId', $_GET['id']);
    $smarty->assign('courseInfo', $courseInfo);
    $smarty->assign('english_levels', $english_levels);
    /* echo "<pre>";
    var_dump($english_levels);
    exit; */
?>