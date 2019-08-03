<?php
		
	$student->setUserId($_SESSION['User']["userId"]);
	$info = $student->GetInfo();
	
	if(file_exists(DOC_ROOT."/".$info['foto'])){
		$foto = DOC_ROOT."/".$info['foto'];
	}else{
		$foto = DOC_ROOT."/images/no_foto.jpg";
	}

	
	$smarty->assign("rand", rand());
	$smarty->assign("info", $info);
	
	
?>