<?php	
	$user->allow_access();
	
	$notificaciones=$notificacion->Enumerate();
	$smarty->assign('notificaciones', $notificaciones);
?>