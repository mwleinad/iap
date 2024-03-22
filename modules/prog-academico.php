<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(8);	
	/* End Session Control */
	//check if docente, 2 == docente
	
	$course->setAparece('si');
	$result = $course->EnumerateCourse();

	// $result = $util->orderMultiDimensionalArray($result,'active',true);
	
	//checar a que curriculas tengo permiso
	if(in_array(2, $info["roles"]))
	{
		$smarty->assign('docente', 1);
		$permisosDocente = $user->PermisosDocente();
		
		foreach($result as $key => $value)
		{
			if(!in_array($value["courseId"], $permisosDocente["course"]))
			{
				unset($result[$key]);
			}
		}
	}
	
	// echo '<pre>'; print_r($result);
	// exit;
	$smarty->assign('subjects', $result);
	$smarty->assign('arrPage', $arrPage);
	$smarty->assign('coursesCount', $coursesCount);
	// -------------------------------------------------------------------------------------------------
	
	$smarty->assign('mnuMain','cursos');
	$smarty->assign('mnuSubmain','historial');
?>