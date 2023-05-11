<?php
    $alumno = $_GET['id'];
    $curso = $_GET['course'];
    $course->setCourseId($curso);
    $info = $course->Info();
    $conceptos->setCourseId($curso);
    $conceptos->setAlumno($alumno);
    $student->setUserId($alumno);
    $infoAlumno = $student->GetInfo();
    $pagos = $conceptos->historial_pagos();
    $smarty->assign("info", $info); 
    $smarty->assign("alumno", $infoAlumno);
    $smarty->assign("pagos", $pagos);
?>