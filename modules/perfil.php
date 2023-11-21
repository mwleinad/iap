<?php
		
	$student->setUserId($_SESSION['User']["userId"]);
	$info = $student->GetInfo();
	$smarty->assign("rand", rand());
	$smarty->assign("info", $info);
	$smarty->assign("mJodit", "active");
?>