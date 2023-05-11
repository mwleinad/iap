<?php
    $permisos = [1];
    if(in_array($User['userId'], $permisos)){
        $listaConceptos = []; 
        $listaConceptos = $conceptos->listar();   
        $smarty->assign("conceptos", $listaConceptos); 
        $smarty->assign("opcion",$opcion);
        $smarty->assign("edicion",$edicion); 
    }
?>