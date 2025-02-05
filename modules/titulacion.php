<?php
	$user->allow_access(37);
	
	if($_POST)
	{
		$courseId = $_POST['courseId'];
        $certificates = $_POST['certificates'];
        foreach($certificates as $key => $value)
        {
            $student->setUserId($key);
            $student->setCourseId($courseId);
            $student->setCertificate($value);
        }
		header("Location:" . WEB_ROOT . "/curriculas");
		exit;
	}
	$group->setCourseId($_GET['id']);
    $students = $group->DefaultGroup();
    $smarty->assign('students', $students);
    $smarty->assign('courseId', $_GET['id']);
?>