<?php 
$lstPosgrados = $group->posgrados("major.name IN('MAESTRIA', 'DOCTORADO')");  
$smarty->assign("posgrados", $lstPosgrados);

$lstConceptos = $conceptos->listar("AND cobros <> 0"); 
$smarty->assign("conceptos", $lstConceptos);
?>