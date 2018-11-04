<?php
	
	/* For Session Control - Don't remove this */
	// $user->allow_access(4);	
	/* End Session Control */


	$registros = $subject->enumerateLog();
	
	

	$smarty->assign("registros", $registros);	

	
?>