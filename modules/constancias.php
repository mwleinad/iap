<?php

$group->setCourseId($_GET['id']);
$students = $group->DefaultGroup();
foreach ($students as $key => $value) {
    $dataExtra = $constancias->getConstancia("course_id = {$_GET['id']} AND alumno_id = {$value['userId']}");
    if ($dataExtra) {
        $students[$key]['folio'] = $dataExtra['folio'];
    } else {
        $students[$key]['folio'] = "";
    }
}
$smarty->assign('students', $students);
$course->setCourseId($_GET['id']);
$info = $course->Info();
$smarty->assign('info', $info);
