<?php 
if (!$_GET['token']) {
    header('Location: ' . WEB_ROOT . '/login');
}
$where = "token = '{$_GET['token']}'";
$diploma = $course->getDiploma($where);
if ($diploma) {
    $student->setUserId($diploma['studentId']);
    $course->setCourseId($diploma['courseId']);
    $diploma['alumno'] = $student->GetInfo();
    $diploma['curso'] = $course->Info();
}
$smarty->assign("diploma", $diploma);