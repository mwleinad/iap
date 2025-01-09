<?php 
    $student->setUserId($_GET['id']); 
    $cursos = $student->preRegistros();
    $smarty->assign('cursos', $cursos); 
    $smarty->assign('id', $_GET['id']);
?>