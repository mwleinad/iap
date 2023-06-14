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
    case 'eliminar-concepto':
        $conceptoId = $_POST['concepto'];
        $conceptos->setConcepto($conceptoId);
        $conceptos->eliminar_concepto();

        $listaConceptos = $conceptos->listar();
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'growl'         => true,
            'message'       => 'Concepto eliminado',
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
    case 'eliminar-curricula-concepto':
        $conceptoId = intval($_POST['concepto']);
        $conceptos->setConceptoSubject($conceptoId);
        $infoConcepto = $conceptos->getConceptoSubject();
        // print_r($infoConcepto);
        $conceptos->eliminar_periodos();
        $conceptos->eliminar_concepto_subject();       
        
        $conceptos->setSubjectId($infoConcepto['subject_id']);
        $listaConceptos = $conceptos->conceptos_subjects();
        // print_r($listaConceptos);
        $smarty->assign('opcion', "guardar-curricula-concepto");
        $smarty->assign("subjectId", $infoConcepto['subject_id']);
        $smarty->assign("conceptos", $listaConceptos);
        echo json_encode([
            'growl'     => true,
            'message'   => 'Concepto eliminado',
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
        $conceptos->setFechaEliminacion("NULL");
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
        $pagos_actuales = $conceptos->pagos_curso_concepto(); 
        foreach ($pagos_actuales as $item) {
            if($item['cobros'] == 0){ //si no existen cobros
                $conceptos->setStatus($item['status']);
                $conceptos->setPagoId($item['pago_id']);
                $conceptos->setUserId($_SESSION['User']['userId']);
                if($item['beca'] == 0){ //Si la beca no ha sido cambiada
                    $conceptos->setTotal($costo);
                    $conceptos->setDescuento($beca);
                    $conceptos->setBeca(0);
                }else{
                    $descuento = $costo * ($item['beca'] / 100);
                    $total = $costo - $descuento;
                    $conceptos->setTotal($total);
                    $conceptos->setDescuento($item['descuento']);
                    $conceptos->setBeca($item['beca']);
                }
                $conceptos->actualizar_pago();
            }
        }

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
    case 'eliminar-curso-concepto':
        $conceptoCurso = intval($_POST['concepto_curso']);
        $conceptos->setConceptoCurso($conceptoCurso);
        $infoConcepto = $conceptos->concepto_curso();
        $conceptos->setFechaEliminacion("NOW()");
        $conceptos->eliminar_concepto_curso();

        $pagos_actuales = $conceptos->pagos_curso_concepto(); 
        foreach ($pagos_actuales as $item) {
            if($item['cobros'] == 0){ 
                $conceptos->setPagoId($item['pago_id']);
                $conceptos->eliminar_pago();
            }
        }
        
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
                'message'       => 'Concepto eliminado',
                'modal_close'   => true,
                'selector'      => "#calendario-pagos",
                'html'          => $smarty->fetch(DOC_ROOT . "/templates/new/configurar-calendario.tpl"),
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
        $conceptos->setUserId($_SESSION['User']['userId']);
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
    case 'pagos': 
        $curso = $_POST['curso'];
        $alumno = $_POST['alumno'];
        $conceptos->setCourseId($curso);
        $conceptos->setAlumno($alumno);
        $course->setCourseId($curso);
        $info = $course->Info();
        $student->setUserId($alumno);
        $infoAlumno = $student->GetInfo();
        $pagos = $conceptos->historial_pagos();
        $smarty->assign("info", $info);
        $smarty->assign("alumno", $infoAlumno);
        $smarty->assign("pagos", $pagos);
        echo json_encode([
            'modal'  => true,
            'html'   => $smarty->fetch(DOC_ROOT . "/templates/new/history-calendar.tpl")
        ]);
        break;
    case 'agregar-pago': 
        $curso = $_POST['curso'];
        $alumno = $_POST['alumno'];
        $conceptos->setCourseId($curso);
        $listaConceptos = $conceptos->conceptos_cursos_relacionados();
        $smarty->assign("conceptos", $listaConceptos);
        $smarty->assign("opcion", "guardar-pago");
        $smarty->assign("curso", $curso); 
        $smarty->assign("alumno", $alumno);
        $smarty->assign("edicion", false);       
        echo json_encode([
            'modal'  => true,
            'html'   => $smarty->fetch(DOC_ROOT . "/templates/forms/new/pago.tpl")
        ]);
        break;
    case 'guardar-pago':
        $errors = [];
        $curso = intval($_POST['curso']);
        $alumno = intval($_POST['alumno']);
        $concepto = intval($_POST['concepto']);
        $subtotal = floatval($_POST['costo']);
        $descuento = intval($_POST['descuento']);
        $beca = intval($_POST['beca']);
        $total = $descuento == 1 && $beca > 0 ? $subtotal - ($subtotal * ($beca/100)) : $subtotal;
        $periodo = intval($_POST['periodo']);
        $fecha_cobro = $_POST['fecha_cobro'] != "" ? "'{$_POST['fecha_cobro']}'" : "NULL";
        $fecha_limite = $_POST['fecha_limite'] != "" ? "'{$_POST['fecha_limite']}'" : "NULL";
        $fecha_pago = $_POST['fecha_pago'] != "" ? "'{$_POST['fecha_pago']}'" : "NULL"; 
        if ($subtotal == 0) {
            $errors['costo'] = "Falta indicar el cantidad del pago";
        }

        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $conceptos->setAlumno($alumno);
        $conceptos->setCourseId($curso);
        $conceptos->setConcepto($concepto);
        $conceptos->setCosto($subtotal);
        $conceptos->setTotal($total);
        $conceptos->setDescuento($descuento);
        $conceptos->setBeca($beca);
        $conceptos->setFechaCobro($fecha_cobro);
        $conceptos->setFechaLimite($fecha_limite);
        $conceptos->setFechaPago($fecha_pago); 
        $conceptos->setPeriodo($periodo);
        $conceptos->setUserId($_SESSION['User']['userId']);  
        $conceptos->guardar_pago();
        
        $course->setCourseId($curso);
        $info = $course->Info();
        $student->setUserId($alumno);
        $infoAlumno = $student->GetInfo();
        $pagos = $conceptos->historial_pagos();
        $smarty->assign("info", $info);
        $smarty->assign("alumno", $infoAlumno);
        $smarty->assign("pagos", $pagos);
        echo json_encode([
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/new/history-calendar.tpl"),
            'growl'     => true,
            'message'   => 'Pago actualizado'
        ]);
        break;
    case 'editar-pago':
        $pago = intval($_POST['pago']);
        $conceptos->setPagoId($pago);
        $infoPago = $conceptos->pago();
        $smarty->assign("pago", $infoPago);
        $smarty->assign("opcion", "actualizar-pago");
        $smarty->assign("edicion", true); 
        echo json_encode([
            'modal'  => true,
            'html'   => $smarty->fetch(DOC_ROOT . "/templates/forms/new/pago.tpl")
        ]);
        break;
    case 'actualizar-pago':
        $errors = [];
        $pago = intval($_POST['pago']); 
        $status = $_POST['estatus']; 
        $conceptos->setPagoId($pago);
        $infoPago = $conceptos->pago();
        if ($infoPago['cobros'] == 0) {
            $fecha_cobro = isset($_POST['fecha_cobro']) ? "'{$_POST['fecha_cobro']}'" : "NULL";
            $fecha_limite = isset($_POST['fecha_limite']) ? "'{$_POST['fecha_limite']}'" : "NULL";
            $fecha_pago = $_POST['fecha_pago'] != "" ? "'{$_POST['fecha_pago']}'" : "NULL";
            $subtotal = $_POST['costo'];
            $descuento = $_POST['descuento'];
            $beca = $_POST['beca'];
            $total = $descuento == 1 && $beca > 0 ? $subtotal - ($subtotal * ($beca/100)) : $subtotal; 
            $periodo = intval($_POST['periodo']);
            $status = $total == 0 ? 2 : $status;
        }else{
            $fecha_cobro =  "'{$infoPago['fecha_cobro']}'";
            $fecha_limite =  "'{$infoPago['fecha_limite']}'";
            $subtotal = $infoPago['subtotal'];
            $descuento =  $infoPago['descuento'];
            $beca = $infoPago['beca'];
            $total = $infoPago['total'];
            $periodo = $infoPago['periodo'];
        }
        
        $tolerancia = intval($_POST['tolerancia']);
        if ($subtotal == 0) {
            $errors['costo'] = "Falta indicar el cantidad del pago";
        }
        // if ($status == 2 && $fecha_pago == "NULL") {
        //     $errors['fecha_pago'] = "Falta indicar la fecha en la que se realizó el pago.";
        // }
        if ($status == 3 && $tolerancia == 0) {
            $errors['tolerancia'] = "Falta indicar los días de tolerancia";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
       
        $conceptos->setFechaCobro($fecha_cobro);
        $conceptos->setFechaLimite($fecha_limite); 
        $conceptos->setCosto($subtotal);
        $conceptos->setTotal($total);
        $conceptos->setDescuento($descuento);
        $conceptos->setBeca($beca);
        $conceptos->setTolerancia($tolerancia);
        $conceptos->setStatus($status);
        $conceptos->setPeriodo($periodo);
        $conceptos->setUserId($_SESSION['User']['userId']);
        $conceptos->actualizar_pago(); 
        
        $curso = $infoPago['course_id'];
        $alumno = $infoPago['alumno_id'];
        $conceptos->setCourseId($curso);
        $conceptos->setAlumno($alumno);
        $course->setCourseId($curso);
        $info = $course->Info();
        $student->setUserId($alumno);
        $infoAlumno = $student->GetInfo();
        $pagos = $conceptos->historial_pagos();
        $smarty->assign("info", $info);
        $smarty->assign("alumno", $infoAlumno);
        $smarty->assign("pagos", $pagos);
        echo json_encode([
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/new/history-calendar.tpl"),
            'growl'     => true,
            'message'   => 'Pago actualizado'
        ]);
        break;

    case 'agregar-cobro':
        $pagoId = intval($_POST['pago']);
        $conceptos->setPagoId($pagoId);
        $pago = $conceptos->pago();
        $montoPagado = $conceptos->monto();
        $metodosPago = $invoice->cfdi_payment_methods();
        $smarty->assign("opcion", "guardar-cobro");
        $smarty->assign("pago", $pago);
        $smarty->assign("monto", $montoPagado);
        $smarty->assign("edicion", false);
        $smarty->assign("metodos_pago", $metodosPago);
        echo json_encode([
            'modal'  => true,
            'html'   => $smarty->fetch(DOC_ROOT . "/templates/forms/new/cobro.tpl")
        ]); 
        break;
    case 'guardar-cobro':
        $errors = [];
        $pagoId = intval($_POST['pago']);
        $monto = floatval($_POST['monto']);
        $fecha_pago = "'{$_POST['fecha_pago']}'";
        $conceptos->setPagoId($pagoId);
        $infoPago = $conceptos->pago();
        $montoActual = $conceptos->monto();
        $metodosPago = intval($_POST['metodo_pago']);
        $resto = $infoPago['total'] - $montoActual;
        if ($monto == 0) {
            $errors['monto'] = "Falta indicar el monto del pago";
        }
        if($monto > $resto){
            $errors['monto'] = "El monto recibido o pagado no debe ser superior a $resto";
        }
        if ($fecha_pago == '') {
            $errors['fecha_pago'] = "El campo fecha de pago es requerido";
        }
        if(empty($metodosPago)){
            $errors['metodo_pago'] = "El campo método de pago es requerido.";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        
        $conceptos->setMonto($monto);
        $conceptos->setFechaPago($fecha_pago);
        $conceptos->setMetodoPago($metodosPago);
        $conceptos->guardar_cobro(); 
        $montoTotalCobrado = $conceptos->monto(); 
        
        $conceptos->setAlumno($infoPago['alumno_id']);
        $conceptos->setCourseId($infoPago['course_id']);
        if ($montoTotalCobrado == $infoPago['total']) {
            $conceptos->setFechaCobro("'{$infoPago['fecha_cobro']}'");
            $conceptos->setFechaLimite("'{$infoPago['fecha_limite']}'"); 
            $conceptos->setCosto($infoPago['subtotal']);
            $conceptos->setTotal($infoPago['total']);
            $conceptos->setDescuento($infoPago['descuento']);
            $conceptos->setBeca($infoPago['beca']);
            $conceptos->setTolerancia($infoPago['tolerancia']);
            $conceptos->setStatus(2);
            $conceptos->setPeriodo($infoPago['periodo']);
            $conceptos->setUserId($_SESSION['User']['userId']);
            $conceptos->actualizar_pago(); 
        }
        $pagos = $conceptos->historial_pagos();
        $curso = $infoPago['course_id'];
        $alumno = $infoPago['alumno_id'];
        $course->setCourseId($curso);
        $info = $course->Info();
        $student->setUserId($alumno);
        $infoAlumno = $student->GetInfo();
        $smarty->assign("info", $info);
        $smarty->assign("alumno", $infoAlumno);
        $smarty->assign("pagos", $pagos);
        echo json_encode([
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/new/history-calendar.tpl"),
            'growl'     => true,
            'message'   => 'Cobro generado'
        ]);
        break;
}
