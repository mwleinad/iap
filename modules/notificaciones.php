<?php	
	$user->allow_access();
    $i = 1;
    $smarty->assign('i', $i);
	// ANUNCIOS
	$announcements = $announcement->Enumerate(0, 0);
	$smarty->assign('announcements', $announcements);
    // NOTIFICACIONES
	$notificaciones=$notificacion->Enumerate();
	$smarty->assign('notificaciones', $notificaciones);
?>