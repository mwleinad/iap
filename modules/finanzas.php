<?php
$student->setUserId($_SESSION['User']["userId"]);
$alumno = $student->getInfo();
$activeCourses = $student->StudentCourses("activo", "si"); 
$inactiveCourses = $student->StudentCourses("inactivo", "si"); 
$finishedCourses = $student->StudentCourses("finalizado");
// $pagos = $student->pagos(); 
$conceptos->setAlumno($_SESSION['User']['userId']);
foreach ($activeCourses as $key => $value) {
    $conceptos->setCourseId($value['courseId']);
    $course->setCourseId($value['courseId']);
    $pagos = $conceptos->historial_pagos();
    if (count($pagos) > 0) {
        $info = $course->Info();
        $activeCourses[$key] = $info;
        $activeCourses[$key]['pagos'] = $pagos;
    }else{
        unset($activeCourses[$key]);
    }
}
foreach ($finishedCourses as $key => $value) {
    $conceptos->setCourseId($value['courseId']);
    $course->setCourseId($value['courseId']);
    $pagos = $conceptos->historial_pagos();
    if (count($pagos) > 0) {
        $info = $course->Info();
        $finishedCourses[$key] = $info;
        $finishedCourses[$key]['pagos'] = $pagos;
    }else{
        unset($finishedCourses[$key]);
    }
}
// echo "<pre>"; 
// print_r($activeCourses);
// print_r($inactiveCourses);
// print_r($finishedCourses);
// echo "</pre>";
$smarty->assign("alumno", $alumno);
$smarty->assign("activeCourse", $activeCourses);
$smarty->assign("inactiveCourse", $inactiveCourses);
$smarty->assign("finishedCourse", $finishedCourses);