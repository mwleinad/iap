<?php

include_once('../../init.php');  
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');
session_start();

switch($_POST["opcion"]){
    case 'cuenta-alumno':
        $alumno = intval($_POST['alumno']);
        $curricula = intval($_POST['curricula']);
        if(empty($alumno)){
            $errors['alumno'] = "Debe seleccionar un alumno";
        }
        if(empty($curricula)){
            $errors['curricula'] = "Debe seleccionar un curricula";
        }
        if (!empty($errors)) { 
            foreach ($errors as $key => $item) {
                echo "<div style='border-radius:15px;display:inline-block;margin-bottom:10px;'>
                        <div style='padding:15px; background-color:#950606;color:#FFFFFF'>$item</div>
                    </div><br>";
            }
            echo "<script>setInterval(() => {
                window.close();
            }, 2000);</script>";
        }else{
            $conceptos->setAlumno($alumno);
            $conceptos->setCourseId($curricula);
            $course->setCourseId($curricula);
            include_once('reportes/pagos.php');
        }
        break;
    case 'cuenta-grupo': 
        // $payments->curricula_con_pagos();
        $curricula = intval($_POST['curricula-grupo']); 
        $estatus = intval($_POST['estatus']);
        if(empty($curricula)){
            $errors['curricula'] = "Debe seleccionar un curricula";
        }
        if (!empty($errors)) { 
            foreach ($errors as $key => $item) {
                echo "<div style='border-radius:15px;display:inline-block;margin-bottom:10px;'>
                        <div style='padding:15px; background-color:#950606;color:#FFFFFF'>$item</div>
                    </div><br>";
            }
            // echo "<script>setInterval(() => {
            //     window.close();
            // }, 3000);</script>";
        }else{  
            $resultado = $payments->historial_pagos_curso($curricula, $estatus);
            // echo "<pre>";
            // print_r($resultado);
            $course->setCourseId($curricula);
            include_once('reportes/pagos-grupo.php');
        }
        break;
}

