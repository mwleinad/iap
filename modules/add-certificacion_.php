<?php
	
	$registros = $student->CertificacionStident($_GET["id"]);
	
// echo "<pre>"; print_r($_GET);
	// exit;

	$smarty->assign('registros', $registros);

?>