<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();
$opcion = $_POST['opcion'];
switch ($opcion) {
    case 'agregar-concepto':
        $smarty->assign("opcion", "guardar-concepto");
        $smarty->assign("edicion", false);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos.tpl"),
        ]);
        break;
    case 'guardar-concepto': //Guarda la información del concepto
        $errors = [];
        $nombre = strip_tags($_POST['nombre']);
        $costo = floatval(str_replace(",", "", strip_tags($_POST['costo'])));
        $beca = intval($_POST['beca']);
        $clave_sat = strip_tags($_POST['clave_sat']);
        $unidad_sat = strip_tags($_POST['unidad_sat']);
        $periodicidad = intval($_POST['periodicidad']);
        $tolerancia = intval($_POST['tolerancia']);
        $cobros = intval($_POST['cobros']);
        if (empty($nombre)) {
            $errors['nombre'] = "El campo nombre es requerido";
        }
        if (empty($clave_sat)) {
            $errors['clave_sat'] = "El campo clave sat es requerido";
        }
        if ($costo == 0) {
            $errors['costo'] = "El campo costo es requerido o debe ser mayor a 0";
        }
        if ($cobros > 1 && $periodicidad == 0) {
            $errors['periodicidad'] = "El campo periodicidad es requerido cuando el número de cobros es más de 1";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }

        $conceptos->setNombre($nombre);
        $conceptos->setCosto($costo);
        $conceptos->setBeca($beca);
        $conceptos->setClave($clave_sat);
        $conceptos->setUnidad($unidad_sat);
        $conceptos->setPeriodicidad($periodicidad);
        $conceptos->setTolerancia($tolerancia);
        $conceptos->setCobros($cobros);
        $respuesta = $conceptos->crear();
        if ($respuesta > 0) {
            $listaConceptos = $conceptos->listar();
            $smarty->assign("conceptos", $listaConceptos);
            echo json_encode([
                'growl'         => true,
                'message'       => 'Concepto creado',
                'modal_close'   => true,
                'html'          => $smarty->fetch(DOC_ROOT . "/templates/lists/new/conceptos.tpl"),
                'selector'      => ".content-wrapper"
            ]);
        }
        break;
    case 'editar-concepto': //Muestra la ventana de edición del concepto
        $conceptoId = $_POST['concepto'];
        $conceptos->setConcepto($conceptoId);
        $infoConcepto = $conceptos->getConcepto();
        $smarty->assign('opcion', 'actualizar-concepto');
        $smarty->assign('edicion', true);
        $smarty->assign('concepto', $infoConcepto);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos.tpl")
        ]);
        break;
    case 'actualizar-concepto': //Actualiza la información del concepto
        $errors = [];
        $nombre = strip_tags($_POST['nombre']);
        $costo = floatval(str_replace(",", "", strip_tags($_POST['costo'])));
        $beca = intval($_POST['beca']);
        $clave_sat = strip_tags($_POST['clave_sat']);
        $unidad_sat = strip_tags($_POST['unidad_sat']);
        $periodicidad = intval($_POST['periodicidad']);
        $tolerancia = intval($_POST['tolerancia']);
        $cobros = intval($_POST['cobros']);
        if (empty($nombre)) {
            $errors['nombre'] = "El campo nombre es requerido";
        }
        if (empty($clave_sat)) {
            $errors['clave_sat'] = "El campo clave sat es requerido";
        }
        if ($costo == 0) {
            $errors['costo'] = "El campo costo es requerido o debe ser mayor a 0";
        }
        if ($cobros > 1 && $periodicidad == 0) {
            $errors['periodicidad'] = "El campo periodicidad es requerido cuando el número de cobros es más de 1";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $conceptoId = $_POST['conceptoId'];
        $conceptos->setConcepto($conceptoId);
        $conceptos->setNombre($nombre);
        $conceptos->setCosto($costo);
        $conceptos->setBeca($beca);
        $conceptos->setClave($clave_sat);
        $conceptos->setUnidad($unidad_sat);
        $conceptos->setPeriodicidad($periodicidad);
        $conceptos->setTolerancia($tolerancia);
        $conceptos->setCobros($cobros);
        $respuesta = $conceptos->actualizar();
        $listaConceptos = $conceptos->listar();
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'growl'         => true,
            'message'       => 'Concepto actualizado',
            'modal_close'   => true,
            'html'          => $smarty->fetch(DOC_ROOT . "/templates/lists/new/conceptos.tpl"),
            'selector'      => ".content-wrapper"
        ]);
        break;

    case 'curricula-conceptos': //Muestra los conceptos de la currícula
        $subjectId = intval($_POST['subjectId']);
        $conceptos->setSubjectId($subjectId);
        $listaConceptos = $conceptos->conceptos_subjects();
        // print_r($listaConceptos);
        $smarty->assign("subjectId", $subjectId);
        $smarty->assign("opcion", "guardar-curricula-concepto");
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curricula.tpl")
        ]);
        break;
    case 'guardar-curricula-concepto': // Guarda la relación de concepto con la curricula
        $subjectId = intval($_POST['subjectId']);
        $relacionConceptos = $_POST['conceptos'];
        $conceptos->setSubjectId($subjectId);
        $json = "";
        foreach ($relacionConceptos as $item) {
            $conceptos->setConcepto($item);
            $infoConcepto = $conceptos->getConcepto();
            $conceptos->setCosto($infoConcepto["total"]);
            $conceptos->setBeca($infoConcepto["descuento"]);
            $conceptos->setPeriodicidad($infoConcepto["periodicidad"]);
            $conceptos->setTolerancia($infoConcepto["tolerancia"]);
            $conceptos->setCobros($infoConcepto["cobros"]);
            $conceptoSubject = $conceptos->crear_relacion();
            if ($infoConcepto["cobros"] > 0) {
                for ($i = 0; $i < $infoConcepto["cobros"]; $i++) {
                    $conceptos->setConceptoSubject($conceptoSubject);
                    $conceptos->crear_periodo();
                }
            }
        }
        $listaConceptos = $conceptos->conceptos_subjects();
        $smarty->assign('opcion', 'guardar-curricula-concepto');
        $smarty->assign("subjectId", $subjectId);
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'growl'     => true,
            'message'   => 'Conceptos relacionados',
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curricula.tpl")
        ]);
        break;
    case 'editar-curricula-concepto': //Muestra la ventana de la información del concepto relacionado con la currícula
        $edicion = true;
        $conceptoSubjectId = $_POST['concepto'];
        $conceptos->setConceptoSubject($conceptoSubjectId);
        $infoConcepto = $conceptos->getConceptoSubject();
        // print_r($infoConcepto);
        $smarty->assign('concepto', $infoConcepto);
        $smarty->assign('opcion', 'actualizar-curricula-concepto');
        $smarty->assign('edicion', true);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curricula.tpl")
        ]);
        break;
    case 'actualizar-curricula-concepto': //Actualiza la información del concepto relacionado a la currícula
        $errors = [];
        $conceptoSubjectId = intval($_POST['conceptoId']);
        $costo = floatval(str_replace(",", "", strip_tags($_POST['costo'])));
        $beca = intval($_POST['beca']);
        $periodicidad = intval($_POST['periodicidad']);
        $tolerancia = intval($_POST['tolerancia']);
        $cobros = intval($_POST['cobros']);
        if ($costo == 0) {
            $errors['costo'] = "El campo costo es requerido o debe ser mayor a 0";
        }
        if ($cobros > 1 && $periodicidad == 0) {
            $errors['periodicidad'] = "El campo periodicidad es requerido cuando el número de cobros es más de 1";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $conceptos->setConceptoSubject($conceptoSubjectId);
        $infoConcepto = $conceptos->getConceptoSubject();
        $conceptos->setCosto($costo);
        $conceptos->setBeca($beca);
        $conceptos->setPeriodicidad($periodicidad);
        $conceptos->setTolerancia($tolerancia);
        $conceptos->setCobros($cobros);
        $conceptos->actualizar_relacion();
        $conceptos->setSubjectId($infoConcepto['subject_id']);
        if ($infoConcepto['cobros'] != $cobros) {
            $conceptos->eliminar_periodos();
            if ($cobros > 0) {
                for ($i = 0; $i < $cobros; $i++) {
                    $conceptos->crear_periodo();
                }
                $periodos = $conceptos->periodos_subject();
                $smarty->assign("opcion", "actualizar-periodos-concepto");
                $smarty->assign("periodos", $periodos);
                $smarty->assign("subjectId", $infoConcepto['subject_id']);
                $smarty->assign("concepto", $conceptoSubjectId);
                echo json_encode([
                    'growl'     => true,
                    'message'   => 'Concepto actualizado, actualice los periodos de los pagos',
                    'modal'     => true,
                    'html'      => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-periodos.tpl")
                ]);
                exit;
            }
        }

        $listaConceptos = $conceptos->conceptos_subjects();
        $smarty->assign('opcion', "guardar-curricula-concepto");
        $smarty->assign("subjectId", $infoConcepto['subject_id']);
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'growl'     => true,
            'message'   => 'Concepto actualizado',
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curricula.tpl")
        ]);
        break;
    case 'periodos-concepto': //Muestra la vista de los periodos del concepto relacionado a la curricula
        $conceptoSubjectId = intval($_POST['concepto']);
        $conceptos->setConceptoSubject($conceptoSubjectId);
        $infoConcepto = $conceptos->getConceptoSubject();
        $periodos = $conceptos->periodos_subject();
        $smarty->assign("opcion", "actualizar-periodos-concepto");
        $smarty->assign("periodos", $periodos);
        $smarty->assign("subjectId", $infoConcepto['subject_id']);
        $smarty->assign("concepto", $conceptoSubjectId);
        echo json_encode([
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-periodos.tpl")
        ]);
        break;
    case 'actualizar-periodos-concepto':
        $conceptoSubjectId = $_POST['concepto'];
        $periodos = $_POST['periodo'];
        foreach ($periodos as $indice => $valor) {
            $conceptos->setPeriodo($valor);
            $conceptos->setPeriodoId($indice);
            $conceptos->actualizar_periodos();
        }
        $conceptos->setConceptoSubject($conceptoSubjectId);
        $infoConcepto = $conceptos->getConceptoSubject();
        $conceptos->setSubjectId($infoConcepto['subject_id']);
        $listaConceptos = $conceptos->conceptos_subjects();
        $smarty->assign('opcion', "guardar-curricula-concepto");
        $smarty->assign("subjectId", $infoConcepto['subject_id']);
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'growl'     => true,
            'message'   => 'Periodos actualizados',
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curricula.tpl")
        ]);
        break;
    case 'conceptos-curso':
        $curso = intval($_POST['curso']);
        $conceptos->setCourseId($curso);
        $listConceptos = $conceptos->conceptos_cursos_relacionados();
        $course->setCourseId($curso);
        $info = $course->Info();
        $smarty->assign('info', $info);
        $smarty->assign("opcion", "conceptos-curso");
        $smarty->assign("conceptos", $listConceptos);
        echo json_encode([
            'html'        => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curso.tpl"),
            'modal'        => true,
        ]);
        break;
    case 'editar-curso-concepto':
        $cursoConcepto = intval($_POST['concepto-curso']);
        $calendario = boolval($_POST['calendario']);
        $conceptos->setConceptoCurso($cursoConcepto);
        $infoConcepto = $conceptos->concepto_curso();
        $smarty->assign("opcion", "actualizar-curso-concepto");
        $smarty->assign("concepto", $infoConcepto);
        $smarty->assign("calendario", $calendario);
        echo json_encode([
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curso.tpl"),
            'modal' => true,
        ]);
        break;
    case 'actualizar-curso-concepto':
        $conceptoCurso = intval($_POST['concepto_curso']);
        $fecha_cobro = $_POST['fecha_cobro'];
        $fecha_limite = $_POST['fecha_limite'];
        $costo = floatval($_POST['costo']);
        $beca = $_POST['beca'];
        $periodo = intval($_POST['periodo']);
        $conceptos->setConceptoCurso($conceptoCurso);
        $conceptos->setCosto($costo);
        $conceptos->setBeca($beca);
        $conceptos->setPeriodo($periodo);
        if ($periodo == 0) {
            $conceptos->setFechaCobro("NULL");
            $conceptos->setFechaLimite("NULL");
        } else {
            $conceptos->setFechaCobro("'$fecha_cobro'");
            $conceptos->setFechaLimite("'$fecha_limite'");
        }

        $conceptos->actualizar_concepto_curso();

        $infoConcepto = $conceptos->concepto_curso();
        $conceptos->setCourseId($infoConcepto['course_id']);
        $listConceptos = $conceptos->conceptos_cursos_relacionados();
        $course->setCourseId($infoConcepto['course_id']);
        $info = $course->Info();
        $smarty->assign('info', $info);
        $smarty->assign("opcion", "conceptos-curso");
        $smarty->assign("conceptos", $listConceptos);
        if ($_POST['calendario']) {
            echo json_encode([
                'growl'         => true,
                'message'       => 'Concepto actualizado',
                'modal_close'   => true,
                'selector'      => "#calendario-pagos",
                'html'          => $smarty->fetch(DOC_ROOT . "/templates/new/configurar-calendario.tpl"),
            ]);
        } else {
            echo json_encode([
                'growl'     => true,
                'message'   => 'Concepto actualizado',
                'modal'     => true,
                'html'      => $smarty->fetch(DOC_ROOT . "/templates/forms/new/conceptos-curso.tpl")
            ]);
        }
        break;
    case 'actualizar-beca': //Actualiza la beca por periodo
        $alumno = intval($_POST['alumno']);
        $beca = intval($_POST['beca']);
        $curso = intval($_POST['curso']);
        $periodo = intval($_POST['periodo']);
        $conceptos->setBeca($beca);
        $conceptos->setCourseId($curso);
        $conceptos->setAlumno($alumno);
        $conceptos->setPeriodo($periodo);
        $conceptos->actualizar_beca();

        $course->setCourseId($curso);
        $info = $course->Info();
        $student->setUserId($alumno);
        $infoAlumno = $student->GetInfo();
        $pagos = $conceptos->historial_pagos();
        $smarty->assign("info", $info);
        $smarty->assign("alumno", $infoAlumno);
        $smarty->assign("pagos", $pagos);
        echo json_encode([
            'growl'     => true,
            'message'   => "Porcentaje de becas aplicadas al periodo {$periodo}",
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/new/history-calendar.tpl")
        ]);
        break;
    case 'editar-pago':
        $pago = intval($_POST['pago']);
        $conceptos->setPagoId($pago);
        $infoPago = $conceptos->pago();
        $smarty->assign("pago", $infoPago);
        echo json_encode([
            'modal'  => true,
            'html'   => $smarty->fetch(DOC_ROOT . "/templates/forms/new/pago.tpl")
        ]);
        break;
}
