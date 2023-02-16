<?php
    // echo $_GET['id'];
    $student->setUserId($_GET['id']);
    // echo "Alumno: ".$student->getUserId();
    $cursos = $student->StudentCourses('activo', NULL);
    $smarty->assign('cursos', $cursos);
    // print_r($cursos);
?>