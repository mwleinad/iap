<?php 	  
	$estudianteID = $_GET['id'];
	$student->setUserId($estudianteID);
	$calendar->setUserId($estudianteID);
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
                'name' => $item['subjectModuleName'],
                'score' => $item['score']
            ];
        }
    }  
 
	foreach ($cursos as $key => $curso) {
		if($curso['courseId'] == $primerCurso){
			unset($cursos[$key]);
			continue;
		}
		$course->setCourseId($curso['courseId']);
		$infoCourse = $course->Info(); 
		$calendar->setCourseId($curso['courseId']);
		$baja = $student->bajaCurso($curso['courseId']);
		$alta = $student->periodoAltaCurso($curso['courseId']);
		$calificacionMinima = $infoCourse['majorName'] == "MAESTRÍA" ? 7 : 8;
		$cursos[$key]['calificacionMinima'] = $calificacionMinima; 
		$cursos[$key]['status']	= 'inactivo';
		if($baja == ""){
			$baja = $infoCourse['totalPeriods']; 
			$cursos[$key]['status']	= 'activo';
		}

    	$distribution = $calendar->getCalendar();
		$cursos[$key]["tipoCuatri"] = $infoCourse['tipoCuatri'] == '' ? "Cuatrimestre" : $infoCourse['tipoCuatri'];
		$cursos[$key]["totalPeriods"] = $infoCourse['totalPeriods'];
		$cursos[$key]["distribucion"] = $distribution;  

		$qualifications = [];
		for ($period = $alta; $period <= $baja; $period++) { 
			$tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, true);  
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
					$qualifications[$period][] = [
						'subjectModuleId' => $item['subjectModuleId'],
						'name' => $item['name'],
						'addepUp' => $item['addepUp'],						
						'score' => $item['score'],
						'comments' => ''
					];
				}
				$total_modules++;
			}
		} 
		$cursos[$key]["calificaciones"] = $qualifications; 
	} 
	$smarty->assign("cuatrimestre", $position);
	$smarty->assign("cursos", $cursos);
	$smarty->display(DOC_ROOT.'/templates/boxes/new/estudiante-informacion-adicional.tpl'); 
?>