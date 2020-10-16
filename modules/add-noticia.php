<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);



	if($_POST)
	{
			
		if($_POST['announcementId']<>null){
		
		
// echo '<pre>'; print_r($_POST);
// exit;	
		// echo 'llega';
			// exit;
			$announcement->setCourseModuleId($_POST["courseModuleId2"]);
			$announcement->setTitle($_POST["title"]);
			$announcement->setDescription($_POST["description"]);
			$announcement->Edit($_POST['announcementId']);
			header("Location:".WEB_ROOT."/edit-modules-course/id/".$_POST["courseModuleId2"]."");
			exit;
		}			
		
		$announcement->setCourseModuleId($_POST["courseModuleId"]);
		$announcement->setTitle($_POST["title"]);
		$announcement->setDescription($_POST["description"]);
		$announcement->Save();
		
		if($_POST["auxTpl"]=="admin"){
			header("Location:".WEB_ROOT."/edit-modules-course/id/".$_POST["courseModuleId"]."");
			exit;
		}
		
		
		
	}
	
	
	// echo '<pre>'; print_r($_GET);
	// exit;
	if($_GET['cId'])
	{
		$infos = $announcement->Info($_GET['cId']);
		$smarty->assign('infos', $infos);
		// $smarty->assign('id', $infos['courseModuleId']);
		// echo '<pre>'; print_r($infos);
		// exit;
	}
	

	$smarty->assign('id', $_GET["id"]);
	$date = date("d-m-Y");
	
	
	

?>