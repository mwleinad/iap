<?php
	/* For Session Control - Don't remove this */
    $user->allow_access(8);

    if($_POST)
    {
        $calendar->setCourseId($_POST['courseId']);
        $calendar->setCalendarConceptId($_POST['conceptId']);
        $calendar->setPeriod($_POST['period']);
        $calendar->setAmount($_POST['amount']);
        $calendar->setDate($_POST['date']);
        $calendar->setIsVisible($_POST['isVisible']);
        $calendar->setHasDiscount($_POST['hasDiscount']);
        $calendar->Save();

        header("Location:" . WEB_ROOT . "/configurar-calendario/id/" . $_POST['courseId']);
		exit;
    }

    $_GET['id'] = intval($_GET['id']);
    $smarty->assign('courseId', $_GET['id']);

    $course->setCourseId($_GET['id']);
    $info     = $course->Info();
    $concepts = $calendar->EnumerateConcepts();
    $smarty->assign('concepts', $concepts);
    $smarty->assign('info', $info);
?>