<?php
	$user->allow_access(37);

    // Información del Curso
    $course->setCourseId($_GET['id']);
    $courseInfo = $course->Info();
    $smarty->assign('courseInfo', $courseInfo);

    // Titulacion
    $group->setCourseId($_GET['id']);
    $total = $group->CertificateIndicator(1);
    $smarty->assign('total_certificate', $total);
    $smarty->assign('courseId', $_GET['id']);

    // Deserción
	$group->setCourseId($_GET['id']);
    $total = $group->DesertionIndicator();
    $smarty->assign('total_desertion', $total);
    $smarty->assign('courseId', $_GET['id']);

    // Recursamiento
    $group->setCourseId($_GET['id']);
    $total = $group->RecursionIndicator();
    $smarty->assign('total_recursion', $total);
    $smarty->assign('courseId', $_GET['id']);
?>