<?php

/* For Session Control - Don't remove this */
$user->allow_access(37);

if ($_POST) {
	$resource->setResourceId($_GET["id"]);
	$resource->setName($_POST["name"]);
	$resource->setDescription($_POST["description"]);
	$resource->setSemana($_POST['semana']);
	$resource->Edit();

	if ($_POST["auxTpl"] == "admin") {

		header("Location:" . WEB_ROOT . "/edit-modules-course/id/" . $_POST["cId"] . "");
		exit;
	}
}

$smarty->assign('id', $_GET["id"]);

$resource->setResourceId($_GET["id"]);
$resource = $resource->Info();
$smarty->assign('resource', $resource);
