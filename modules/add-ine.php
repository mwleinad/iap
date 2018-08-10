<?php
		
		// echo '<pre>'; print_r($_GET);
	// exit;	
	/* For Session Control - Don't remove this */
	// $user->allow_access(37);	
	/* End Session Control */
	
	$student->setUserId($_SESSION["User"]["userId"]);
	$info = $student->GetInfo();
	
	// echo '<pre>'; print_r($info);
	// exit;
// exit;
	$smarty->assign("userId",$_SESSION["User"]["userId"]);	
	$smarty->assign('id', $_GET['id']);
	$smarty->assign('personalId', $_GET['personalId']);
	$smarty->assign('info', $info);
	
?>