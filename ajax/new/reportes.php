<?php

include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();
if ($_GET['opcion']) {
    $_POST['opcion'] = $_GET['opcion'];
}
switch ($_POST["opcion"]) {
    case 'cuenta-alumno':
        $alumno = intval($_POST['alumno']);
        $curricula = intval($_POST['curricula']);
        if (empty($alumno)) {
            $errors['alumno'] = "Debe seleccionar un alumno";
        }
        if (empty($curricula)) {
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
        } else {
            $conceptos->setAlumno($alumno);
            $conceptos->setCourseId($curricula);
            $course->setCourseId($curricula);
            include_once('reportes/pagos.php');
        }
        break;
    case 'cuenta-grupo':
        $curricula = intval($_POST['curricula-grupo']);
        $estatus = intval($_POST['estatus']);
        if (empty($curricula)) {
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
        } else {
            $resultado = $payments->historial_pagos_curso($curricula, $estatus);
            $course->setCourseId($curricula);
            include_once('reportes/pagos-grupo.php');
        }
        break;
    case 'cuenta-fechas':
        $estatus = intval($_POST['estatus']);
        $fecha_inicio = $_POST['fecha_inicial'];
        $fecha_fin = $_POST['fecha_final'];
        if (empty($fecha_inicio)) {
            $errors['fecha_inicio'] = "Debe seleccionar un fecha de inicio";
        }
        if (empty($fecha_fin)) {
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
        } else {
            $resultado = $payments->historial_pagos_fecha($fecha_inicio, $fecha_fin, $estatus);
            // echo "<pre>";
            // print_r($resultado);
            include_once('reportes/pagos-fechas.php');
        }
        break;
    case 'diplomados':
        include_once('reportes/diplomados.php');
        break;
    case 'becas':
        $sql = "SELECT major.name as posgrado,subject.subjectId,subject.name as curricula,course.courseId,course.group,user.userId,user.names,user.lastNamePaterno,user.lastNameMaterno,conceptos.concepto_id, conceptos.nombre,pagos.periodo,pagos.beca FROM pagos INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id INNER JOIN course ON course.courseId = pagos.course_id INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo INNER JOIN user_subject ON user_subject.alumnoId = pagos.alumno_id AND user_subject.courseId = course.courseId AND user_subject.status = 'activo' INNER JOIN user ON user.userId = pagos.alumno_id WHERE course.finalDate >= NOW() AND pagos.deleted_at IS NULL AND pagos.indice > 0 GROUP BY subject.subjectId, course.courseId, pagos.alumno_id, pagos.concepto_id, pagos.periodo, pagos.beca ORDER BY major.name, subject.name, course.group, pagos.periodo, pagos.concepto_id, pagos.beca;";
        $util->DB()->setQuery($sql);
        $response = $util->DB()->GetResult();
        // echo "<pre>";
        // print_r($response);
        $data = [];
        $curricula = [];
        foreach ($response as $item) {
            if (isset($data[$item['courseId']][$item['periodo']][$item['nombre']][$item['beca']])) { 
                $data[$item['courseId']][$item['periodo']][$item['nombre']][$item['beca']] =  $data[$item['courseId']][$item['periodo']][$item['nombre']][$item['beca']] + 1;
            }else{
                $data[$item['courseId']][$item['periodo']][$item['nombre']][$item['beca']] = 1;
                $curricula[$item['courseId']] = $item;
            }
        }
        // print_r($curricula);
        // // echo count($data);
        include_once('reportes/becas.php');
        break;
}
