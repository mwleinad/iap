<?php 
$student->setState(7);
$ciudades = $student->EnumerateCiudades(); 
$smarty->assign("opcion", $opcion);
$smarty->assign("ciudades", $ciudades);
