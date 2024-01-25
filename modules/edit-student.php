<?php


// echo "<pre>"; print_r($_FILES);	
// exit;
if ($_FILES) {
	$student->UpdateFoto();
}

$smarty->assign('mnuMain', 'datos'); 
$prof = $profesion->Enumerate();
$prof = $util->EncodeResult($prof);
$smarty->assign('prof', $prof);

$resCode = $code->Enumerate();
$codes = $util->EncodeResult($resCode);
$smarty->assign('codes', $codes);

$resSem = $semester->Enumerate();
$semesters = $util->EncodeResult($resSem);
$smarty->assign('semesters', $semesters);

$resMajorList = $major->Enumerate();
$majorList = $util->EncodeResult($resMajorList);
$smarty->assign("majorList", $majorList);

$resSchTypes = $schoolType->EnumerateAll();
$schTypes = $util->EncodeResult($resSchTypes);
$smarty->assign('schTypes', $schTypes);

$smarty->assign("DOC_ROOT", DOC_ROOT);
$student->setUserId($_GET["id"]);
$result = $student->GetInfo();
$info = $util->EncodeRow($result);

//datos domiciio
$student->setCountry($info['pais']);
$student->setState($info['estado']);
$paises = $student->EnumeratePaises();
$estados = $student->EnumerateEstados();
$ciudades = $student->EnumerateCiudades();

$smarty->assign('paises', $paises);
$smarty->assign('estados', $estados);
$smarty->assign('ciudades', $ciudades);

//datos trabajo
$student->setCountry($info['paist']);
$student->setState($info['estadot']);
$paisest = $student->EnumeratePaises();
$estadost = $student->EnumerateEstados();
$ciudadest = $student->EnumerateCiudades();

// echo "<pre>"; print_r($paisest);		
// exit;	
$smarty->assign('paisest', $paisest);
$smarty->assign('estadost', $estadost);
$smarty->assign('ciudadest', $ciudadest);


$resGroup = $group->Enumerate();
$groups = $util->EncodeResult($resGroup);
$smarty->assign('groups', $groups);

$bd = explode('-', $info['birthdate']);
$info['dayBirthdate'] = $bd[0];
$info['monthBirthdate'] = $bd[1];
$info['yearBirthdate'] = $bd[2];
$smarty->assign("info", $info);
$smarty->assign("opcion", "actualizacion");
$smarty->assign("auxAdmin", true);
