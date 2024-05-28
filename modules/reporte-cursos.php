<?php
$cursos = $course->getCourses("AND courseId IN(167,168)");
$smarty->assign("cursos", $cursos);