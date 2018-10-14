<?php
	
	// $student->setUserId($_GET["id"]);
	$lstCalificador = $subject->extraeCalificador();
	
	// echo "<pre>"; print_r($lstCalificador );
	// exit;
	$smarty->assign('id', $_GET["id"]);
	$smarty->assign('lstCalificador', $lstCalificador);
	// exit;
?>