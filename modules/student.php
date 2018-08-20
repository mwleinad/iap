<?php
	
	/* For Session Control - Don't remove this */
	$user->allow_access(4);	
	/* End Session Control */
	// echo "<pre>"; print_r($_FILES);
	// exit;
	if($_FILES)
	{
		$student->UpdateFoto();
	}
	
	
	if($_POST['accion'] == 'export'){
		
			
		        //if($modality==0)
				header('Location: '.WEB_ROOT.'/reportes/alumnos.php');
		exit;
			
	}
	
	
	$arrPage = array();		
	$viewPage = 1;			
	$rowsPerPage = 3000;
	
	$pageVar = 'p';	
	
	if(isset($_GET["$pageVar"]))
		$viewPage = $_GET["$pageVar"];	
	
	$studentsCount = $student->EnumerateCount();
	
	if($studentsCount){
		
		$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
		$smarty->assign('students', $students);	
		$smarty->assign('arrPage', $arrPage);
		
		$resSem = $semester->Enumerate();
		$semesters = $util->EncodeResult($resSem);
		$smarty->assign('semesters',$semesters);
		
		$_SESSION['stdSearch'] = '';
		unset($_SESSION['stdSearch']);
			
	}//if	
	
	$smarty->assign("studentsCount", $studentsCount);	
	$smarty->assign("students", $students);	
	$smarty->assign('mnuMain','catalogos');
	$smarty->assign('mnuSubmain','alumnos');	
	
?>