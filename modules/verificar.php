<?php 
if (!$_GET['token']) {
    header('Location: ' . WEB_ROOT . '/login');
}
$where = "token = '{$_GET['token']}'";
$diploma = $course->getDiploma($where);
if ($diploma) {
    $student->setUserId($diploma['studentId']);
    $diploma['alumno'] = $student->GetInfo();
}
$smarty->assign("diploma", $diploma);