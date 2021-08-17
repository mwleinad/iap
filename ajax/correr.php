<?php

include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();
$user->allow_access(37);

$result = $student->AddUserToCurricula(3467, 59, 'LEONEL INOCENCIO REYES GONZALEZ', 'carloszh04@gmail.com', 'LEONELREY2021', 'DOCTORADO', 'EN ADMINISTRACION PUBLICA', 0, 0, "");
var_dump($result);