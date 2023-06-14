<?php
	/* For Session Control - Don't remove this */
    $user->allow_access(34);
    $_GET['id'] = intval($_GET['id']);
    $smarty->assign('courseId', $_GET['id']);

    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    $conceptos->setCourseId($_GET['id']);
    $listConceptos = $conceptos->conceptos_cursos_relacionados(); 
    // foreach ($listConceptos['periodicos'] as $item) {
    //     $sql = "SELECT * FROM pagos WHERE concepto_id = {$item['concepto_id']} AND course_id = {$item['course_id']} AND fecha_cobro = '{$item['fecha_cobro']}' AND concepto_course_id IS NULL";
    //     $util->DB()->setQuery($sql);
    //     $pagos = $util->DB()->GetResult();
    //     foreach ($pagos as $itemp) {
    //         $sql = "UPDATE pagos SET concepto_course_id = {$item['concepto_course_id']} WHERE pago_id = '{$itemp['pago_id']}' ";
    //         $util->DB()->setQuery($sql);
    //         $util->DB()->UpdateData();
    //     }
    // }
    $smarty->assign("conceptos", $listConceptos);
    $smarty->assign('info', $info);
    $smarty->assign("calendario", true);
?>