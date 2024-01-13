<?php
	
	$counReins = $student->confirmaReinscripcion($_GET['s'],$_GET['sId']);
	
	if($counReins >=1){
		$smarty->assign("courseId", $_GET['c']);
		$smarty->assign("sId", $_GET['sId']);
		 $smarty->assign('descargaAchivo','si');
		// exit;
	}
	$msjConfirma = "";
		
	if($_FILES)
	{
		$student->UpdateFoto();
		$msjConfirma = "si";
	}
				
	$smarty->assign('mnuMain','datos');	
				
				
				
	$prof = $profesion->Enumerate();
	$prof = $util->EncodeResult($prof);
	$smarty->assign('prof',$prof);
	
	$resCode = $code->Enumerate();
	$codes = $util->EncodeResult($resCode);
	$smarty->assign('codes',$codes);			
	
	$resSem = $semester->Enumerate();
	$semesters = $util->EncodeResult($resSem);
	$smarty->assign('semesters',$semesters);
				
	$resMajorList = $major->Enumerate();
	$majorList = $util->EncodeResult($resMajorList);
	$smarty->assign("majorList", $majorList);
	
	$resSchTypes = $schoolType->EnumerateAll();
	$schTypes = $util->EncodeResult($resSchTypes);
	$smarty->assign('schTypes',$schTypes);
	
	$smarty->assign("DOC_ROOT", DOC_ROOT);
	$student->setUserId($_SESSION['User']["userId"]);
	$result = $student->GetInfo();
	
	// echo "<pre>"; print_r($result);
	// exit;
	
	$info = $util->EncodeRow($result);
	
	$student->setCountry($info['pais']);
	$student->setState($info['estado']);
	
	$paises=$student->EnumeratePaises();
	$estados=$student->EnumerateEstados();	
	$ciudades=$student->EnumerateCiudades();
	
	$student->setCountry($info['paist']);
	$student->setState($info['estadot']);
	
	$paisest=$student->EnumeratePaises();
	$estadost=$student->EnumerateEstados();	
	$ciudadest=$student->EnumerateCiudades();
	
	$smarty->assign('paises',$paises);
	$smarty->assign('estados',$estados);
	$smarty->assign('ciudades',$ciudades);
	
	$smarty->assign('paisest',$paisest);
	$smarty->assign('estadost',$estadost);
	$smarty->assign('ciudadest',$ciudadest);
	
	$resGroup = $group->Enumerate();
	$groups = $util->EncodeResult($resGroup);
	$smarty->assign('groups',$groups);
	
	// echo "<pre>"; print_r($_GET);
	// exit;
	// echo $info["userId"];
	if(file_exists(DOC_ROOT."/alumnos/".$info["userId"].".jpg")){
		$exFoto = "si";
	}else{
		$exFoto = "no";
	}
	// exit;
	$bd = explode('-',$info['birthdate']);
	$info['dayBirthdate'] = $bd[0];
	$info['monthBirthdate'] = $bd[1];
	$info['yearBirthdate'] = $bd[2];
	$smarty->assign("rand", rand());
	$smarty->assign("exFoto", $exFoto);
	$smarty->assign("alumnoSer", "si");
	$smarty->assign("msjConfirma", $msjConfirma);
	$smarty->assign("info", $info);
	$smarty->assign("courseMId", $_GET['id']);
	$smarty->assign("subjectId", $_GET['s']);
	$smarty->assign("courseId", $_GET['c']);
	$smarty->assign("sId", $_GET['sId']);
	$smarty->assign("opcion", "reinscripcion");
?>