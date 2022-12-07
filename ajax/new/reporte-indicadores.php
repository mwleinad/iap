<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php'); 
session_start();

$fecha_inicial = $_POST['fecha_inicial'];
$fecha_final = $_POST['fecha_final'];
//Titulación
$total = $group->IndicadorTitulacionFechas($fecha_inicial, $fecha_final);
$smarty->assign('total_certificate', $total);
print_r($total);
echo json_encode(array(
    "selector"  =>"#container-reportes",
    "html"      =>$smarty->fetch(DOC_ROOT.'/templates/items/new/reporte-indicadores.tpl')
)); 
?>