<?php
// echo 'lled';
// echo '<pre>'; print_r($_GET);
// echo '<pre>'; print_r($_POST);
// exit;
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();

switch($_POST["type"])
{
    case "Student":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroup();
        $smarty->assign("courseId",$_POST['id']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
		 $smarty->assign("tipo",$_POST['tipo']);
		 $smarty->assign("tip",$_POST['tip']);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-student.tpl');

        break;
		
	
	case "VerSolicitud":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroup();
        $smarty->assign("courseId",$_POST['id']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
		 $smarty->assign("tip",$_POST['tip']);
        $smarty->display(DOC_ROOT.'/templates/actas.tpl');

       break;

    case "StudentAdmin":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroup();
        $smarty->assign("courseId",$_POST['id']);
        $smarty->assign("tip",$_POST['tip']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-studentadmin.tpl');

        break;

    case "calificaciones":

        $module->setCourseModuleId($_POST['id']);
        $infoModule=$module->InfoCourseModule();
        $courseId=$infoModule['courseId'];
        //	print_r($infoModule);
        $activity->setCourseModuleId($_POST['id']);
        $activityInfoTask=$activity->Enumerate("Tarea");
        $userId=$_SESSION['User']['userId'];

        $activity->setUserId($userId);
        //$ponderation=$activity->Score();

        foreach($activityInfoTask as $key => $fila){
            $activity->setCourseModuleId($_POST['id']);
            $activity->setActivityId($fila['activityId']);
            $activityInfoTask[$key]['calificacion']=$activity->Score();
            $activityInfoTask[$key]['retroTotal']=$activity->Retro();

        }
        //print_r($activityInfoTask);exit;

        //print_r($fila['activityId']);

        //print_r($infoModule);
        //$students=$group->DefaultGroup();
        //print_r($_POST);
        //$smarty->assign("DOC_ROOT", DOC_ROOT);
        $tipo=1;
        $smarty->assign("tipo", $tipo);
        $smarty->assign("tareas", $activityInfoTask);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-ponderation-student.tpl');

        break;

    case "calificacionesExa":
        $tipo=2;
        $module->setCourseModuleId($_POST['id']);
        $infoModule=$module->InfoCourseModule();
        $courseId=$infoModule['courseId'];
        //	print_r($infoModule);
        $activity->setCourseModuleId($_POST['id']);
        $activityInfoTask=$activity->Enumerate("Examen");
        $userId=$_SESSION['User']['userId'];

        $activity->setUserId($userId);
        //$ponderation=$activity->Score();

        foreach($activityInfoTask as $key => $fila){
            $activity->setCourseModuleId($_POST['id']);
            $activity->setActivityId($fila['activityId']);
            $activityInfoTask[$key]['calificacion']=$activity->Score();
            $activityInfoTask[$key]['retroTotal']=$activity->Retro();

        }
        //print_r($activityInfoTask);exit;

        //print_r($fila['activityId']);

        //print_r($infoModule);
        //$students=$group->DefaultGroup();
        //print_r($_POST);
        //$smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("tipo", $tipo);
        $smarty->assign("tareas", $activityInfoTask);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-ponderation-student.tpl');

        break;

    case "deleteStudentCurricula":

		$course->setCourseId($_POST['courseId']);
		$courseInfo = $course->Info();
        $student->setUserId($_POST['userId']);
        $student->setCourseId($_POST['courseId']);
		$student->setSubjectId($courseInfo['subjectId']);

        if(!$student->DeleteStudentCurricula($_POST['period'], $_POST['situation']))
        {
            echo "fail[#]";
            //$util->setError(10028, "error","Ocurrio un error al eliminar a este alumno");
            //$util->PrintErrors();
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');

        }else{
            echo "ok[#]";
            $util->setError(10028, "complete","Alumno eliminado con exito de esta curricula.");
            $util->PrintErrors();
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');

        }
		break;

    case "enableStudentCurricula":
		$course->setCourseId($_POST['courseId']);
		$courseInfo = $course->Info();
        $student->setUserId($_POST['userId']);
        $student->setCourseId($_POST['courseId']);
		$student->setSubjectId($courseInfo['subjectId']);

        if(!$student->EnableStudentCurricula())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
		else
		{
            echo "ok[#]";
            $util->setError(10028, "complete", "Alumno activado con exito.");
            $util->PrintErrors();
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
		break;



    case "StudentInactivo":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroupInactivo();
		 $smarty->assign("tip",$_POST['tip']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-student.tpl');

        break;

    case "StudentInactivoAdmin":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroupInactivo();
		$smarty->assign("tip", $_POST['tip']);
		$smarty->assign("courseId", $_POST['id']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-studentadmin.tpl');

      break;

	case 'saveNumReferencia';
	
		// echo '<pre>'; print_r($_POST);
		// exit;
		 if ($group->saveNumReferencia()){
			 echo 'ok[#]';
			 echo '<div class="alert alert-info alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			 Los datos se guardaron correctamente
			</div>';
			echo $_SESSION['msj']='si';
		 }else{
			 echo 'fail[#]';
		 }
		
	break;
	
	
	case 'saveMatricula';
	
		// echo '<pre>'; print_r($_POST);
		// exit;
		 if ($group->saveMatricula()){
			 echo 'ok[#]';
			 echo '<div class="alert alert-info alert-dismissable">
			  <button type="button" class="close" data-dismiss="alert">&times;</button>
			 Los datos se guardaron correctamente
			</div>';
			$_SESSION['msj']='si';
		 }else{
			 echo 'fail[#]';
		 }
		
	break;
	
	case 'descargarConstancias':
	
	
		
		$infoStudent = $student->InfoEstudiate($_POST["Id"]);
		$infoTypeSol = $solicitud->infoSolicitud($_POST["tipodocId"]);
		
		
		// echo '<pre>'; print_r($infoTypeSol);
		// exit;
		

		$student->setUserId($_POST["Id"]);
		$activeCourses = $student->StudentCourses("activo", "si");
		$finishedCourses = $student->StudentCourses("finalizado");
		
		
		$smarty->assign("finishedCourses", $finishedCourses);	
		$smarty->assign("solicitudId", $_POST['tipodocId']);	
		$smarty->assign("userId", $_POST['Id']);	
		

		$smarty->assign("infoTypeSol", $infoTypeSol);
		$smarty->assign("infoStudent", $infoStudent);
		$smarty->assign("activeCourses", $activeCourses);
		$smarty->display(DOC_ROOT.'/templates/new/view-curricula-admin.tpl');

		
	
	break;
	
	case 'onBuscar':
	
		// echo '<pre>'; print_r($_POST);
		$arrPage = array();		// ---- arreglo donde guarda los resultados de la paginacion...para usarse en footer-pages-links.tpl
		$viewPage = 1;			// ---- por default se toma la primera pagina, por si aun no esta definidala en la variable GET
		$rowsPerPage = 500;		//<<--- se podria tomar este valor de una variable o constante global, o especificarla para un caso particular
		$pageVar = 'p';	// ---- el nombre de la variable en GET que trae la pagina a mostrar, en este caso se usa viewPage para pasar la pagina a visualizar
		if(isset($_GET["$pageVar"]))
			$viewPage = $_GET["$pageVar"];	//si ya esta definida la variable GET['viewPage'] tomar el valor de esta

		$coursesCount = $course->EnumerateCount();
		$lstMajor = $major->Enumerate();
		
		$course->setActivo($_POST['activo']);
		$course->setModalidad($_POST['modalidad']);
		$course->setCurricula($_POST['curricula']);
		$result = $course->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/history-subject', $arrPage);
		$uniqueSubjects = $course->EnumerateSubjectByPage();
		$smarty->assign('subjects', $result);
		$smarty->assign('uniqueSubjects', $uniqueSubjects);
		$smarty->display(DOC_ROOT.'/templates/lists/new/courses.tpl');
	
	break;
	
	case 'addSaveSolicitud':

		
		// echo '<pre>'; print_r($_POST);
				$activa = 0;
				$inactiva = 0;
				foreach($_POST as $key=>$aux){
					$g = explode('_',$key);
					if($g[0]=='activa'){
						if($aux=='on'){
							$valoractiva = $g[1];
							$activa++;
						}
					}
					if($g[0]=='finalizada'){
						if($aux=='on'){
							$valorinactiva = $g[1];
							$inactiva++;
						}
					}
				}
				if(($activa+ $inactiva) <= 0){
						echo 'fail[#]';
						echo '<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						Debe seleccionar al menos una curricula
						</div>';
					exit;
				}
				
				if(($activa+ $inactiva) > 1){
						echo 'fail[#]';
						echo '<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						Solo puede seleccionar una curricula
						</div>';
					exit;
				}
				
				// echo $valoractiva.'___'; 
				// echo $valorinactiva; 
				// echo '<pre>'; print_r($_POST);
				// exit;
				if($valoractiva<>''){
					$cursoId = $valoractiva;
				}
				
				if($valorinactiva<>''){
					$cursoId = $valorinactiva;
				}
				
				// echo $cursoId;
				// exit;
				
				$solicitud->setTipo($_POST['solicitudId']);
				$solicitud->setCursoId($cursoId);
				// $solicitud->setPrecio($precio);
				if ($Id = $solicitud->SaveSolicitudAdmin($_POST['userId'])){
					echo 'ok[#]';
					echo $Id;
					echo '[#]';
					echo $_POST['userId'];
					// echo '<div class="alert alert-info alert-dismissable">
					  // <button type="button" class="close" data-dismiss="alert">&times;</button>
					  // La solicitud se genero correctamente
					// </div>';
					// echo '[#]';
					// $lstSol = $solicitud->arraySolicitudes();
						// $registros = $solicitud->enumarateSolicitudesStden();
						// $smarty->assign('registros', $registros);
					// $smarty->assign("lstSol", $lstSol);
					// $smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
				}else{
					echo 'fail[#]';
				}
	
	break;

	case 'editPeriodos':
		
			
	$course->setCourseId($_POST["id"]);
	
	$date = date("d-m-Y");
	$addedModules = $course->AddedCourseModules();
	
	
	// echo '<pre>'; print_r($addedModules);
	// exit;
	
	//checar a que curriculas tengo permiso
	if(is_array($info))
	{
		if(in_array(2, $info["roles"]))
		{
			$smarty->assign('docente', 1);
			$permisosDocente = $user->PermisosDocente();
			
			foreach($addedModules as $key => $value)
			{
				if(!in_array($value["courseModuleId"], $permisosDocente["courseModule"]))
				{
					unset($addedModules[$key]);
				}
			}
		}
	}
	//
	
	$smarty->assign('date', $date);
	$smarty->assign('invoiceId', $_GET["id"]);
	$smarty->assign('subjects', $addedModules);
		 $smarty->display(DOC_ROOT.'/templates/new/view-periodos.tpl');
	
	break;
	
	
	case 'savePeriodos':
	
		// echo '<pre>'; print_r($_POST);
		 if($course->savePeriodos()){
            // echo "ok[#]";
            // $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
			echo 'fail[#]';
        }

	
	break;


	case 'onBuscarCalendario':
		$arrPage = array();		// ---- arreglo donde guarda los resultados de la paginacion...para usarse en footer-pages-links.tpl
		$viewPage = 1;			// ---- por default se toma la primera pagina, por si aun no esta definidala en la variable GET
		$rowsPerPage = 500;		//<<--- se podria tomar este valor de una variable o constante global, o especificarla para un caso particular
		$pageVar = 'p';	// ---- el nombre de la variable en GET que trae la pagina a mostrar, en este caso se usa viewPage para pasar la pagina a visualizar
		if(isset($_GET["$pageVar"]))
			$viewPage = $_GET["$pageVar"];	//si ya esta definida la variable GET['viewPage'] tomar el valor de esta

		$coursesCount = $course->EnumerateCount();
		$lstMajor = $major->Enumerate();
		
		$course->setActivo($_POST['activo']);
		$course->setModalidad($_POST['modalidad']);
		$course->setCurricula($_POST['curricula']);
		$result = $course->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/cobranza-calendario', $arrPage);
		$smarty->assign('subjects', $result);
		$smarty->display(DOC_ROOT.'/templates/lists/new/calendar-courses.tpl');
	break;

	case 'additional':
		$courseId = intval($_POST['course']);
		$semesterId = intval($_POST['cuatri']);
		$modules = $course->AddedCourseModulesCuatri($courseId, $semesterId);
		$arrayDate = explode('-', $modules[0]['initialDate']);
		$year = intval($arrayDate[0]);
		$c1 = strval($year - 1) . " - " . $year;
		$c2 = $year . " - " . strval($year + 1);
		$ciclos = [$c1, $c2];
		$course->setCourseId($courseId);
		$infoCourse = $course->Info();
		$periodos = ['Enero - Abril', 'Mayo - Agosto', 'Septiembre - Diciembre'];
		if($infoCourse['tipoCuatri'] == 'Semestre')
			$periodos = ['Febrero - Julio', 'Agosto - Enero'];
		$smarty->assign('ciclos', $ciclos);
		$smarty->assign('periodos', $periodos);
		$smarty->assign('year', $year);
		$smarty->display(DOC_ROOT.'/templates/boxes/new/qualifications-course.tpl');
		break;

	case 'announcement':
		$_SESSION['User']['announcement'] = true;
		echo 'Aviso OK';
		break;
}

?>
