<?php
	
	// $registros = $student->enumerateCertificaciones($_GET["id"]);
	$lstCertificaciones = $subject->EnumerateCertificacion();
	$registros = $student->CertificacionStident($_GET["id"]);
// echo "<pre>"; print_r($registros);
	// exit;
	// echo "<pre>";print_r($_GET);
	// exit;

	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('registros', $registros);
	$smarty->assign('lstCertificaciones', $lstCertificaciones);

?>