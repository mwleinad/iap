<?php
	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');
	
	session_start();

	
	
	// echo "<pre>"; print_r($_POST);
	// exit;
	switch($_POST["type"])
	{
		case 'recupera':
				
				$student->setPermiso(0);
				$student->setEmail($_POST['email']);
				
				if(!$student->enviarMail())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				}else{
				    echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				}
			
		    	break;

	
	}

?>
