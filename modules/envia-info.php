<?php
	
	$student->setUserId($_GET["id"]);
	$info = $student->GetInfo();
	$smarty->assign('info', $info);
?>