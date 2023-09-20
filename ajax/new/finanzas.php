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
        $conceptos->setIndice(0);
        $conceptos->setUserId($_SESSION['User']['userId']);
        $conceptos->guardar_pago();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Pago solicitado',
            'reload'    => true
        ]);
        break;
    case 'crear-datos-fiscales':
        $regimenes = $invoice->tax_regime();
        $estados = $util->estados();
        $smarty->assign("regimenes", $regimenes);
        $smarty->assign("estados", $estados);
        echo json_encode([
            'modal'     => true,
            'html'   => $smarty->fetch(DOC_ROOT . "/templates/forms/new/crear-datos-fiscales.tpl")
        ]);
        break;
    case 'guardar-datos-fiscales':
        $regimen = intval($_POST['regimen']);
        $nombreComercial = strip_tags($_POST['nombre_comercial']);
        $nombreEmpresa = strip_tags($_POST['nombre_empresa']);
        $rfc = strip_tags($_POST['rfc']);
        $telefono = strip_tags($_POST['telefono']);
        $correoElectronico = strip_tags($_POST['correo']);
        $estado = intval($_POST['estado']);
        $municipio = intval($_POST['municipio']);
        $localidad = intval($_POST['localidad']);
        $calle = strip_tags($_POST['calle']);
        $num_int = strip_tags($_POST['num_int']);
        $num_ext = strip_tags($_POST['num_ext']);
        $codigoPostal = $_POST['codigo_postal'];

        $errors = [];
        if (empty($regimen)) {
            $errors['regimen'] = 'El campo regimen fiscal es requerido';
        }
        // if (empty($nombreComercial)) {
        //     $errors['nombre_comercial'] = 'El campo nombre comercial es requerido';
        // }
        if (empty($nombreEmpresa)) {
            $errors['nombre_empresa'] = 'El campo razon social es requerido';
        }
        if (empty($rfc)) {
            $errors['rfc'] = 'El campo RFC es requerido';
        }
        if (empty($codigoPostal)) {
            $errors['codigo_postal'] = 'El campo RFC es requerido';
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $invoice->setAlumnoId($_SESSION['User']['userId']);
        $invoice->setRegimenId($regimen);
        $invoice->setNombreComercial($nombreComercial);
        $invoice->setNombreEmpresa($nombreEmpresa);
        $invoice->setRFC($rfc);
        $invoice->setTelefono($telefono);
        $invoice->setCorreo($correoElectronico);
        $invoice->setCalle($calle);
        $invoice->setNumExt($num_ext);
        $invoice->setNumInt($num_int);
        $invoice->setCodigoPostal($codigoPostal);
        $invoice->setEstado($estado);
        $invoice->setMunicipio($municipio);
        $invoice->setLocalidad($localidad);
        $invoice->guardar();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Se ha guardado los datos fiscales',
            'reload'    => true
        ]);
        break;
    case 'editar-datos-fiscales':
        $invoice->setDatoFiscalId($_POST['dato_fiscal']);
        $datos_fiscales = $invoice->getDatoFiscal();
        $regimenes = $invoice->tax_regime();
        $estados = $util->estados();
        $municipios = !empty($datos_fiscales['cve_ent']) ? $util->municipios($datos_fiscales['cve_ent']) : [];
        $localidades = !empty($datos_fiscales['cve_mun']) ? $util->localidades($datos_fiscales['cve_ent'], $datos_fiscales['cve_mun']) : [];
        $smarty->assign("regimenes", $regimenes);
        $smarty->assign("estados", $estados);
        $smarty->assign("municipios", $municipios);
        $smarty->assign("localidades", $localidades);
        $smarty->assign("datos_fiscales", $datos_fiscales);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/editar-datos-fiscales.tpl")
        ]);
        break;

    case 'actualizar-datos-fiscales':
        $regimen = intval($_POST['regimen']);
        $nombreComercial = strip_tags($_POST['nombre_comercial']);
        $nombreEmpresa = strip_tags($_POST['nombre_empresa']);
        $rfc = strip_tags($_POST['rfc']);
        $telefono = strip_tags($_POST['telefono']);
        $correoElectronico = strip_tags($_POST['correo']);
        $estado = intval($_POST['estado']);
        $municipio = intval($_POST['municipio']);
        $localidad = intval($_POST['localidad']);
        $calle = strip_tags($_POST['calle']);
        $num_int = strip_tags($_POST['num_int']);
        $num_ext = strip_tags($_POST['num_ext']);
        $codigoPostal = $_POST['codigo_postal'];
        $errors = [];
        if (empty($regimen)) {
            $errors['regimen'] = 'El campo regimen fiscal es requerido';
        }
        // if (empty($nombreComercial)) {
        //     $errors['nombre_comercial'] = 'El campo nombre comercial es requerido';
        // }
        if (empty($nombreEmpresa)) {
            $errors['nombre_empresa'] = 'El campo razon social es requerido';
        }
        if (empty($rfc)) {
            $errors['rfc'] = 'El campo RFC es requerido';
        }
        if (empty($codigoPostal)) {
            $errors['codigo_postal'] = 'El campo RFC es requerido';
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $invoice->setDatoFiscalId($_POST['dato_fiscal']);
        $invoice->setAlumnoId($_SESSION['User']['userId']);
        $invoice->setRegimenId($regimen);
        $invoice->setNombreComercial($nombreComercial);
        $invoice->setNombreEmpresa($nombreEmpresa);
        $invoice->setRFC($rfc);
        $invoice->setTelefono($telefono);
        $invoice->setCorreo($correoElectronico);
        $invoice->setCalle($calle);
        $invoice->setNumExt($num_ext);
        $invoice->setNumInt($num_int);
        $invoice->setCodigoPostal($codigoPostal);
        $invoice->setEstado($estado);
        $invoice->setMunicipio($municipio);
        $invoice->setLocalidad($localidad);
        $invoice->actualizar();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Se han actualizado los datos fiscales',
            'reload'    => true
        ]);
        break;
    case 'eliminar-datos-fiscales':
        $invoice->setDatoFiscalId($_POST['dato_fiscal']);
        $invoice->eliminar();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Se ha eliminado el dato fiscal',
            'reload'    => true
        ]);
        break;
    case 'subir-archivo':
        $pago = $_POST['pago'];
        $smarty->assign('pago', $pago);
        $smarty->assign('opcion', 'guardar-archivo');
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/solicitud-pago.tpl")
        ]);
        break;
    case 'guardar-archivo':
        $ruta = DOC_ROOT . "/files/solicitudes/";
        $response = $util->Util()->validarSubida(['types' => ['application/pdf'], 'size' => 5242880], $ruta);
        if (!$response['estatus']) {
            $errors["archivo"] = $response['mensaje'];
        }

        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $pago = $_POST['pago'];
        $payments->setArchivo($response['archivo']);
        $payments->setPagoId($pago);
        $responsePayment = $payments->actualizar_archivo();
        if ($responsePayment > 0) {
            echo json_encode([
                'growl'     => true,
                'message'   => 'Archivo subido',
                'type'      => 'success',
                'dtreload'  => '#datatable',
                'modal_close' => true
            ]);
        } else {
            $archivo = $ruta . $response['archivo'];
            if (file_exists($archivo)) {
                unlink($archivo);
            }
            echo json_encode([
                'growl'     => true,
                'type'      => 'danger',
                'message'   => 'No se pudo subir el archivo, intente de nuevo. ',
            ]);
        }
        break; 
}
