<?php

	class Course extends Subject
	{
		private $ponenteText;
		private $nombre;
		private $precio;
		private $idfire;
		private $id;
		private $dias;
		private $horario;
		private $aparece;
		private $listar;
		private $tarifa;
		private $tarifaDr;
		private $hora;
		private $activo;
		private $modalidad;
		private $curricula;
		private $subtotal;
		private $tipoCuatri;
		private $name;
		private $numero;
		
		
		public function setNumero($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Nombre ');
			$this->numero = $value;	
		}
		
		public function setName($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Nombre ');
			$this->name = $value;	
		}
		
		
		public function setTipoCuatri($value)
		{
			$this->tipoCuatri = $value;	
		}
		
		public function setSubtotal($value)
		{
			$this->subtotal = $value;	
		}
		
		public function setActivo($value)
		{
			$this->activo = $value;	
		}
		
		public function setModalidad($value)
		{
			$this->modalidad = $value;	
		}
		
		public function setCurricula($value)
		{
			$this->curricula = $value;	
		}
		
		public function setId($value)
		{
			$this->id = $value;	
		}
	
		public function setAparece($value)
		{
			// $this->Util()->ValidateString($value, 255, 0, 'Nombre');
			$this->aparece = $value;
		}
		
		public function setListar($value)
		{
			// $this->Util()->ValidateString($value, 255, 0, 'Nombre');
			$this->listar = $value;
		}
	
		public function setNombre($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Nombre');
			$this->nombre = $value;
		}
		
		public function setTarifa($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Tarifa');
			$this->tarifa = $value;
		}
		
		
		public function setTarifaDr($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Tarifa');
			$this->tarifaDr = $value;
		}
		
		public function setHora($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Hora');
			$this->hora = $value;
		}
		
		public function setDias($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Dias');
			$this->dias = $value;
		}
		
		public function setHorario($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Horario');
			$this->horario = $value;
		}
		
		public function setPrecio($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Precio');
			$this->precio = $value;
		}
		
		public function setFire($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'ID Fire');
			$this->idfire = $value;
		}
		
		public function setPonenteText($value)
		{
			$this->Util()->ValidateString($value, 255, 0, 'Texto Ponente');
			$this->ponenteText = $value;
		}

		private $fechaDi2ploma;
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
			
			$filtro = "";
			
			// if($this->aparece){
				// $filtro .= " and course.apareceTabla ='si'";
			// }
			
			 $sql =   "SELECT COUNT(*) FROM course";
			
			// exit;
			$this->Util()->DB()->setQuery($sql);
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
			
			$filtro = "";
			
			// if($this->aparece){
				// $filtro .= " and course.apareceTabla ='si'";
			// }
			
			
			if($this->activo){
				$filtro .= " and course.active ='".$this->activo."'";
			}
			
			
			if($this->modalidad){
				$filtro .= " and course.modality ='".$this->modalidad."'";
			}
			
			if($this->curricula){
				$filtro .= " and majorId ='".$this->curricula."'";
			}
			
			//variable donde guardaremos los registros de la pagina actual y que se regresara para su visualizacion
			$result = NULL;

			// Verificar que este definido el metodo CountTotalRows en esta clase
			//$totalTableRows...total de registros que hay en la tabla, usado para calcular el numero de paginas
			$totalTableRows = $this->EnumerateCount();

			//***calculamos el numero total de paginas, si hay fracciones es porque los ultimos 
			//		registros no completan la pagina ($rowsPerPage) pero se calculan como una pagina mas con ceil()
			@$totalPages = ceil($totalTableRows / $rowsPerPage);
			// exit;
			
			//validamos el valor de la pagina...no puede ser menor a 1 ni mayor al total de las paginas
			if($currentPage < 1)
				$currentPage = 1;
			if($currentPage > $totalPages)
				$currentPage = $totalPages;

			// ***calculamos y guardamos el numero de registro inicial que se va a rcuperar
			$arrPages['rowBegin']	= ($currentPage * $rowsPerPage) - $rowsPerPage + 1 ;
			//calcular el desplazamiento de los registros a recuperar
			$rowOffset = $arrPages['rowBegin'] - 1;
			
			if($rowOffset <0){
				
				$rowOffset = 0;
			}
			
			$sql = '
				SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				where 1 '.$filtro.'
				ORDER BY 
				FIELD (major.name,"MAESTRIA","DOCTORADO","CURSO","ESPECIALIDAD") asc, subject.name, modality desc, initialDate desc,  active
				
				LIMIT ' . $rowOffset . ', ' . $rowsPerPage;
			// exit;
			$this->Util()->DB()->setQuery($sql);
			
			$result = $this->Util()->DB()->GetResult();
			// echo "<pre>"; print_r($result);
			// exit;
			
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
		
		public function EnumerateCourse()
		{
			
			$filtro = "";
			
			if($this->aparece){
				$filtro .= " and course.apareceTabla ='si'";
			}
			
			
			
			$sql = '
				SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				where 1 '.$filtro.'
				ORDER BY subject.tipo,  subject.name,  course.modality, initialDate ';
			// exit;
			$this->Util()->DB()->setQuery($sql);
			
			$result = $this->Util()->DB()->GetResult();

			
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
			
			
			return $result;
		}
				
		public function Open()
		{
			if($this->Util()->PrintErrors())
			{
				// si hay errores regresa false
				return false;
			}
			
			$sql = "INSERT INTO
						subject
						( 	
						 	name,
						 	tipo
						)
					VALUES (
							'" . $this->name . "',
							'" . $this->getSubjectId() . "'
							)";
			$this->Util()->DB()->setQuery($sql);
			$subjectId = $this->Util()->DB()->InsertData();
			

			$sql = "INSERT INTO
						subject_module
						( 	
						 	subjectId
						)
					VALUES (
							'" . $subjectId. "'
							)";
			$this->Util()->DB()->setQuery($sql);
			$subId = $this->Util()->DB()->InsertData();
				

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
							access,
							dias,
							horario,
							apareceTabla,
							listar,
							tipo,
							numero
						)
					VALUES (
							'" . $subjectId . "',
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
							'".$this->personalId."|".$this->teacherId."|".$this->tutorId."|".$this->extraId."',
							'".$this->dias."',
							'".$this->horario."',
							'".$this->aparece."',
							'".$this->listar."',
							'".$this->tipoCuatri."',
							'".$this->numero."'
							)";
			//configuramos la consulta con la cadena de insercion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$result = $this->Util()->DB()->InsertData();
			
			$sql = "INSERT INTO
							course_module
							( 	
								courseId,
								subjectModuleId,
								initialDate,
								finalDate
							)
						VALUES (
								'" . $result . "',
								'" . $subId . "',
								'" . $this->initialDate . "',
								'" . $this->finalDate . "'
								)";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->InsertData();
		
			
		
			
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

			$sql = '
				SELECT subjectId FROM course
				where courseId = '.$this->courseId.'';
			$this->Util()->DB()->setQuery($sql);
			$info = $this->Util()->DB()->GetRow();
			
			
			 $sql = "UPDATE 
						subject
					SET
						name='". $this->name."'
						WHERE subjectId='".$info["subjectId"]."'";
						
						// exit;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
			
			//

			$sql = "UPDATE 
						course
					SET
						 
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
						dias='".$this->dias."',
						horario='".$this->horario."',
						tipo='".$this->tipoCuatri."',
						apareceTabla='".$this->aparece."',
						listar='".$this->listar."',
						numero='".$this->numero."',
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
						*, 
						major.name AS majorName, 
						subject.name AS name,
						course.tipo as tipoCuatri
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
			
			// echo "<pre>"; print_r($result);
			// exit;
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
				WHERE course.active = 'si' AND listar = 'si'
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
			$this->Util()->DB()->setQuery("
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, name ASC");
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
		
		
		function cuatriSolicitudes()
		{
			
			$info = $this->Info();

			$sql = "
				SELECT semesterId FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				group BY semesterId ASC";
			
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key=>$aux){
				$materias = 0;
				 $sql = "
					SELECT 
						sum(cms.calificacion) as cl,
						count(cms.calificacion) as c
					FROM course_module
					LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
					LEFT JOIN course_module_score as cms ON cms.courseModuleId = course_module.courseModuleId
					WHERE 
						subject_module.semesterId = ".$aux['semesterId']." and 
						userId = ".$_SESSION["User"]["userId"]." and 
						calificacionValida = 'si'";

				$this->Util()->DB()->setQuery($sql);
				$materias = $this->Util()->DB()->GetRow();
				
				$result[$key]['promedio'] = $materias['cl']/ $materias['c'];
			}
			
			
			return $result;
		}
		
		function StudentCourseModulesInbox()
		{
			$info = $this->Info();

			$sql = "
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, initialDate ASC";
			
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			//print_r($result);exit;
			foreach($result as $key => $res)
			{
				
				//verifica si el alumno ya completo la encuesta
				$sql = "
					SELECT count(*)
					FROM eval_alumno_docente
					WHERE courseModuleId = '".$res['courseModuleId']."' and alumnoId = ".$_SESSION["User"]["userId"]."";
				$this->Util()->DB()->setQuery($sql);
				$countEval = $this->Util()->DB()->GetSingle();
					
				$sql = "
					SELECT 
						*
					FROM 
						course_module_score as c
					LEFT JOIN course_module as cm on cm.courseModuleId = c.courseModuleId
					WHERE 
						c.courseModuleId = '".$res['courseModuleId']."' 
						and c.userId = ".$_SESSION["User"]["userId"]." 
						and c.courseId = ".$info["courseId"]."
						and cm.calificacionValida = 'si' ";

				$this->Util()->DB()->setQuery($sql);
				$infoCc = $this->Util()->DB()->GetRow();
				
				// $infoCc['calificacion'] = 8;
				// echo $info['majorName'];
				// exit;
				
				if($infoCc['calificacion']==''){
					$infoCc['calificacion']='En proceso';
				}else if ($infoCc['calificacion'] < 7 and $info['majorName'] == 'MAESTRIA'){
					$infoCc['calificacion'] = '<font color="red">'.$infoCc['calificacion'].'</font>';
				}else if ($infoCc['calificacion'] < 8 and $info['majorName'] == 'DOCTORADO'){
					$infoCc['calificacion'] = '<font color="red">'.$infoCc['calificacion'].'</font>';
				}else if ($infoCc['calificacion'] <= 6){
					$infoCc['calificacion'] = '<font color="red">'.$infoCc['calificacion'].'</font>';
				}				
				
				 
				
				$result[$key]["finalDate"]=$result[$key]["finalDate"]." 23:59:59";
				$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
				$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);
				
				$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;
				
				$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
				//echo $result[$key]["finalDateStamp"]."+".$toFinishSeconds."=".$result[$key]["daysToFinishStamp"]."<br/>" ;
				$student = new Student;
				$result[$key]["totalScore"] = $student->GetAcumuladoCourseModule($res["courseModuleId"]);
				$result[$key]["calificacionFinal"] = $infoCc['calificacion'];
				$result[$key]["countEval"] = $countEval;
				
				$timestamp = time();
				
				if ($timestamp < $result[$key]["initialDateStamp"]){
					$statusCCi = 'No iniciado';
				}
				else{
					if ($result[$key]["finalDateStamp"] > 0 AND $timestamp > $result[$key]["finalDateStamp"]){
						$statusCCi = 'Finalizado';
					}
					else if ($res['active'] == "no"){
						$statusCCi = 'Finalizado';
					}  
					else if ($result[$key]["finalDateStamp"] <= 0 AND $initialDateStamp < $result[$key]["daysToFinishStamp"] AND $timestamp > $result[$key]["daysToFinishStamp"]) { 
							$statusCCi = 'Finalizado';
					}
					else{
							$statusCCi = 'Activo';
					}		
				}
					
				$result[$key]["statusCCi"] = $statusCCi;
			}
			
			return $result;
		}

		
		// StudentCourseModulesCuatri
		
		
		function StudentCourseModules()
		{
			$info = $this->Info();

			$sql = "
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, initialDate ASC";
			// exit;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			//print_r($result);exit;
			foreach($result as $key => $res)
			{
				
				//verifica si el alumno ya completo la encuesta
				$sql = "
					SELECT count(*)
					FROM eval_alumno_docente
					WHERE courseModuleId = '".$res['courseModuleId']."' and alumnoId = ".$_SESSION["User"]["userId"]."";
				$this->Util()->DB()->setQuery($sql);
				$countEval = $this->Util()->DB()->GetSingle();
					
				$sql = "
					SELECT 
						*
					FROM 
						course_module_score as c
					LEFT JOIN course_module as cm on cm.courseModuleId = c.courseModuleId
					WHERE 
						c.courseModuleId = '".$res['courseModuleId']."' 
						and c.userId = ".$_SESSION["User"]["userId"]." 
						and c.courseId = ".$info["courseId"]."
						and cm.calificacionValida = 'si' ";

				$this->Util()->DB()->setQuery($sql);
				$infoCc = $this->Util()->DB()->GetRow();
				
				// $infoCc['calificacion'] = 8;
				// echo $info['majorName'];
				// exit;
				
				if($infoCc['calificacion']==''){
					$infoCc['calificacion']='En proceso';
				}else if ($infoCc['calificacion'] < 7 and $info['majorName'] == 'MAESTRIA'){
					$infoCc['calificacion'] = '<font color="red">'.$infoCc['calificacion'].'</font>';
				}else if ($infoCc['calificacion'] < 8 and $info['majorName'] == 'DOCTORADO'){
					$infoCc['calificacion'] = '<font color="red">'.$infoCc['calificacion'].'</font>';
				}else if ($infoCc['calificacion'] <= 6){
					$infoCc['calificacion'] = '<font color="red">'.$infoCc['calificacion'].'</font>';
				}				
				
				 
				
				$result[$key]["finalDate"]=$result[$key]["finalDate"]." 23:59:59";
				$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
				$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);
				
				$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;
				
				$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
				//echo $result[$key]["finalDateStamp"]."+".$toFinishSeconds."=".$result[$key]["daysToFinishStamp"]."<br/>" ;
				$student = new Student;
				$result[$key]["totalScore"] = $student->GetAcumuladoCourseModule($res["courseModuleId"]);
				$result[$key]["calificacionFinal"] = $infoCc['calificacion'];
				$result[$key]["countEval"] = $countEval;
			}
			
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
		
		
		
		function boletaAlumno()
		{
			
			 $sql = "
				SELECT 
					* 
				FROM 
					course_module as c
				left join subject_module as s on s.subjectModuleId = c.subjectModuleId
				WHERE c.courseId = '".$this->courseId."' and calificacionValida = 'si'";
		
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key=>$aux){
				 $sql = "
				SELECT 
					calificacion 
				FROM 
					course_module_score
				WHERE courseModuleId = '".$aux["courseModuleId"]."' and userId = ".$this->userId."";		
				$this->Util()->DB()->setQuery($sql);
				$cal = $this->Util()->DB()->GetSingle();
				$result[$key]["cal"] = $cal;
			}
			return $result;
		}
		
		function saveConcepto5()
		{
			
			if($this->nombre == ''){
				echo 'fail[#]';
				echo '<font color="red">Campo requerido: Nombre</font>';
				exit;
			}
			
			if($this->precio == ''){
				echo 'fail[#]';
				echo '<font color="red">Campo requerido: Nombre</font>';
				exit;
			}
			
			if($this->idfire == ''){
				echo 'fail[#]';
				echo '<font color="red">Campo requerido: Nombre</font>';
				exit;
			}
			
			if($this->id){
				
				$sql = " UPDATE 
						tiposolicitud
					SET
						nombre='".$this->nombre."', 
						precio='".$this->precio."',
						idfire='".$this->idfire."'
						WHERE tiposolicitudId ='".$this->id."'";
						
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData();
				
			}else{
				 $sql = "INSERT INTO
						tiposolicitud
						( 	
						 	nombre,
							precio,
							idfire
						)
					VALUES (
							'" . $this->nombre."',
							'" . $this->precio."',
							'" . $this->idfire."'
							)";
							
			
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->InsertData();
			}

				 
			
			
			
			
			
			return true;
		}
		
		function editaCosto($Id)
		{
			
			 $sql = " UPDATE 
						course
					SET
						tarifaMtro='".$this->tarifa."', 
						tarifaDr='".$this->tarifaDr."', 
						hora='".$this->hora."',
						subtotal='".$this->subtotal."'
						WHERE courseId ='".$Id."'";

						
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
			
			return true;
		
		}
		
		function getMateriaxCourse($Id)
		{
			 $sql = "
				SELECT 
					c.*,
					sm.*,
					CONCAT_WS(' ',p.name,lastname_paterno,lastname_materno) as nombrePersonal
				FROM 
					course_module as c
				left join  subject_module as sm on sm.subjectModuleId = c.subjectModuleId 
				left join  course_module_personal as cm on cm.courseModuleId = c.courseModuleId 
				left join  personal as p on p.personalId = cm.personalId 
				WHERE courseId = '".$Id."' group by courseModuleId";		
				// exit;
				$this->Util()->DB()->setQuery($sql);
				$cal = $this->Util()->DB()->GetResult();
				
				// echo '<pre>'; print_r($cal );
				// exit;
			return $cal;
		}
		
		function savePeriodos()
		{
			// echo 'llega';
			// exit;
			foreach($_POST as $key=>$aux){
				
				$a = explode('_',$key);
				if($a[0] == "periodo"){
					$sql = "UPDATE 
								course_module
							SET
								periodo='".$aux."'
								WHERE courseModuleId='".$a[1]."'";
					// exit;
					$this->Util()->DB()->setQuery($sql);
					$this->Util()->DB()->UpdateData();
					
					
				}
			}
			
			return true;
		}
		
		function reporteRegion()
		{
			
			$filtro = "";
			
			if($_POST["tipo"]){
				
				$filtro.= " and s.subjectId = ".$_POST["tipo"]."";
			}
			
			if($_POST["estatus"]){
				$filtro.= " and mr.grupo = ".$_POST["estatus"]."";
				
			}
			
			if($_POST["region"]){
				
				$filtro.= " and mr.region = ".$_POST["region"]."";
			}
			
			
			
		$sql = "
				SELECT 
					
					m.nombre as municipio,
					us.*,
					s.name as certificacion,
					mr.grupo,
					mr.region
				FROM 
					user_subject as u
				left join  course as c on c.courseId = u.courseId 
				left join  user as us on us.userId = u.alumnoId 
				left join  municipio_region as mr on mr.municipioId = us.ciudadt 
				left join  municipio as m on m.municipioId = us.ciudadt 
				left join  subject as s on s.subjectId = c.subjectId 

				WHERE 1 ".$filtro." group by us.userId,c.courseId order by c.courseId";
				// exit;
				$this->Util()->DB()->setQuery($sql);
				$cal = $this->Util()->DB()->GetResult();
				
				return $cal;
		
		}
		
		
		
		function reporteB()
		{
			
			$filtro = "";
			
			if($_POST["tipo"]){
				
				$filtro.= " and s.subjectId = ".$_POST["tipo"]."";
			}
			
			if($_POST["estatus"]){
				$filtro.= " and mr.grupo = ".$_POST["estatus"]."";
				
			}
			
			if($_POST["region"]){
				
				$filtro.= " and mr.region = ".$_POST["region"]."";
			}
			
			
			
		$sql = "
				SELECT 
					
					m.nombre as municipio,
					us.*,
					s.name as certificacion,
					mr.grupo,
					mr.region,
					(SELECT 
						count(*)
					FROM 
						user_subject as u2
					left join  course as c2 on c2.courseId = u2.courseId 
					left join  user as us2 on us2.userId = u2.alumnoId 
					left join  municipio_region as mr2 on mr2.municipioId = us2.ciudadt 
					where us2.ciudadt = m.municipioId
					) as cantidad
				FROM 
					user_subject as u
				left join  course as c on c.courseId = u.courseId 
				left join  user as us on us.userId = u.alumnoId 
				left join  municipio_region as mr on mr.municipioId = us.ciudadt 
				left join  municipio as m on m.municipioId = us.ciudadt 
				left join  subject as s on s.subjectId = c.subjectId 

				WHERE 1 ".$filtro." group by m.municipioId order by c.courseId";
				// exit;
				$this->Util()->DB()->setQuery($sql);
				$cal = $this->Util()->DB()->GetResult();
				
				return $cal;
		
		}
		
		function enumerateCer()
		{
			$sql = "
				SELECT 
					s.name as nombre,
					s.subjectId
				FROM 
					course as c
				left join subject as s on s.subjectId = c.subjectId

				WHERE 1";		
				// exit;
				$this->Util()->DB()->setQuery($sql);
				$cal = $this->Util()->DB()->GetResult();
				
				return $cal;
		}
		
		function regiones()
		{
			$sql = "
				SELECT 
					region
				FROM 
					municipio_region
				WHERE 1 group by region order by region";		
				// exit;
				$this->Util()->DB()->setQuery($sql);
				$cal = $this->Util()->DB()->GetResult();
				
				return $cal;
		}
		
		
	
}	
?>
