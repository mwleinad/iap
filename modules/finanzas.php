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
    $references = [
        '3323' => '00018',
        '3321' => '00026',
        '3104' => '00034',
        '3310' => '00042',
        '3247' => '00059',
        '3309' => '00067',
        '3250' => '00075',
        '3254' => '00083',
        '1035' => '00091',
        '3313' => '00109',
        '3320' => '00117',
        '3318' => '00125',
        '3316' => '00133',
        '3222' => '00141',
        '3312' => '00158',
        '3322' => '00166',
        '3324' => '00174'
    ];
    $smarty->assign("infoStudent", $info);
    $smarty->assign("totalCourses", $totalCourses);
    $smarty->assign("usId", $_SESSION['User']['userId']);
    $smarty->assign("references", $references);