<?php
	if($_GET['cId']=='admin')
		$userId = $_GET['id'];
	else
		$userId = $_SESSION['User']['userId'];
	
	$student->setUserId($userId);
	$registros = $student->enumerateCatProductos();
	
	$smarty->assign("cId", $_GET['cId']);	
	$smarty->assign("userId", $userId);	
	$smarty->assign("registros", $registros);
?>