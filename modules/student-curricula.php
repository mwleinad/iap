<?php
$student->setUserId($_GET["id"]);
$activeCourses = $course->getCourses("AND course.finalDate >= NOW() ORDER BY major.majorId");
$smarty->assign('activeCourses', $activeCourses);
$activeCoursesStudent = $student->getCourses("AND user_subject.alumnoId = {$_GET['id']} AND user_subject.status = 'activo' AND course.finalDate >= NOW()");
$inactiveCoursesStudent = $student->getCourses("AND user_subject.alumnoId = {$_GET['id']} AND user_subject.status = 'inactivo'");
$finishedCoursesStudent = $student->getCourses("AND user_subject.alumnoId = {$_GET['id']} AND user_subject.status = 'activo' AND course.finalDate <= NOW()");
$smarty->assign("activeCourseStudent", $activeCoursesStudent);
$smarty->assign("inactiveCourseStudent", $inactiveCoursesStudent);
$smarty->assign("finishedCourseStudent", $finishedCoursesStudent);
$smarty->assign("student", $_GET['id']);
