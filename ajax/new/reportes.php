<?php

include_once('../../init.php');  
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');
session_start();

switch($_POST["opcion"]){
    case 'pagos':
        $alumno = intval($_POST['alumno']);
        $curricula = intval($_POST['curricula']);
        if(empty($alumno)){
            $errors['alumno'] = "Debe seleccionar un alumno";
        }
        if(empty($curricula)){
            $errors['curricula'] = "Debe seleccionar un curricula";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        include_once('reportes/pagos.php');
        echo json_encode([
            'load'  =>'alumnos.xls'
        ]);
        break;
}

