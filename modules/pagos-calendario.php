<?php
	/* For Session Control - Don't remove this */
    $user->allow_access(34);

    if($_POST)
    {
        $courseId = intval($_POST['courseId']);
        $calendar->setCourseId($courseId);
        foreach($_POST['students'] as $key => $value)
        {
            $calendar->setUserId($key);
            $calendar->setDiscount($value);
            $calendar->saveDiscount();
        }
    }

    $_GET['id'] = intval($_GET['id']);
    $smarty->assign('courseId', $_GET['id']);

    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    $group->setCourseId($_GET['id']);
    $students = $group->DefaultGroup();
    
    $smarty->assign('info', $info);
    $smarty->assign('students', $students);
    $smarty->assign('mnuMain', 'cobranza');
	$smarty->assign('mnuSubmain', 'calendario');
?>