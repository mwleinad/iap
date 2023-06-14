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
        $nombreComercial = !empty(strip_tags($_POST['nombre_comercial'])) ? strip_tags($_POST['nombre_comercial']) : "NULL";
        $nombreEmpresa = strip_tags($_POST['nombre_empresa']);
        $rfc = strip_tags($_POST['rfc']);
        $telefono = !empty(strip_tags($_POST['telefono'])) ? strip_tags($_POST['telefono']) : "NULL";
        $correoElectronico = !empty(strip_tags($_POST['correo'])) ? strip_tags($_POST['correo']) : "NULL";
        $estado = !empty(intval($_POST['estado'])) ? intval($_POST['estado']) : "NULL";
        $municipio = !empty(intval($_POST['municipio'])) ? intval($_POST['municipio']) : "NULL";
        $localidad = !empty(intval($_POST['localidad'])) ? intval($_POST['localidad']) : "NULL";
        $calle = !empty(strip_tags($_POST['calle'])) ? strip_tags($_POST['calle']) : "NULL";
        $num_int = !empty(strip_tags($_POST['num_int'])) ? strip_tags($_POST['num_int']) : "NULL";
        $num_ext = !empty(strip_tags($_POST['num_ext'])) ? strip_tags($_POST['num_ext']) : "NULL";
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
        $municipios = $util->municipios($datos_fiscales['cve_ent']);
        $localidades= $util->localidades($datos_fiscales['cve_ent'], $datos_fiscales['cve_mun']);
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
        $nombreComercial = !empty(strip_tags($_POST['nombre_comercial'])) ? strip_tags($_POST['nombre_comercial']) : "NULL";
        $nombreEmpresa = strip_tags($_POST['nombre_empresa']);
        $rfc = strip_tags($_POST['rfc']);
        $telefono = !empty(strip_tags($_POST['telefono'])) ? strip_tags($_POST['telefono']) : "NULL";
        $correoElectronico = !empty(strip_tags($_POST['correo'])) ? strip_tags($_POST['correo']) : "NULL";
        $estado = !empty(intval($_POST['estado'])) ? intval($_POST['estado']) : "NULL";
        $municipio = !empty(intval($_POST['municipio'])) ? intval($_POST['municipio']) : "NULL";
        $localidad = !empty(intval($_POST['localidad'])) ? intval($_POST['localidad']) : "NULL";
        $calle = !empty(strip_tags($_POST['calle'])) ? strip_tags($_POST['calle']) : "NULL";
        $num_int = !empty(strip_tags($_POST['num_int'])) ? strip_tags($_POST['num_int']) : "NULL";
        $num_ext = !empty(strip_tags($_POST['num_ext'])) ? strip_tags($_POST['num_ext']) : "NULL";
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
}
