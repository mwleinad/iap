<?php
	
	$registros = $student->CertificacionStident($_GET["id"]);
	
	// echo "<pre>"; print_r($_GET);
	// exit;

	$smarty->assign('cId', $_GET["cId"] );
	$smarty->assign('id', $_GET["id"] );
	$smarty->assign('auxTpl', $_GET["auxTpl"] );

	$smarty->assign('registros', $registros);

?>