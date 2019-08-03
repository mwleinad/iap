<?php
//update last click
//print_r($_SESSION);

//actualiza la nueva actividad en la que inicia la nueva sesion
if($_SESSION["User"]["type"] == "student")
{
	$db->setQuery("UPDATE user SET lastActivity = '".time()."' WHERE userId = '".$_SESSION["User"]["studentId"]."'");
	$db->UpdateData();
}
else
{
	$db->setQuery("UPDATE personal SET lastActivity = '".time()."' WHERE personalId = '".$_SESSION["User"]["userId"]."'");
	$db->UpdateData();
}
$infoStudent = $student->InfoStudent();
$smarty->assign("infoStudent", $infoStudent);

if($_SESSION["User"]["type"] == "Docente"){
	$personal->setPersonalId($_SESSION['User']['userId']);
	$infoPj = $personal->Info();
	if(file_exists(DOC_ROOT."/".$infoPj['foto'])){
		$fotoPj = WEB_ROOT."/".$infoPj['foto'].'?'.rand();
	}else{
		$fotoPj = WEB_ROOT."/images/no_foto.jpg";
	}
	$smarty->assign('fotoPj', $fotoPj);
}

$info = $user->Info();
$smarty->assign("info", $info);

	if(in_array(2, $info["roles"]))
	{
		$smarty->assign('docente', 1);
	}
?>