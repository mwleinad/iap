<?php
	
	$student->setUserId($_GET);
	// echo "<pre>"; print_r($_GET);
	// exit;
	$lstCalificador = $subject->extraeCalificador($_GET["cId"]);
	
	// echo "<pre>"; print_r($lstCalificador );
	// exit;
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('lstCalificador', $lstCalificador);
	// exit;
?>