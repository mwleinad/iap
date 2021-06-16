<?php

include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();

switch($_POST["type"])
{
	case 'deleteNot':
		$forum->setNotificacionId($_POST['id']);	
		if(!$forum->DeleteNotificacion())
		{
			echo "fail[#]";
			$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
		}
		else
		{
			echo "ok[#]";
			$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
			
			echo "[#]";
			$notificaciones=$forum->EnumerateNotificacion();
			$smarty->assign('notificaciones', $notificaciones);
			$smarty->display(DOC_ROOT.'/templates/lists/notificacionesadmin.tpl');
		}			
		break;

	case 'deleteNotificacion':
		$forum->setNotificacionId($_POST['id']);
		if($forum->DeleteNotificacion())
			echo "ok[#]";
		else
			echo "fail[#]";
		break;
}
?>
