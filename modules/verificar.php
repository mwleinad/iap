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
    $diploma['curso'][] = $course->Info();  
}else{
    $sql = "SELECT * FROM diploma_alumnos WHERE token = '{$_GET['token']}'";
    $util->DB()->setQuery($sql);
    $infoDiploma = $util->DB()->GetRow(); 
    $student->setUserId($infoDiploma['alumno_id']);
    $diploma['alumno'] = $student->GetInfo(); 

    $sql = "SELECT * FROM diploma_cursos WHERE diploma_id = {$infoDiploma['diploma_id']}";
    $util->DB()->setQuery($sql);
    $cursos = $util->DB()->GetResult(); 
    foreach ($cursos as $curso) {
        $course->setCourseId($curso['course_id']);
        $diploma['curso'][] = $course->Info();
    } 
}
$smarty->assign("diploma", $diploma);