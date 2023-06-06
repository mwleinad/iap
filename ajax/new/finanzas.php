<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();

switch ($_POST["opcion"]) {
    case 'cuenta-deposito':
        $data = [
            [
                "metodo"    => "En ventanilla",
                "dato"      => "Con número de cuenta: <b>1031331727</b>"
            ],
            [
                "metodo"    => "Por transferencia de un banco distinto a Banorte",
                "dato"      => "Con número de clabe interbancaria: <b>072100010313317272</b>"
            ],
            [
                "metodo"    => "Por transferencia con cuenta Banorte",
                "dato"      => "Con número de Cuenta: <b>1031331727</b>"
            ],

        ];
        $smarty->assign("banco", "BANORTE IXE");
        $smarty->assign("nombre_cuenta", "IAP POSTGRADOS");
        $smarty->assign("data", $data);
        echo json_encode([
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/new/cuenta-deposito.tpl"),
            'modal' => true
        ]);
        break;
    case 'nuevo-pago':
        $curso = intval($_POST['curso']);
        $alumno = intval($_POST['alumno']);
        $conceptos->setCourseId($curso);
        $listaConceptos = $conceptos->conceptos_cursos_relacionados();
        $smarty->assign("conceptos", $listaConceptos);
        $smarty->assign("alumno", $alumno);
        $smarty->assign("curso", $curso);
        echo json_encode([
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/pago-estudiante.tpl"),
            'modal' => true
        ]);
        break;
    case 'guardar-pago':
        $curso = intval($_POST['curso']);
        $alumno = intval($_POST['alumno']);
        $concepto = intval($_POST['concepto']);
        $errors = [];
        if (empty($concepto)) {
            $errors['concepto'] = 'Por favor, no se olvide de seleccionar el concepto a pagar.';
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
        $conceptos->setConceptoCurso($concepto);
        $infoConcepto = $conceptos->concepto_curso();
        // print_r($infoConcepto);
        $conceptos->setConcepto($infoConcepto['concepto_id']);
        $conceptos->setCosto($infoConcepto['total']);
        $conceptos->setTotal($infoConcepto['total']);
        $conceptos->setDescuento($infoConcepto['descuento']);
        $conceptos->setBeca(0);
        $conceptos->setFechaCobro("NULL");
        $conceptos->setFechaLimite("NULL");
        $conceptos->setFechaPago("NULL"); 
        $conceptos->setPeriodo(0);
        $conceptos->setUserId($_SESSION['User']['userId']);  
        $conceptos->guardar_pago();
        echo json_encode([
            'growl'     =>true,
            'message'   =>'Pago solicitado',
            'reload'    =>true
        ]);
        break;
}
