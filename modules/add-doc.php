<?php
		
	/* For Session Control - Don't remove this */
	// $user->allow_access(37);	


	$lstSol = $solicitud->arraySolicitudes();
	$registros = $solicitud->enumarateSolicitudesAdmin();
	$infoDoc = $solicitud->infoDoc();
	
		
	// echo "<pre>"; print_r($infoDoc);
	// exit;

	$smarty->assign('infoDoc', $infoDoc);
	$smarty->assign('auxTpl', $_GET['auxTpl']);
	$smarty->assign('id', $_GET['id']);
	$smarty->assign('registros', $registros);
	$smarty->assign('lstSol', $lstSol);
	

?>