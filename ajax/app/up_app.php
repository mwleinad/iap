<?php
header('Access-Control-Allow-Origin: *'); 
// echo "<pre>"; print_r($_POST);
// echo "<pre>"; print_r($_FILES);
// file_put_contents('logs.txt', print_r($_FILES));
// $_FILES["fileToUpload"]
exit;
	
	include_once('../../init.php');
	include_once('../../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

	switch($_POST["type"])
	{
		
		 case 'doLogin':
		 
			$username = strip_tags(trim($_POST['username']));
			$passwd = strip_tags(trim($_POST['passwd']));

			if($username == '' || $passwd == ''){
				echo 'fail[#]';
				echo 'empty';
				exit;
			}

			$user->setUsername($username);
			$user->setPassword($passwd);
			if($Id = $user->do_login()){
				echo "ok[#]";
				echo $Id;
			}else{
				echo "fail[#]";
				echo 'data';
			}
			
        break;
		
		case 'inicio':
		

			$student->setUserId($_POST["usuarioId"]);
			$info = $student->GetInfo();
			
			if(file_exists(DOC_ROOT."/alumnos/".$info["userId"].".jpg"))
			{
				$urlFoto = "<img src='".WEB_ROOT."/alumnos/".$info["userId"].".jpg?".rand()."' style='width:100px; border-radius: 50%;' '>";
				$fotoHeader = "<img src='".WEB_ROOT."/alumnos/".$info["userId"].".jpg?".rand()."' style='width:30px; border-radius: 50%;' >";
			}else{
				$urlFoto = "<img src='".WEB_ROOT."/images/no_foto.jpg' style='width:100px; border-radius: 50%;' '>";
				$fotoHeader = "<img src='".WEB_ROOT."/images/no_foto.jpg' style='width:30px; border-radius: 50%;' '>";
			}
			
			$activeCourses = $student->StudentCourses("activo", "si");
			$inactiveCourses = $student->StudentCourses("inactivo", "si");
			$finishedCourses = $student->StudentCourses("finalizado");
			
			
			echo "ok[#]";
			echo $fotoHeader;
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/perfil-inicio.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/curricula-activa.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/curricula-inactiva.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/curricula-finalizada.php');
					
		break;
		
		case "viewModules":
		
			
			if($_POST["estatus"]=="activa"){	
				$course->setCourseId($_POST["courseId"]);
				$date = date("d-m-Y");
				$addedModules = $course->StudentCourseModules();
				
				$timestamp = time();
				
				foreach($addedModules as $key=>$aux){
						
						if($aux["finalDateStamp"] > 0 AND $timestamp > $aux["finalDateStamp"]){
							$addedModules[$key]["estatusCourse"] = "Finalizado";
						}else if($aux["active"] == "no"){
							$addedModules[$key]["estatusCourse"] = "Finalizado";
						}
						else if($aux["finalDateStamp"] <= 0 AND $initialDateStamp < $aux["daysToFinishStamp"] AND $timestamp > $aux["daysToFinishStamp"]){
							$addedModules[$key]["estatusCourse"] = "Finalizado";
						}else{
							$addedModules[$key]["estatusCourse"] = "Activo";
						}
					}
				echo "ok[#]";
				include(DOC_ROOT.'/ajax/app/view/view-modules.php');
				exit;
			}else{

				$student->setUserId($_POST["usuarioId"]);
				if($_POST["estatus"]=="finalizada"){
					$infoMol = $student->InfoStudentCourses("finalizado",null,$_POST["courseId"]);
				}else{
					$infoMol = $student->InfoStudentCourses("inactivo","si",$_POST["courseId"]);
				}
				echo "ok[#]";
				include(DOC_ROOT.'/ajax/app/view/info-modules.php');
			}
			
		
		break;
		
		
		case "verDetalle":
		// echo "<pre>"; print_r($_POST);
		// exit;
			if($_POST["estatus"]=="Finalizado"){
				// actividades
				$module->setCourseModuleId($_POST['courseId']);
				$infoModule=$module->InfoCourseModule();
				$courseId=$infoModule['courseId'];
				$activity->setCourseModuleId($_POST['courseId']);
				$activityInfoTask=$activity->Enumerate("Tarea");
				$userId=$_POST["usuarioId"];
				$activity->setUserId($userId);
				foreach($activityInfoTask as $key => $fila){
				  $activity->setCourseModuleId($_POST['courseId']);
				  $activity->setActivityId($fila['activityId']);
				  $activityInfoTask[$key]['calificacion']=$activity->Score();
				  $activityInfoTask[$key]['retroTotal']=$activity->Retro();
				  }
				//examenes
				$tipo=2;
				$module->setCourseModuleId($_POST['courseId']);
				$infoModule=$module->InfoCourseModule();
				$courseId=$infoModule['courseId'];
				$activity->setCourseModuleId($_POST['courseId']);
				$activityInfoTaskExam=$activity->Enumerate("Examen");
				$userId=$_POST["usuarioId"];
				$activity->setUserId($userId);				
				foreach($activityInfoTaskExam as $key => $fila){
				  $activity->setCourseModuleId($_POST['courseId']);
				  $activity->setActivityId($fila['activityId']);
				  $activityInfoTaskExam[$key]['calificacion']=$activity->Score();
				  $activityInfoTaskExam[$key]['retroTotal']=$activity->Retro();
				  
				  }
				 echo "ok[#]";
				 include(DOC_ROOT.'/ajax/app/view/calificacion-actividad.php');
				 echo "[#]";
				 include(DOC_ROOT.'/ajax/app/view/calificacion-examen.php');
				 exit;
			}
		
			//anuncios
			$module->setCourseModuleId($_POST["courseId"]);
			$myModule = $module->InfoCourseModule();
			
			//informacion
			$module->setCourseModuleId($_POST["courseId"]);
			$infoMod = $module->InfoCourseModule();
			$announcements = $announcement->Enumerate($myModule["courseId"], $myModule["courseModuleId"]);
			
			//actividades
			$activity->setCourseModuleId($_POST["courseId"]);
			$actividades = $activity->Enumerate("Tarea");
			//examenes
			$activity->setCourseModuleId($_POST["courseId"]);
			$lstExmanenes = $activity->Enumerate("Examen");
			//recursos de apoyo
			$resource->setCourseModuleId($_POST["courseId"]);
			$resources = $resource->Enumerate();
			//foro
			$forum->setCourseId($myModule["courseId"]);
			$forums = $forum->Enumerate();
			//docente
			$module->setCourseModuleId($_POST["courseId"]);
			$myModule = $module->InfoCourseModule();

			$personal->setPersonalId($myModule["access"][1]);
			$docente = $personal->Info();

			$urlFotoDoc = "<img src='".WEB_ROOT."/images/no_foto.jpg' style='width:100px; border-radius: 50%;' '>";
			
			// echo "<pre>"; print_r($actividades);
			echo "ok[#]";
			include(DOC_ROOT.'/ajax/app/view/anuncios.php');			
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/informacion.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/actividades.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/examen.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/recursos.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/foro.php');
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/docente.php');
		
		break;

		
		case "miCuenta":
			$student->setUserId($_POST["usuarioId"]);
			$info = $student->GetInfo();
			
			$iPais = $student->InfoPais($info["pais"]);
			$iEdo = $student->InfoEstado($info["estado"]);
			$iMpo = $student->InfoMunicipio($info["ciudad"]);
			
			$iPaist = $student->InfoPais($info["paist"]);
			$iEdot = $student->InfoEstado($info["estadot"]);
			$iMpot = $student->InfoMunicipio($info["ciudadt"]);
			
			$profesion->setProfesionId($info["profesion"]);
			$infoPro = $profesion->Info();
			
			if(file_exists(DOC_ROOT."/alumnos/".$info["userId"].".jpg"))
			{
				$fotoHeader = "<img src='".WEB_ROOT."/alumnos/".$info["userId"].".jpg?".rand()."' style='width:30px; border-radius: 50%;' >";
			}else{
				$fotoHeader = "<img src='".WEB_ROOT."/images/no_foto.jpg' style='width:30px; border-radius: 50%;' '>";
			}
		
			echo "ok[#]";
			echo $fotoHeader;
			echo "[#]";
			include(DOC_ROOT.'/ajax/app/view/mi-cuenta.php');
			

		break;

		
		case "detalleActividad":
		
			$activity->setActivityId($_POST["actividadId"]);
			$activity->setUsuarioId($_POST["usuarioId"]);
			$infoActividad = $activity->InfoApp();
			echo "<pre>"; print_r($infoActividad);
			// $activity->setCourseModuleId($_GET["id"]);
			// $infoActividad = $activity->Enumerate("Tarea");
			echo "ok[#]";
			include(DOC_ROOT.'/ajax/app/view/detalle-actividad.php');
			
		break;
		
		case "detalleRecurso":
		
			$resource->setResourceId($_POST["actividadId"]);
			$infoRe = $resource->Info();
			// echo "<pre>"; print_r($infoRe);
			echo "ok[#]";
			include(DOC_ROOT.'/ajax/app/view/detalle-recurso.php');
			
		break;

		
		case "verSubforo":
			
			// echo "<pre>"; print_r($_POST);
			$forum->setTopicId($_POST["topicId"]);
			$forums = $forum->Enumeratesub();
			echo "ok[#]";
			include(DOC_ROOT.'/ajax/app/view/sub-foro.php');
			echo "[#]";
			echo $_POST["topicId"];
		
		break;
		
		case "saveForo":
		
			// echo "<pre>"; print_r($_POST);
			// exit;
			if($_POST["asunto"]==null){
				echo "fail[#]";
				echo "Campo requerido: Asunto";
				exit;
			}
			
			
			$forum->setTopicId($_POST["forotopicId"]);
			$forum->setUserId($_POST["usuarioId"]);
			$forum->setSubject($_POST["asunto"]);
			$forum->setReply($_POST["mensaje"]);
			if($forum->AddTopic()){
				$forum->setTopicId($_POST["forotopicId"]);
				$forums = $forum->Enumeratesub();
				echo "ok[#]";
				include(DOC_ROOT.'/ajax/app/view/sub-foro.php');
			}else{
				echo "fail[#]";
			}
		
		break;
		
		case "verSubforoDetalle":
		
			// echo "<pre>"; print_r($_POST);
			$forum->setTopicsubId($_POST["topicId"]);
			$replies = $forum->Replies();
			echo "ok[#]";
			include(DOC_ROOT.'/ajax/app/view/aportaciones.php');
			echo "[#]";
			echo $_POST["topicId"];
			echo "[#]";
			echo $_POST["courseId"];
		
		break;
		
		case "saveAportacion":
		
		// echo "<pre>"; print_r($_POST);
		// exit;
		
			if($_POST["aportacion"]==null){
				echo "fail[#]";
				echo "Campo requerido: Aportacion";
				exit;
			}
			$infoUser = $student->InfoStudent($_POST["usuarioId"]);
			$infoUser["positionId"] = 0;
			$forum->setTopicsubId($_POST["dtopicId"]);
			$forum->setModuleId($_POST["dcourseId"]);
			$forum->setReply($_POST["aportacion"]);
		     if($infoUser["positionId"]==0 || $infoUser["positionId"]=="" || $infoUser["positionId"]==null || !isset($infoUser["positionId"])){
				 $forum->setUserId($infoUser["userId"]);
				 $forum->setPersonalId(0);
		    }
			else{
				$forum->setUserId(0);
				$forum->setPersonalId($infoUser["userId"]);
			}
			

			$_SESSION['User']['userId'] = $_POST["usuarioId"];
			if($forum->AddReply()){
				$forum->setTopicsubId($_POST["dtopicId"]);
				$replies = $forum->Replies();
				echo "ok[#]";
				include(DOC_ROOT.'/ajax/app/view/aportaciones.php');
				
			}else{
				echo "fail[#]";
			}
		
		break;
		
		case "detalleAportacion":
		
			echo "ok[#]";
			include(DOC_ROOT.'/ajax/app/view/detalle-aportacion.php');
		break;
		
		case "verComentario":

			// echo "<pre>"; print_r($_POST);
			include(DOC_ROOT.'/ajax/app/view/comentarios.php');
		break;
		
		case "addComentario":
		
		break;
		
		case "SaveComentario":
		
		// echo "<pre>"; print_r($_POST);
		// exit;
			if($_POST["comentario"]==null){
				echo "fail[#]";
				echo "Campo requerido: Comentario";
				exit;
			}
		
			$infoUser = $student->InfoStudent($_POST["usuarioId"]);
			$infoUser["positionId"] = 0;
			$forum->setTopicsubId($_POST["ctopicId"]);
			$forum->setModuleId($_POST["ccourseId"]);
			$forum->setReplyId($_POST["replyId"]);
			$forum->setReply($_POST["comentario"]);
		     if($infoUser["positionId"]==0 || $infoUser["positionId"]=="" || $infoUser["positionId"]==null || !isset($infoUser["positionId"])){
				 $forum->setUserId($infoUser["userId"]);
				 $forum->setPersonalId(0);
		    }
			else{
				$forum->setUserId(0);
				$forum->setPersonalId($infoUser["userId"]);
			}
			

			$_SESSION['User']['userId'] = $_POST["usuarioId"];
			if($forum->AddReply()){
				$forum->setTopicsubId($_POST["ctopicId"]);
				$replies = $forum->Replies();
				echo "ok[#]";
				include(DOC_ROOT.'/ajax/app/view/aportaciones.php');
				echo "[#]";
				echo $_POST["ctopicId"];
				echo "[#]";
				echo $_POST["ccourseId"];
				
			}else{
				echo "fail[#]";
			}
		
		break;

	}

?>