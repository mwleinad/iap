<?php
	
	// echo "<pre>"; print_r($_SESSION);
	// exit;
	if($_SESSION["User"]["type"]=="student"){
		
		exit;
	}
	
	
	// $students = $student->enumerateOk();
	$registros = $personal->gruposEvalaudor();
	
		// echo "<pre>"; print_r($registros);
		// exit;
		
	$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
	$smarty->assign("registros", $registros);	
	$smarty->assign('mnuSubmain','alumnos');	
	
?>