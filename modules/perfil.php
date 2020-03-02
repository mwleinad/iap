<?php
		
	$student->setUserId($_SESSION['User']["userId"]);
	$info = $student->GetInfo();
	
	if(file_exists(DOC_ROOT."/".$info['foto'])){
		$foto = DOC_ROOT."/".$info['foto'];
	}else{
		$foto = DOC_ROOT."/alumnos/no_foto.JPG";
	}

	
	$smarty->assign("rand", rand());
	$smarty->assign("info", $info);
	
	
?>