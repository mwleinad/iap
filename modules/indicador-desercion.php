<?php
	$user->allow_access(37);
	$group->setCourseId($_GET['id']);
    $total = $group->DesertionIndicator();
    $smarty->assign('total', $total);
    $smarty->assign('courseId', $_GET['id']);
?>