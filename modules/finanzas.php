<?php
    $student->setUserId($_SESSION['User']["userId"]);
    $activeCourses = $student->StudentCourses("activo", "si");
    $infoStudent   = $student->GetInfo();
    $totalCourses  = count($activeCourses);
    
    if($totalCourses == 1)
    {
        $calendar->setCourseId($activeCourses[0]['courseId']);
        $calendar->setUserId($_SESSION['User']['userId']);
        $distribution = $calendar->getCalendar();
        $course->setCourseId($activeCourses[0]['courseId']);
        $info = $course->Info();
        $smarty->assign("info", $info);
        $smarty->assign("distribution", $distribution);
    }
    elseif($totalCourses > 1)
    {
        $smarty->assign("activeCourses", $activeCourses);
    }
    $smarty->assign("infoStudent", $info);
    $smarty->assign("totalCourses", $totalCourses);