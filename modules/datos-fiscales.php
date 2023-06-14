<?php
$student->setUserId($_SESSION["User"]["userId"]);
$datos_fiscales = $student->datos_fiscales(); 
// print_r($datos_fiscales);
$smarty->assign("datos_fiscales", $datos_fiscales);
?> 