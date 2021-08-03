<?php

	if($_GET['id'] == 'test')
	{
		if($User['isLogged']){
			header('Location: '.WEB_ROOT);
			exit;
		}
	}
	else
		header('Location: ' . WEB_ROOT . '/mantenimiento');
?>