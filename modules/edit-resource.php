<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(37);	

	if($_POST)
	{
		$resource->setResourceId($_GET["id"]);
		$resource->setName($_POST["name"]);
		$resource->setDescription($_POST["description"]);
		$resource->Edit();
	}

$smarty->assign('id', $_GET["id"]);

	$resource->setResourceId($_GET["id"]);
	$resource = $resource->Info();
	$smarty->assign('resource', $resource);
	
?>