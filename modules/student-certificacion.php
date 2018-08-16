<?php
	
	$registros = $student->CertificacionStident($_GET["id"]);
	
// echo "<pre>"; print_r($regsitros);
	// exit;

	$smarty->assign('registros', $registros);

?>