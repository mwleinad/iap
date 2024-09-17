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
        if ($_POST['tipo'] == 1) {
            include_once('reportes/diplomados.php');
        } else {
            include_once('reportes/diplomados-evaluaciones.php');
        }
        break;
    case 'becas':
        $where = " AND course.courseId = {$_POST['grupo']}";
        $courseData = $course->getCourses($where)[0];
        $course->setCourseId($courseData['courseId']);
        $periodoActual = $course->periodoActual();
        $conceptosData = $conceptos->conceptos_cursos_relacionados("conceptos_course.course_id = {$courseData['courseId']} AND conceptos_course.periodo = {$periodoActual} GROUP BY conceptos.concepto_id");

        $sql = "SELECT user.userId, user.controlNumber, user.names, user.lastNamePaterno, user.lastNameMaterno, pagos.course_id FROM pagos INNER JOIN user ON user.userId = pagos.alumno_id WHERE pagos.course_id = {$courseData['courseId']} AND periodo = {$periodoActual} AND pagos.deleted_at IS NULL GROUP BY userId;";
        $util->DB()->setQuery($sql);
        $alumnos = $util->DB()->GetResult();

        $sql = "SELECT conceptos.nombre, conceptos.concepto_id FROM `pagos` INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id WHERE pagos.course_id = {$courseData['courseId']} AND pagos.periodo >= {$periodoActual} GROUP BY pagos.concepto_id;";
        $util->DB()->setQuery($sql);
        $conceptosProximos = $util->DB()->GetResult();

        foreach ($alumnos as $key => $alumno) {
            $sql = "SELECT pagos.concepto_id, pagos.beca, pagos.subtotal, pagos.total FROM pagos INNER JOIN user ON user.userId = pagos.alumno_id WHERE pagos.course_id = {$alumno['course_id']} AND periodo = {$periodoActual} AND pagos.alumno_id = {$alumno['userId']} GROUP BY userId, pagos.concepto_id order BY pagos.concepto_id;";
            $util->DB()->setQuery($sql);
            $alumnos[$key]['becas'] = $util->DB()->GetResult();

            $sql = "SELECT SUM(IF(pagos.beca <> 100, total, 0)) monto_pagar, SUM((SELECT SUM(cobros.monto) FROM cobros WHERE cobros.pago_id = pagos.pago_id)) as monto_pagado FROM `pagos` WHERE pagos.deleted_at IS NULL AND pagos.alumno_id = {$alumno['userId']} AND pagos.fecha_limite <= NOW() AND pagos.periodo <> 0 AND pagos.beca <> 100 AND pagos.course_id = {$alumno['course_id']};";  
            $util->DB()->setQuery($sql);
            $montos = $util->DB()->GetResult();

            $alumnos[$key]["deuda"] = $montos[0]['monto_pagar'] - $montos[0]['monto_pagado'];
            $alumnos[$key]['pagado'] = $montos[0]['monto_pagado'];
            foreach ($conceptosProximos as $conceptoProximo) {
                $sql = "SELECT COUNT(pagos.pago_id) as cantidad FROM `pagos` WHERE pagos.deleted_at IS NULL AND pagos.alumno_id = {$alumno['userId']} AND pagos.status <> 2 AND pagos.fecha_limite >= NOW() AND pagos.periodo <> 0 AND pagos.beca <> 100 AND pagos.course_id = {$alumno['course_id']} AND pagos.concepto_id = {$conceptoProximo['concepto_id']} GROUP BY pagos.concepto_id;"; 
                $util->DB()->setQuery($sql);
                $cantidad = $util->DB()->GetSingle();
                $alumnos[$key]['proximos'][] = $cantidad;
            }

            $sql = "SELECT SUM(pagos.total) FROM `pagos` WHERE pagos.deleted_at IS NULL AND pagos.alumno_id = {$alumno['userId']} AND pagos.status <> 2 AND pagos.fecha_limite >= NOW() AND pagos.periodo <> 0 AND pagos.beca <> 100 AND pagos.course_id = {$alumno['course_id']};";
            $util->DB()->setQuery($sql); 
            $alumnos[$key]["proximo"] =  $util->DB()->GetSingle();
        }  
         
        include_once('reportes/becas.php');
        break;
}
