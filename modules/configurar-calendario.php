<?php
	/* For Session Control - Don't remove this */
    $user->allow_access(8);
    $_GET['id'] = intval($_GET['id']);
    $smarty->assign('courseId', $_GET['id']);

    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    $calendar->setCourseId($_GET['id']);
    $distribution = $calendar->Distribution();
    
    $smarty->assign('info', $info);
    $smarty->assign('distribution', $distribution);
    $smarty->assign('mnuMain', 'cobranza');
	$smarty->assign('mnuSubmain', 'calendario');
?>