<?php

	class Group extends Module
	{
		private $teamNumber;

		public function setTeamNumber($value)
		{
			$this->Util()->ValidateInteger($value,999,1);
			$this->teamNumber = $value;
		}

		function EditScore($modality, $id, $scores, $retros)
		{
			foreach($scores as $key => $score)
			{
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
							   $actividad="Se ha calificado la Actividad ".$infoActivity['resumen']." para ".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno']." Calificación(De ".$activityAnt['ponderation']." a ".number_format($score,2,'.','').")   Retroalimentación(De ".$activityAnt['retro']." a ".$retros[$key].")";;
									
									
								// echo $result;
							// echo $arch =  "fileRetro_".$retros[$key];
							
							// exit;
							foreach($_FILES as $keyf=>$varf)
							{
							   switch($keyf)
							   {
									case $arch:
										if($varf["name"]<>""){
											// $aux = explode(".",$varf["name"]);
											$target_path = DOC_ROOT."/file_retro/";
											$ext = end(explode('.', basename($varf['name'])));			
											$target_path = $target_path."".$ext; 
											$relative_path = $target_path."".$ext; 

											if(move_uploaded_file($varf['tmp_name'], $target_path)) 
											{
												$sql = "UPDATE 
															activity_score
															SET
																rutaArchivoRetro = '".$relative_path."'
															WHERE activityScoreId = '".$result."'";		
												$this->Util()->DB()->setQuery($sql);
												$this->Util()->DB()->UpdateData();
											}
										}
									break;
								}
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
							$result = $this->Util()->DB()->UpdateData();					
						
						
                       $hecho=$_SESSION['User']['userId']."p";				       
					   $vista="1p,".$hecho.",".$key."u";
				       $tablas="activity_score";
                       $enlace="/score-activity/id/".$id;
					   
                       if($activityAnt['ponderation']==number_format($score,2,'.','') &&  $activityAnt['retro']==$retros[$key])
                       $actividad="NO";                       
					   else					   
						 $actividad="Se ha modificado calificación en ".$infoActivity['resumen']." para ".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno']." Calificación(De ".$activityAnt['ponderation']." a ".number_format($score,2,'.','').")   Retroalimentación(De ".$activityAnt['retro']." a ".$retros[$key].")";
			          
					   
					   // print_r($enlace); exit;
						//print_r($actividad); exit;			   
						}
						
						//crear notificacion de actualizacion de calificaciones
						if($actividad!="NO"){
						  $notificacion= new Notificacion;
						  $notificacion->setActividad($actividad);
						  $notificacion->setVista($vista);
						  $notificacion->setHecho($hecho);
						  $notificacion->setTablas($tablas);
						  $notificacion->setEnlace($enlace);
						  
						  $notificacion->saveNotificacion();
						  
						}
						
						
						
						
						
					break;   //}
					default:
						$this->setTeamNumber($key);
						$members = $this->Team();
						foreach($members as $member)
						{
							//checar si ya hay calificacion
							$this->Util()->DB()->setQuery("
								SELECT COUNT(*)
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'");
							$count = $this->Util()->DB()->GetSingle();
							
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
										'".$member["userId"]."',  
										'".$id."',  
										'".$retros[$key]."',  
										'".$score."');");
								$this->Util()->DB()->InsertData();					
							}
							else
							{
								$this->Util()->DB()->setQuery("
									UPDATE `activity_score` SET
										`ponderation` = '".$score."'
									WHERE
										`userId` = '".$member["userId"]."' AND activityId = '".$id."' LIMIT 1");
								$this->Util()->DB()->UpdateData();					
							}
						}

				}
				
			}
			$this->Util()->setError(90000, 'complete', "Has modificado las calificaciones");
			$this->Util()->PrintErrors();			
		}
		
		public function ScoreGroup($modality, $type, $id)
		{
			switch($modality)
			{
				case "Individual":
					 $sql = "
						SELECT *, user_subject.status AS status FROM user_subject
						LEFT JOIN user ON user_subject.alumnoId = user.userId
						WHERE courseId = '".$this->getCourseId()."' and user_subject.status = 'activo'
						ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
					
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
							SELECT *
							FROM homework
							WHERE activityId = '".$id."' AND userId = '".$res["alumnoId"]."'");
						$result[$key]["homework"] = $this->Util()->DB()->GetRow();
				
					}
				break;				
				default: 
					$this->Util()->DB()->setQuery("
						SELECT teamNumber, teamId FROM team
						WHERE courseModuleId = '".$this->getCourseModuleId()."'
						GROUP BY teamNumber
						ORDER BY teamNumber ASC");
					$result = $this->Util()->DB()->GetResult();
					
					foreach($result as $key => $res)
					{
						//get all team members
						$this->setTeamNumber($res["teamNumber"]);
						$members = $this->Team();
						foreach($members as $member)
						{
							$this->Util()->DB()->setQuery("
								SELECT *
								FROM homework
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'");
							$result[$key]["homework"] = $this->Util()->DB()->GetRow();


							$this->Util()->DB()->setQuery("
								SELECT ponderation
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'");
							$result[$key]["ponderation"] = $this->Util()->DB()->GetSingle();

							$this->Util()->DB()->setQuery("
								SELECT retro
								FROM activity_score
								WHERE activityId = '".$id."' AND userId = '".$member["userId"]."'");
							$result[$key]["retro"] = $this->Util()->DB()->GetSingle();
if($result[$key]["homework"]) { break; }
						}
						
					}
					
					return $result;
				;
			}
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
	
			$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE courseId = '".$this->getCourseId()."' and user.activo='1' and user_subject.status='activo'
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
						
			//return $result;
			}
			
			
			foreach($result as $key => $res)
			{
				//get activities
				$activity = new Activity;
				$activity->setCourseModuleId($this->getCourseModuleId());
				$actividades = $activity->Enumerate();
				$result[$key]["names"] = $this->Util()->DecodeTiny($result[$key]["names"]);
				$result[$key]["lastNamePaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNamePaterno"]);
				$result[$key]["lastNameMaterno"] = $this->Util()->DecodeTiny($result[$key]["lastNameMaterno"]);

				$this->Util()->DB()->setQuery("
					SELECT teamNumber
					FROM team
					WHERE courseModuleId = '".$this->getCourseModuleId()."' AND userId = '".$res["alumnoId"]."'");
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
			$this->Util()->DB()->setQuery("
				SELECT teamNumber FROM team
				WHERE courseModuleId = '".$this->getCourseModuleId()."'
					AND userId = '".$userId."'");
			$teamNumber = $this->Util()->DB()->GetSingle();
			
			$this->setTeamNumber($teamNumber);
			$members = $this->Team();
			
			return $members;
		}

		public function Team()
		{
			$this->Util()->DB()->setQuery("
				SELECT *, team.userId AS userId FROM team
				LEFT JOIN user ON team.userId = user.userId
				WHERE courseModuleId = '".$this->getCourseModuleId()."'
					AND teamNumber = '".$this->teamNumber."'
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

		public function TeamsScore()
		{
		}	
		
		public function NoTeam()
		{
			$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE courseId = '".$this->getCourseId()."'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$this->getCourseModuleId();
				
				$this->Util()->DB()->setQuery("
					SELECT COUNT(*)
					FROM team
					WHERE userId = '".$res["alumnoId"]."' AND courseModuleId = '".$this->getCourseModuleId()."'");
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
		
		function GetTeamNumber()
		{
			$this->Util()->DB()->setQuery("
					SELECT MAX(teamNumber)
					FROM team
					WHERE courseModuleId = '".$this->getCourseModuleId()."'");
			$max = $this->Util()->DB()->GetSingle() + 1;
			return $max;	
		}

		function DeleteTeam($id)
		{
			$this->Util()->DB()->setQuery("
					DELETE FROM team
					WHERE courseModuleId = '".$this->getCourseModuleId()."' AND teamNumber = '".$id."'");
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
								'" . utf8_decode($this->getCourseModuleId()) . "',
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

/*			foreach($mails as $mail)
			{
				$sendmail->Prepare($message[4]["subject"], $message[4]["body"], $details_body, $details_subject, $mail, $mail, $_FILES["file"]["tmp_name"], $_FILES["file"]["name"]); 						
			}
			
*/
			$student = new Student;
			$student->setUserId($_SESSION["User"]["userId"]);
			$info = $student->InfoUser();

			$name = $info["names"]." ".$info["lastNamePaterno"]." ".$info["lastNameMaterno"];
			
			$sendmail->PrepareMulti($message[4]["subject"], $message[4]["body"], $details_body, $details_subject, $_POST["list_roles"], $mail, $_FILES["file"]["tmp_name"], $_FILES["file"]["name"], $info["email"], $name); 						
			
			$this->Util()->setError(90000, 'complete', "Has enviado un correo correctamente");
			$this->Util()->PrintErrors();
			
			
		}
	}	
?>