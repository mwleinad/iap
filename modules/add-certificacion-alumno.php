<?php
	
	// $registros = $student->enumerateCertificaciones($_GET["id"]);
	$lstCertificaciones = $subject->EnumerateCertificacion();
// echo "<pre>"; print_r($lstCertificaciones);
	// exit;
	// echo "<pre>";print_r($_GET);
	// exit;

	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('lstCertificaciones', $lstCertificaciones);

?>