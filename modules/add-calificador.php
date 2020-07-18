<?php
	
	$student->setUserId($_GET);
	// echo "<pre>"; print_r($_GET);
	// exit;
	// $lstCalificador = $subject->extraeCalificador($_GET["cId"],$_GET["id"]);

		$registros = $student->CertificacionStident2($_GET["id"]);
	
	// echo "<pre>"; print_r($lstCalificador );
	// exit;
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('registros', $registros);
	$smarty->assign('lstCalificador', $lstCalificador);
	// exit;
?>