<?php 	  
	$estudianteID = $_GET['id'];
	$student->setUserId($estudianteID);  
	$conceptos->setAlumno($estudianteID);
	/**
	 * Sección calificaciones
	 */
	// echo "<pre>";
	$total_modules = 0;
	$cursos = $student->StudentCourses(); 
	$primerCurso = $student->primerCurso(); //Obtiene el primer curso si es un temporal.
    $infoStudent = $student->GetInfo(); 
	$position = [
		1 => 'PRIMER',
		2 => 'SEGUNDO',
		3 => 'TERCER',
		4 => 'CUARTO'
	]; 

	$has_modules_repeat = $student->hasModulesRepeat();
    $qualifications_repeat = [];
    if ($has_modules_repeat) {
        $tmp = $student->StudentModulesRepeat(); 
        foreach ($tmp as $item) {
            $qualifications_repeat[$item['subjectModuleId']] = [
                'name' 			=> $item['subjectModuleName'],
                'score' 		=> $item['score'],
				'period'		=> $item['semesterId'],
				'courseId'		=> $item['courseId']
            ];
        }
    }
	// echo "<pre>"; 
	foreach ($cursos as $key => $curso) {
		if($curso['courseId'] == $primerCurso){ 
			unset($cursos[$key]);
			continue;
		}
		$matricula = $student->GetMatricula($curso['courseId']);
		$course->setCourseId($curso['courseId']);
		$nivelesValidos = $course->GetEnglishLevels();  //Obtenemos los niveles de inglés válidos(si tiene)
		$infoCourse = $course->Info();  
		$baja = $student->bajaCurso($curso['courseId']);
		$alta = $student->periodoAltaCurso($curso['courseId']);
		$alta = $alta > 0 ? $alta : 1;
		$calificacionMinima = $infoCourse['majorName'] == "MAESTRÍA" ? 7 : 8;
		$cursos[$key]['calificacionMinima'] = $calificacionMinima; 
		$cursos[$key]['status']	= 'inactivo';
		if($baja == ""){
			$baja = $infoCourse['totalPeriods']; 
			$cursos[$key]['status']	= 'activo';
		}
		$conceptos->setCourseId($curso['courseId']);
		$pagos = $conceptos->historial_pagos();
		$cursos[$key]['matricula'] = $matricula;
		$cursos[$key]["tipoCuatri"] = $infoCourse['tipoCuatri'] == '' ? "Cuatrimestre" : $infoCourse['tipoCuatri'];
		$cursos[$key]["totalPeriods"] = $infoCourse['totalPeriods'];
		$cursos[$key]["pagos"] = $pagos;  
		if($curso['situation'] == 'Recursador'){
			continue;
		}

		$qualifications = []; 
		for ($period = $alta; $period <= $baja; $period++) { 
			$tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, true);
			if(!$tmp){
				$qualifications[$period] = [];
			}else{
				foreach ($tmp as $item) {
					if (array_key_exists($item['subjectModuleId'], $qualifications_repeat)) { 
						$qualifications[$period][] = [
							'subjectModuleId' => $item['subjectModuleId'],
							'name' => $qualifications_repeat[$item['subjectModuleId']]['name'],
							'score' => $qualifications_repeat[$item['subjectModuleId']]['score'],
							'addepUp' => $qualifications_repeat[$item['subjectModuleId']]['addepUp'],
							'comments' => 'REC.'
						];
					} else {
						if($item['extra'] && in_array($period, $nivelesValidos[$estudianteID])){
							$item['score'] = 10;
						}
						$qualifications[$period][] = [
							'subjectModuleId' => $item['subjectModuleId'],
							'name' => $item['name'],
							'addepUp' => $item['addepUp'],						
							'score' => $item['score'],
							'comments' => ''
						];
					} 
				}
			}
		}  
		$cursos[$key]["calificaciones"] = $qualifications;  
	} 
	$recursamiento = [];
	foreach ($qualifications_repeat as $item) {
		$recursamiento[$item['courseId']]['calificaciones'][$item['period']][] = [
			'subjectModuleId' => $item['subjectModuleId'],
			'name' => $item['name'],
			'addepUp' => $item['addepUp'],						
			'score' => $item['score'],
			'comments' => ''
		]; 
	}
	// print_r($cursos);
	// print_r($recursamiento);
	// exit;
	$smarty->assign("cuatrimestre", $position);
	$smarty->assign("cursos", $cursos);
	$smarty->assign("recursamiento", $recursamiento);
	$smarty->assign("infoStudent", $infoStudent);
	$smarty->display(DOC_ROOT.'/templates/boxes/new/estudiante-informacion-adicional.tpl'); 
?>