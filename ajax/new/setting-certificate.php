<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

if ($_POST) {
    $errors = []; 
    $rectorName = $util->cleanInput(trim($_POST['rName']));
    $rectorGender = trim($_POST['rGener']) == "M" ? 1 : 2;
    $secretaryName = $util->cleanInput(trim($_POST['saName']));
    $secretaryGender = trim($_POST['saGener']) == "M" ? 1 : 2;
    $schoolServicesName = $util->cleanInput(trim($_POST['jdseName']));
    $schoolServicesGender = trim($_POST['jdseGener']) == "M" ? 1 : 2;
    $directorEducationName = $util->cleanInput(trim($_POST['desName']));
    $directorEducationGender = trim($_POST['desGener']) == "M" ? 1 : 2;
    $coordinatorName = $util->cleanInput(trim($_POST['cajgName']));
    $coordinatorGender = trim($_POST['cajgGener']) == "M" ? 1 : 2;
    $comparisonName = $util->cleanInput(trim($_POST['cName']));
    $headName = $util->cleanInput(trim($_POST['joName']));
    $headGender = trim($_POST['joGener']) == "M" ? 1 : 2;
    $message = "El campo nombre es requerido";
    if (empty($rectorName)) {
        $errors["rName"] = $message; 
    }
    if (empty($secretaryName)) {
        $errors["saName"] = $message; 
    }
    if (empty($schoolServicesName)) {
        $errors["jdsaName"] = $message; 
    }
    if (empty($directorEducationName)) {
        $errors["desName"] = $message; 
    }
    if (empty($coordinatorName)) {
        $errors["cajgName"] = $message; 
    }
    if (empty($comparisonName)) {
        $errors["cName"] = $message; 
    }
    if (empty($rectorName)) {
        $errors["joName"] = $message; 
    } 
     
    if (!empty($errors)) {
        http_response_code(422);
        echo json_encode([
            "errors"    =>$errors,
            "growl"     =>true,
            "message"   =>"Faltan datos o hay algún error con ellos",
            "type"      =>"danger"
        ]);
    }else{
        $result = $certificates->updateSettings($rectorName, $secretaryName, $schoolServicesName, $directorEducationName, $coordinatorName, $comparisonName, $headName, $rectorGender, $secretaryGender, $schoolServicesGender, $directorEducationGender, $coordinatorGender, $headGender);
        echo json_encode([
            "growl"     =>true,
            "message"   =>"Datos actualizados",
            "type"      =>"success"
        ]);
    }
}else{
    http_response_code(405);
}

?>