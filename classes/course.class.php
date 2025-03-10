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
	private $totalPeriods;
	private $temporalGroup;
	private $periodo;
	private $token;

	public function setPeriodo($valor)
	{
		$this->periodo = $valor;
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

	public function setTotalPeriods($value)
	{
		$this->totalPeriods = intval($value);
	}

	public function setTemporalGroup($value)
	{
		$this->temporalGroup = intval($value);
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
		if (strlen($explode[0]) == 2) {
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
		if (strlen($explode[0]) == 2) {
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

	public function setToken($value)
	{
		$this->token = $value;
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


	public function Infocoursem()
	{
		$sql = "SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo where course.courseId='" . $this->courseId . "' ";
		$this->Util()->DB()->setQuery($sql);
		$datos = $this->Util()->DB()->GetResult();

		foreach ($datos as $dato) {
			$majorName = $dato['majorName'];
		}
		return $majorName;
	}

	public function EnumerateByPage($currentPage, $rowsPerPage, $pageVar, $pageLink, &$arrPages)
	{

		$filtro = "";

		// if($this->aparece){
		// $filtro .= " and course.apareceTabla ='si'";
		// }


		if ($this->activo) {
			$filtro .= " and course.active ='" . $this->activo . "'";
		}


		if ($this->modalidad) {
			$filtro .= " and course.modality ='" . $this->modalidad . "'";
		}

		if ($this->curricula) {
			$filtro .= " and majorId ='" . $this->curricula . "'";
		}

		if ($this->totalPeriods) {
			$filtro .= " AND totalPeriods > 0";
		}

		if ($_SESSION['User']['userId'] == 253) {
			$filtro .= " AND subject.constancia = 1";
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
		if ($currentPage < 1)
			$currentPage = 1;
		if ($currentPage > $totalPages)
			$currentPage = $totalPages;

		// ***calculamos y guardamos el numero de registro inicial que se va a rcuperar
		$arrPages['rowBegin']	= ($currentPage * $rowsPerPage) - $rowsPerPage + 1;
		//calcular el desplazamiento de los registros a recuperar
		$rowOffset = $arrPages['rowBegin'] - 1;
		$sql = '
				SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				where 1 ' . $filtro . '
				ORDER BY course.initialDate DESC, course.finalDate DESC			
				LIMIT ' . $rowOffset . ', ' . $rowsPerPage;
		// exit;
		$this->Util()->DB()->setQuery($sql);

		$result = $this->Util()->DB()->GetResult();
		// echo "<pre>"; print_r($result);
		// exit;

		foreach ($result as $key => $res) {
			$sql = "SELECT COUNT(*) FROM subject_module WHERE subjectId = '" . $res["subjectId"] . "'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["modules"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(*) FROM user_subject WHERE courseId = '" . $res["courseId"] . "' AND status = 'inactivo'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["alumnInactive"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(user_subject.registrationId) 
							FROM user_subject 
							INNER JOIN user 
								ON user_subject.alumnoId = user.userId 
							WHERE user_subject.courseId = '" . $res["courseId"] . "' AND user_subject.status = 'activo' AND user.activo = 1";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["alumnActive"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(*) FROM course_module WHERE courseId ='" . $res["courseId"] . "' AND active = 'si'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["courseModuleActive"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(*) FROM course_module WHERE courseId = '" . $res["courseId"] . "'";
			$this->Util()->DB()->setQuery($sql);
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
		if ($currentPage > 1) {
			//***si la pagina actual es mayor a 1, se activa el enlace anterior
			$arrPages['previusPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage - 1);
			//***si la pagina actual es mayor a 2, se activa el enlace inicio
			if ($currentPage > 2)
				$arrPages['startPage'] = $pageLink . '/' . $pageVar . '/' . '1';
		}
		//***por default los enlaces siguiente y fin estan vacios
		$arrPages['nextPage'] = '';
		$arrPages['endPage'] = '';
		if ($currentPage < $arrPages['totalPages']) {
			//***si la pagina actual es menor al total de paginas, se activa el enlace siguiente
			$arrPages['nextPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage + 1);
			//***si la pagina actual es menor al (total de paginas - 1), se activa el enlace fin
			if ($currentPage < ($arrPages['totalPages'] - 1))
				$arrPages['endPage'] = $pageLink . '/' . $pageVar . '/' . $arrPages['totalPages'];
		}
		//enlace hacia la misma pagina para poder actualizar los valores de los datos
		$arrPages['refreshPage'] = $pageLink . '/' . $pageVar . '/' . $currentPage;
		//regresamos los registros recuperados de la pagina actual
		return $result;
	}

	public function EnumerateCourse()
	{

		$filtro = "";

		if ($this->aparece) {
			$filtro .= " and course.apareceTabla ='si'";
		}

		$sql = '
				SELECT *, major.name AS majorName, subject.name AS name  FROM course
				LEFT JOIN subject ON course.subjectId = subject.subjectId 
				LEFT JOIN major ON major.majorId = subject.tipo
				where 1 ' . $filtro . ' AND major.majorId IN (1,18)
				ORDER BY course.initialDate DESC, course.finalDate DESC';
		// exit;
		$this->Util()->DB()->setQuery($sql);

		$result = $this->Util()->DB()->GetResult();


		foreach ($result as $key => $res) {
			$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM subject_module WHERE subjectId ='" . $res["subjectId"] . "'");

			$result[$key]["modules"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM user_subject WHERE courseId ='" . $res["courseId"] . "' AND status = 'inactivo'");
			$result[$key]["alumnInactive"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM user_subject WHERE courseId ='" . $res["courseId"] . "' AND status = 'activo'");

			$result[$key]["alumnActive"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM course_module WHERE courseId ='" . $res["courseId"] . "' AND active = 'si'");
			$result[$key]["courseModuleActive"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
					SELECT COUNT(*) FROM course_module WHERE courseId ='" . $res["courseId"] . "'");

			$result[$key]["courseModule"] = $this->Util()->DB()->GetSingle();
		}


		return $result;
	}

	public function Open()
	{
		if ($this->Util()->PrintErrors()) {
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
							access,
							dias,
							horario,
							apareceTabla,
							listar,
							tipo,
							temporalGroup
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
							'" . $this->personalId . "|" . $this->teacherId . "|" . $this->tutorId . "|" . $this->extraId . "',
							'" . $this->dias . "',
							'" . $this->horario . "',
							'" . $this->aparece . "',
							'" . $this->listar . "',
							'" . $this->tipoCuatri . "',
							" . $this->temporalGroup . "
							)";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->InsertData();
		$tipo = $this->tipoCuatri == "Cuatrimestre" ? 4 : 6;
		$periodos =  $this->obtenerPeriodos($this->initialDate, $this->finalDate, $tipo);
		foreach ($periodos as $key => $periodo) {
			$aux = $key + 1;
			$this->savePeriod($result, $aux, $periodo['periodBegin'], $periodo['periodEnd']);
		}
		return $result;
	}

	public function savePeriod($courseId, $period, $periodBegin, $periodEnd)
	{
		$sql = "INSERT INTO course_periods(courseId, period, periodBegin, periodEnd) VALUES('{$courseId}', '{$period}', '{$periodBegin}', '{$periodEnd}')";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
	}

	public function Update()
	{
		if ($this->Util()->PrintErrors()) {
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
						dias='" . $this->dias . "',
						horario='" . $this->horario . "',
						tipo='" . $this->tipoCuatri . "',
						apareceTabla='" . $this->aparece . "',
						listar='" . $this->listar . "',
						access='" . $this->personalId . "|" . $this->teacherId . "|" . $this->tutorId . "|" . $this->extraId . "',
						temporalGroup = " . $this->temporalGroup . "
						WHERE courseId='" . utf8_decode($this->courseId) . "'";
		//configuramos la consulta con la cadena de actualizacion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y guardamos el resultado, que sera el numero de columnas afectadas
		$this->Util()->DB()->UpdateData();
		$result = 1;
		if ($result > 0) {
			//si el resultado es mayor a cero, se actualizo el registro con exito
			$result = true;
			$this->Util()->setError(90002, 'complete', 'El curso se ha actualizado correctamente');
		} else {
			//si el resultado es cero, no se pudo modificar el registro...se regresa false
			$result = false;
			$this->Util()->setError(90011, 'error', "No se pudo modificar el curso");
		}
		$this->Util()->PrintErrors();
		return $result;
	}

	public function Delete()
	{
		if ($this->Util()->PrintErrors()) {
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
		if ($result > 0) {
			//si el resultado es mayor a cero, se actualizo el registro con exito
			$result = true;
			$this->Util()->setError(90001, 'complete', "Se ha eliminado el curso correctamente");
		} else {
			//si el resultado es cero, no se pudo modificar el registro...se regresa false
			$result = false;
			$this->Util()->setError(90012, 'error');
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
						courseId='" . $this->courseId . "'   &&  modality='" . $this->modality . "'  ";
		//configuramos la consulta con la cadena de actualizacion

		//$sql="select ";

		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y obtenemos el resultado
		$result = $this->Util()->DB()->GetRow();
		if ($result) {
			//				$result = $this->Util->EncodeRow($result);
		}

		$result["access"] = explode("|", $result["access"]);

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
						subject.vigencia,
						course.tipo as tipoCuatri,
						subject.totalPeriods,
						(SELECT IF((course.modality = 'Online'), subject.crm_id_online, subject.crm_id_local)) AS crm_id,
						(SELECT IF((course.modality = 'Online'), subject.crm_name_online, subject.crm_name_local)) AS crm_name
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
		if ($result) {
			$sql = "SELECT * FROM course_periods WHERE courseId = {$result['courseId']} ORDER BY period";
			$this->Util()->DB()->setQuery($sql);
			$result['periodos'] = $this->Util()->DB()->GetResult();
		}
		$result["name"] = str_replace("NUEVO PROGRAMA", "", $result['name']);
		$result["access"] = explode("|", $result["access"]);

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

	public function EnumerateActive($where = '')
	{
		$sql = "
		SELECT *, major.name AS majorName, subject.name AS name, subject.rvoe FROM course
		LEFT JOIN subject ON course.subjectId = subject.subjectId 
		LEFT JOIN major ON major.majorId = subject.tipo
		WHERE course.active = 'si' AND listar = 'si' {$where}
		ORDER BY subject.tipo, subject.name, course.group";
		$this->Util()->DB()->setQuery($sql);
		//echo $this->Util()->DB()->query;
		$result = $this->Util()->DB()->GetResult();

		foreach ($result as $key => $res) {
			$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
			$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);

			$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;

			$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
		}
		return $result;
	}

	public function EnumerateOfficial()
	{
		$sql = "SELECT *, major.name AS majorName, subject.name AS name FROM course
						LEFT JOIN subject ON course.subjectId = subject.subjectId 
						LEFT JOIN major ON major.majorId = subject.tipo
					WHERE course.active = 'si' AND course.apareceTabla = 'si'
					ORDER BY subject.tipo, subject.name, course.group";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		foreach ($result as $key => $res) {
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
				WHERE user_subject.courseId = '" . $courseId . "'
					AND user_subject.status = '" . $status . "'
				ORDER BY user.lastNamePaterno ASC, user.lastNameMaterno ASC, names ASC");
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function FreeCourseModules()
	{
		$info = $this->Info();
		$this->Util()->DB()->setQuery("
				SELECT * FROM subject_module
				WHERE subject_module.subjectId = '" . $info["subjectId"] . "'
				ORDER BY semesterId ASC, name ASC");
		$result = $this->Util()->DB()->GetResult();
		foreach ($result as $key => $value) {
			$this->Util()->DB()->setQuery("
				SELECT * FROM course_module
				WHERE subjectModuleId = '" . $value["subjectModuleId"] . "' AND courseId = '" . $this->courseId . "'");
			$row = $this->Util()->DB()->GetRow();

			if ($row) {
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
				WHERE courseId = '" . $info["courseId"] . "'
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
				WHERE courseId = '" . $info["courseId"] . "'
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
				WHERE courseId = '" . $info["courseId"] . "'
				group BY semesterId ASC";

		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		foreach ($result as $key => $aux) {
			$materias = 0;
			$sql = "
					SELECT 
						sum(cms.calificacion) as cl,
						count(cms.calificacion) as c
					FROM course_module
					LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
					LEFT JOIN course_module_score as cms ON cms.courseModuleId = course_module.courseModuleId
					WHERE 
						subject_module.semesterId = " . $aux['semesterId'] . " and 
						userId = " . $_SESSION["User"]["userId"] . " and 
						calificacionValida = 'si'";

			$this->Util()->DB()->setQuery($sql);
			$materias = $this->Util()->DB()->GetRow();

			$result[$key]['promedio'] = $materias['cl'] / $materias['c'];
		}


		return $result;
	}

	function StudentCourseModulesInbox()
	{
		$info = $this->Info();

		$sql = "
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '" . $info["courseId"] . "'
				ORDER BY semesterId ASC, initialDate ASC";

		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		//print_r($result);exit;
		foreach ($result as $key => $res) {

			//verifica si el alumno ya completo la encuesta
			$sql = "
					SELECT count(*)
					FROM eval_alumno_docente
					WHERE courseModuleId = '" . $res['courseModuleId'] . "' and alumnoId = " . $_SESSION["User"]["userId"] . "";
			$this->Util()->DB()->setQuery($sql);
			$countEval = $this->Util()->DB()->GetSingle();

			$sql = "
					SELECT 
						*
					FROM 
						course_module_score as c
					LEFT JOIN course_module as cm on cm.courseModuleId = c.courseModuleId
					WHERE 
						c.courseModuleId = '" . $res['courseModuleId'] . "' 
						and c.userId = " . $_SESSION["User"]["userId"] . " 
						and c.courseId = " . $info["courseId"] . "
						and cm.calificacionValida = 'si' ";

			$this->Util()->DB()->setQuery($sql);
			$infoCc = $this->Util()->DB()->GetRow();

			// $infoCc['calificacion'] = 8;
			// echo $info['majorName'];
			// exit;

			if ($infoCc['calificacion'] == '') {
				$infoCc['calificacion'] = 'En proceso';
			} else if ($infoCc['calificacion'] < 7 and $info['majorName'] == 'MAESTRIA') {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			} else if ($infoCc['calificacion'] < 8 and $info['majorName'] == 'DOCTORADO') {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			} else if ($infoCc['calificacion'] <= 6) {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			}



			$result[$key]["finalDate"] = $result[$key]["finalDate"] . " 23:59:59";
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

			if ($timestamp < $result[$key]["initialDateStamp"]) {
				$statusCCi = 'No iniciado';
			} else {
				if ($result[$key]["finalDateStamp"] > 0 and $timestamp > $result[$key]["finalDateStamp"]) {
					$statusCCi = 'Finalizado';
				} else if ($res['active'] == "no") {
					$statusCCi = 'Finalizado';
				} else if ($result[$key]["finalDateStamp"] <= 0 and $initialDateStamp < $result[$key]["daysToFinishStamp"] and $timestamp > $result[$key]["daysToFinishStamp"]) {
					$statusCCi = 'Finalizado';
				} else {
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
				WHERE courseId = '" . $info["courseId"] . "'
				ORDER BY semesterId ASC, initialDate ASC";

		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		//print_r($result);exit;
		foreach ($result as $key => $res) {
			$isEnglish = 0;
			if (substr($result[$key]['clave'], 0, 3) == 'ING')
				$isEnglish = 1;
			//verifica si el alumno ya completo la encuesta
			$sql = "
					SELECT count(*)
					FROM eval_alumno_docente
					WHERE courseModuleId = '" . $res['courseModuleId'] . "' and alumnoId = " . $_SESSION["User"]["userId"] . "";
			$this->Util()->DB()->setQuery($sql);
			$countEval = $this->Util()->DB()->GetSingle();

			$sql = "
					SELECT 
						*
					FROM 
						course_module_score as c
					LEFT JOIN course_module as cm on cm.courseModuleId = c.courseModuleId
					WHERE 
						c.courseModuleId = '" . $res['courseModuleId'] . "' 
						and c.userId = " . $_SESSION["User"]["userId"] . " 
						and c.courseId = " . $info["courseId"] . "
						and cm.calificacionValida = 'si' ";

			$this->Util()->DB()->setQuery($sql);
			$infoCc = $this->Util()->DB()->GetRow();

			// $infoCc['calificacion'] = 8;
			// echo $info['majorName'];
			// exit;

			if ($infoCc['calificacion'] == '') {
				$infoCc['calificacion'] = 'En proceso';
			} else if ($infoCc['calificacion'] < 7 and $info['majorName'] == 'MAESTRIA') {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			} else if ($infoCc['calificacion'] < 8 and $info['majorName'] == 'DOCTORADO') {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			} else if ($infoCc['calificacion'] <= 6) {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			}



			$result[$key]["finalDate"] = $result[$key]["finalDate"] . " 23:59:59";
			$result[$key]["initialDateStamp"] = strtotime($result[$key]["initialDate"]);
			$result[$key]["finalDateStamp"] = strtotime($result[$key]["finalDate"]);

			$toFinishSeconds = $result[$key]["daysToFinish"] * 3600 * 24;

			$result[$key]["daysToFinishStamp"] = strtotime($result[$key]["initialDate"]) + $toFinishSeconds;
			//echo $result[$key]["finalDateStamp"]."+".$toFinishSeconds."=".$result[$key]["daysToFinishStamp"]."<br/>" ;
			$student = new Student;
			$result[$key]["totalScore"] = $student->GetAcumuladoCourseModule($res["courseModuleId"]);
			$result[$key]["calificacionFinal"] = $infoCc['calificacion'];
			$result[$key]["countEval"] = $countEval;
			$result[$key]["isEnglish"] = $isEnglish;
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

		foreach ($result as $key => $res) {
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
				WHERE subjectId = '" . $info["subjectId"] . "' ORDER BY semesterId ASC");
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function HowManyCuatrimesters()
	{
		$info = $this->Info();

		$this->Util()->DB()->setQuery("
				SELECT DISTINCT(semesterId) FROM subject_module
				WHERE subjectId = '" . $info["subjectId"] . "' ORDER BY semesterId ASC");
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
				WHERE c.courseId = '" . $this->courseId . "' and calificacionValida = 'si'";

		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		foreach ($result as $key => $aux) {
			$sql = "
				SELECT 
					calificacion 
				FROM 
					course_module_score
				WHERE courseModuleId = '" . $aux["courseModuleId"] . "' and userId = " . $this->userId . "";
			$this->Util()->DB()->setQuery($sql);
			$cal = $this->Util()->DB()->GetSingle();
			$result[$key]["cal"] = $cal;
		}
		return $result;
	}

	function saveConcepto5()
	{

		if ($this->nombre == '') {
			echo 'fail[#]';
			echo '<font color="red">Campo requerido: Nombre</font>';
			exit;
		}

		if ($this->precio == '') {
			echo 'fail[#]';
			echo '<font color="red">Campo requerido: Nombre</font>';
			exit;
		}

		if ($this->idfire == '') {
			echo 'fail[#]';
			echo '<font color="red">Campo requerido: Nombre</font>';
			exit;
		}

		if ($this->id) {

			$sql = " UPDATE 
						tiposolicitud
					SET
						nombre='" . $this->nombre . "', 
						precio='" . $this->precio . "',
						idfire='" . $this->idfire . "'
						WHERE tiposolicitudId ='" . $this->id . "'";

			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		} else {
			$sql = "INSERT INTO
						tiposolicitud
						( 	
						 	nombre,
							precio,
							idfire
						)
					VALUES (
							'" . $this->nombre . "',
							'" . $this->precio . "',
							'" . $this->idfire . "'
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
						tarifaMtro='" . $this->tarifa . "', 
						tarifaDr='" . $this->tarifaDr . "', 
						hora='" . $this->hora . "',
						subtotal='" . $this->subtotal . "'
						WHERE courseId ='" . $Id . "'";


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
				WHERE courseId = '" . $Id . "' group by courseModuleId";
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
		foreach ($_POST as $key => $aux) {

			$a = explode('_', $key);
			if ($a[0] == "periodo") {
				$sql = "UPDATE 
								course_module
							SET
								periodo='" . $aux . "'
								WHERE courseModuleId='" . $a[1] . "'";
				// exit;
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData();
			}
		}

		return true;
	}

	function ListModules($period = 0, $ignoreEnglish = false, $order = " ORDER BY sm.name")
	{
		$condition = "";
		if ($period > 0)
			$condition = " AND sm.semesterId = " . $period;
		if ($ignoreEnglish)
			$condition .= " AND sm.subjectModuleId NOT IN (246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 274, 275, 276, 277, 278)";
		$sql = "SELECT cm.courseModuleId, sm.name AS subjectModuleName, cm.initialDate, cm.finalDate 
						FROM course_module cm 
							INNER JOIN subject_module sm 
								ON cm.subjectModuleId = sm.subjectModuleId
						WHERE cm.courseId = " . $this->courseId . $condition . $order;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function StudentCourseModulesRepeat()
	{
		$info = $this->Info();
		$sql = "SELECT * 
						FROM user_subject_repeat usr
							LEFT JOIN course_module cm 
								ON usr.courseModuleId = cm.courseModuleId  
							LEFT JOIN subject_module sm  
								ON sm.subjectModuleId = cm.subjectModuleId
						WHERE usr.courseId = " . $info["courseId"] . " AND usr.alumnoId = " . $_SESSION["User"]["userId"] . " 
					ORDER BY sm.semesterId ASC, cm.initialDate ASC";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		//print_r($result);exit;
		foreach ($result as $key => $res) {

			//verifica si el alumno ya completo la encuesta
			$sql = "
					SELECT count(*)
					FROM eval_alumno_docente
					WHERE courseModuleId = '" . $res['courseModuleId'] . "' and alumnoId = " . $_SESSION["User"]["userId"] . "";
			$this->Util()->DB()->setQuery($sql);
			$countEval = $this->Util()->DB()->GetSingle();

			$sql = "
					SELECT 
						*
					FROM 
						course_module_score as c
					LEFT JOIN course_module as cm on cm.courseModuleId = c.courseModuleId
					WHERE 
						c.courseModuleId = '" . $res['courseModuleId'] . "' 
						and c.userId = " . $_SESSION["User"]["userId"] . " 
						and c.courseId = " . $info["courseId"] . "
						and cm.calificacionValida = 'si' ";

			$this->Util()->DB()->setQuery($sql);
			$infoCc = $this->Util()->DB()->GetRow();

			// $infoCc['calificacion'] = 8;
			// echo $info['majorName'];
			// exit;

			if ($infoCc['calificacion'] == '') {
				$infoCc['calificacion'] = 'En proceso';
			} else if ($infoCc['calificacion'] < 7 and $info['majorName'] == 'MAESTRIA') {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			} else if ($infoCc['calificacion'] < 8 and $info['majorName'] == 'DOCTORADO') {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			} else if ($infoCc['calificacion'] <= 6) {
				$infoCc['calificacion'] = '<font color="red">' . $infoCc['calificacion'] . '</font>';
			}



			$result[$key]["finalDate"] = $result[$key]["finalDate"] . " 23:59:59";
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

	public function EnumerateSubjectByPage()
	{
		$filtro = "";
		if ($this->activo)
			$filtro .= " and course.active ='" . $this->activo . "'";

		if ($this->modalidad)
			$filtro .= " and course.modality ='" . $this->modalidad . "'";

		if ($this->curricula)
			$filtro .= " and majorId ='" . $this->curricula . "'";

		if ($this->totalPeriods)
			$filtro .= " AND totalPeriods > 0";
		if (in_array($_SESSION['User']['userId'], [253])) {
			$filtro .= " AND(subject.constancia = 1 OR course.courseId IN(162, 169))";
		}
		$sql = 'SELECT 
						DISTINCT(subject.subjectId), 
						major.name AS majorName, 
						subject.name AS name
						FROM course
					LEFT JOIN subject 
						ON course.subjectId = subject.subjectId 
					LEFT JOIN major 
						ON major.majorId = subject.tipo
					WHERE 1 ' . $filtro . '
					ORDER BY 
					FIELD (major.name,"MAESTRIA","DOCTORADO","CURSO","ESPECIALIDAD") asc, subject.name, modality desc, initialDate desc,  active';
		// exit;
		// echo $sql;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function SabanaCalificacionesFrontal($period = 0, $ignoreEnglish = false, $order = " ORDER BY sm.name", $type = 'initial')
	{
		$sql = "SELECT u.userId, u.curp, u.lastNamePaterno, u.lastNameMaterno, u.names, us.matricula, u.sexo, situation, (SELECT IF(academic_history.semesterId = 0, 1, academic_history.semesterId) as periodo FROM academic_history WHERE academic_history.courseId = '{$this->courseId}' AND academic_history.type = 'alta' AND academic_history.userId = u.userId) as alta, (SELECT academic_history.semesterId FROM academic_history WHERE academic_history.courseId = '{$this->courseId}' AND academic_history.type = 'baja' AND academic_history.userId = u.userId) as baja FROM user_subject us INNER JOIN user u ON us.alumnoId = u.userId WHERE us.courseId = '{$this->courseId}' ORDER BY lastNamePaterno, lastNameMaterno, names;";
		$this->Util()->DB()->setQuery($sql);
		$students = $this->Util()->DB()->GetResult();
		// echo $sql; exit;
		// echo "<pre>";
		// var_dump($students);
		// exit;  
		if ($type == 'final') {
			$condition = "";
			if ($period > 0)
				$condition = " AND sm.semesterId = " . $period;
			if ($ignoreEnglish)
				$condition .= " AND sm.subjectModuleId NOT IN (246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 274, 275, 276, 277, 278)";
			foreach ($students as $key => $value) {
				$semesterId = intval($value['alta']);
				$sql = "SELECT cm.courseModuleId, sm.name AS subjectModuleName, cm.initialDate, cm.finalDate, cms.calificacion 
				FROM course_module cm 
					INNER JOIN subject_module sm 
						ON cm.subjectModuleId = sm.subjectModuleId
					LEFT JOIN course_module_score cms 
						ON (cm.courseId = cms.courseId AND cm.courseModuleId = cms.courseModuleId)
				WHERE cm.courseId = " . $this->courseId . " AND cms.userId = " . $value['userId'] . $condition . $order;
				$this->Util()->DB()->setQuery($sql);
				$result = $this->Util()->DB()->GetResult();
				$students[$key]['modules'] = $result;

				// if ($semesterId > $period || $semesterId == $period)
				if ($semesterId > $period)
					unset($students[$key]);
			}
		} else {
			foreach ($students as $key => $value) {
				$semesterId = intval($value['alta']);
				if ($semesterId > $period || ($semesterId == $period && $semesterId > 1))
					unset($students[$key]);
			}
		}
		$students = array_values($students);
		// print_r($students);
		return $students;
	}

	function SabanaCalificacionesTrasera($period = 0, $ignoreEnglish = false, $order = " ORDER BY sm.name", $type = 'initial', $modules = [])
	{
		$modules = implode(',', $modules);
		/*$sql = "SELECT * FROM (SELECT 'REC' AS situation, u.userId, u.lastNamePaterno, u.lastNameMaterno, u.names, u.sexo,
		(SELECT matricula FROM user_subject WHERE alumnoId = u.userId ORDER BY registrationId DESC LIMIT 1) AS matricula, '' AS alta
		FROM user_subject_repeat usr INNER JOIN USER u ON usr.alumnoId = u.userId
		WHERE usr.courseId = ".$this->courseId." AND usr.courseModuleId IN(".$modules.")
		UNION ALL SELECT situation, user.userId, user.lastNamePaterno, user.lastNameMaterno, user.names, user.sexo, 
		( SELECT matricula FROM user_subject WHERE alumnoId = user.userId ORDER BY registrationId DESC LIMIT 1) AS matricula,
		( SELECT academic_history.semesterId AS periodo FROM academic_history WHERE academic_history.courseId = ".$this->courseId." AND academic_history.type = 'alta' AND academic_history.userId = user.userId LIMIT 1) AS alta
		FROM user_subject INNER JOIN user ON user_subject.alumnoId = user.userId WHERE user_subject.courseId = ".$this->courseId." HAVING alta = 2) A ORDER BY A.lastNamePaterno, A.lastNameMaterno,A.names";*/
		$sql = "SELECT 'REC' AS situation, u.userId, u.lastNamePaterno, u.lastNameMaterno, u.names, u.sexo,
		(SELECT matricula FROM user_subject WHERE alumnoId = u.userId ORDER BY registrationId DESC LIMIT 1) AS matricula, '' AS alta
		FROM user_subject_repeat usr INNER JOIN USER u ON usr.alumnoId = u.userId
		WHERE usr.courseId = " . $this->courseId . " AND usr.courseModuleId IN(" . $modules . ")";
		$this->Util()->DB()->setQuery($sql);
		// echo $sql;
		$students = $this->Util()->DB()->GetResult();
		if ($type == 'final') {
			$condition = "";
			if ($period > 0)
				$condition = " AND sm.semesterId = " . $period;
			if ($ignoreEnglish)
				$condition .= " AND sm.subjectModuleId NOT IN (246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 274, 275, 276, 277, 278)";
			foreach ($students as $key => $value) {
				$sql = "SELECT cm.courseModuleId, sm.name AS subjectModuleName, cm.initialDate, cm.finalDate, cms.calificacion 
				FROM course_module cm 
					INNER JOIN subject_module sm 
						ON cm.subjectModuleId = sm.subjectModuleId
					LEFT JOIN course_module_score cms 
						ON (cm.courseId = cms.courseId AND cm.courseModuleId = cms.courseModuleId)
				WHERE cm.courseId = " . $this->courseId . " AND cms.userId = " . $value['userId'] . $condition . $order;
				//echo $sql . "<br>";
				$this->Util()->DB()->setQuery($sql);
				$result = $this->Util()->DB()->GetResult();
				$students[$key]['modules'] = $result;
			}
		}
		return $students;
	}

	function AddedCourseModulesCuatri($cId, $sId)
	{
		$sql = "SELECT * 
					FROM course_module
						LEFT JOIN subject_module 
							ON subject_module.subjectModuleId = course_module.subjectModuleId
						WHERE courseId = " . $cId . " AND subject_module.semesterId = " . $sId . "
						ORDER BY name ASC";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function SaveEnglishLevels($data)
	{
		$identifiers = [
			1 => 'INGI',
			2 => 'INGII',
			3 => 'INGIII',
			4 => 'INGIV',
			5 => 'INGV',
			6 => 'INGVI',
			7 => 'INGVII',
			8 => 'INGVIII',
			9 => 'INGIX',
			10 => 'INGX'
		];
		foreach ($data as $userId => $levels) {
			$sql = "DELETE FROM english_levels WHERE courseId = " . $this->courseId . " AND userId = " . $userId;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->DeleteData();
			foreach ($levels as $item) {
				$sql = "INSERT INTO english_levels(courseId, userId, validated_level, identifier) VALUES(" . $this->courseId . ", " . $userId . ", " . $item . ", '" . $identifiers[$item] . "')";
				$this->Util()->DB()->setQuery($sql);
				$result = $this->Util()->DB()->InsertData();
			}
		}
	}

	function GetEnglishLevels()
	{
		$data = [];
		$sql = "SELECT * FROM english_levels WHERE courseId = " . $this->courseId . ' ORDER BY userId, validated_level';
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		foreach ($result as $item) {
			$data[$item['userId']][] = $item['validated_level'];
		}
		return $data;
	}

	/**
	 * Inidica el periodo actual del curso
	 */
	public function periodoActual()
	{
		$sql = "SELECT semesterId FROM course_module LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId WHERE courseId = '{$this->courseId}' ORDER BY semesterId DESC LIMIT 1";
		$this->Util()->DB()->setQuery($sql);
		$periodo = $this->Util()->DB()->GetSingle();
		return $periodo;
	}

	/**
	 * Indica la cantidad de módulos que hay en el periodo de un curso
	 */
	public function modulosPeriodo()
	{
		$sql = "SELECT count(*) as modulos FROM course_module LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId WHERE courseId = '{$this->courseId}' AND semesterId = '{$this->periodo}';";
		// echo $sql;
		$this->Util()->DB()->setQuery($sql);
		$modulos = $this->Util()->DB()->GetSingle();
		return $modulos;
	}

	function getCourses($where = "")
	{
		$sql = "SELECT major.name as major_name, subject.name as subject_name, course.courseId, `course`.`group`, subject.icon, course.tipo, course.subjectId, subject.totalPeriods FROM course INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo WHERE 1 {$where}";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function getHeadersActivities($where = "")
	{
		$sql = "SELECT * FROM `activity` INNER JOIN course_module ON course_module.courseModuleId = activity.courseModuleId WHERE 1 {$where}";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function getStudents($where = "")
	{
		$sql = "SELECT * FROM user INNER JOIN user_subject ON user_subject.alumnoId = user.userId WHERE 1 {$where}";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function getStudentsConocer($where = "")
	{
		$sql = "SELECT * FROM user INNER JOIN user_subject ON user_subject.alumnoId = user.userId LEFT JOIN constancias_conocer ON constancias_conocer.courseId = user_subject.courseId AND constancias_conocer.studentId = user_subject.alumnoId WHERE 1 {$where}";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function obtenerPeriodos($fechaInicio, $fechaFinal, $tipo)
	{
		$inicio = new DateTime($fechaInicio);
		$final = new DateTime($fechaFinal);
		$inicio = $inicio->modify('first day of this month');
		$final = $final->modify('first day of this month');
		// Crear un array para almacenar los periodos cuatrimestrales
		$periodos = [];

		// Iterar desde la fecha de inicio hasta la fecha final en intervalos de 4 meses
		while ($inicio < $final) {
			// Clonar la fecha de inicio para evitar modificar el objeto original
			$periodoInicio = (clone $inicio);

			// Calcular la fecha final del periodo cuatrimestral actual
			$periodoFinal = (clone $inicio)->add(new DateInterval('P' . $tipo . 'M'))->sub(new DateInterval('P1D'));

			// Asegurarse de que el periodo final no sobrepase la fecha final dada
			if ($periodoFinal > $final) {
				$periodoFinal = $final;
			}

			// Agregar el periodo al array
			$inicioMes = strftime('%B %Y', $periodoInicio->getTimestamp());
			$finalMes = strftime('%B %Y', $periodoFinal->getTimestamp());
			$periodos[] = [
				'periodBegin' => ucfirst($inicioMes),
				'periodEnd' => ucfirst($finalMes),
			];

			// Mover la fecha de inicio al siguiente periodo cuatrimestral
			$inicio = $inicio->add(new DateInterval('P' . $tipo . 'M'));
		}

		return $periodos;
	}

	function dt_diplomas()
	{
		$table = 'user INNER JOIN user_subject ON user_subject.alumnoId = user.userId';
		$primaryKey = 'userId';
		$columns = array(
			array('db' => 'userId', 'dt' => 'userId'),
			array('db' => 'user.controlNumber', 'dt' => 'control'),
			array('db' => 'CONCAT(user.names, " ", user.lastNamePaterno," ", user.lastNameMaterno)',  'dt' => 'alumno'),
			array(
				'db' => 'userId',
				'dt' => 'acciones',
				'formatter' => function ($d, $row) {
					$html = "";
					$this->setUserId($d);
					$this->setCourseId($_POST['curso']);
					if ($this->getDiploma()) {
						$html .= "<a href='" . WEB_ROOT . "/pdf/diploma.php?alumno={$d}&curso={$_POST['curso']}' class='btn btn-primary btn-sm' target='_blank'>Ver diploma</a>
							<form class='form d-inline' id='form_diploma{$d}' action='" . WEB_ROOT . "/ajax/new/course.php'>
								<input type='hidden' name='curso' value='{$_POST['curso']}'>
								<input type='hidden' name='alumno' value='{$d}'>
								<input type='hidden' name='option' value='deleteDiploma'>
								<button class='btn btn-sm btn-danger'>
									Eliminar diploma
								</button>
							</form>
						";
					} else {
						$html .= "
							<form class='form' id='form_diploma{$d}' action='" . WEB_ROOT . "/ajax/new/course.php'>
								<input type='hidden' name='curso' value='{$_POST['curso']}'>
								<input type='hidden' name='alumno' value='{$d}'>
								<input type='hidden' name='option' value='addDiploma'>
								<button class='btn btn-sm btn-success'>
									Generar diploma
								</button>
							</form>
						";
					}
					return $html;
				},
			),
		);
		$where = "user_subject.courseId = {$_POST['curso']}";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	function getDiploma($where = NULL)
	{
		if (is_null($where)) {
			$where = "studentId = {$this->getUserId()} AND courseId = {$this->getCourseId()}";
		}
		$sql = "SELECT * FROM diplomas WHERE $where";
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->GetRow();
	}

	function addDiploma()
	{
		$sql = "INSERT INTO diplomas(studentId, courseId, token) VALUES({$this->getUserId()},{$this->getCourseId()}, '{$this->token}')";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
	}

	function deleteDiploma()
	{
		$sql = "DELETE FROM diplomas WHERE studentId = {$this->getUserId()} AND courseId = {$this->getCourseId()}";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->DeleteData();
	}

	function dt_cotejo()
	{
		$table = 'user INNER JOIN user_subject ON user_subject.alumnoId = user.userId';
		$primaryKey = 'userId';
		$columns = array(
			array('db' => 'userId', 'dt' => 'userId'),
			array('db' => 'user.controlNumber', 'dt' => 'control'),
			array('db' => 'CONCAT(user.names, " ", user.lastNamePaterno," ", user.lastNameMaterno)',  'dt' => 'alumno'),
			array('db' => 'IF(user_subject.status_payment = 1, "PAGADO", "PENDIENTE")', "dt" => "pago"),
			array('db' => 'IF(user_subject.status_evaluation = 1, "Sí", "No")', "dt" => "evaluacion"),
			array('db' => 'user_subject.status_payment', "dt" => "status_payment"),
			array('db' => 'user_subject.status_evaluation', "dt" => "status_evaluation"),
			array(
				'db' => 'userId',
				'dt' => 'acciones',
				'formatter' => function ($d, $row) {
					$html = "";
					if ($row['status_payment']) {
						$html .= "<form action='" . WEB_ROOT . "/ajax/new/course.php' method='POST' class='form mb-3' id='form_pago_{$d}'>
									<input type='hidden' name='option' value='changePayment'>
									<input type='hidden' name='curso' value='{$_POST['curso']}'>
									<input type='hidden' name='estudiante' value='{$d}'>
									<input type='hidden' name='estatus' value='0'>
									<button class='btn btn-warning'>Cambiar a pago pendiente</button>
								</form>";
					} else {
						$html .= "<form action='" . WEB_ROOT . "/ajax/new/course.php' method='POST' class='form mb-3' id='form_pago_{$d}'>
									<input type='hidden' name='option' value='changePayment'>
									<input type='hidden' name='curso' value='{$_POST['curso']}'>
									<input type='hidden' name='estudiante' value='{$d}'>
									<input type='hidden' name='estatus' value='1'>
									<button class='btn btn-primary'>Cambiar a pagado </button>
								</form>";
					}
					if ($row['status_evaluation']) {
						$html .= "<form action='" . WEB_ROOT . "/ajax/new/course.php' method='POST' class='form mb-3' id='form_evaluation_{$d}'>
									<input type='hidden' name='option' value='changeEvaluation'>
									<input type='hidden' name='curso' value='{$_POST['curso']}'>
									<input type='hidden' name='estudiante' value='{$d}'>
									<input type='hidden' name='estatus' value='0'>
									<button class='btn btn-warning'>Cambiar a no la evaluación</button>
								</form>";
					} else {
						$html .= "<form action='" . WEB_ROOT . "/ajax/new/course.php' method='POST' class='form mb-3' id='form_evaluation_{$d}'>
									<input type='hidden' name='option' value='changeEvaluation'>
									<input type='hidden' name='curso' value='{$_POST['curso']}'>
									<input type='hidden' name='estudiante' value='{$d}'>
									<input type='hidden' name='estatus' value='1'>
									<button class='btn btn-primary'>Cambiar a si la evaluación</button>
								</form>";
					}
					return $html;
				},
			),
		);
		$where = "user_subject.courseId = {$_POST['curso']}";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	function dt_constancias_conocer()
	{
		$table = 'user INNER JOIN user_subject ON user_subject.alumnoId = user.userId';
		$primaryKey = 'userId';
		$columns = array(
			array('db' => 'userId', 'dt' => 'userId'),
			array('db' => 'user.controlNumber', 'dt' => 'control'),
			array('db' => 'CONCAT(user.names, " ", user.lastNamePaterno," ", user.lastNameMaterno)',  'dt' => 'alumno'),
			array('db' => '(SELECT constancias_conocer.id FROM constancias_conocer WHERE constancias_conocer.studentId = user.userId AND constancias_conocer.courseId = user_subject.courseId)', 'dt' => 'constancia'),
			array(
				'db' => 'userId',
				'dt' => 'acciones',
				'formatter' => function ($d, $row) {
					$html = "";
					if ($row['constancia']) {
						$html = '<a href="' . WEB_ROOT . '/pdf/constancia.php?courseId=' . $_POST['curso'] . '&studentId=' . $row['userId'] . '" target="_blank">
									<i class="fas fa-download"></i>
								</a>';
					} else {
						$html = '<form id="form_' . $row['userId'] . $_POST['curso'] . '" class="form" action="' . WEB_ROOT . '/ajax/new/constancia-conocer.php" method="POST">
									<input type="hidden" name="student" value="' . $row['userId'] . '">
									<input type="hidden" name="course" value="' . $_POST['curso'] . '">
									<div class="input-group">
									 	<div class="input-group-prepend">
										 	<input placeholder="Folio..." type="text" class="form-control" id="folio' . $row['userId'] . '" name="folio" required> 
											<button class="btn btn-success" type="submit">Generar</button> 
										</div>
									</div>
								</form>';
					}
					return $html;
				},
			),
		);
		$where = "user_subject.courseId = {$_POST['curso']}";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	public function dt_diplomas_multiples()
	{
		$table = 'diploma_multiple';
		$primaryKey = 'id';
		$columns = array(
			array('db' => 'id', 			'dt' => 'id'),
			array('db' => 'nombre', 		'dt' => 'nombre'),
			array('db' => 'imagen_portada',	'dt' => 'imagen_portada', 'formatter' => function ($d, $row) {
				return "<iframe src='https://drive.google.com/file/d/{$row['imagen_portada']}/preview' style='border:0;'></iframe>";
			}),
			array('db' => 'imagen_contraportada', 'dt' => 'imagen_contraportada', 'formatter' => function ($d, $row) {
				return "<iframe src='https://drive.google.com/file/d/{$row['imagen_contraportada']}/preview' style='border:0;'></iframe>";
			}),
			array('db'	=> '(SELECT GROUP_CONCAT(diploma_cursos.course_id) FROM diploma_cursos WHERE diploma_cursos.diploma_id = diploma_multiple.id)', 'dt'	=> 'cursos'),
			array(
				'db' => 'id',
				'dt' => 'acciones',
				'formatter' => function ($d, $row) {
					$html = "<form class='form' id='form_curso_alumno" . $row['id'] . "' action='" . WEB_ROOT . "/ajax/new/course.php' method='POST'>
								<input type='hidden' name='option' value='addStudentDiploma'>
								<input type='hidden' name='diploma' value='" . $row['id'] . "'>
								<button class='btn btn-success' type='submit'>Agregar alumno</button>
							</form>";
					return $html;
				},
			),
		);
		$where = "";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	public function addDiplomaMultiple($nombre, $imagen_portada, $imagen_contraportada)
	{
		$sql = "INSERT INTO diploma_multiple(nombre, imagen_portada, imagen_contraportada) VALUES('$nombre', '$imagen_portada', '$imagen_contraportada')";
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->InsertData();
	}


	public function addDiplomaCurso($diploma, $curso)
	{
		$sql = "INSERT INTO diploma_cursos(diploma_id, course_id) VALUES($diploma, $curso)";
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->InsertData();
	}

	public function dt_alumnos_diplomas()
	{
		$table = 'user_subject INNER JOIN user ON user.userId = user_subject.alumnoId';
		$primaryKey = 'courseId';
		$columns = array(
			array('db'	=> 'user.userId', 			'dt'	=> 'id'),
			array('db'	=> 'user.controlNumber',	'dt' 	=> 'controlNumber'),
			array('db'	=> 'user.password',			'dt' 	=> 'password'),
			array('db' 	=> 'CONCAT(user.names, " ", user.lastNamePaterno, " ", user.lastNameMaterno)', 	'dt' => 'nombre'),
			array('db'	=> "(SELECT COUNT(*) FROM diploma_alumnos WHERE diploma_alumnos.alumno_id = user.userId AND diploma_alumnos.diploma_id = {$_POST['diploma']})", 'dt'	=> 'existe'),
			array(
				'db' => 'user.userId',
				'dt' => 'acciones',
				'formatter' => function ($d, $row) {
					if ($row['existe'] == 0) {
						return "<form id='form_generateDiploma" . $row['id'] . "' class='form' method='POST' action='" . WEB_ROOT . "/ajax/new/course.php'>
								<input type='hidden' name='option' value='generateDiploma'>
								<input type='hidden' name='diploma' value='" . $_POST['diploma'] . "'>
								<input type='hidden' name='student' value='" . $row['id'] . "'>
								<button class='btn btn-success' type='submit'>Generar documento</button>
							</form>";
					}
					return "<form id='form_generateDiploma" . $row['id'] . "' class='form' method='POST' action='" . WEB_ROOT . "/ajax/new/course.php'>
								<input type='hidden' name='option' value='deleteDiplomaMultiple'>
								<input type='hidden' name='diploma' value='" . $_POST['diploma'] . "'>
								<input type='hidden' name='student' value='" . $row['id'] . "'>
								<button class='btn btn-danger' type='submit'>Quitar documento</button>
							</form>";
				},
			),
		);
		$where = "1 GROUP BY user.userId";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where, null);
	}

	public function generateDiploma($diploma, $alumno, $token)
	{
		$sql = "INSERT INTO diploma_alumnos(diploma_id, alumno_id, token) VALUES($diploma, $alumno, '{$token}')";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
	}

	public function deleteDiplomaMultiple($diploma, $alumno)
	{
		$sql = "DELETE FROM diploma_alumnos WHERE diploma_id = '{$diploma}' AND alumno_id = '{$alumno}'";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
	}

	public function dt_courses_request($subjectId, $modality)
	{
		$table = 'course INNER JOIN subject ON subject.subjectId = course.subjectId';
		$primaryKey = 'course.courseId';
		$columns = array(
			array('db' => 'course.courseId',	'dt' => 'courseId'),
			array('db' => 'subject.rvoe',		'dt' => 'rvoeLocal'),
			array('db' => 'subject.rvoeLinea',	'dt' => 'rvoeLinea'),
			array('db' => 'course.modality',	'dt' => 'modalidad', 'formatter' => function ($id, $row) {
				$modalidad = ["Local" => "Escolar", "Online" => "No Escolar", "Mixta" => "Mixta"];
				return $modalidad[$row['modalidad']];
			}),
			array('db' => 'subject.rvoe',		'dt' => 'rvoe', 'formatter' => function ($id, $row) {
				return $row['modalidad'] == "Local" ? $row['rvoeLocal'] : $row['rvoeLinea'];
			}),
			array('db' => 'subject.name',		'dt' => 'nombre'),
			array('db' => '`course`.`group`',	'dt' => 'grupo'),
			array('db' => 'course.initialDate',	'dt' => 'fecha_inicial'),
			array('db' => 'course.finalDate',	'dt' => 'fecha_final'),
			array('db' => 'course.courseId',	'dt' => 'modulos', 'formatter'	=> function ($id, $row) {
				$id = $row['courseId'];
				$this->setCourseId($id);
				$courseData = $this->getCourse();
				$modulesCourse = $this->getCountModulesCourse();
				$this->setSubjectId($courseData['subjectId']);
				$modulesSubject = $this->getCountModulesSubject();

				$html = "<a href='" . WEB_ROOT . "/graybox.php?page=view-modules-course&id=" . $id . "' title='Ver Modulos de Curso' data-target='#ajax' data-toggle='modal' >
					<i class='far fa-window-restore text-info fa-lg'></i>
				</a>";
				if ($_SESSION['User']['perfil'] != "Docente") {
					$html .= "<a href='" . WEB_ROOT . "/graybox.php?page=add-modules-course&id=" . $id . "' title='Agregar Modulo a Curso' data-target='#ajax' data-toggle='modal' style='color:#000' >
						<i class='fas fa-plus-circle text-dark fa-lg'></i>
					</a>";
				}
				return $_SESSION['User']['perfil'] == "Docente" ? $html : "$modulesCourse/$modulesSubject" . $html;
			}),
			array('db' => 'course.courseId',	'dt' => 'alumnos', 'formatter'	=> function ($id, $row) {
				$id = $row['courseId'];
				$sql = "SELECT * FROM user_subject WHERE user_subject.courseId = $id AND user_subject.status = 'activo'";
				$this->Util()->DB()->setQuery($sql);
				$activos = $this->Util()->DB()->GetTotalRows();
				$sql = "SELECT * FROM user_subject WHERE user_subject.courseId = $id AND user_subject.status = 'inactivo'";
				$this->Util()->DB()->setQuery($sql);
				$inactivos = $this->Util()->DB()->GetTotalRows();
				$html = "";
				if ($_SESSION['User']['perfil'] == "Docente") {
					$html .= "<span class='spanActive badge badge-success rounded-circle' title='Alumnos Activos'>$activos</span>
					<span class='spanInactive badge badge-danger rounded-circle' title='Alumnos Inactivos'>" . $inactivos . "</span>";
				} else {
					$html .= "<form class='form d-inline' action='" . WEB_ROOT . "/ajax/new/studentCurricula.php' method='POST' id='activeStudent" . $id . "'>
						<input type='hidden' name='type' value='StudentAdmin'>
						<input type='hidden' name='id' value='" . $id . "'>
						<input type='hidden' name='tip' value='Activo'>
						<button type='submit' class='pointer spanActive badge badge-success rounded-circle' data-target='#ajax' data-toggle='modal' title='Alumnos Activos'>$activos</button>
					</form> / <form class='form d-inline' action='" . WEB_ROOT . "/ajax/new/studentCurricula.php' method='POST' id='inactiveStudent" . $id . "'>
						<input type='hidden' name='type' value='StudentInactivoAdmin'>
						<input type='hidden' name='id' value='" . $id . "'>
						<input type='hidden' name='tip' value='Inactivo'>
						<button type='submit' class='pointer spanInactive badge badge-danger rounded-circle' data-target='#ajax' data-toggle='modal' title='Alumnos Inactivos'>" . $inactivos . "</button>
					</form>";
				}
				return $html;
			}),
			array('db' => 'subject.tipo', 		'dt' => 'tipo'),
			array('db' => 'course.courseId',	'dt' => 'acciones', 'formatter'	=> function ($id, $row) {
				$id = $row['courseId'];
				if ($_SESSION['User']['perfil'] == "Docente")
					return "";
				$acciones = "";
				if ($_SESSION['User']['userId'] != 253) {
					$acciones .= '	<a class="dropdown-item py-0 spanActive" href="#" onclick="VerGrupo(' . $id . ',\'matricula\');"
										title="Matrículas" id="' . $id . '">
										<i class="fas fa-cog"></i> Matrículas
									</a>
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=niveles-ingles&id=' . $id . '"
									data-target="#ajax" data-toggle="modal" title="Niveles de Inglés">
										<i class="far fa-check-square"></i> Niveles de Inglés
									</a>
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=titulacion&id=' . $id . '"
									data-target="#ajax" data-toggle="modal" title="Títulos">
										<i class="fas fa-file-signature"></i> Títulos
									</a>
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=qualifications-course&id=' . $id . '" data-target="#ajax" data-toggle="modal" title="Boleta de Calificaciones">
										<i class="fas fa-file-signature"></i> Boleta de Calificaciones
									</a>
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=ver-sabana-course&id=' . $id . '"
									data-target="#ajax" data-toggle="modal" title="Sabana de Calificaciones">
										<i class="fas fa-tasks"></i> Sabana de Calificaciones
									</a> 
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=certificates-course&id=' . $id . '"
										data-target="#ajax" data-toggle="modal" title="Certificados">
										<i class="fas fa-certificate"></i> Certificados
									</a> 
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=acta-examen-course&id=' . $id . '"
										data-target="#ajax" data-toggle="modal" title="Acta de Examen">
										<i class="fas fa-file-contract"></i> Acta de Examen
									</a>
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=constancias&id=' . $id . '"
										data-target="#ajax" data-toggle="modal" title="Constancias" data-width="1100px">
										<i class="fas fa-certificate"></i> Constancias
									</a>
									<a class="dropdown-item py-0"
										href="' . WEB_ROOT . '/graybox.php?page=constancia-sencilla-course&id=' . $id . '"
										data-target="#ajax" data-toggle="modal" title="Constancia Sencilla">
										<i class="fas fa-file-alt"></i> Constancia Sencilla
									</a>
									<a class="dropdown-item py-0"
										href="' . WEB_ROOT . '/graybox.php?page=constancia-calificaciones-course&id=' . $id . '"
										data-target="#ajax" data-toggle="modal" title="Constancia Sencilla">
										<i class="fas fa-file-alt"></i> Constancia del 50%
									</a>
									<a class="dropdown-item py-0 pointer spanActive" onclick="VerGrupo(' . $id . ');"
									title="Referencia Bancaria" id="' . $id . '">
										<i class="fas fa-credit-card"></i> Referencia Bancaria
									</a>
									<a class="dropdown-item py-0" href="' . WEB_ROOT . '/graybox.php?page=periodos&id=' . $id . '"
										data-target="#ajax" data-toggle="modal" title="Periodos del curso">
										<i class="fas fa-calendar-alt"></i> Periodos de curso
									</a>
									';
				}
				if (in_array($_SESSION['User']['userId'], [1, 253])) {
					if (in_array($id, [162, 169])) {
						$acciones .= '<a class="dropdown-item" href="' . WEB_ROOT . '/graybox.php?page=diplomas&id=' . $id . '"
						target="_blank" data-target="#ajax" data-toggle="modal" title="Diplomas">
							<i class="fas fa-clipboard-check"></i> Diplomas
						</a>';
					}
					$acciones .= '<a class="dropdown-item" href="' . WEB_ROOT . '/graybox.php?page=constancia-conocer&id=' . $id . '"
									data-target="#ajax" data-toggle="modal" title="Constancia">
									<i class="fas fa-certificate"></i> Constancia Evaluación
								</a>
								<a class="dropdown-item" href="' . WEB_ROOT . '/graybox.php?page=cotejo-conocer&id=' . $id . '"
									data-target="#ajax" data-toggle="modal" title="Constancia">
									<i class="fas fa-certificate"></i> Cotejo Conocer
								</a>';
				}
				if (in_array($_SESSION['User']['userId'], [1, 149])) {
					$acciones .= '<form id="form_calendario' . $id . '" class="form dropdown-item pointer spanActive"
						action="' . WEB_ROOT . '/ajax/new/conceptos.php" method="POST">
						<input type="hidden" name="opcion" value="conceptos-curso">
						<input type="hidden" name="curso" value="' . $id . '">
						<button type="submit" class="border-0 bg-transparent p-0" data-target="#ajax" data-toggle="modal">
							<i class="fas fa-calendar-alt"></i> Calendario de Pagos
						</button>
					</form>';
				}
				$html = '<div class="dropdown">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
								<i class="fas fa-bars"></i>
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="' . WEB_ROOT . '/graybox.php?page=edit-course&id=' . $id . '" data-target="#ajax" data-toggle="modal" title="Editar">
									<i class="fas fa-edit"></i> Editar
								</a>
								' . $acciones . '
							</div>
						</div>';
				return $html;
			}),
		);

		$where = "subject.subjectId = " . $subjectId;
		if ($modality != "") {
			$where .= " AND course.modality = '" . $modality . "'";
		}
		if ($_SESSION['User']['perfil'] == "Docente") {
			$table .= " INNER JOIN course_module ON course_module.courseId = course.courseId";
			$where .= " AND course_module.access LIKE '%|{$_SESSION['User']['userId']}|%' GROUP BY course.courseId";
		}
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	public function getCourse()
	{
		$sql = "SELECT major.name as major_name, subject.subjectId, subject.name as subject_name, course.courseId, `course`.`group`, course.initialDate, course.finalDate, course.access, subject.totalPeriods as totalPeriods FROM course INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo WHERE courseId = {$this->courseId}";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();

		$result["access"] = explode("|", $result["access"]);
		$personal = new Personal;
		$personalData = $personal->getPersonal("AND personalId = {$result['access'][0]}")[0];
		$result["encargado"] = $personalData;
		return $result;
	}

	public function getCountModulesCourse()
	{
		$sql = "SELECT COUNT(*) FROM course_module WHERE courseId = {$this->courseId}";
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->GetSingle();
	}
}
