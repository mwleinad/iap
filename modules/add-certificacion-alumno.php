<?php
	
	// $registros = $student->enumerateCertificaciones($_GET["id"]);
	$lstCertificaciones = $subject->Enumerate();
echo "<pre>"; print_r($lstCertificaciones);
	exit;

	$smarty->assign('lstCertificaciones', $lstCertificaciones);

?>