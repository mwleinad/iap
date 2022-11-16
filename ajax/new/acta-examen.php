<?php

include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();
$testHistory = $test->getTestHistory($_POST['course'],$_POST['student']);
if ($testHistory) {
    echo json_encode([
        'status'    =>true,
        'data'      =>$testHistory
    ]);
}else{
    echo json_encode([
        'status'=>false
    ]);
}