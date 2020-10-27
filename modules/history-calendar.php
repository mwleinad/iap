<?php
	/* For Session Control - Don't remove this */
    $user->allow_access(8);
    if($_POST)
    {
        $courseId = intval($_POST['courseId']);
        $userId   = intval($_POST['userId']);
        $calendar->setCourseId($courseId);
        $calendar->setUserId($userId);
        foreach($_POST['payments'] as $key => $value)
        {
            $calendar->setCalendarDistributionId($key);
            $calendar->setPaid($value);
            $calendar->savePayment();
        }
        header("Location: " . WEB_ROOT . "/pagos-calendario/id/" . $courseId);
        exit;
    }

    $userId   = intval($_GET['id']);
    $courseId = intval($_GET['course']);
    $calendar->setCourseId($courseId);
    $calendar->setUserId($userId);
    $distribution = $calendar->getCalendar();

    $course->setCourseId($courseId);
    $info = $course->Info();
    
    $smarty->assign('info', $info);
    $smarty->assign('userId', $userId);
    $smarty->assign('distribution', $distribution);
    $smarty->assign('mnuMain', 'cobranza');
	$smarty->assign('mnuSubmain', 'calendario');
?>