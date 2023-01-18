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
	$has_modules_repeat = $student->hasModulesRepeat(); 
    $infoStudent = $student->GetInfo();
    // print_r($infoStudent);
	// print_r($cursos);
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
		$course->setCourseId($curso['courseId']);
		$infoCourse = $course->Info();
		$calendar->setCourseId($curso['courseId']);
    	$distribution = $calendar->getCalendar();
		$cursos[$key]["tipoCuatri"] = $infoCourse['tipoCuatri'] == '' ? "Cuatrimestre" : $infoCourse['tipoCuatri'];
		$cursos[$key]["totalPeriods"] = $infoCourse['totalPeriods'];
		$cursos[$key]["distribucion"] = $distribution;
		// print_r($infoCourse);
		if ($infoCourse['modality'] == 'Online') {
			$modality = 'NO ESCOLAR';
			$rvoe = $infoCourse['rvoeLinea'];
			$fechaRvoe = $infoCourse['fechaRvoeLinea'];
		}
		if ($infoCourse['modality'] == 'Local') {
			$modality = 'ESCOLAR';
			$rvoe = $infoCourse['rvoe'];
			$fechaRvoe = $infoCourse['fechaRvoe'];
		}

		$period_course = [];
		$group_history = $student->GroupHistory($infoCourse['subjectId']);
		// print_r($group_history);
		$has_history = count($group_history) > 0 ? true : false;
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
		for ($period = 1; $period <= $infoCourse['totalPeriods']; $period++) {
			if ($has_history)
				$tmp = $student->BoletaCalificacion($period_course[$period], $period, false); 
			else
				$tmp = $student->BoletaCalificacion($infoCourse['courseId'], $period, false);

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