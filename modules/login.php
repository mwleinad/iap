<?php
	if($User['isLogged']){
		header('Location: '.WEB_ROOT);
		exit;
	}
?>