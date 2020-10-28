<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();

switch($_POST["type"])
{
    case 'getCalendar':
        $userId   = $_SESSION['User']['userId'];
        $courseId = intval($_POST['courseId']);
        $calendar->setCourseId($courseId);
        $calendar->setUserId($userId);
        $distribution = $calendar->getCalendar();
        $course->setCourseId($courseId);
        $info = $course->Info();
        $smarty->assign("info", $info);
        $smarty->assign("distribution", $distribution);
        echo "ok[#]";
        $smarty->display(DOC_ROOT . '/templates/items/new/calendar-student.tpl');	
    break;
}
