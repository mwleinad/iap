<?php
$alumnos = $payments->alumnos_con_pagos();
$cursos = $payments->curricula_con_pagos();
$smarty->assign('alumnos', $alumnos);
$smarty->assign('cursos', $cursos);
?>