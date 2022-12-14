<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php'); 
session_start();

$fecha_inicial = $_POST['fecha_inicial'];
$fecha_final = $_POST['fecha_final'];
$posgrado = $_POST['posgrado'];
//Titulación
$total = $group->IndicadorTitulacionFechas($fecha_inicial, $fecha_final, $posgrado);
$smarty->assign('total_certificate', $total);
$total = $group->IndicadorDesertoresFechas($fecha_inicial, $fecha_final, $posgrado);
$smarty->assign('total_desertion', $total);
$total = $group->IndicadorRecursadoresFechas($fecha_inicial, $fecha_final, $posgrado);
$smarty->assign('total_recursion', $total); 
$desglose = $group->desgloseReporteIndicadores($fecha_inicial, $fecha_final, $posgrado);
$smarty->assign('desglose', $desglose); 
$tipo = $_POST['posgrado'] > 0 ? 1 : 0;
$smarty->assign('tipo', $tipo);

echo json_encode([
    "selector"  =>"#contenedor-reportes",
    "html"      =>$smarty->fetch(DOC_ROOT.'/templates/lists/new/reporte-indicadores.tpl')
]); 
?>