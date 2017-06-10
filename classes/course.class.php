<?php

	class Course extends Subject
	{
		private $ponenteText;
		public function setPonenteText($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Texto Ponente');
			$this->ponenteText = $value;
		}

		private $fechaDiploma;
		public function setFechaDiploma($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Fecha Diploma');
			$this->fechaDiploma = $value;
		}

		private $backDiploma;
		public function setBackDiploma($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Parte trasera del diploma');
			$this->backDiploma = $value;
		}

		private $folio;
		public function setFolio($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Folio');
			$this->folio = $value;
		}

		private $libro;
		public function setLibro($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Libro');
			$this->libro = $value;
		}

		private $group;

		public function setGroup($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Grupo');
			$this->group = $value;
		}

		public function getGroup()
		{
			return $this->group;
		}

		private $turn;

		public function setTurn($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Turno');
			$this->turn = $value;
		}

		public function getTurn()
		{
			return $this->turn;
		}

		private $scholarCicle;

		public function setScholarCicle($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Ciclo Escolar');
			$this->scholarCicle = $value;
		}

		public function getScholarCicle()
		{
			return $this->scholarCicle;
		}

		private $modality;

		public function setModality($value)
		{
			//$this->Util()->ValidateString($value, 255, 1, 'Modalidad');
			$this->modality = $value;
		}

		public function getModality()
		{
			return $this->modality;
		}
		
		private $initialDate;

		public function setInitialDate($value)
		{
			$this->Util()->ValidateString($value, 255, 1, 'Fecha Inicial');
			$value = $this->Util()->FormatDateMySql($value);
			
			$explode = explode("-", $value);
			if(strlen($explode[0]) == 2)
			{
				$value = $this->Util()->FormatDateBack($value);
			}
			
			$this->initialDate = $value;
		}

		public function getInitialDate()
		{
			return $this->initialDate;
		}

		private $finalDate;

		public function setFinalDate($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Fecha Final');
			$value = $this->Util()->FormatDateMySql($value);

			$explode = explode("-", $value);
			if(strlen($explode[0]) == 2)
			{
				$value = $this->Util()->FormatDateBack($value);
			}

			$this->finalDate = $value;
		}

		public function getFinalDate()
		{
			return $this->finalDate;
		}

		private $daysToFinish;

		public function setDaysToFinish($value)
		{
			$this->Util()->ValidateInteger($value, 3000, 0);
			$this->daysToFinish = $value;
		}

		public function getDaysToFinish()
		{
			return $this->daysToFinish;
		}


		private $personalId;

		public function setPersonalId($value)
		{
			$this->Util()->ValidateInteger($value);
			$this->personalId = $value;
		}

		public function getPersonalId()
		{
			return $this->personalId;
		}

		private $teacherId;

		public function setTeacherId($value)
		{
			$this->Util()->ValidateInteger($value);
			$this->teacherId = $value;
		}

		public function getTeacherId()
		{
			return $this->teacherId;
		}

		private $tutorId;

		public function setTutorId($value)
		{
			$this->Util()->ValidateInteger($value);
			$this->tutorId = $value;
		}

		public function getTutorId()
		{
			return $this->tutorId;
		}

		private $extraId;

		public function setExtraId($value)
		{
			$this->Util()->ValidateInteger($value);
			$this->extraId = $value;
		}

		public function getExtraId()
		{
			return $this->extraId;
		}

		private $active;
		
		public function setActive($value)
		{
			$this->Util()->ValidateString($value, 10, 1, 'Activo');
			$this->active = $value;
		}

		public function getActive()
		{
			return $this->active;
		}
		
		private $courseId;
		public function setCourseId($value)
		{
			$this->Util()->ValidateInteger($value);
			$this->courseId = $value;
			//echo $this->courseId;
		}

		public function getCourseId()
		{
			return $this->courseId;
		}
		

		public function EnumerateCount()
		{
			$this->Util()->DB()->setQuery("SELECT COUNT(*) FROM course");
			return $this->Util()->DB()->GetSingle();
		}


		  public function Infocoursem(){
		  $sql="SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo where course.courseId='".$this->courseId."' "; 
		  $this->Util()->DB()->setQuery($sql);
		  $datos=$this->Util()->DB()->GetResult();
		  
		  foreach($datos as $dato){
		    $majorName=$dato['majorName']; }
		  return $majorName;
		  
		  }
		  		  
		public function EnumerateByPage($currentPage, $rowsPerPage, $pageVar, $pageLink, &$arrPages)
		{
			//variable donde guardaremos los registros de la pagina actual y que se regresara para su visualizacion
			$result = NULL;

			// Verificar que este definido el metodo CountTotalRows en esta clase
			//$totalTableRows...total de registros que hay en la tabla, usado para calcular el numero de paginas
			$totalTableRows = $this->EnumerateCount();

			//***calculamos el numero total de paginas, si hay fracciones es porque los ultimos 
			//		registros no completan la pagina ($rowsPerPage) pero se calculan como una pagina mas con ceil()
			$totalPages = ceil($totalTableRows / $rowsPerPage);

			//validamos el valor de la pagina...no puede ser menor a 1 ni mayor al total de las paginas
			if($currentPage < 1)
				$currentPage = 1;
			if($currentPage > $totalPages)
				$currentPage = $totalPages;

			// ***calculamos y guardamos el numero de registro inicial que se va a rcuperar
			$arrPages['rowBegin']	= ($currentPage * $rowsPerPage) - $rowsPerPage + 1 ;
			//calcular el desplazamiento de los registros a recuperar
			$rowOffset = $arrPages['rowBegin'] - 1;
			
			$sql = '
				SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				ORDER BY subject.tipo,  subject.name,  course.modality, initialDate DESC LIMIT ' . $rowOffset . ', ' . $rowsPerPage;
			
			// exit;
			$this->Util()->DB()->setQuery($sql);
			
			$result = $this->Util()->DB()->GetResult();
			//echo "<pre>".print_r($result)."</pre>";exit;
			
			foreach($result as $key => $res)
			{
				$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM subject_module WHERE subjectId ='".$res["subjectId"]."'");
			
				$result[$key]["modules"] = $this->Util()->DB()->GetSingle();

				$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM user_subject WHERE courseId ='".$res["courseId"]."' AND status = 'inactivo'");
				$result[$key]["alumnInactive"] = $this->Util()->DB()->GetSingle();
				
				$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM user_subject WHERE courseId ='".$res["courseId"]."' AND status = 'activo'");
			
				$result[$key]["alumnActive"] = $this->Util()->DB()->GetSingle();

				$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM course_module WHERE courseId ='".$res["courseId"]."' AND active = 'si'");
				$result[$key]["courseModuleActive"] = $this->Util()->DB()->GetSingle();
					
				$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM course_module WHERE courseId ='".$res["courseId"]."'");
			
				$result[$key]["courseModule"] = $this->Util()->DB()->GetSingle();
				
			}
			
			//print_r($result);
			//$countPageRows...total de registros recuperados en la pagina actual, 
			$countPageRows = count($result);
			//***guardamos el numero de registros recuperados en la pagina actual
			$arrPages['countPageRows'] = $countPageRows;
			//***calculamos y guardamos el numero de registro final que se va a recuperar
			$arrPages['rowEnd']		= $arrPages['rowBegin'] + $countPageRows - 1;
			//***guardamos el numero total de registros que hay en la tabla
			$arrPages['totalTableRows'] = $totalTableRows;
			//***guardamos los registros por pagina a mostrar
			$arrPages['rowsPerPages'] = $rowsPerPages;
			//***guardamos la pagina actual que estamos mostrando
			$arrPages['currentPage'] = $currentPage;
			//***guardamos el total de paginas
			$arrPages['totalPages']	= $totalPages;

			//***por default los enlaces inicio y anterior estan vacios
			$arrPages['startPage'] = '';
			$arrPages['previusPage'] = '';
			if($currentPage > 1)
			{
				//***si la pagina actual es mayor a 1, se activa el enlace anterior
				$arrPages['previusPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage - 1);
				//***si la pagina actual es mayor a 2, se activa el enlace inicio
				if($currentPage > 2)
					$arrPages['startPage'] = $pageLink . '/' . $pageVar . '/' . '1';
			}
			//***por default los enlaces siguiente y fin estan vacios
			$arrPages['nextPage'] = '';
			$arrPages['endPage'] = '';
			if($currentPage < $arrPages['totalPages'])
			{
				//***si la pagina actual es menor al total de paginas, se activa el enlace siguiente
				$arrPages['nextPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage + 1);
				//***si la pagina actual es menor al (total de paginas - 1), se activa el enlace fin
				if($currentPage < ($arrPages['totalPages'] - 1))
					$arrPages['endPage'] = $pageLink . '/' . $pageVar . '/' . $arrPages['totalPages'];
			}
			//enlace hacia la misma pagina para poder actualizar los valores de los datos
			$arrPages['refreshPage'] = $pageLink . '/' . $pageVar . '/' . $currentPage ;
			//regresamos los registros recuperados de la pagina actual
			return $result;
		}
				
		public function Open()
		{
			if($this->Util()->PrintErrors())
			{
				// si hay errores regresa false
				return false;
			}
			//si no hay errores
			//creamos la cadena de insercion
		 $sql = "INSERT INTO
						course
						( 	
						 	subjectId,
							initialDate,
							finalDate,
							daysToFinish,
							`group`,
							turn,
							scholarCicle,
							active,
							modality,
							libro,
							folio,
							access
						)
					VALUES (
							'" . $this->getSubjectId() . "',
							'" . $this->initialDate . "',
							'" . $this->finalDate . "',
							'" . $this->daysToFinish . "',
							'" . $this->group . "',
							'" . $this->turn . "',
							'" . $this->scholarCicle . "',
							'" . $this->active . "',
							'" . $this->modality . "',
							'" . $this->libro . "',
							'" . $this->folio . "',
							'".$this->personalId."|".$this->teacherId."|".$this->tutorId."|".$this->extraId."')";
			//configuramos la consulta con la cadena de insercion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$result = $this->Util()->DB()->InsertData();
			if($result > 0)
			{
				//si el resultado es mayor a cero, se inserto el nuevo registro con exito...se regresara true
				$result = true;
				$this->Util()->setError(90000, 'complete', "Se ha abierto un nuevo curso");
			}
			else
			{
				//si el resultado es cero, no se pudo insertar el nuevo registro...se regresara false
				$result = false;
				$this->Util()->setError(90010, 'error');
			}
			$this->Util()->PrintErrors();
			return $result;
		}
		

		public function Update()
		{
			if($this->Util()->PrintErrors())
			{
				// si hay errores regresa false
				return false;
			}
			//si no hay errores
//			print_r($this);
			//creamos la cadena de actualizacion
			$sql = "UPDATE 
						course
					SET
						subjectId='" 	. $this->getSubjectId() . "', 
						initialDate='" 	. $this->initialDate . "',
						finalDate='" 	. $this->finalDate . "',
						daysToFinish='" 	. $this->daysToFinish . "',
						active='" 	. $this->active . "',
						`group`='" 	. $this->group . "',
						turn='" 	. $this->turn . "',
						scholarCicle='" 	. $this->scholarCicle . "',
						folio='" 	. $this->folio . "',
						libro='" 	. $this->libro . "',
						backDiploma='" 	. $this->backDiploma . "',
						modality='" 	. $this->modality . "',
						ponenteText='" 	. $this->ponenteText . "',
						fechaDiploma='" 	. $this->fechaDiploma . "',
						access='".$this->personalId."|".$this->teacherId."|".$this->tutorId."|".$this->extraId."'
						WHERE courseId='" . utf8_decode($this->courseId) . "'";
			//configuramos la consulta con la cadena de actualizacion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y guardamos el resultado, que sera el numero de columnas afectadas
			$this->Util()->DB()->UpdateData();
			$result = 1;
			if($result > 0)
			{
				//si el resultado es mayor a cero, se actualizo el registro con exito
				$result = true;
				$this->Util()->setError(90002,'complete', 'El curso se ha actualizado correctamente');
			}
			else
			{
				//si el resultado es cero, no se pudo modificar el registro...se regresa false
				$result = false;
				$this->Util()->setError(90011,'error', "No se pudo modificar el curso");
			}
			$this->Util()->PrintErrors();
			return $result;
		}
		
		public function Delete()
		{
			if($this->Util()->PrintErrors())
			{
				// si hay errores regresa false
				return false;
			}
			//si no hay errores
			//creamos la cadena de eliminacion
			$sql = "DELETE FROM 
						course 
					WHERE 
						courseId='" . $this->courseId . "'";
			//configuramos la consulta con la cadena de eliminacion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y regresamos el resultado, que sera el numero de columnas afectadas
			$result = $this->Util()->DB()->DeleteData();
			if($result > 0)
			{
				//si el resultado es mayor a cero, se actualizo el registro con exito
				$result = true;
				$this->Util()->setError(90001,'complete', "Se ha eliminado el curso correctamente");
			}
			else
			{
				//si el resultado es cero, no se pudo modificar el registro...se regresa false
				$result = false;
				$this->Util()->setError(90012,'error');
			}
			$this->Util()->PrintErrors();
			return $result;
		}
		
		
		
		public function Info_modality()
		{
			//creamos la cadena de seleccion
			$sql = "SELECT 
						*, major.name AS majorName, subject.name AS name 
					FROM
						course
					LEFT JOIN subject ON subject.subjectId = course.subjectId
					LEFT JOIN major ON major.majorId = subject.tipo
					WHERE
						courseId='" . $this->courseId . "'   &&  modality='".$this->modality."'  ";
			//configuramos la consulta con la cadena de actualizacion
			
			//$sql="select ";
			
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y obtenemos el resultado
			$result = $this->Util()->DB()->GetRow();
			if($result)
			{
//				$result = $this->Util->EncodeRow($result);
			}

			$result["access"] = explode("|",$result["access"]);
			
			$user = new User;
			$user->setUserId($result["access"][0]);
			$info = $user->Info();
			$result["encargado"] = $info;
			return $result;	
		}
		
		
		
		public function Info()
		{
			//creamos la cadena de seleccion
			$sql = "SELECT 
						*, major.name AS majorName, subject.name AS name 
					FROM
						course
					LEFT JOIN subject ON subject.subjectId = course.subjectId
					LEFT JOIN major ON major.majorId = subject.tipo
					WHERE
						courseId='" . $this->courseId . "'";
			//configuramos la consulta con la cadena de actualizacion
			
			//$sql="select ";
			
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y obtenemos el resultado
			$result = $this->Util()->DB()->GetRow();
			if($result)
			{
//				$result = $this->Util->EncodeRow($result);
			}

			$result["access"] = explode("|",$result["access"]);
			
			$user = new User;
			$user->setUserId($result["access"][0]);
			$info = $user->Info();
			$result["encargado"] = $info;
			return $result;	
		}

		public function EnumerateAll()
		{
			
			$this->Util()->DB()->setQuery("
				SELECT *, major.name AS majorName, subject.name AS name FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				ORDER BY subject.tipo");
			$result = $this->Util()->DB()->GetResult();
			return $result;
		}
		
		public function EnumerateActive()
		{
			//TODO porque tenia IN(0) no logro recordar -> Para mostrar solo los cursos en donde si se pueden inscribir
//				WHERE course.active = 'si' AND courseId IN (0)

			$this->Util()->DB()->setQuery("
				SELECT *, major.name AS majorName, subject.name AS name FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				WHERE course.active = 'si' AND courseId IN (89,80,59,82,81)
				ORDER BY subject.tipo, subject.name, course.group");
				//echo $this->Util()->DB()->query;
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
				$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);
				
				$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;
				
				$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
			}
			return $result;
		}
		
		function EnumerateAlumn($courseId, $status)
		{
			$this->Util()->DB()->setQuery("
				SELECT * FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId 
				WHERE user_subject.courseId = '".$courseId."'
					AND user_subject.status = '".$status."'
				ORDER BY user.lastNamePaterno ASC, user.lastNameMaterno ASC, names ASC");
			$result = $this->Util()->DB()->GetResult();
			return $result;
		}

		function FreeCourseModules()
		{
			$info = $this->Info();
			$this->Util()->DB()->setQuery("
				SELECT * FROM subject_module
				WHERE subject_module.subjectId = '".$info["subjectId"]."'
				ORDER BY semesterId ASC, name ASC");
			$result = $this->Util()->DB()->GetResult();
			foreach($result as $key => $value)
			{
				$this->Util()->DB()->setQuery("
				SELECT * FROM course_module
				WHERE subjectModuleId = '".$value["subjectModuleId"]."' AND courseId = '".$this->courseId."'");
				$row = $this->Util()->DB()->GetRow();
				
				if($row)
				{
					unset($result[$key]);
				}
				
			}
			return $result;
		}

		function AddedCourseModules()
		{
			$info = $this->Info();
			
			$sql = "
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, name ASC";
			
			
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			return $result;
		}

			function AddedCourseModules_modality()
		{
			$info = $this->Info_modality();
			$this->Util()->DB()->setQuery("
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, name ASC");
			$result = $this->Util()->DB()->GetResult();
			return $result;
		}
		
		function StudentCourseModules()
		{
			$info = $this->Info();
			$this->Util()->DB()->setQuery("
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, initialDate ASC");
			$result = $this->Util()->DB()->GetResult();
			//print_r($result);exit;
			foreach($result as $key => $res)
			{
				$result[$key]["finalDate"]=$result[$key]["finalDate"]." 23:59:59";
				$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
				$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);
				
				$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;
				
				$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
				//echo $result[$key]["finalDateStamp"]."+".$toFinishSeconds."=".$result[$key]["daysToFinishStamp"]."<br/>" ;
				$student = new Student;
				$result[$key]["totalScore"] = $student->GetAcumuladoCourseModule($res["courseModuleId"]);
			}
			
//			print_r($result);
			return $result;
		}

		function AllActiveCourseModules()
		{
			$info = $this->Info();
			$this->Util()->DB()->setQuery("
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE active = 'si'
				ORDER BY courseModuleId ASC");
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
				$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);
				
				$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;
				
				$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
			}
			//print_r($result);
			return $result;
		}

			function HowManyCuatrimesters_modality()
		{
			$info = $this->Info_modality();
			
			$this->Util()->DB()->setQuery("
				SELECT DISTINCT(semesterId) FROM subject_module
				WHERE subjectId = '".$info["subjectId"]."' ORDER BY semesterId ASC");
			$result = $this->Util()->DB()->GetResult();
			return $result;
		}
		
		function HowManyCuatrimesters()
		{
			$info = $this->Info();
			
			$this->Util()->DB()->setQuery("
				SELECT DISTINCT(semesterId) FROM subject_module
				WHERE subjectId = '".$info["subjectId"]."' ORDER BY semesterId ASC");
			$result = $this->Util()->DB()->GetResult();
			return $result;
		}
		
	
}	
?>