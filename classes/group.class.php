<?php

	class Group extends Module
	{
		private $teamNumber;
		private $coursemoduleId;
		private $perfilParticipante;
		private $duracion;

		private $numParticipantes;
		private $horario;
		private $objetivoParticular;
		private $estructuraTematica;
		private $criteriosEvaluacion;
		private $tecnicas;
		private $bibliografias;
		private $tipoMajor;
		
		public function setTipoMajor($value)
		{
			// $this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "");
			$this->tipoMajor = $value;
		}
		
		public function setPerfilParticipante($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->perfilParticipante = $value;
		}
		
		public function setDuracion($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->duracion = $value;
		}
		
		public function setnumParticipantes($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->numParticipantes = $value;
		}
		
		public function setHorario($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->horario = $value;
		}
		
		public function setobjetivoParticular($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->objetivoParticular = $value;
		}
		
		public function setestructuraTematica($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->estructuraTematica = $value;
		}
		
		public function setcriteriosEvaluacion($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->criteriosEvaluacion = $value;
		}
		
		
		public function settecnicas($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->tecnicas = $value;
		}
		
		public function setbibliografias($value)
		{
			$this->Util()->ValidateString($value, $max_chars=100000000000, $minChars = 0, "Semblanza");
			$this->bibliografias = $value;
		}


		
		public function setCourseModuleId($value)
		{
			$this->Util()->ValidateInteger($value,999,1);
			$this->coursemoduleId = $value;
		}
		
		
		public function setTeamNumber($value)
		{
			$this->Util()->ValidateInteger($value,999,1);
			$this->teamNumber = $value;
		}

		function EditScore($modality, $id, $scores, $retros)
		{
			 $notificacion= new Notificacion;
			// echo '<pre>'; print_r($scores);
			// exit;
			// foreach($scores as $key => $score){
				// $this->setTeamNumber($key);
				// $members = $this->Team();
				// foreach($members as $member){
					// echo $retros[$key];
				// }
			// }
			
			// exit;
			
			foreach($scores as $key => $score)
			{
				$k = $key;
				$this->Util()->ValidateFloat($score, 2, 100,0);
				switch($modality)
				{
					case "Individual":   //{
						//checar si ya hay calificacion
						$this->Util()->DB()->setQuery("
							SELECT COUNT(*)
							FROM activity_score
							WHERE activityId = '".$id."' AND userId = '".$key."'");
						$count = $this->Util()->DB()->GetSingle();
						
						$this->Util()->DB()->setQuery("
							SELECT *
							FROM activity_score
							WHERE activityId = '".$id."' AND userId = '".$key."'");
						$activityAnt = $this->Util()->DB()->GetRow();
					//	print_r($activityAnt); exit;
						
						
						  //obteniendo la informacion de la actividad
				   $activity=new Activity();
				   $activity->setActivityId($id);
				   $infoActivity=$activity->Info();
				   //fin de informacion de actividad 
				   
				    //obteniendo informacion de Student
					$student=new Student;
					$student->setUserId($key);
					$infoStudent=$student->GetInfo();
															 					
															
					//fin informacion Student
						
						
						
						//print_r($calificacion); exit;
						if($count == 0)
						{
							$this->Util()->DB()->setQuery("
								INSERT INTO  `activity_score` (
									`userId` ,
									`activityId` ,
									`retro` ,
									`ponderation`
									)
									VALUES (
									'".$key."',  
									'".$id."',  
									'".$retros[$key]."',  
									'".$score."');");
							$result = $this->Util()->DB()->InsertData();	
							   $hecho=$_SESSION['User']['userId']."p";				       
							   $vista="1p,".$hecho.",".$key."u";
							   $tablas="activity_score";
							   $enlace="/score-activity/id/".$id;
							   // $actividad="Se ha calificado la Actividad ".$infoActivity['resumen']." para ".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno']." Calificación(De ".$activityAnt['ponderation']." a ".number_format($score,2,'.','').")   Retroalimentación(De ".$activityAnt['retro']." a ".$retros[$key].")";;
							   $actividad="Se ha calificado la Actividad ".$infoActivity['resumen']." para ".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno']." Calificación(".number_format($score,2,'.','').")   Retroalimentación(".$retros[$key].")";;
									


							 if($score <> '0' or $score <> ''){
								  $notificacion->setActividad($actividad);
								  $notificacion->setVista($vista);
								  $notificacion->setHecho($hecho);
								  $notificacion->setTablas($tablas);
								  $notificacion->setEnlace($enlace);
								  
								  $notificacion->saveNotificacion();
							 }
							
							

						}
						else
						{
							$this->Util()->DB()->setQuery("
								UPDATE `activity_score` SET
									`ponderation` = '".$score."',
									`retro` = '".$retros[$key]."'
								WHERE
									`userId` = '".$key."' AND activityId = '".$id."' LIMIT 1");
							$this->Util()->DB()->UpdateData();	

							$this->Util()->DB()->setQuery("
							SELECT activityScoreId
							FROM activity_score
							WHERE activityId = '".$id."' AND userId = '".$key."'");
							$result = $this->Util()->DB()->GetSingle();

							// echo $result;
							// exit;
							$hecho=$_SESSION['User']['userId']."p";				       
							$vista="1p,".$hecho.",".$key."u";
							$tablas="activity_score";
							$enlace="/score-activity/id/".$id;

							if($activityAnt['ponderation']==number_format($score,2,'.','') &&  $activityAnt['retro']==$retros[$key])
							$actividad="NO";                       
							else					   
							$actividad="Se ha modificado calificación en ".$infoActivity['resumen']." para ".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno']." Calificación(".number_format($score,2,'.','').")   Retroalimentación(".$retros[$key].")";
							// $actividad="Se ha modificado calificación en ".$infoActivity['resumen']." para ".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno']." Calificación(De ".$activityAnt['ponderation']." a ".number_format($score,2,'.','').")   Retroalimentación(De ".$activityAnt['retro']." a ".$retros[$key].")";

							if($actividad!="NO"){

							  $notificacion->setActividad($actividad);
							  $notificacion->setVista($vista);
							  $notificacion->setHecho($hecho);
							  $notificacion->setTablas($tablas);
							  $notificacion->setEnlace($enlace);
							  
							  $notificacion->saveNotificacion();
							  
							}
						}
						
						$arch =  "fileRetro_".$key;
						$url = DOC_ROOT;
						foreach($_FILES as $key=>$var)
						{
						   switch($key)
						   {
							   case $arch:
							   if($var["name"]<>""){
									$aux = explode(".",$var["name"]);
									$extencion=end($aux);
									$temporal = $var['tmp_name'];
									$foto_name="doc_".$result.".".$extencion;	
									 $url."/file_retro/".$foto_name;
									if(move_uploaded_file($temporal,$url."/file_retro/".$foto_name)){		
												
										$sql = 'UPDATE 		
										activity_score SET 		
										rutaArchivoRetro = "'.$foto_name.'"			      		
										WHERE activityScoreId = '.$result.'';		
											
									$this->Util()->DB()->setQuery($sql);		
									$this->Util()->DB()->UpdateData();

								   }
									
							   }
						   }
						}
						
						//crear notificacion de actualizacion de calificaciones
						
		
					
							
						
						
						
						
						
						
					break;   //}
					default:
					
					
						$this->setTeamNumber($key);
						$members = $this->Team();
						foreach($members as $keyme=>$member)
						{
							// echo 'llega';;
							//checar si ya hay calificacion
							 $sql =	"
								SELECT COUNT(*)
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'";
							
							$this->Util()->DB()->setQuery($sql);
							$count = $this->Util()->DB()->GetSingle();
							
							if($count == 0)
							{
								  $sql = "
									INSERT INTO  `activity_score` (
										`userId` ,
										`activityId` ,
										`retro` ,
										`ponderation`
										)
										VALUES (
										'".$member["userId"]."',  
										'".$id."',  
										'".$retros[$k]."',  
										'".$score."');";
										
								// echo '<br>';
								$this->Util()->DB()->setQuery($sql);
								$result = $this->Util()->DB()->InsertData();					
							}
							else
							{
								$this->Util()->DB()->setQuery("
								SELECT activityScoreId
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'");
								$result = $this->Util()->DB()->GetSingle();
							
							$sql  = "
									UPDATE `activity_score` SET
										`ponderation` = '".$score."',
										`retro` = '".$retros[$k]."'
									WHERE
										`userId` = '".$member["userId"]."' AND activityId = '".$id."' LIMIT 1";
										
								$this->Util()->DB()->setQuery($sql);
								$this->Util()->DB()->UpdateData();					
							}
							
							$edit = 'no';
							// $editdos = '';
							$arch =  "fileRetro_".$k;
							$url = DOC_ROOT;
							if($_FILES['fileRetro_'.$k]["name"]<>""){
								$aux = explode(".",$_FILES['fileRetro_'.$k]["name"]);
								$extencion=end($aux);
								$temporal = $_FILES['fileRetro_'.$k]['tmp_name'];
								$foto_name="doc_".$result.".".$extencion;	
								 $url."/file_retro/".$foto_name;
								if(move_uploaded_file($temporal,$url."/file_retro/".$foto_name)){		
											
									$sql = 'UPDATE 		
									activity_score SET 		
									rutaArchivoRetro = "'.$foto_name.'"			      		
									WHERE activityScoreId = '.$result.'';		
								$this->Util()->DB()->setQuery($sql);		
								$this->Util()->DB()->UpdateData();
							   }
							   $edit = 'si';
							}
							if ($keyme >= 1){
								if ($editdos=='si'){
									copy($url.'/file_retro/'.$foto_nameant, $url."/file_retro/".$foto_name);
									$sql = 'UPDATE 		
										activity_score SET 		
										rutaArchivoRetro = "'.$foto_name.'"			      		
										WHERE activityScoreId = '.$result.'';		
									$this->Util()->DB()->setQuery($sql);		
									$this->Util()->DB()->UpdateData();
								}
								// echo 'copai';
							}else
							{
								$foto_nameant = $foto_name;
								 $editdos = $edit;
							}
							
								 
						}

				}
				
			}
			$this->Util()->setError(90000, 'complete', "Has modificado las calificaciones");
			$this->Util()->PrintErrors();	

			return true;
		}
		
		public function ScoreGroup($modality, $type, $id)
		{
			switch($modality)
			{
				case "Individual":
				 	$sql = "SELECT 
					 			user_subject.alumnoId, user.*, user_subject.status AS status, 'Ordinario' AS situation 
							FROM user_subject
								LEFT JOIN user 
									ON user_subject.alumnoId = user.userId
							WHERE courseId = " . $this->getCourseId() . " AND user_subject.status = 'activo'
							UNION
							SELECT 
								usr.alumnoId, user.*, usr.status, 'Recursador' AS situation
							FROM user_subject_repeat usr
								LEFT JOIN user
									ON usr.alumnoId = user.userId 
							WHERE usr.courseId = " . $this->getCourseId() . " AND usr.status = 'activo' AND usr.courseModuleId = " . $this->coursemoduleId . "
							ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
					// exit
					$this->Util()->DB()->setQuery($sql);
					$result = $this->Util()->DB()->GetResult();
					
					foreach($result as $key => $res)
					{
						$this->Util()->DB()->setQuery("
							SELECT ponderation
							FROM activity_score
							WHERE activityId = '".$id."' AND userId = '".$res["alumnoId"]."'");
						$result[$key]["ponderation"] = $this->Util()->DB()->GetSingle();

						$this->Util()->DB()->setQuery("
							SELECT retro
							FROM activity_score
							WHERE activityId = '".$id."' AND userId = '".$res["alumnoId"]."'");
						$result[$key]["retro"] = $this->Util()->DB()->GetSingle();
						
						$this->Util()->DB()->setQuery("
							SELECT rutaArchivoRetro
							FROM activity_score
							WHERE activityId = '".$id."' AND userId = '".$res["alumnoId"]."'");
						$result[$key]["fileRetro"] = $this->Util()->DB()->GetSingle();

						$this->Util()->DB()->setQuery("
							SELECT *
							FROM homework
							WHERE activityId = '".$id."' AND userId = '".$res["alumnoId"]."'");
						$result[$key]["homework"] = $this->Util()->DB()->GetRow();
				
					}
				break;				
				default: 
				
				if($this->getCourseModuleId()=='') {
					$this->Util()->DB()->setQuery("
						SELECT teamNumber, teamId FROM team
						WHERE courseModuleId = '".$this->coursemoduleId."'
						GROUP BY teamNumber
						ORDER BY teamNumber ASC");
				}else{
					$this->Util()->DB()->setQuery("
						SELECT teamNumber, teamId FROM team
						WHERE courseModuleId = '".$this->getCourseModuleId()."'
						GROUP BY teamNumber
						ORDER BY teamNumber ASC");
				}
				
					$result = $this->Util()->DB()->GetResult();
					// echo "<pre>"; print_r($result);
					// exit;
					foreach($result as $key => $res)
					{
						//get all team members
						$this->setTeamNumber($res["teamNumber"]);
						$members = $this->Team();
						foreach($members as $member)
						{
							 $sql = "
								SELECT *
								FROM homework
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."' and path <>'' order by homeworkId ASC";
								// echo '<br>';
								// echo '<br>';
							$this->Util()->DB()->setQuery($sql);
							 $home = $this->Util()->DB()->GetRow();
							// $home
							if($home['path']<>''){
								if(file_exists(DOC_ROOT."/homework/".$home['path'])){
									$result[$key]["homework"] = WEB_ROOT."/homework/".$home["path"];
									$result[$key]["nombre"] = $home['nombre'];
								} 
							} 


							$this->Util()->DB()->setQuery("
								SELECT ponderation
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'");
							$result[$key]["ponderation"] = $this->Util()->DB()->GetSingle();

							 $sql = "
								SELECT retro
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'";
							// echo '<br>';
								// exit;
							$this->Util()->DB()->setQuery($sql);
							$result[$key]["retro"] = $this->Util()->DB()->GetSingle();
							
							 $sql = "
								SELECT rutaArchivoRetro
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'";
							// echo '<br>';
								// exit;
							$this->Util()->DB()->setQuery($sql);
							$result[$key]["fileRetro"] = $this->Util()->DB()->GetSingle();

						}
						
					}
					break; 
					// return $result;
				
			}
			
				// exit;
			return $result;
		
		}

		
		public function genera(){
		        $this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE courseId = '".$this->getCourseId()."'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			$x=63;
			 foreach($result as $fila){
			 $year=date('Y');
			 //print_r($year);
			 $year = substr($year, -2);
			 if(strlen($x)==2){
			      $num="0".$x;
			 }else
			 $num=$x;
			   $matricula="5036101".$year.$num;
			  // print_r($matricula);
			 
			          $this->Util()->DB()->setQuery("
								UPDATE user_subject SET
									matricula = '".$matricula."'
							WHERE
									`alumnoId` = '".$fila['alumnoId']."'  AND courseId = '".$this->getCourseId()."' ");
							$actualiza = $this->Util()->DB()->UpdateData();
				   $x++;
			 
			 }
		   
		
		}
		
		public function matricula_maestrias(){
		        
			//resultados de maestrias
			$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE matricula like '5036%'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$maestrias = $this->Util()->DB()->GetResult();
			//print_r($maestrias);
		     if(count($maestrias)==0){
			  $this->genera();
			  $this->Util()->setError(90000, 'complete', "Se ha generado correctamente todas las matriculas");
			  $this->Util()->PrintErrors();
			  
			    return true;       
			 }else{
			 $this->Util()->setError(90000, 'complete', "No se pueden generar las matriculas por que ya existen");
			  $this->Util()->PrintErrors();
			 
			 return false;
			 
			 }
			 }
			 
			public function generaEspecialidad(){
		        $this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE courseId = '".$this->getCourseId()."'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			$x=63;
			 foreach($result as $fila){
			 $year=date('Y');
			 //print_r($year);
			 $year = substr($year, -2);
			 if(strlen($x)==2){
			      $num="0".$x;
			 }else
			 $num=$x;
			   $matricula="5046101".$year.$num;
			  // print_r($matricula);
			 
			          $this->Util()->DB()->setQuery("
								UPDATE user_subject SET
									matricula = '".$matricula."'
							WHERE
									`alumnoId` = '".$fila['alumnoId']."'  AND courseId = '".$this->getCourseId()."' ");
							$actualiza = $this->Util()->DB()->UpdateData();
				   $x++;
			 
			 }
			 
			 }
			 
			 public function matricula_especialidad(){
		        
			//resultados de maestrias
			$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE matricula like '5046%'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$especialidad = $this->Util()->DB()->GetResult();
			//print_r($maestrias);
		     if(count($especialidad)==0){
			  $this->generaEspecialidad();
			  $this->Util()->setError(90000, 'complete', "Se ha generado correctamente todas las matriculas");
			  $this->Util()->PrintErrors();
			  
			    return true;       
			 }else{
			 $this->Util()->setError(90000, 'complete', "No se pueden generar las matriculas por que ya existen");
			  $this->Util()->PrintErrors();
			 
			 return false;
			 
			 }
			 
			 		
		}//fin funcion matricula
		
		public function DefaultGroupInactivo()
		{
	
			$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE courseId = '".$this->getCourseId()."'  and user_subject.status='inactivo'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			
			$student= new Student();
			
			foreach($result as $fila){
			      $x=0;
				     $alumnos=$student->EnumerateTotal();
					   
					   foreach($alumnos as $alumno){
					
						    
							if($fila["alumnoId"] == $alumno["userId"] ){
							         $x=1;
							
							}
						
						}
						if($x==0){
						    $student->setAlumnoId($fila["alumnoId"]);
							$student->DeleteLimpia();
						 //echo $fila["alumnoId"]."Este alumno no aparece en estudiantes</br>";
						}
						
			return $result;
			}
		
		}
		
		public function DefaultGroup()
		{
			$students_repeat = "";
			if($this->coursemoduleId > 0)
			{
				$students_repeat = "UNION
							SELECT 
								u.*,
								u.controlNumber AS matricula,
								usr.alumnoId,
								usr.status,
								cd.discount,
								'Recursador' AS situation
							FROM user_subject_repeat usr 
								LEFT JOIN user u 
									ON usr.alumnoId = u.userId 
								LEFT JOIN calendar_discounts cd 
									ON (usr.alumnoId = cd.userId AND usr.courseId = cd.courseId)
							WHERE usr.courseId = " . $this->getCourseId() . " AND u.activo = '1' AND usr.status = 'activo' AND usr.courseModuleId = " . $this->coursemoduleId;
			}
			$sql = "SELECT 
						u.*, 
						us.matricula,
						us.alumnoId,
						us.status AS status,
						cd.discount,
						'Ordinario' AS situation,
						(SELECT cs.status FROM certificate_subject cs WHERE cs.userId = us.alumnoId AND us.courseId = cs.courseId) AS certificateStatus
					FROM user_subject us
						LEFT JOIN user u 
							ON us.alumnoId = u.userId
						LEFT JOIN calendar_discounts cd 
							ON (us.alumnoId = cd.userId AND us.courseId = cd.courseId)
					WHERE us.courseId = " . $this->getCourseId() . " AND u.activo = '1' AND us.status = 'activo'
					" . $students_repeat . "
					ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			$student= new Student();
			
			foreach($result as $fila){
			      $x=0;
				     $alumnos=$student->EnumerateTotal();
					   
					   foreach($alumnos as $alumno){
					
						    
							if($fila["alumnoId"] == $alumno["userId"] ){
							         $x=1;
							
							}
						
						}
						if($x==0){
						    $student->setAlumnoId($fila["alumnoId"]);
							$student->DeleteLimpia();
						 //echo $fila["alumnoId"]."Este alumno no aparece en estudiantes</br>";
						}
						
			//return $result;
			}
			
			
			foreach($result as $key => $res)
			{
				//get activities
				$activity = new Activity;
				$activity->setCourseModuleId($this->coursemoduleId);
				$actividades = $activity->Enumerate();
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);

				$this->Util()->DB()->setQuery("
					SELECT teamNumber
					FROM team
					WHERE courseModuleId = '".$this->coursemoduleId."' AND userId = '".$res["alumnoId"]."'");
				$result[$key]["equipo"] = $this->Util()->DB()->GetSingle();
				
				$result[$key]{"addepUp"} = 0;
				foreach($actividades as $activity)
				{
					if($activity["score"] <= 0)
					{
						continue;
					}
					//revisar calificacion

					$this->Util()->DB()->setQuery("
						SELECT ponderation
						FROM activity_score
						WHERE activityId = '".$activity["activityId"]."' AND userId = '".$res["alumnoId"]."'");
//						echo $this->Util()->DB()->query;
					$score = $this->Util()->DB()->GetSingle();

					$result[$key]{"score"}[] = $score;
					$realScore = $score * $activity["score"] / 100;
					$result[$key]{"realScore"}[] = $realScore;
					
					$result[$key]{"addepUp"} += $realScore;
				}
			}
			
			// 
			return $result;
		}
		
		public function TeamsModule()
		{
			$this->Util()->DB()->setQuery("
				SELECT * FROM team
				LEFT JOIN user ON team.userId = user.userId
				WHERE courseModuleId = '".$this->coursemoduleId."'
				ORDER BY teamNumber ASC, lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);
			}
			return $result;
		}

		public function Teams()
		{
			$this->Util()->DB()->setQuery("
				SELECT * FROM team
				LEFT JOIN user ON team.userId = user.userId
				WHERE courseModuleId = '".$this->getCourseModuleId()."'
				ORDER BY teamNumber ASC, lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);
			}
			return $result;
		}	
		
		

		function MyTeam($userId, $courseModuleId)
		{
			$this->setCourseModuleId($courseModuleId);
			
			 $sql = "
				SELECT teamNumber FROM team
				WHERE courseModuleId = '".$this->getCourseModuleId()."'
					AND userId = '".$userId."'";
					
					// exit;
			$this->Util()->DB()->setQuery($sql);
			$teamNumber = $this->Util()->DB()->GetSingle();
			
			$this->setTeamNumber($teamNumber);
			$members = $this->Team();
			
			return $members;
		}

		function MyTeamStudent($userId, $courseModuleId)
		{
						
			 $sql = "
				SELECT teamNumber FROM team
				WHERE courseModuleId = '".$courseModuleId."'
					AND userId = '".$userId."'";
					
					// exit;
			$this->Util()->DB()->setQuery($sql);
			$teamNumber = $this->Util()->DB()->GetSingle();
			
			$sql = "
				SELECT *, team.userId AS userId FROM team
				LEFT JOIN user ON team.userId = user.userId
				WHERE courseModuleId = '".$courseModuleId."'
					AND teamNumber = '".$teamNumber."'
				ORDER BY teamNumber ASC, lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
				// exit;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);
			}
			
			
			return $result;
		}
		
		public function Team()
		{
			if($this->getCourseModuleId()==''){
				$sql = "
				SELECT *, team.userId AS userId FROM team
				LEFT JOIN user ON team.userId = user.userId
				WHERE courseModuleId = '".$this->coursemoduleId."'
					AND teamNumber = '".$this->teamNumber."'
				ORDER BY teamNumber ASC, lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
			}else{
				$sql = "
				SELECT *, team.userId AS userId FROM team
				LEFT JOIN user ON team.userId = user.userId
				WHERE courseModuleId = '".$this->getCourseModuleId()."'
					AND teamNumber = '".$this->teamNumber."'
				ORDER BY teamNumber ASC, lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
			}
			// echo  
				// exit;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			foreach($result as $key => $res)
			{
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);
			}
			return $result;
		}	

		public function TeamsScore()
		{
		}	
		
		public function NoTeam()
		{
			$sql = "SELECT 
						user_subject.alumnoId,
						user.*, 
						user_subject.status AS status,
						'Ordinario' AS situation 
					FROM user_subject
						LEFT JOIN user 
							ON user_subject.alumnoId = user.userId
					WHERE courseId = " . $this->getCourseId() . " AND user_subject.status = 'activo'
					UNION 
					SELECT 
						usr.alumnoId,
						u.*,
						usr.status,
						'Recursador' AS situation
					FROM user_subject_repeat usr 
						LEFT JOIN user u 
							ON usr.alumnoId = u.userId 
					WHERE usr.courseId = " . $this->getCourseId() . " AND usr.status = 'activo' AND usr.courseModuleId = " . $this->coursemoduleId . "
					ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				
				if($this->getCourseModuleId() == ''){
					$this->Util()->DB()->setQuery("
					SELECT COUNT(*)
					FROM team
					WHERE userId = '".$res["alumnoId"]."' AND courseModuleId = '".$this->coursemoduleId."'");
				
				}else{
					$this->Util()->DB()->setQuery("
					SELECT COUNT(*)
					FROM team
					WHERE userId = '".$res["alumnoId"]."' AND courseModuleId = '".$this->getCourseModuleId()."'");
				
				}
				
				
				
				$inTeam = $this->Util()->DB()->GetSingle();
				
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);
				
				if($inTeam > 0)
				{
					unset($result[$key]);
				}
				
			}
			return $result;
		}	
		
		public function actaCalificacion()
		{
			
			// echo $this->tipoMajor;
			// exit;
			
			$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE user_subject.status = 'activo' and courseId = '".$this->getCourseId()."'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			$student = New Student;
			foreach($result as $key => $res)
			{
				 $sql = "
					SELECT *
					FROM course_module_score
					WHERE courseModuleId = '".$this->coursemoduleId."' and userId = ".$res["alumnoId"]." and courseId = ".$res["courseId"]."";

				$this->Util()->DB()->setQuery($sql);
				$infoCc = $this->Util()->DB()->GetRow();
	
				// CALCULA ACUMULADO
					$activity = new Activity;
					$activity->setCourseModuleId($this->coursemoduleId);
					$actividades = $activity->Enumerate();
					$this->Util()->DB()->setQuery("
						SELECT teamNumber
						FROM team
						WHERE courseModuleId = '".$this->coursemoduleId."' AND userId = '".$res["alumnoId"]."'");
					$result[$key]["equipo"] = $this->Util()->DB()->GetSingle();
					
					$result[$key]{"addepUp"} = 0;
					foreach($actividades as $activity)
					{
						if($activity["score"] <= 0)
						{
							continue;
						}
						//revisar calificacion
						 $sqlca = "
							SELECT ponderation
							FROM activity_score
							WHERE activityId = '".$activity["activityId"]."' AND userId = '".$res["alumnoId"]."'";
							
						// echo '<br>';
						// echo '<br>';
						
						$this->Util()->DB()->setQuery($sqlca);
						$score = $this->Util()->DB()->GetSingle();

						$result[$key]{"score"}[] = $score;
						$realScore = $score * $activity["score"] / 100;
						$result[$key]{"realScore"}[] = $realScore;
						
						$result[$key]{"addepUp"} += $realScore;
					}
				
				
				if($infoCc["calificacion"]==null or $infoCc["calificacion"]==0){
					
					$at = $result[$key]{"addepUp"} / 10;
					// echo $res["alumnoId"].'__'.$result[$key]{"addepUp"}.'__'.'__'.$at;
					// echo '<br>';
					if($this->tipoMajor == "MAESTRIA" and $at < 7){
						$at= floor ($at);
					}
					else if($this->tipoMajor == "DOCTORADO" and $at < 8){
						$at= floor ($at);
					}
					else{
						$at= round($at, 0, PHP_ROUND_HALF_DOWN);
					}
					$infoCc["calificacion"] = $at ;
					
				}else{
					$infoCc["calificacion"] = $infoCc["calificacion"];
				}
				
				if($this->tipoMajor == "MAESTRIA" and $infoCc["calificacion"] < 7){
					$result[$key]["score"] = 6;
				}
				else if($this->tipoMajor == "DOCTORADO" and $infoCc["calificacion"] < 8){
					$result[$key]["score"] = 7;
				}
				else{
					$result[$key]["score"] = $infoCc["calificacion"];
				}
				

				
			}
			// exit;
			
			// echo "<pre>"; print_r($result);
			// exit;
			return $result;
		}	
		
		function GetTeamNumber()
		{
			if ($this->getCourseModuleId() == ''){
				$sql = "
					SELECT MAX(teamNumber)
					FROM team
					WHERE courseModuleId = '".$this->coursemoduleId."'";
			}
			else{
				$sql = "
					SELECT MAX(teamNumber)
					FROM team
					WHERE courseModuleId = '".$this->getCourseModuleId()."'";
			}
			
			$this->Util()->DB()->setQuery($sql);
			$max = $this->Util()->DB()->GetSingle() + 1;
			return $max;	
		}

		function DeleteTeam($id)
		{
			$sql = "DELETE FROM team WHERE courseModuleId = " . $this->coursemoduleId . " AND teamNumber = " . $id;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->DeleteData();
			$this->Util()->setError(90000, 'complete', "Se ha borrado el equipo");
			$this->Util()->PrintErrors();
			
		}

		function GetNumberOfTeams()
		{
			$this->Util()->DB()->setQuery("
					SELECT COUNT(DISTINCT(teamNumber))
					FROM team
					WHERE courseModuleId = '".$this->getCourseModuleId()."'");
			$no = $this->Util()->DB()->GetSingle();
			return $no;	
		}

		public function CreateTeam($team)
		{
			$teamNumber = $this->GetTeamNumber();
			foreach($team as $member)
			{
				$sql = "INSERT INTO
							team
							( 	
								userId,
								courseModuleId,
								teamNumber
							)
						VALUES (
								'" . utf8_decode($member) . "', 
								'" . utf8_decode($this->coursemoduleId) . "',
								'" . $teamNumber . "'
								)";
				$this->Util()->DB()->setQuery($sql);
				$result = $this->Util()->DB()->InsertData();
			}
			$this->Util()->setError(90000, 'complete', "Se ha creado un nuevo equipo");
			$this->Util()->PrintErrors();
		}

		function GetMenWomen($group)
		{
			$count["m"] = 0;
			$count["f"] = 0;
			$count["t"] = 0;
			if($group)
			{
				foreach($group as $alumn)
				{
					if($alumn["sexo"] == "m")
					{
						$count["m"]++;
					}
					if($alumn["sexo"] == "f")
					{
						$count["f"]++;
					}
					$count["t"] = $count["m"] + $count["f"];
				}
			}
			return $count;
		}
		
		function SendMailTeam()
		{
			$mails = explode(",", $_POST["list_roles"]);
			$sendmail = new Sendmail;
			
			$message[4]["subject"] = $_POST["subject"];
			$message[4]["body"] = $this->Util()->DecodeTiny($_POST["body"]);
			$details_body = array();
			$details_subject = array();

		foreach($mails as $mail)
			{
				$sendmail->Prepare($message[4]["subject"], $message[4]["body"], $details_body, $details_subject, $mail, $mail, $_FILES["file"]["tmp_name"], $_FILES["file"]["name"]); 						
			}
			

			$student = new Student;
			$student->setUserId($_SESSION["User"]["userId"]);
			$info = $student->InfoUser();

			$name = $info["names"]." ".$info["lastNamePaterno"]." ".$info["lastNameMaterno"];
			
			$sendmail->PrepareMulti($message[4]["subject"], $message[4]["body"], $details_body, $details_subject, $_POST["list_roles"], $mail, $_FILES["file"]["tmp_name"], $_FILES["file"]["name"], $info["email"], $name); 						
			
			$this->Util()->setError(90000, 'complete', "Has enviado un correo correctamente");
			$this->Util()->PrintErrors();
			
			
		}
		
		function EditCalificacion()
		{
			
			
			// echo '<pre>'; print_r($_SESSION);nombreCompleto
			// exit;
			foreach($_POST as $key=>$aux){ 
				
				$e = explode("_",$key);
				if($e[0]=="cal"){
					
					if($aux>=11){
						echo 'fail[#]';
						echo '<font color="red">La calificacion del alumno '.$e[1].' es mayor a 10</font>';
						exit;
					}
					
					if (strpos($aux, '.') !== false) {
						echo 'fail[#]';
						echo '<font color="red">La calificacion del alumno '.$e[1].' tiene decimales</font>';
						exit;
					}
				}
				
			}
			
			// exit;
			$this->Util()->DB()->setQuery("
					SELECT *
					FROM course_module
					WHERE courseModuleId = '".$this->coursemoduleId."'");
			$info = $this->Util()->DB()->GetRow();

			foreach($_POST as $key=>$aux){ 
				
				$e = explode("_",$key);
				if($e[0]=="cal"){
					
					$this->Util()->DB()->setQuery("
					SELECT *
					FROM course_module_score
					WHERE courseModuleId = '".$this->coursemoduleId."' and userId = ".$e[1]." and courseId = ".$info["courseId"]."");
					$infoCc = $this->Util()->DB()->GetRow();
					
					if($infoCc["courseModuleScoreId"] <= 0){
						
						$sql = "
							INSERT INTO  `course_module_score` (
								`courseModuleId` ,
								`courseId` ,
								`userId` ,
								`calificacion`
								)
								VALUES (
								'".$this->coursemoduleId."',  
								'".$info["courseId"]."',  
								'".$e[1]."',  
								'".$aux."')";
						$this->Util()->DB()->setQuery($sql);
						$result = $this->Util()->DB()->InsertData();
						
					}else{
						$this->Util()->DB()->setQuery("
								UPDATE `course_module_score` SET
									`calificacion` = '".$aux."'
								WHERE
									`courseModuleScoreId` = '".$infoCc["courseModuleScoreId"]."'");
							$this->Util()->DB()->UpdateData();	
					}
					
				}
			}
			// deshabilitamos el calificar otra vez
			$this->Util()->DB()->setQuery("
								UPDATE `course_module` SET
									`habilitarCalificar` = 'no'
								WHERE
									`courseModuleId` = '".$this->coursemoduleId."'");
			$this->Util()->DB()->UpdateData();	
			
			
			$this->Util()->DB()->setQuery("
					SELECT 
						*,
						sm.name as materia,
						s.name as carrera
					FROM 
						course_module as cm
					left join subject_module as sm on sm.subjectModuleId = cm.subjectModuleId
					left join subject as s on s.subjectId = sm.subjectId
					left join course as c on c.courseId = cm.courseId
					WHERE cm.courseModuleId = ".$this->coursemoduleId."");
			$infoSub = $this->Util()->DB()->GetRow();
			
			$this->Util()->DB()->setQuery("
					SELECT *
					FROM personal
					WHERE perfil = 'Administrador'");
			$lstAdmins = $this->Util()->DB()->GetResult();
			
			// echo '<pre>'; print_r($_SESSION);nombreCompleto
			// exit;
			$notificacion = new Notificacion;
			$sendmail = new SendMail;
			
			//guardamos notificacion
			$actividads = "El Docente ".$_SESSION['User']['nombreCompleto']." de la materia ".$infoSub['materia']." del grupo ".$infoSub['group']." del posgrado ".$infoSub['carrera']." actualizo el acta de calificaciones";
			$vistas = "1p,".$lstAdmins[0]['personalId']."p";
			
			$notificacion->setActividad($actividads);
			$notificacion->setVista($vistas);
			$notificacion->setHecho($_SESSION["User"]["userId"]."p");
			$notificacion->setTablas('course_module_score');
			$notificacion->setEnlace('/edit-modules-course/id/'.$this->coursemoduleId);
			$notificacion->saveNotificacion();
			
			
			$resposeHtml .= '<br><br><br><br>';
			$resposeHtml .= $actividads;
			$sendmail->PrepareAttachment("Actualizacion en Acta de Calificaciones",$resposeHtml, "","", "dacademica@iapchiapas.org.mx", "Administrador", $attachment, $fileName);
			$sendmail->PrepareAttachment("Actualizacion en Acta de Calificaciones",$resposeHtml, "", "", "enlinea@iapchiapas.org.mx", "Administrador", $attachment, $fileName);
			
			

			return true;
		}
		
		function validarCalificacion()
		{
			$this->Util()->DB()->setQuery("
								UPDATE `course_module` SET
									`calificacionValida` = 'si'
								WHERE
									`courseModuleId` = '".$this->coursemoduleId."'");
							$this->Util()->DB()->UpdateData();	
			return true;
		}
		
		
		function habilitarEdicion()
		{
			$this->Util()->DB()->setQuery("
								UPDATE `course_module` SET
									`habilitarCalificar` = 'si'
								WHERE
									`courseModuleId` = '".$this->coursemoduleId."'");
							$this->Util()->DB()->UpdateData();	
							
			$this->Util()->DB()->setQuery("
					SELECT 
						*
					FROM 
						course_module
					WHERE courseModuleId = ".$this->coursemoduleId."");
			$infoSub = $this->Util()->DB()->GetRow();
			
			@unlink(DOC_ROOT."/docentes/calificaciones/".$infoSub['rutaActa']);
			
			$this->Util()->DB()->setQuery("
								UPDATE `course_module` SET
									`rutaActa` = ''
								WHERE
									`courseModuleId` = '".$this->coursemoduleId."'");
							$this->Util()->DB()->UpdateData();	
							
			
			return true;
		}
		
		function saveNumReferencia()
		{
			
			foreach ($_POST as $key=>$aux){
				
				$k = explode('_',$key);
				if($k[0]=='num'){
					$this->Util()->DB()->setQuery("
						UPDATE `user` SET
							`referenciaBancaria` = '".$aux."'
						WHERE
							`userId` = '".$k[1]."'");
						$this->Util()->DB()->UpdateData();
				}
			}
				
			
			return true;
		
		}
		
		
		
		function saveMatricula()
		{
			$courseId = $_POST['course'];
			foreach ($_POST['students'] as $key => $aux)
			{
				$sql = "UPDATE user_subject SET matricula = '" . $aux . "' WHERE alumnoId = " . $key . " AND courseId = " . $courseId;
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData();
			}
			return true;
		}
		
		function upFile($Id)
		{
			
			// echo '<pre>'; print_r($_FILES);
			// echo '<pre>'; print_r($_POST);
			// exit;
			$archivo = 'archivos';
			foreach($_FILES as $key=>$var)
			{
			   switch($key)
			   {
				   case $archivo:
				   if($var["name"]<>""){
						$aux = explode(".",$var["name"]);
						$extencion=end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;				
						$foto_name="acta_".$Id.".".$extencion;		
						if(move_uploaded_file($temporal,$url."/docentes/calificaciones/".$foto_name)){									
							$sql = 'UPDATE 		
								course_module SET 		
								rutaActa = "'.$foto_name.'"			      		
								WHERE courseModuleId = '.$Id.'';		
							$this->Util()->DB()->setQuery($sql);		
							$this->Util()->DB()->UpdateData();
					   }
					}
					break;
				}
			}
			
			unset($_FILES);
			
			return true;
		}	
		
		
		function onSendCarta($Id)
		{
			
			// echo '<pre>'; print_r($_FILES);
			// echo '<pre>'; print_r($_POST);
			// exit;
			$archivo = 'cedula';
			foreach($_FILES as $key=>$var)
			{
			   switch($key)
			   {
				   case $archivo:
				   if($var["name"]<>""){
						$aux = explode(".",$var["name"]);
						$extencion=end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;				
						$foto_name="carta_".$Id.".".$extencion;		
						if(move_uploaded_file($temporal,$url."/docentes/carta/".$foto_name)){									
							$sql = 'UPDATE 		
								course_module SET 		
								rutaCarta = "'.$foto_name.'"			      		
								WHERE courseModuleId = '.$Id.'';		
							$this->Util()->DB()->setQuery($sql);		
							$this->Util()->DB()->UpdateData();
					   }
					}
					break;
				}
			}
			
			unset($_FILES);
			
			return true;
		}	
		
		
		
		function onSendInforme($Id)
		{
			
			// echo '<pre>'; print_r($_FILES);
			// echo '<pre>'; print_r($_POST);
			// exit;
			$archivo = 'cedula';
			foreach($_FILES as $key=>$var)
			{
			   switch($key)
			   {
				   case $archivo:
				   if($var["name"]<>""){
						$aux = explode(".",$var["name"]);
						$extencion=end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;				
						$foto_name="info_".$Id.".".$extencion;		
						if(move_uploaded_file($temporal,$url."/docentes/informe/".$foto_name)){									
							$sql = 'UPDATE 		
								course_module SET 		
								rutaInforme = "'.$foto_name.'"			      		
								WHERE courseModuleId = '.$Id.'';		
							$this->Util()->DB()->setQuery($sql);		
							$this->Util()->DB()->UpdateData();
					   }
					}
					break;
				}
			}
			
			unset($_FILES);
			
			return true;
		}	
		
		function onSendEncuadre($Id)
		{
			
			// echo '<pre>'; print_r($_FILES);
			// echo '<pre>'; print_r($_POST);
			// exit;
			$archivo = 'cedula';
			foreach($_FILES as $key=>$var)
			{
			   switch($key)
			   {
				   case $archivo:
				   if($var["name"]<>""){
						$aux = explode(".",$var["name"]);
						$extencion=end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;				
						$foto_name="encuadre_".$Id.".".$extencion;		
						if(move_uploaded_file($temporal,$url."/docentes/encuadre/".$foto_name)){									
							$sql = 'UPDATE 		
								course_module SET 		
								rutaEncuadre = "'.$foto_name.'"			      		
								WHERE courseModuleId = '.$Id.'';		
							$this->Util()->DB()->setQuery($sql);		
							$this->Util()->DB()->UpdateData();
					   }
					}
					break;
				}
			}
			
			unset($_FILES);
			
			return true;
		}	
		
		
		function onSendRubrica($Id)
		{
			
			// echo '<pre>'; print_r($_FILES);
			// echo '<pre>'; print_r($_POST);
			// exit;
			$archivo = 'cedula';
			foreach($_FILES as $key=>$var)
			{
			   switch($key)
			   {
				   case $archivo:
				   if($var["name"]<>""){
						$aux = explode(".",$var["name"]);
						$extencion=end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;				
						$foto_name="rubrica_".$Id.".".$extencion;		
						if(move_uploaded_file($temporal,$url."/docentes/rubrica/".$foto_name)){									
							$sql = 'UPDATE 		
								course_module SET 		
								rutaRubrica = "'.$foto_name.'"			      		
								WHERE courseModuleId = '.$Id.'';		
							$this->Util()->DB()->setQuery($sql);		
							$this->Util()->DB()->UpdateData();
					   }
					}
					break;
				}
			}
			
			unset($_FILES);
			
			return true;
		}	
		
		
		function onChangePicture($Id)
		{
			
			// echo '<pre>'; print_r($_FILES);
			// echo '<pre>'; print_r($_POST);
			// exit;
			$archivo = 'archivos';
			foreach($_FILES as $key=>$var)
			{
			   switch($key)
			   {
				   case $archivo:
				   if($var["name"]<>""){
						$aux = explode(".",$var["name"]);
						$extencion=end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;				
						$foto_name="personal_foto/".$Id.".".$extencion;		
						if(move_uploaded_file($temporal,$url."/".$foto_name)){	
							
							$foto_names = $Id.".".$extencion;
							$minFoto = $foto_names;
							$this->resizeImagen($url.'/personal_foto/', $foto_names, 340, 340,$minFoto,$extencion);
							
							$sql = 'UPDATE 		
								personal SET 		
								foto = "'.$foto_name.'"			      		
								WHERE personalId = '.$Id.'';		
							$this->Util()->DB()->setQuery($sql);		
							$this->Util()->DB()->UpdateData();
					   }
					}
					break;
				}
			}
			
			unset($_FILES);
			
			return true;
		}
		
		function onSaveCarta($Id)
		{
			
			 $sql = 'UPDATE 		
							course_module SET 		
							perfilParticipante = "'.$this->perfilParticipante.'",			      		
							duracion = "'.$this->duracion.'",			      		
							numParticipantes = "'.$this->numParticipantes.'",			      		
							horario = "'.$this->horario.'",			      		
							objetivoParticular = "'.$this->objetivoParticular.'",				      		
							estructuraTematica = "'.$this->estructuraTematica.'",			      		
							criteriosEvaluacion = "'.$this->criteriosEvaluacion.'",		      		
							tecnicas = "'.$this->tecnicas.'",			      		
							bibliografias = "'.$this->bibliografias.'"			      		
							WHERE courseModuleId = '.$Id.'';		
						$this->Util()->DB()->setQuery($sql);		
						$this->Util()->DB()->UpdateData();
						
			return true;
			
		}
		
		public function  getGrupo($Id)
		{
			
			$this->Util()->DB()->setQuery("
				SELECT *
				FROM course_module
				WHERE courseModuleId = '".$Id."'");
			$info = $this->Util()->DB()->GetRow();
			
			$sql = "SELECT 
						user.*, 
						user_subject.status AS status,
						'Ordinario' AS situation
					FROM user_subject
						LEFT JOIN user 
							ON user_subject.alumnoId = user.userId
					WHERE user_subject.status = 'activo' AND courseId = " . $info['courseId'] . "
					UNION 
					SELECT 
						user.*, 
						usr.status,
						'Recursador' AS situation
					FROM user_subject_repeat usr 
						LEFT JOIN user 
							ON usr.alumnoId = user.userId
					WHERE usr.status = 'activo' AND usr.courseModuleId = " . $Id . "
					ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
			//echo $sql; exit;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			return $result;
	
		}
		
		
		
	
	function resizeImagen($ruta, $nombre, $alto, $ancho,$nombreN,$extension){
		
		$rutaImagenOriginal = $ruta.$nombre;
		if($extension == 'GIF' || $extension == 'gif'){
		$img_original = imagecreatefromgif($rutaImagenOriginal);
		}
		if($extension == 'jpg' || $extension == 'JPG'){
		$img_original = imagecreatefromjpeg($rutaImagenOriginal);
		}
		if($extension == 'png' || $extension == 'PNG'){
		$img_original = imagecreatefrompng($rutaImagenOriginal);
		}
		$max_ancho = $ancho;
		$max_alto = $alto;
		list($ancho,$alto)=getimagesize($rutaImagenOriginal);
		$x_ratio = $max_ancho / $ancho;
		$y_ratio = $max_alto / $alto;
		if( ($ancho <= $max_ancho) && ($alto <= $max_alto) ){//Si ancho 
		$ancho_final = $ancho;
			$alto_final = $alto;
		} elseif (($x_ratio * $alto) < $max_alto){
			$alto_final = ceil($x_ratio * $alto);
			$ancho_final = $max_ancho;
		} else{
			$ancho_final = ceil($y_ratio * $ancho);
			$alto_final = $max_alto;
		}
		$tmp=imagecreatetruecolor($ancho_final,$alto_final);
		imagecopyresampled($tmp,$img_original,0,0,0,0,$ancho_final, $alto_final,$ancho,$alto);
		imagedestroy($img_original);
		$calidad=70;
		imagejpeg($tmp,$ruta.$nombreN,$calidad);
    
	}




	public function actaCalificacionRepeat()
	{
		$sql = "SELECT 
					*, 
					usr.status AS status,
					'Recursador' AS situation 
				FROM user_subject_repeat usr
					LEFT JOIN user u 
						ON usr.alumnoId = u.userId
				WHERE usr.status = 'activo' AND usr.courseId = " . $this->getCourseId() . " AND usr.courseModuleId = " . $this->coursemoduleId . "
				ORDER BY u.lastNamePaterno, u.lastNameMaterno, u.names";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		$student = New Student;
		foreach($result as $key => $res)
		{
			$sql = "SELECT *
					FROM course_module_score
					WHERE courseModuleId = " . $this->coursemoduleId . " AND userId = " . $res["alumnoId"] . " AND courseId = " . $res["courseId"];
			$this->Util()->DB()->setQuery($sql);
			$infoCc = $this->Util()->DB()->GetRow();
	
			// CALCULA ACUMULADO
			$activity = new Activity;
			$activity->setCourseModuleId($this->coursemoduleId);
			$actividades = $activity->Enumerate();
			$sql = "SELECT teamNumber
					FROM team
					WHERE courseModuleId = " . $this->coursemoduleId . " AND userId = " . $res["alumnoId"];
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["equipo"] = $this->Util()->DB()->GetSingle();	
			$result[$key]{"addepUp"} = 0;
			foreach($actividades as $activity)
			{
				if($activity["score"] <= 0)
					continue;
				$sqlca = "SELECT ponderation
							FROM activity_score
							WHERE activityId = " . $activity["activityId"] . " AND userId = " . $res["alumnoId"];
				$this->Util()->DB()->setQuery($sqlca);
				$score = $this->Util()->DB()->GetSingle();
				$result[$key]{"score"}[] = $score;
				$realScore = $score * $activity["score"] / 100;
				$result[$key]{"realScore"}[] = $realScore;
				$result[$key]{"addepUp"} += $realScore;
			}
			
			if($infoCc["calificacion"] == null or $infoCc["calificacion"] == 0)
			{	
				$at = $result[$key]{"addepUp"} / 10;
				if($this->tipoMajor == "MAESTRIA" and $at < 7)
					$at= floor ($at);
				else if($this->tipoMajor == "DOCTORADO" and $at < 8)
					$at= floor ($at);
				else
					$at= round($at, 0, PHP_ROUND_HALF_DOWN);
				$infoCc["calificacion"] = $at ;
			}else
				$infoCc["calificacion"] = $infoCc["calificacion"];
			
			if($this->tipoMajor == "MAESTRIA" and $infoCc["calificacion"] < 7)
				$result[$key]["score"] = 6;
			else if($this->tipoMajor == "DOCTORADO" and $infoCc["calificacion"] < 8)
				$result[$key]["score"] = 7;
			else
				$result[$key]["score"] = $infoCc["calificacion"];
		}
		return $result;
	}
		
}	
?>