<?php
$student->setUserId($_SESSION['User']["userId"]);
if($_POST)
{
    $student->saveAcceptedRegulation();
    header("Location:" . WEB_ROOT . "/reglamento");
	exit;
}

$accepted = $student->hasAcceptedRegulation();
$smarty->assign("accepted", $accepted);
$smarty->assign("nombre", $_SESSION['User']['nombreCompleto']);