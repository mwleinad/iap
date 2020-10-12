<?php
	$calendar->setCourseId($_GET["id"]);
    $calendar->setUserId($_GET["user"]);
    $distribution = $calendar->getCalendar();
    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    
    $smarty->assign('info', $info);
    $smarty->assign('distribution', $distribution);
?>