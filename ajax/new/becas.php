<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();
$opcion = $_POST['opcion'];
switch ($opcion) {
    case 'grupos': 
        $subject->setSubjectId($_POST['posgrado']);
        $grupos = $subject->grupos();
        print_r(json_encode($grupos));
        break;
    
    default:
        # code...
        break;
}