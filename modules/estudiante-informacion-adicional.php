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
	$primerCurso = $student->primerCurso();
    $infoStudent = $student->GetInfo();
    // print_r($infoStudent);
	// print_r($primerCurso);
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
		// print_r($tmp);
        foreach ($tmp as $item) {
            $qualifications_repeat[$item['subjectModuleId']] = [
                'name' => $item['subjectModuleName'],
                'score' => $item['score']
            ];
        }
    } 

	// unset($cursos[0]);
	foreach ($cursos as $key => $curso) {
		if($curso['courseId'] == $primerCurso){
			unset($cursos[$key]);
			continue;
		}
		$course->setCourseId($curso['courseId']);
		$infoCourse = $course->Info();
		// print_r($infoCourse);
		$calendar->setCourseId($curso['courseId']);
		$baja = $student->bajaCurso($curso['courseId']);
		$alta = $student->periodoAltaCurso($curso['courseId']);
		$cursos[$key]['status']	= 'inactivo';
		if($baja == ""){
			$baja = $infoCourse['totalPeriods']; 
			$cursos[$key]['status']	= 'activo';
		}

    	$distribution = $calendar->getCalendar();
		$cursos[$key]["tipoCuatri"] = $infoCourse['tipoCuatri'] == '' ? "Cuatrimestre" : $infoCourse['tipoCuatri'];
		$cursos[$key]["totalPeriods"] = $infoCourse['totalPeriods'];
		$cursos[$key]["distribucion"] = $distribution; 
		 
		$period_course = [];
		$group_history = $student->GroupHistory($infoCourse['subjectId']);
		// print_r($group_history);
		$has_history = count($group_history) > 1 ? true : false;
		if ($has_history) {
			foreach ($group_history as $item) {
				if ($item['type'] == 'baja') {
					for ($i = 1; $i <= $item['semesterId']; $i++)
						$period_course[$i] = $item['courseId'];
				}
				if ($item['type'] == 'alta') {
					for ($i = $item['semesterId']; $i <= $infoCourse['totalPeriods']; $i++)
						$period_course[$i] = $item['courseId'];
				}
			}
		}
		// echo "Periodos <br>";
		// print_r($period_course);
		 
		$qualifications = [];
		for ($period = $alta; $period <= $baja; $period++) {
			if ($has_history)
				$tmp = $student->BoletaCalificacion($period_course[$period], $period, true); 
			else
				$tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, true);

			// print_r($tmp);
			foreach ($tmp as $item) {
				if (array_key_exists($item['subjectModuleId'], $qualifications_repeat)) { 
					$qualifications[$period][] = [
						'subjectModuleId' => $item['subjectModuleId'],
						'name' => $qualifications_repeat[$item['subjectModuleId']]['name'],
						'score' => $qualifications_repeat[$item['subjectModuleId']]['score'],
						'comments' => 'REC.'
					];
				} else {
					$qualifications[$period][] = [
						'subjectModuleId' => $item['subjectModuleId'],
						'name' => $item['name'],
						'score' => $item['score'],
						'comments' => ''
					];
				}
				$total_modules++;
			}
		} 
		$cursos[$key]["calificaciones"] = $qualifications;
		// print_r($qualifications);
	}
	// print_r($cursos);
	$smarty->assign("cuatrimestre", $position);
	$smarty->assign("cursos", $cursos);
	$smarty->display(DOC_ROOT.'/templates/boxes/new/estudiante-informacion-adicional.tpl'); 
?>