<?php
$curso = $_GET['id'];
$students = $course->getStudentsConocer("AND user_subject.courseId = $curso ORDER BY user.lastNamePaterno, user.lastNameMaterno");
$smarty->assign("students", $students);
$smarty->assign("curso", $curso);
