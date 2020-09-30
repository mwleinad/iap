<?php
	$user->allow_access(37);	
	/* End Session Control */
    $calendarDistributionId = intval($_GET['id']);
    
    if($_POST)
	{
		$calendar->setCalendarDistributionId($_POST['calendarDistributionId']);
		$calendar->setCalendarConceptId($_POST['conceptId']);
        $calendar->setPeriod($_POST['period']);
        $calendar->setAmount($_POST['amount']);
        $calendar->setDate($_POST['date']);
        $calendar->setIsVisible($_POST['isVisible']);
        $calendar->setHasDiscount($_POST['hasDiscount']);
        $calendar->Update();

        header("Location:" . WEB_ROOT . "/configurar-calendario/id/" . $_POST['courseId']);
		exit;
	}

	$calendar->setCalendarDistributionId($calendarDistributionId);
    $info     = $calendar->Info();
    $concepts = $calendar->EnumerateConcepts();
    $smarty->assign('concepts', $concepts);
    $smarty->assign('info', $info);