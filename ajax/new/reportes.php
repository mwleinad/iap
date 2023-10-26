<?php

include_once('../../init.php');  
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');
session_start();
if ($_GET['opcion']) {
    $_POST['opcion'] = $_GET['opcion'];
}
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
            echo "<script>setInterval(() => {
                window.close();
            }, 3000);</script>";
        }else{  
            $resultado = $payments->historial_pagos_curso($curricula, $estatus); 
            $course->setCourseId($curricula);
            include_once('reportes/pagos-grupo.php');
        }
        break;
    case 'cuenta-fechas':   
        $estatus = intval($_POST['estatus']);
        $fecha_inicio = $_POST['fecha_inicial'];
        $fecha_fin = $_POST['fecha_final']; 
        if(empty($fecha_inicio)){
            $errors['fecha_inicio'] = "Debe seleccionar un fecha de inicio";
        } 
        if(empty($fecha_fin)){
            $errors['fecha_fin'] = "Debe seleccionar un fecha final";
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
            $resultado = $payments->historial_pagos_fecha($fecha_inicio, $fecha_fin, $estatus);
            // echo "<pre>";
            // print_r($resultado);
            include_once('reportes/pagos-fechas.php');
        }
        break;
    case 'diplomados': 
        include_once('reportes/diplomados.php');
        break;
}

