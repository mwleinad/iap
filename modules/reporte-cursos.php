<?php
$cursos = $course->getCourses("AND courseId IN(167,168, 170)");
$smarty->assign("cursos", $cursos);