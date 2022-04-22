<?php
	if($_GET['id'])
		$Info = $student->infoDocumento($_GET['id']);
	
	$smarty->assign("catId", $_GET['id']);	
	$smarty->assign("userId", $_SESSION['User']['userId']);	
	$smarty->assign("Info", $Info);
?>