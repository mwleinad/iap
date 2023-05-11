<?php
	/* For Session Control - Don't remove this */
    $user->allow_access(34);
    $_GET['id'] = intval($_GET['id']);
    $smarty->assign('courseId', $_GET['id']);

    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    $conceptos->setCourseId($_GET['id']);
    $listConceptos = $conceptos->conceptos_cursos_relacionados();
    $smarty->assign("conceptos", $listConceptos);
    $smarty->assign('info', $info);
    $smarty->assign("calendario", true);
?>