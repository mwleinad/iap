<?php
// echo '<pre>'; print_r($_POST);
// exit;
	header('Access-Control-Allow-Origin: *'); 
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
			echo DOC_ROOT."/alumnos/".$info["userId"].".jpg";
			if(file_exists(DOC_ROOT."/alumnos/".$info["userId"].".jpg"))
			{
				echo 'si';
				$urlFoto = "<img src='".WEB_ROOT."/alumnos/".$info["userId"].".jpg?".rand()."' style='width:100px; height:100px; border-radius: 50%;' />";
				$fotoHeader = "<img src='".WEB_ROOT."/alumnos/".$info["userId"].".jpg?".rand()."' style='width:30px; border-radius: 50%;' />";
			}else{
				echo  'no';
				$urlFoto = "<img src='".WEB_ROOT."/alumnos/no_foto.JPG' style='width:100px; border-radius: 50%;' />";
				$fotoHeader = "<img src='".WEB_ROOT."/alumnos/no_foto.JPG' style='width:30px; border-radius: 50%;' />";
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
			echo "[#]";
			echo count($activeCourses);
			echo "[#]";
			echo count($inactiveCourses);
			echo "[#]";
			echo count($finishedCourses);
					
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
				// echo "<pre>"; print_r($addedModules);
				// exit;
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
				 echo "[#]";
				 echo count($activityInfoTask);
				 echo "[#]";
				 echo count($activityInfoTaskExam);
				 exit;
			}
		
			//anuncios
			$module->setCourseModuleId($_POST["courseId"]);
			$myModule = $module->InfoCourseModule();
			
			//informacion
			$module->setCourseModuleId($_POST["courseId"]);
			$infoMod = $module->InfoCourseModule();
			$announcement->setLimit(5);
			$announcements = $announcement->Enumerate($myModule["courseId"], $myModule["courseModuleId"]);
			
			//actividades
			$activity->setCourseModuleId($_POST["courseId"]);
			$actividades = $activity->Enumerate("Tarea");
			// echo '<pre>'; print_r($actividades); 
			// exit;
			//examenes
			$activity->setCourseModuleId($_POST["courseId"]);
			$lstExmanenes = $activity->Enumerate("Examen");
			//recursos de apoyo
			$resource->setCourseModuleId($_POST["courseId"]);
			$resources = $resource->Enumerate();
			//foro
            $forum->setCourseModuleId($_POST["courseId"]);
			$forum->setCourseId($myModule["courseId"]);
			$forums = $forum->Enumerate();
			//docente
			$module->setCourseModuleId($_POST["courseId"]);
			$myModule = $module->InfoCourseModule();

			$personal->setPersonalId($myModule["access"][1]);
			$docente = $personal->Info();

			if($docente['foto']){
				$urlFotoDoc = "<img src='".WEB_ROOT."/".$docente['foto']."' style='width:100px; border-radius: 50%;' '>";
			} else {
				$urlFotoDoc = "<img src='".WEB_ROOT."/alumnos/no_foto.JPG' style='width:100px; border-radius: 50%;' '>";
			}

			// echo "<pre>"; print_r($docente);
			// exit;
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
			echo "[#]";
			echo count($announcements);
			echo "[#]";
			echo count($actividades);
			echo "[#]";
			echo count($lstExmanenes);
			echo "[#]";
			echo count($resources);
			echo "[#]";
			echo count($forums);
		
		break;

		
		case "miCuenta":
		// echo "<pre>"; print_r($_POST);
		// exit;
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
				$urlFoto = "<img src='".WEB_ROOT."/alumnos/".$info["userId"].".jpg?".rand()."' style='width:100px; height:100px; border-radius: 50%;' />";
			}else{
				$urlFoto = "<img src='".WEB_ROOT."/alumnos/no_foto.JPG' style='width:100px; border-radius: 50%;' />";
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
			// echo "<pre>"; print_r($infoActividad);
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
		
			// echo "<pre>"; print_r($_FILES);
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
				$_POST["topicId"] = $_POST["dtopicId"];
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
		
		// echo "<pre>"; print_r($_FILES);
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
		
		case "upActividad":
		
			$homework->setActividadId($_POST["upactividadId"]);
			$homework->setModalidad($_POST["upmodalidad"]);
			$homework->setNombre($_POST["titulo"]);
			$homework->setUser5Id($_POST["upusuarioId"]);
			if($homework->UploadApp($_FILES["path"])){
				echo "ok[#]";
				echo $_POST["upactividadId"];
				echo "[#]";
				echo $_POST["tipoactivi"];
			}else{
				echo "fail[#]";
			}
			
		
		break;

		case "editFoto":
		
		// echo '<pre>'; print_r($_FILES);
		// echo '<pre>'; print_r($_POST);
		// exit;
			$ext = end(explode('.', basename($_FILES["pathfoto"]['name'])));			
			$target_path = DOC_ROOT.'/alumnos/'.$_POST['usuarioId'].'.jpg'; 
			if(move_uploaded_file($_FILES["pathfoto"]['tmp_name'], $target_path)) 
			{
				echo 'ok[#]';
			}

		break;
		
		case "verSeccion":
					

			// if($_POST["Id"]==1){
				// include(DOC_ROOT.'/ajax/app/view/nosotros.php');
			// }else if($_POST["Id"]==2){
				// include(DOC_ROOT.'/ajax/app/view/prodim.php');
			// }else if($_POST["Id"]==3){
				// include(DOC_ROOT.'/ajax/app/view/red.php');
			// }else if($_POST["Id"]==4){
				// include(DOC_ROOT.'/ajax/app/view/profe.php');
			// }else if($_POST["Id"]==5){
				// include(DOC_ROOT.'/ajax/app/view/contacto.php');
			// }

			$lstMenu = $student->muestraMenu($_POST["Id"]);
			include(DOC_ROOT.'/ajax/app/view/menu-principal.php');
		
		break;
		
		case 'verSubSeccion':
		// exit;
			// echo '<pre>'; print_r($_POST);
			$uno = "<img src='".WEB_ROOT."/images/instalaciones/1.jpg' style='width:100px;' />";
			$dos = "<img src='".WEB_ROOT."/images/instalaciones/2.jpg' style='width:100px;' />";
			$tres = "<img src='".WEB_ROOT."/images/instalaciones/3.jpg' style='width:100px;' />";
			$cuatro = "<img src='".WEB_ROOT."/images/instalaciones/4.jpg' style='width:100px;' />";
			$cinco = "<img src='".WEB_ROOT."/images/instalaciones/5.jpg' style='width:100px;' />";
			$seis = "<img src='".WEB_ROOT."/images/instalaciones/6.jpg' style='width:100px;' />";
			$siete = "<img src='".WEB_ROOT."/images/instalaciones/7.jpg' style='width:100px;' />";
			$ocho = "<img src='".WEB_ROOT."/images/instalaciones/8.jpg' style='width:100px;' />";
			$nueve = "<img src='".WEB_ROOT."/images/instalaciones/9.jpg' style='width:100px;' />";
			$diez = "<img src='".WEB_ROOT."/images/instalaciones/10.jpg' style='width:100px;' />";

			$infoSeccion = $student->contenidoSeccion($_POST["Id"]);
			$var = 0;
			
			if($_POST["Id"]==7){
				$var = 1;
			}
			
			if($_POST["Id"]==9){
				$var = 2;
			}
			
			if($_POST["Id"]==12){
				$var = 3;
			}
			
			if($_POST["Id"]==24){
				$var = 4;
			}
			
			if($_POST["Id"]==6){
				$var = 6;
			}
			
			
			
			$urlFace = "<img src='".WEB_ROOT."/images/face.png'  border-radius: 2%;' />";
			$imgFachada = "<img src='".WEB_ROOT."/images/fachada.jpg' border-radius: 2%;' />";
			$urlTwi = "<img src='".WEB_ROOT."/images/twitter.png'  border-radius: 2%;' />";
			$urlIns = "<img src='".WEB_ROOT."/images/insta.png'  border-radius: 2%;' />";
			$urlLink = "<img src='".WEB_ROOT."/images/link.png'  border-radius: 2%;' />";
			
			$lstMenu = $student->muestraMenu($var);
			$lstSubmenu = $student->muestraMenu($_POST["Id"]);
			
			echo '<pre>'; print_r($lstMenu);
			// exit;
			echo 'ok[#]';
			include(DOC_ROOT.'/ajax/app/view/seccion.php');
			echo '[#]';
			include(DOC_ROOT.'/ajax/app/view/menu.php');
			
		break;
		
		case 'clickMenu';
		
		// echo $_POST["Id"];
			$urlPres = "<img src='".WEB_ROOT."/images/presi.png' style='width:200px; height:200px; border-radius: 2%;' />";
			$urlSede = "<img src='".WEB_ROOT."/images/sedes.png' style='width:200px; height:200px; border-radius: 2%;' />";
			$imgFachada = "<img src='".WEB_ROOT."/images/fachada.jpg' border-radius: 2%;' />";
				
			$lstSubmenu = $student->muestraMenu($_POST["Id"]);
			// echo '<pre>'; print_r($_POST);
			$uno = "<img src='".WEB_ROOT."/images/instalaciones/1.jpg' style='width:100px;' />";
			$dos = "<img src='".WEB_ROOT."/images/instalaciones/2.jpg' style='width:100px;' />";
			$tres = "<img src='".WEB_ROOT."/images/instalaciones/3.jpg' style='width:100px;' />";
			$cuatro = "<img src='".WEB_ROOT."/images/instalaciones/4.jpg' style='width:100px;' />";
			$cinco = "<img src='".WEB_ROOT."/images/instalaciones/5.jpg' style='width:100px;' />";
			$seis = "<img src='".WEB_ROOT."/images/instalaciones/6.jpg' style='width:100px;' />";
			$siete = "<img src='".WEB_ROOT."/images/instalaciones/7.jpg' style='width:100px;' />";
			$ocho = "<img src='".WEB_ROOT."/images/instalaciones/8.jpg' style='width:100px;' />";
			$nueve = "<img src='".WEB_ROOT."/images/instalaciones/9.jpg' style='width:100px;' />";
			$diez = "<img src='".WEB_ROOT."/images/instalaciones/10.jpg' style='width:100px;' />";
			$infoSeccion = $student->contenidoSeccion($_POST["Id"]);
			$lstSubmenu = $student->muestraMenu($_POST["Id"]);
			echo 'ok[#]';
			include(DOC_ROOT.'/ajax/app/view/seccion2.php');
			
		break;
		
		case 'saveContacto';
		
			// echo '<pre>'; print_r($_POST);
			if($student->saveContacto()){
				echo 'ok[#]';
				echo '
				<div class="alert alert-info alert-dismissable" style="color: #3a87ad;
					background-color: #d9edf7;
					border-color: #bce8f1">
				 El mensaje se envio correctamente, en breve nos pondremos en contacto contigo
				</div>';
			}else{
				echo 'fail[#]';
			}
		
		break;
		
	}

?>