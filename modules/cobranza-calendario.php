<?php
		
	/* For Session Control - Don't remove this */
	$user->allow_access(34);	
	/* End Session Control */
	//check if docente, 2 == docente
	
	
	// echo '<pre>'; print_r($_SESSION);
	// exit;

	if($_GET["borrar"])
	{
		$module->setCourseModuleId($_GET["borrar"]);
		$module->DeleteModuleFromCourse();
	}
	// poner esta parte en el lugar donde se este dando de alta y se requiera la visualizacion inmediata de los datos
	// ( por ejemplo en el codigo de los modulos de ajax despues de guardar y de eliminar )
	// -------------------------------------------------------------------------------------------------
	$arrPage = array();		// ---- arreglo donde guarda los resultados de la paginacion...para usarse en footer-pages-links.tpl
	$viewPage = 1;			// ---- por default se toma la primera pagina, por si aun no esta definidala en la variable GET
	$rowsPerPage = 500;		//<<--- se podria tomar este valor de una variable o constante global, o especificarla para un caso particular
	$pageVar = 'p';	// ---- el nombre de la variable en GET que trae la pagina a mostrar, en este caso se usa viewPage para pasar la pagina a visualizar
	if(isset($_GET["$pageVar"]))
		$viewPage = $_GET["$pageVar"];	//si ya esta definida la variable GET['viewPage'] tomar el valor de esta

	$coursesCount = $course->EnumerateCount();
	$lstMajor = $major->Enumerate();
	
	$course->setTotalPeriods(true);
	$result = $course->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/cobranza-calendario', $arrPage);
	  
	foreach($result as $key => $value)
	{
		$conceptos->setCourseId($value['courseId']);
		$tieneConceptos = $conceptos->conceptos_cursos_relacionados(); //checamos si el curso tiene conceptos de pago  
		if(count($tieneConceptos) == 0)
		{
			unset($result[$key]);
		}
	}
	
	if($_SESSION['msj']=='si'){
		unset($_SESSION['msj']);
		$smarty->assign('msj', 'si');
	}
	
	
	$smarty->assign('perfil', $_SESSION['User']['perfil']);
	$smarty->assign('lstMajor', $lstMajor);
	$smarty->assign('subjects', $result);
	$smarty->assign('arrPage', $arrPage);
	$smarty->assign('coursesCount', $coursesCount); 
	$smarty->assign('mnuMain', 'cobranza');
	$smarty->assign('mnuSubmain', 'calendario');
?>