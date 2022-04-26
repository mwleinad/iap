<?php
	$student->setUserId($_SESSION['User']['userId']);
	$registros = $student->enumerateCatProductos();
	
	$smarty->assign("catId", $_GET['id']);	
	$smarty->assign("userId", $_SESSION['User']['userId']);	
	$smarty->assign("registros", $registros);
?>