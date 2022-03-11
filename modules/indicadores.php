<?php
	$user->allow_access(37);

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