<?php

	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');
	
	session_start();
	
	switch($_POST["type"])
	{
		case 'enviar':
				$activity->setActivityId($_POST['activityId']);	
				$info = $activity->Info();
						
				$activity->Delete();
				echo "ok[#]";
				$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				echo "[#]";
				
				$activity->setCourseModuleId($info['courseModuleId']);	
				$actividades = $activity->Enumerate();
				$smarty->assign('actividades', $actividades);
				
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/activities.tpl');
					
				break;

	
	}

?>
