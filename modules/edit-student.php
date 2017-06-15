<?php
		
		
// echo "<pre>"; print_r($_FILES);	
// exit;
if($_FILES)
	{
		$student->UpdateFoto();
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
	$student->setUserId($_GET["id"]);
	$result = $student->GetInfo();
	$info = $util->EncodeRow($result);
	
	            $student->setCountry($info['pais']);
				$student->setState($info['estado']);
		        
				$paises=$student->EnumeratePaises();	
		        $smarty->assign('paises',$paises);
				
				$estados=$student->EnumerateEstados();	
		        $smarty->assign('estados',$estados);
				
				$ciudades=$student->EnumerateCiudades();	
		        $smarty->assign('ciudades',$ciudades);
	
	$resGroup = $group->Enumerate();
	$groups = $util->EncodeResult($resGroup);
	$smarty->assign('groups',$groups);
	
	$bd = explode('-',$info['birthdate']);
	$info['dayBirthdate'] = $bd[0];
	$info['monthBirthdate'] = $bd[1];
	$info['yearBirthdate'] = $bd[2];
	$smarty->assign("info", $info);

?>