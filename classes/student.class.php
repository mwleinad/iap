<?php

class Student extends User
{
	private $subjectId;
	private $name;
	private $apaterno;
	private $amaterno;
	private $nombre;
	private $noControl;
	private $estatus;
	private $tipobaja;
	private $motivo;
	private $cmId;
	private $usuariojjId;
	private $yoId;
	private $mensaje;
	private $statusjj;
	private $asunto;
	private $perfil;
	private $anterior;
	private $nuevo;
	private $repite;
	private $documentoId;
	private $tipoMajor;
	private $tipo_beca;
	private $por_beca;
	private $validar = true;
	private $periodo;
	private $correoInstitucional;
	private $foto;
	private $curpDrive;
	private $funcion;
	private $actualizado;

	public function setActualizado($value)
	{
		$this->actualizado = $value;
	}
	public function setValidar($value)
	{
		$this->validar = $value;
	}
	public function setPeriodo($value)
	{
		$this->periodo = $value;
	}

	public function setAnterior($value)
	{
		$this->anterior = $value;
	}

	public function setNuevo($value)
	{
		$this->nuevo = $value;
	}

	public function setRepite($value)
	{
		$this->repite = $value;
	}

	public function setPerfil($value)
	{
		$this->perfil = $value;
	}

	public function setAsunto($value)
	{
		$this->asunto = $value;
	}

	public function setStatusjj($value)
	{
		$this->statusjj = $value;
	}

	public function setUsuariojjId($value)
	{
		$this->usuariojjId = $value;
	}

	public function setYoId($value)
	{
		$this->yoId = $value;
	}

	public function setMensaje($value)
	{
		$this->mensaje = $value;
	}

	public function setCMId($value)
	{
		$this->cmId = $value;
	}

	public function setSubjectId($value)
	{
		$this->subjectId = $value;
	}

	public function setTipoBaja($value)
	{
		$this->tipobaja = $value;
	}

	public function setMotivo($value)
	{
		$this->motivo = $value;
	}

	private $alumnoId;

	public function setAlumnoId($value)
	{
		$this->alumnoId = $value;
	}

	public function setName($value)
	{
		$this->name = $value;
	}

	public function setNombre($value)
	{
		$this->nombre = $value;
	}

	public function setApaterno($value)
	{
		$this->apaterno = $value;
	}

	public function setAmaterno($value)
	{
		$this->amaterno = $value;
	}

	public function setNocontrol($value)
	{
		$this->noControl = $value;
	}

	public function setEstatus($value)
	{
		$this->estatus = $value;
	}


	public function setTipoBeca($value)
	{
		$this->tipo_beca = $value;
	}

	public function setPorBeca($value)
	{
		$this->por_beca = $value;
	}

	public function setDocumentoId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->documentoId = $value;
	}

	public function setTipoMajor($value)
	{
		$this->tipoMajor = $value;
	}

	public function setCorreoInstitucional($value)
	{
		$this->correoInstitucional = $value;
	}

	public function setCurpDrive($value)
	{
		$this->curpDrive = $value;
	}

	public function setCurp($value)
	{
		$this->curp = $value;
	}

	public function setFoto($value)
	{
		$this->foto = $value;
	}

	function setFuncion($value)
	{
		$this->funcion = $value;
	}

	private $schoolNumber;
	function setSchoolNumber($value)
	{
		$this->schoolNumber = $value;
	}

	public function AddAcademicHistory($type, $situation, $semesterId = 1)
	{
		$sql = "INSERT INTO academic_history(subjectId, courseId, userId, semesterId, dateHistory, type, situation) VALUES(" . $this->subjectId . ", " . $this->courseId . ", " . $this->userId . ", " . $semesterId . ", CURDATE(), '" . $type . "', '" . $situation . "')";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
		return true;
	}

	public function UpdateFoto()
	{
		$ext = end(explode('.', basename($_FILES['foto']['name'])));
		if (strtolower($ext) != "jpg" && strtolower($ext) != "jepg") {
			$this->Util()->setError(10028, "error", "La extension solo puede ser jpg");
			$this->Util()->PrintErrors();
			return;
		}
		$filename = $_POST["userId"] . ".jpg";
		$target_path = DOC_ROOT . "/alumnos/" . $filename;
		if (move_uploaded_file($_FILES['foto']['tmp_name'], $target_path)) {
			$sql = "UPDATE user SET rutaFoto = '" . $filename . "' WHERE userId = " . $_POST["userId"];
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
			$this->Util()->setError(10028, "complete", "Has cambiado la foto satisfactoriamente.");
			$this->Util()->PrintErrors();
		}
	}

	public function desactivar()
	{
		$sql = "UPDATE user SET activo='0' WHERE userId='" . $this->getUserId() . "' ";
		$this->Util()->DB()->setQuery($sql);
		if (!$this->Util()->DB()->ExecuteQuery()) {
			$infoStudent = $this->GetInfo();
			$fecha_aplicacion = date("Y-m-d H:i:s");
			$hecho = $_SESSION['User']['userId'] . "p";
			$actividad = "Se ha dado de Baja un Alumno(" . $infoStudent['controlNumber'] . "-" . $infoStudent['names'] . " " . $infoStudent['lastNamePaterno'] . " " . $infoStudent['lastNameMaterno'] . ") desde el panel de Administración ";
			$visto = "1p," . $_SESSION['User']['userId'] . "p";
			$enlace = "/student";

			$sqlNot = "INSERT INTO notificacion(notificacionId,actividad,vista,hecho,fecha_aplicacion,tablas,enlace)
			   			VALUES('', '" . $actividad . "', '" . $visto . "', '" . $hecho . "', '" . $fecha_aplicacion . "', 'reply', '" . $enlace . "')";
			$this->Util()->DB()->setQuery($sqlNot);
			// Ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();
			return true;
		} else {
			$this->Util()->setError(10030, "complete", "No ne pudo desactivar al Alumno intente mas tarde");
			$this->Util()->PrintErrors();
			return false;
		}
	}

	public function Activar()
	{
		$sql = "UPDATE user SET activo='1' WHERE userId='" . $this->getUserId() . "'";
		$this->Util()->DB()->setQuery($sql);
		if (!$this->Util()->DB()->ExecuteQuery()) {
			$this->Util()->setError(10030, "complete", "El Alumno fue dado de Alta Correctamente");
			$this->Util()->PrintErrors();
			$infoStudent = $this->GetInfo();
			$fecha_aplicacion = date("Y-m-d H:i:s");
			$hecho = $_SESSION['User']['userId'] . "p";
			$actividad = "Se ha dado de Alta un Alumno(" . $infoStudent['controlNumber'] . "-" . $infoStudent['names'] . " " . $infoStudent['lastNamePaterno'] . " " . $infoStudent['lastNameMaterno'] . ") desde el panel de Administración ";
			$visto = "1p," . $_SESSION['User']['userId'] . "p";
			$enlace = "/student";
			$sqlNot = "INSERT INTO notificacion(notificacionId, actividad, vista, hecho, fecha_aplicacion, tablas, enlace)
			   			VALUES('', '" . $actividad . "',  '" . $visto . "', '" . $hecho . "', '" . $fecha_aplicacion . "', 'reply', '" . $enlace . "')";
			$this->Util()->DB()->setQuery($sqlNot);
			// Ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();
			return true;
		} else {
			$this->Util()->setError(10030, "complete", "No ne pudo Activar al Alumno intente mas tarde");
			$this->Util()->PrintErrors();
			return false;
		}
	}

	public function GetInfo($where = "")
	{
		if ($where == "") {
			$where = "AND userId = $this->userId";
		}
		$sql = "SELECT u.*, 
						m.nombre AS nombreciudad 
				FROM user AS u 
					LEFT JOIN municipio AS m 
						ON m.municipioId = u.ciudadt
		WHERE 1 $where";
		$this->Util()->DB()->setQuery($sql);
		$row = $this->Util()->DB()->GetRow();
		$row["names"] = $this->Util()->DecodeTiny($row["names"]);
		$row["curpDrive"] = json_decode($this->Util()->DecodeTiny($row['curpDrive']));
		$row["foto"] = json_decode($this->Util()->DecodeTiny($row['foto']));
		$row["lastNamePaterno"] = $this->Util()->DecodeTiny($row["lastNamePaterno"]);
		$row["lastNameMaterno"] = $this->Util()->DecodeTiny($row["lastNameMaterno"]);
		return $row;
	}

	public function EnumerateTotal()
	{
		$sql = "SELECT * FROM user";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function EnumeratePaises()
	{
		$sql = "SELECT * FROM pais";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function EnumerateEstados()
	{
		$sql = "SELECT * FROM estado WHERE paisId='" . $this->getCountry() . "'";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function EnumerateCiudades()
	{
		$sql = "SELECT * FROM municipio WHERE estadoId='" . $this->getState() . "'";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function EnumerateStudent($sql)
	{
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		foreach ($result as $key => $res) {
			$card = $res;
			$result2[$key] = $card;
		}
		return $result2;
	}

	public function Enumerate($orderSemester = '', $sqlSearch = '')
	{
		global $semester;
		global $group;
		$sql = "SELECT * 
					FROM user 
					WHERE 1" . $sqlSearch . "
						AND type = 'student'
						ORDER BY " . $orderSemester . " lastNamePaterno ASC, lastNameMaterno ASC, `names` ASC";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		foreach ($result as $key => $res) {
			$card = $res;
			$result2[$key] = $card;
		}
		return $result2;
	}

	public function EnumerateCount($sqlSearch = '')
	{
		$sql = "SELECT COUNT(*) FROM user WHERE 1" . $sqlSearch . " AND type = 'student'";
		$this->Util()->DB()->setQuery($sql);
		$total = $this->Util()->DB()->GetSingle();
		return $total;
	}

	public function Save($option = "")
	{
		if ($this->Util()->PrintErrors())
			return false;

		if ($this->curpDrive == "") {
			$this->curpDrive = 'NULL';
		}
		if ($this->foto == "") {
			$this->foto = 'NULL';
		}
		if ($this->actualizado == "") {
			$this->actualizado = 'no';
		}
		$sql = "SELECT COUNT(*) FROM user WHERE email = '" . $this->getEmail() . "'";
		// Verificando que no se duplique el correo electronico
		$this->Util()->DB()->setQuery($sql);
		$total = $this->Util()->DB()->GetSingle();
		if ($total > 0) {
			$this->Util()->setError(10028, "error", "Este e-mail ya ha sido registrado previamente");
			$this->Util()->PrintErrors();
			return false;
		}
		// Validando contraseña de minimo 6 caracteres
		if (strlen($this->getPassword()) < 6) {
			$this->Util()->setError(10028, "error", "El password debe de contener al menos 6 caracteres.");
			$this->Util()->PrintErrors();
			return false;
		}

		$course = new Course();
		$course->setCourseId($_POST["curricula"]);
		$courseData = $course->Info();
		if (!in_array($_POST['curricula'], [162, 167, 168, 169])) {
			// CRM
			$sql = "SELECT uuid()";
			$this->Util()->DBCrm()->setQuery($sql);
			$leadId = $this->Util()->DBCrm()->GetSingle();
			$sql = "INSERT INTO leads(
						id, 
						date_entered, 
						date_modified, 
						modified_user_id, 
						created_by, 
						deleted, 
						assigned_user_id, 
						first_name, 
						last_name, 
						do_not_call, 
						phone_mobile, 
						phone_work, 
						converted, 
						lead_source, 
						status, 
						account_name, 
						account_id) 
					VALUES(
						'" . $leadId . "',
						NOW(),
						NOW(),
						1,
						1,
						0,
						1,
						'" . ucfirst(mb_strtolower($this->getNames())) . "',
						'" . ucfirst(mb_strtolower($this->getLastNamePaterno())) . " " . ucfirst(mb_strtolower($this->getLastNameMaterno())) . "',
						0,
						'" . $this->getMobile() . "',
						'" . $this->getMobile() . "',
						0,
						'Education System',
						'New',
						'" . $courseData['crm_name'] . "',
						'" . $courseData['crm_id'] . "'
						)";

			$this->Util()->DBCrm()->setQuery($sql);
			$this->Util()->DBCrm()->InsertData();

			$sql = "SELECT uuid()";
			$this->Util()->DBCrm()->setQuery($sql);
			$emailId = $this->Util()->DBCrm()->GetSingle();
			$sql = "INSERT INTO email_addresses(
					id,
					email_address,
					email_address_caps,
					invalid_email,
					opt_out,
					confirm_opt_in,
					date_created,
					date_modified,
					deleted
				) 
				VALUES(
					'" . $emailId . "',
					'" . mb_strtolower($this->getEmail()) . "',
					'" . mb_strtoupper($this->getEmail()) . "',
					0,
					0,
					'not-opt-in',
					NOW(),
					NOW(),
					0
				)";
			$this->Util()->DBCrm()->setQuery($sql);
			$this->Util()->DBCrm()->InsertData();

			$sql = "SELECT uuid()";
			$this->Util()->DBCrm()->setQuery($sql);
			$uuId = $this->Util()->DBCrm()->GetSingle();
			$sql = "INSERT INTO email_addr_bean_rel(
					id,
					email_address_id,
					bean_id,
					bean_module,
					primary_address, 
					reply_to_address,
					date_created, 
					date_modified,
					deleted
				) 
				VALUES(
					'" . $uuId . "',
					'" . $emailId . "',
					'" . $leadId . "',
					'Leads',
					1,
					0,
					NOW(),
					NOW(),
					0
				)";
			$this->Util()->DBCrm()->setQuery($sql);
			$this->Util()->DBCrm()->InsertData();
		}

		$sqlQuery = "INSERT INTO 
						user 
						(
							type,
							names, 
							lastNamePaterno, 
							lastNameMaterno,
							controlNumber,
							birthdate,							
							email, 
							phone, 
							password,
							street, 
							number, 
							colony, 
							ciudad, 
							estado, 
							pais, 
							postalCode, 
							sexo, 
							maritalStatus, 
							fax,
							mobile,
							workplace,
							workplaceOcupation,
							workplaceAddress,
							workplaceArea,
							workplacePosition,
							workplaceCity,
							paist,
							estadot,
							ciudadt,
							workplacePhone,
							workplaceEmail,
							academicDegree,
							profesion,
							school,
							masters,
							mastersSchool,
							highSchool,
							actualizado,
							curpDrive,
							curp,
							foto,
							funcion
						)
							VALUES
						(
							'student',
							'" . $this->getNames() . "', 
							'" . $this->getLastNamePaterno() . "', 
							'" . $this->getLastNameMaterno() . "',
							'" . $this->getControlNumber() . "',
							'" . $this->getBirthdate() . "',							
							'" . $this->getEmail() . "', 
							'" . $this->getPhone() . "', 
							'" . $this->getPassword() . "',
							'" . $this->getStreet() . "', 
							'" . $this->getNumer() . "', 
							'" . $this->getColony() . "', 
							'" . $this->getCity() . "', 
							'" . $this->getState() . "', 
							'" . $this->getCountry() . "', 
							'" . $this->getPostalCode() . "', 
							'" . $this->getSexo() . "', 
							'" . $this->getMaritalStatus() . "', 
							'" . $this->getFax() . "', 
							'" . $this->getMobile() . "', 
							'" . $this->getWorkplace() . "', 
							'" . $this->getWorkplaceOcupation() . "', 
							'" . $this->getWorkplaceAddress() . "', 
							'" . $this->getWorkplaceArea() . "', 
							'" . $this->getWorkplacePosition() . "', 
							'" . $this->getCiudadT() . "', 
							'" . $this->getPaisT() . "', 
							'" . $this->getEstadoT() . "', 
							'" . $this->getCiudadT() . "',
							'" . $this->getWorkplacePhone() . "', 
							'" . $this->getWorkplaceEmail() . "', 
							'" . $this->getAcademicDegree() . "', 
							'" . $this->getProfesion() . "', 
							'" . $this->getSchool() . "', 
							'" . $this->getMasters() . "', 
							'" . $this->getMastersSchool() . "', 
							'" . $this->getHighSchool() . "',
							'" . $this->actualizado . "',
							{$this->curpDrive},
							'{$this->curp}',
							{$this->foto},
							'{$this->funcion}'
						)";
		// echo $sqlQuery;
		$this->Util()->DB()->setQuery($sqlQuery);

		if ($id = $this->Util()->DB()->InsertData()) {
			$fecha_aplicacion = date("Y-m-d H:i:s");
			$enlace = "/student";

			if ($this->getRegister() == 0) {
				$hecho = $id . "u";
				$actividad = "Se ha Registrado un nuevo Alumno";
				$visto = $id . "u,1p";
			} else {
				$hecho = $_SESSION['User']['userId'] . "p";
				$actividad = "Se ha registrado un Alumno(" . $this->getNames() . " " . $this->getLastNamePaterno() . " " . $this->getLastNameMaterno() . ") desde el panel de Administración ";
				$visto = "1p," . $_SESSION['User']['userId'] . "p";
			}

			$sqlNot = "INSERT INTO notificacion(notificacionId,actividad,vista,hecho,fecha_aplicacion,tablas,enlace)
			   		VALUES('', '" . $actividad . "', '" . $visto . "', '" . $hecho . "', '" . $fecha_aplicacion . "', 'reply', '" . $enlace . "')";
			$this->Util()->DB()->setQuery($sqlNot);
			// Ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();
		}

		if ($option == "createCurricula") {
			$course = new Course();
			$course->setCourseId($_POST["curricula"]);
			$courseInfo = $course->Info();
			if ($this->tipo_beca == "Ninguno")
				$this->por_beca = 0;

			$this->AddUserToCurriculaRegister($id, $_POST["curricula"], $this->getNames(), $this->getEmail(), $this->getPassword(), $courseInfo["majorName"], $courseInfo["name"], $this->tipo_beca, $this->por_beca, "");

			if ($this->getRegister() == 0) {
				$complete1 = "Te has registrado exitosamente. Te hemos enviado un correo electronico con los datos de ingreso al sistema";
				$this->Util()->setError(10028, "complete", $complete1);
				$complete2 = "En caso de no estar en tu bandeja de entrada, verifica en correos no deseados";
				$this->Util()->setError(10028, "complete", $complete2);
				$complete4 = "Cualquier problema que llegaras a tener, escribenos a enlinea@iapchiapas.org.mx";
				$this->Util()->setError(10028, "complete", $complete4);
				$complete3 = "Bienvenido";
				$this->Util()->setError(10028, "complete", $complete3);
			} else {
				$complete = "Has ingresado al Alumno exitosamente, Se ha enviado un correo electronico para continuar con su proceso de inscripción";
				$this->Util()->setError(10028, "complete", $complete);
			}
		}
		$this->Util()->PrintErrors();
		return true;
	}

	public function AddUserToCurriculaRegister($id, $curricula, $nombre, $email, $password, $major, $course, $tipo_beca, $por_beca, $matricula)
	{
		include_once(DOC_ROOT . "/properties/messages.php");
		$sql = "SELECT COUNT(*) FROM user_subject WHERE alumnoId = '" . $id . "' AND courseId = '" . $curricula . "'";
		$this->Util()->DB()->setQuery($sql);
		$count = $this->Util()->DB()->GetSingle();

		$sql = "SELECT subjectId FROM course WHERE courseId = '" . $curricula . "'";
		$this->Util()->DB()->setQuery($sql);
		$subjectId = $this->Util()->DB()->GetSingle();

		$sql = "SELECT payments FROM subject WHERE subjectId = '" . $subjectId . "'";
		$this->Util()->DB()->setQuery($sql);
		$payments = $this->Util()->DB()->GetSingle();

		// Curricula Temporal
		$sql = "SELECT temporalGroup FROM course WHERE courseId = " . $curricula;
		$this->Util()->DB()->setQuery($sql);
		$temporalGroup = intval($this->Util()->DB()->GetSingle());
		// Preinscrito
		$sql = "SELECT registrationId FROM user_subject WHERE courseId = " . $temporalGroup . " AND alumnoId = " . $id;
		$this->Util()->DB()->setQuery($sql);
		$registrationId = intval($this->Util()->DB()->GetSingle());

		$status = 'activo';

		if ($count > 0)
			return $complete = "Este alumno ya esta registrado en esta curricula. Favor de Seleccionar otra Curricula";

		if ($temporalGroup > 0 && $registrationId > 0) {
			// Actualiza la curricula temporal por la oficial
			$sql = "UPDATE user_subject SET courseId = " . $curricula . ", status = 'activo' WHERE alumnoId = " . $id . " AND courseId = " . $temporalGroup;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
			$complete = "Has registrado al alumno exitosamente, le hemos enviado un correo electronico para continuar con el proceso de inscripcion";
		} else {
			// Se inscribe a curricula 
			$sqlQuery = "INSERT INTO user_subject(alumnoId, status, courseId, tipo_beca, por_beca, matricula) VALUES('" . $id . "', '" . $status . "', '" . $curricula . "', '" . $tipo_beca . "', '" . $por_beca . "', '" . $matricula . "')";
			$this->Util()->DB()->setQuery($sqlQuery);
			if ($this->Util()->DB()->InsertData())
				$complete = "Has registrado al alumno exitosamente, le hemos enviado un correo electronico para continuar con el proceso de inscripcion";
			else
				$complete = "no";
		}
		$this->setUserId($id);
		$info = $this->GetInfo();
		// Informacion Personal
		$this->setControlNumber();
		$this->setNames($info['names']);
		$this->setLastNamePaterno($info['lastNamePaterno']);
		$this->setLastNameMaterno($info['lastNameMaterno']);
		$this->setSexo($info['sexo']);
		$this->setPassword(trim($info['password']));

		// Datos de Contacto
		$this->setEmail($info['email']);
		$this->setMobile($info['mobile']);

		// Datos Laborales
		$this->setWorkplaceOcupation($info['workplaceOcupation']);
		$this->setWorkplace($info['workplace']);
		$this->setWorkplacePosition($info['workplacePosition']);
		$this->setWorkplaceCity($info['nombreciudad']);

		// Estudios
		$this->setAcademicDegree($info['academicDegree']);
		// Crear Vencimientos
		$this->AddInvoices($id, $curricula);
		// Create File to Attach
		/* $files  = new Files;
		$file = $files->CedulaInscripcion($id, $curricula, $this, $major, $course); */
		// Enviar Correo
		$sendmail = new SendMail;
		$details_body = array(
			"email" => $info["controlNumber"],
			"password" => $password,
			"major" => utf8_decode($major),
			"course" => utf8_decode($course),
		);
		$details_subject = array();
		/* $attachment[0] = DOC_ROOT."/files/solicitudes/".$file;
		$fileName[0] = "Solicitud_de_Inscripcion.pdf";
		$attachment[1] = DOC_ROOT."/manual_alumno.pdf";
		$fileName[1] = "Manual_Alumno.pdf"; */
		$attachment = [];
		$fileName = [];
		$sendmail->PrepareAttachment($message[1]["subject"], $message[1]["body"], $details_body, $details_subject, $email, $nombre, $attachment, $fileName);
		return $complete;
	}

	function DeleteStudentCurricula($period, $situation)
	{
		$courseId = $this->getCourseId();
		$subjectId = $this->subjectId;
		$userId = $this->getUserId();
		$sql = "UPDATE user_subject SET status = 'inactivo', situation = '" . $situation . "', situation_date = CURDATE() WHERE alumnoId = " . $userId . " AND courseId = " . $courseId;
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		$this->AddAcademicHistory('baja', $situation, $period);
		$this->Util()->setError(10028, "complete", "Alumno eliminado con éxito de esta curricula.");
		$this->Util()->PrintErrors();
		return true;
	}

	function EnableStudentCurricula()
	{
		$courseId = $this->getCourseId();
		$userId = $this->getUserId();
		$sql = "UPDATE user_subject SET status='activo', situation = 'A', situation_date = CURDATE() WHERE alumnoId= '" . $userId . "' AND courseId= '" . $courseId . "' ";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		$this->AddAcademicHistory('alta', 'A');
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10028, "complete", "Alumno activado con éxito.");
		$this->Util()->PrintErrors();
		return true;
	}

	function AddUserToCurriculaFromCatalog($userId, $courseId, $tipo_beca, $por_beca)
	{
		$course = new Course();
		$course->setCourseId($courseId);
		$courseInfo = $course->Info();

		$user = new User();
		$this->setUserId($userId);
		$info = $this->GetInfo();
		if ($courseInfo['majorName'] == "ESPECIALIDAD" || $courseInfo['majorName'] == "MAESTRIA")
			$matricula = $this->generaMatricula($info['majorName'], $courseId);
		else
			$matricula = "";

		$complete = $this->AddUserToCurricula($userId, $courseId, $info["names"], $info["email"], $info["password"], $courseInfo["majorName"], $courseInfo["name"], $tipo_beca, $por_beca, $matricula);
		if ($complete['status']) {
			$this->AddAcademicHistory('alta', 'A', $this->periodo);
		}
		$this->Util()->setError(10028, "complete", $complete["message"]);
		$this->Util()->PrintErrors();
		return $complete;
	}

	public function generaMatricula($major, $courseId)
	{
		switch ($major) {
			case 'MAESTRIA':
				$year = date('Y');
				$year = substr($year, -2);
				$sql = "SELECT *, user_subject.status AS status FROM user_subject
							LEFT JOIN user 
								ON user_subject.alumnoId = user.userId
							WHERE matricula LIKE '5036%'
							ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
				$this->Util()->DB()->setQuery($sql);
				$maestrias = $this->Util()->DB()->GetResult();
				foreach ($maestrias as $fila)
					$num = $fila['matricula'];

				$num = substr($num, -3);    // devuelve "ef"
				$num = $num + 1;
				if (strlen($num) == 2)
					$num = "0" . $num;
				$matricula = "5036101" . $year . $num;
				return $matricula;
				break;

			case 'ESPECIALIDAD':
				$year = date('Y');
				$year = substr($year, -2);
				$sql = "SELECT *, user_subject.status AS status 
							FROM user_subject
								LEFT JOIN user 
									ON user_subject.alumnoId = user.userId
							WHERE matricula LIKE '5046%'
							ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
				$this->Util()->DB()->setQuery($sql);
				$maestrias = $this->Util()->DB()->GetResult();
				foreach ($maestrias as $fila)
					$num = $fila['matricula'];
				$num = substr($num, -3);    // devuelve "ef"
				$num = $num + 1;
				if (strlen($num) == 2)
					$num = "0" . $num;
				$matricula = "5046101" . $year . $num;
				return $matricula;
				break;
		}
	}

	public function AddUserToCurricula($id, $curricula, $nombre, $email, $password, $major, $course, $tipo_beca, $por_beca, $matricula)
	{
		include_once(DOC_ROOT . "/properties/messages.php");
		$sql = "SELECT COUNT(*) FROM user_subject WHERE alumnoId = '" . $id . "' AND courseId = '" . $curricula . "'";
		$this->Util()->DB()->setQuery($sql);
		$count = $this->Util()->DB()->GetSingle();

		$sql = "SELECT subjectId FROM course WHERE courseId = '" . $curricula . "'";
		$this->Util()->DB()->setQuery($sql);
		$subjectId = $this->Util()->DB()->GetSingle();

		$sql = "SELECT payments FROM subject WHERE subjectId = '" . $subjectId . "'";
		$this->Util()->DB()->setQuery($sql);
		$payments = $this->Util()->DB()->GetSingle();

		// Curricula temporal
		$sql = "SELECT temporalGroup FROM course WHERE courseId = " . $curricula;
		$this->Util()->DB()->setQuery($sql);
		$temporalGroup = intval($this->Util()->DB()->GetSingle());
		// Preinscrito
		$sql = "SELECT registrationId FROM user_subject WHERE courseId = " . $temporalGroup . " AND alumnoId = " . $id;
		$this->Util()->DB()->setQuery($sql);
		$registrationId = intval($this->Util()->DB()->GetSingle());
		$status = 'activo';

		if ($count > 0) {
			$complete['status'] = false;
			$complete["message"] = "Este alumno ya esta registrado en esta currícula. Favor de Seleccionar otra currícula";
			return $complete;
		} else {
			if ($this->historialDuplicado()) {
				$complete['status'] = false;
				$complete["message"] = "Este alumno tiene historial duplicado, favor de comunicarse con el administrador.";
				return $complete;
			}
			if ($this->ultimaBaja() > 1 && $this->validar) {
				$complete['status']	= false;
				$complete['message'] = "El alumno tiene una baja en el periodo {$this->ultimaBaja()}, por lo tanto, es necesario que seleccione en qué periodo iniciará.";
				$complete['period'] = $this->ultimaBaja();
				$this->setPeriodo($this->ultimaBaja()); //Guardamos el periodo de baja para determinar posteriormente el alta.
				return $complete;
			} elseif (empty($this->periodo)) {
				$this->setPeriodo(1);
			}
		}
		$periodoAlta = $this->periodo;
		if ($temporalGroup > 0 && $registrationId > 0) {
			// Actualiza la curricula temporal por la oficial
			$sql = "UPDATE user_subject SET courseId = " . $curricula . ", status = 'activo' WHERE alumnoId = " . $id . " AND courseId = " . $temporalGroup;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
			$complete["status"] = true;
			$complete["message"] = "Has registrado al alumno exitosamente, le hemos enviado un correo electronico para continuar con el proceso de inscripcion";
			$conceptos = new Conceptos();
			$conceptos->setCourseId($curricula);
			$conceptos->setAlumno($id);
			$relacionados = $conceptos->conceptos_cursos_relacionados();
			foreach ($relacionados['periodicos'] as $item) {
				if ($periodoAlta <= $item['periodo']) {
					$conceptos->setCosto($item['total']);
					$fecha_cobro = is_null($item['fecha_cobro']) ? "NULL" : "'{$item['fecha_cobro']}'";
					$fecha_limite = is_null($item['fecha_limite']) ? "NULL" : "'{$item['fecha_limite']}'";
					$conceptos->setIndice($item['indice']);
					$conceptos->setConceptoCurso($item['concepto_course_id']);
					$conceptos->setFechaCobro($fecha_cobro);
					$conceptos->setFechaLimite($fecha_limite);
					$conceptos->setTotal($item['total']);
					$conceptos->setCosto(($item['total']));
					$conceptos->setPeriodo($item['periodo']);
					$conceptos->setDescuento($item['descuento']);
					$conceptos->setBeca(0);
					$conceptos->setCourseId($item['course_id']);
					$conceptos->setConcepto($item['concepto_id']);
					$conceptos->setUserId($this->yoId);
					$conceptos->guardar_pago();
				}
			}
		} else {
			// Se inscribe a curricula 
			$sqlQuery = "INSERT INTO user_subject(alumnoId, status, courseId, tipo_beca, por_beca, matricula) VALUES('" . $id . "', '" . $status . "', '" . $curricula . "', '" . $tipo_beca . "', '" . $por_beca . "', '" . $matricula . "')";
			$this->Util()->DB()->setQuery($sqlQuery);
			if ($this->Util()->DB()->InsertData()) {
				$complete["status"] = true;
				$complete["message"] = "Has registrado al alumno exitosamente, le hemos enviado un correo electrónico para continuar con el proceso de inscripcion";
				$conceptos = new Conceptos();
				$conceptos->setCourseId($curricula);
				$conceptos->setAlumno($id);
				$relacionados = $conceptos->conceptos_cursos_relacionados();
				foreach ($relacionados['periodicos'] as $item) {
					if ($periodoAlta <= $item['periodo']) {
						$conceptos->setCosto($item['total']);
						$fecha_cobro = is_null($item['fecha_cobro']) ? "NULL" : "'{$item['fecha_cobro']}'";
						$fecha_limite = is_null($item['fecha_limite']) ? "NULL" : "'{$item['fecha_limite']}'";
						$fecha_pago = "NULL";
						$conceptos->setIndice($item['indice']);
						$conceptos->setConceptoCurso($item['concepto_course_id']);
						$conceptos->setFechaCobro($fecha_cobro);
						$conceptos->setFechaLimite($fecha_limite);
						$conceptos->setTotal($item['total']);
						$conceptos->setCosto(($item['total']));
						$conceptos->setPeriodo($item['periodo']);
						$conceptos->setDescuento($item['descuento']);
						$conceptos->setBeca(0);
						$conceptos->setCourseId($item['course_id']);
						$conceptos->setConcepto($item['concepto_id']);
						$conceptos->setUserId($this->yoId);
						$conceptos->guardar_pago();
					}
				}
			} else {
				$complete["status"] = false;
				$complete["message"] = "no";
			}
		}
		$this->setUserId($id);
		$info = $this->GetInfo();

		$this->setControlNumber();
		$this->setNames($info['names']);
		$this->setLastNamePaterno($info['lastNamePaterno']);
		$this->setLastNameMaterno($info['lastNameMaterno']);
		$this->setSexo($info['sexo']);
		$info['birthdate'] = explode("-", $info['birthdate']);
		$this->setBirthdate($info['birthdate'][0], $info['birthdate'][1], $info['birthdate'][2]);
		$this->setMaritalStatus($info['maritalStatus']);
		$this->setPassword(trim($info['password']));

		// Domicilio
		$this->setStreet($info['street']);
		$this->setNumber($info['number']);
		$this->setColony($info['colony']);
		$this->setCity($info['ciudad']);
		$this->setState($info['estado']);
		$this->setCountry($info['pais']);
		$this->setPostalCode($info['postalCode']);

		// Datos de Contacto
		$this->setEmail($info['email']);
		$this->setPhone($info['phone']);
		$this->setFax($info['fax']);
		$this->setMobile($info['mobile']);

		// Datos Laborales
		$this->setWorkplace($info['workplace']);
		$this->setWorkplaceOcupation($info['workplaceOcupation']);
		$this->setWorkplaceAddress($info['workplaceAddress']);
		$this->setWorkplaceArea($info['workplaceArea']);
		$this->setWorkplacePosition($info['workplacePosition']);
		$this->setWorkplaceCity($info['nombreciudad']);
		$this->setWorkplacePhone($info['workplacePhone']);
		$this->setWorkplaceEmail($info['workplaceEmail']);

		// Estudios
		$this->setAcademicDegree($info['academicDegree']);
		$this->setSchool($info['school']);
		$this->setHighSchool($info['highSchool']);
		$this->setMasters($info['masters']);
		$this->setMastersSchool($info['mastersSchool']);
		$this->setProfesion($info['profesion']);

		// Crear Vencimientos
		$this->AddInvoices($id, $curricula);
		// Create File to Attach
		// $files  = new Files;
		// $file = $files->CedulaInscripcion($id, $curricula, $this, $major, $course);
		// // Enviar correo
		// $sendmail = new SendMail;
		// $details_body = array(
		// 	"email" => $info["controlNumber"],
		// 	"password" => $password,
		// 	"major" => utf8_decode($major),
		// 	"course" => utf8_decode($course),
		// );
		// Envio Correo Deshabilitado
		/* $details_subject = array();
		$attachment[0] = DOC_ROOT."/files/solicitudes/".$file;
		$fileName[0] = "Solicitud_de_Inscripcion.pdf";
		$attachment[1] = DOC_ROOT."/manual_alumno.pdf";
		$fileName[1] = "Manual_Alumno.pdf";
		$sendmail->PrepareAttachment($message[1]["subject"], $message[1]["body"], $details_body, $details_subject, $email, $nombre, $attachment, $fileName); */
		return $complete;
	}


	public function Update()
	{
		if ($this->Util()->PrintErrors())
			return false;

		$sqlQuery = "UPDATE user				
						SET 
							names = '" . $this->getNames() . "', 
							lastNamePaterno = '" . $this->getLastNamePaterno() . "', 
							lastNameMaterno = '" . $this->getLastNameMaterno() . "', 
							birthdate = '" . $this->getBirthdate() . "', 
							email = '" . $this->getEmail() . "', 
							phone = '" . $this->getPhone() . "', 
							password = '" . $this->getPassword() . "', 
							street = '" . $this->getStreet() . "', 
							number = '" . $this->getNumer() . "', 
							colony = '" . $this->getColony() . "', 
							ciudad = '" . $this->getCity() . "', 
							estado = '" . $this->getState() . "', 
							pais =  '" . $this->getCountry() . "', 
							postalCode = '" . $this->getPostalCode() . "', 
							sexo = '" . $this->getSexo() . "', 
							maritalStatus = '" . $this->getMaritalStatus() . "', 
							fax = '" . $this->getFax() . "', 
							mobile = '" . $this->getMobile() . "', 
							workplace = '" . $this->getWorkplace() . "', 
							workplaceOcupation = '" . $this->getWorkplaceOcupation() . "', 
							workplaceAddress = '" . $this->getWorkplaceAddress() . "', 
							workplaceArea = '" . $this->getWorkplaceArea() . "', 
							workplacePosition = '" . $this->getWorkplacePosition() . "', 
							paist='" . $this->getPaisT() . "',
							estadot='" . $this->getEstadoT() . "',
							ciudadt='" . $this->getCiudadT() . "',
						    workplacePhone = '" . $this->getWorkplacePhone() . "', 
							workplaceEmail = '" . $this->getWorkplaceEmail() . "', 
							academicDegree = '" . $this->getAcademicDegree() . "', 
							profesion = '" . $this->getProfesion() . "', 
							school = '" . $this->getSchool() . "', 
							masters = '" . $this->getMasters() . "', 
							mastersSchool = '" . $this->getMastersSchool() . "', 
							highSchool = '" . $this->getHighSchool() . "'						
						WHERE 
							userId = " . $this->getUserId();
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	public function UpdateAlumn()
	{
		$sqlQuery = "UPDATE user				
						SET  
							names = '" . $this->getNames() . "', 
							lastNamePaterno = '" . $this->getLastNamePaterno() . "', 
							lastNameMaterno = '" . $this->getLastNameMaterno() . "', 
							birthdate = '" . $this->getBirthdate() . "', 
							email = '" . $this->getEmail() . "', 
							phone = '" . $this->getPhone() . "', 
							password = '" . $this->getPassword() . "', 
							street = '" . $this->getStreet() . "', 
							number = '" . $this->getNumer() . "', 
							colony = '" . $this->getColony() . "', 
							ciudad = '" . $this->getCity() . "', 
							estado = '" . $this->getState() . "', 
							pais =  '" . $this->getCountry() . "', 
							postalCode = '" . $this->getPostalCode() . "', 
							sexo = '" . $this->getSexo() . "', 
							maritalStatus = '" . $this->getMaritalStatus() . "', 
							fax = '" . $this->getFax() . "', 
							mobile = '" . $this->getMobile() . "', 
							workplace = '" . $this->getWorkplace() . "', 
							workplaceAddress = '" . $this->getWorkplaceAddress() . "', 
							workplaceArea = '" . $this->getWorkplaceArea() . "', 
							workplaceOcupation = '" . $this->getWorkplaceOcupation() . "', 
						    paist='" . $this->getPaisT() . "',
							estadot='" . $this->getEstadoT() . "',
							ciudadt='" . $this->getCiudadT() . "',
							workplacePhone = '" . $this->getWorkplacePhone() . "', 
							workplaceEmail = '" . $this->getWorkplaceEmail() . "', 
							profesion = '" . $this->getProfesion() . "', 
							academicDegree = '" . $this->getAcademicDegree() . "', 
							school = '" . $this->getSchool() . "', 
							masters = '" . $this->getMasters() . "', 
							mastersSchool = '" . $this->getMastersSchool() . "', 
							highSchool = '" . $this->getHighSchool() . "',
							curpDrive = " . $this->curpDrive . ",
							foto = " . $this->foto . ",
							funcion = " . $this->funcion . ",
							curp = '" . $this->curp . "'
						WHERE 
							userId = " . $this->getUserId();
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	public function UpdateFicha()
	{
		if ($this->Util()->PrintErrors())
			return false;

		$sqlQuery = "UPDATE user				
				SET
					mainMajor = " . $this->getMainMajor() . ", 
					secondMajor = " . $this->getSecondMajor() . ", 
					thirdMajor = " . $this->getThirdMajor() . ", 
					mode = " . $this->getMode() . ",
					names = '" . $this->getNames() . "', 
					lastNamePaterno = '" . $this->getLastNamePaterno() . "', 
					lastNameMaterno = '" . $this->getLastNameMaterno() . "', 
					sexo = '" . $this->getSexo() . "',													
					birthdate = '" . $this->getBirthdate() . "', 
					
					cityBorn = '" . $this->getCityBorn() . "', 
					stateBorn = '" . $this->getStateBorn() . "', 
					countryBorn = '" . $this->getCountryBorn() . "',
					
					street = '" . $this->getStreet() . "', 
					number = '" . $this->getNumer() . "', 
					colony = '" . $this->getColony() . "', 
					city = '" . $this->getCity() . "', 
					state = '" . $this->getState() . "', 
					country =  '" . $this->getCountry() . "', 
					postalCode = '" . $this->getPostalCode() . "',
					phone = '" . $this->getPhone() . "', 
					curp = '" . $this->getCurp() . "',
												
					tutorNames = '" . $this->getTutorNames() . "', 
					tutorLastNamePaterno = '" . $this->getTutorLastNamePaterno() . "', 
					tutorLastNameMaterno = '" . $this->getTutorLastNameMaterno() . "', 
					tutorAddress = '" . $this->getTutorAddress() . "', 
					tutorPhone = '" . $this->getTutorPhone() . "', 
					
					prevSchNames = '" . $this->getPrevSchNames() . "', 
					prevSchType = " . $this->getPrevSchType() . ", 
					prevSchKey = '" . $this->getPrevSchKey() . "', 
					prevSchMode = " . $this->getPrevSchMode() . ", 
					prevSchCity = '" . $this->getPrevSchCity() . "', 
					prevSchState = '" . $this->getPrevSchState() . "', 
					prevSchAverage = " . $this->getPrevSchAverage() . ", 
					prevSchCertified = " . $this->getPrevSchCertified() . ",
					
					average = '" . $this->getAverage() . "'					
				WHERE 
					userId = " . $this->getUserId();
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	public function DeleteLimpia()
	{
		$sqlQuery = "DELETE FROM user_subject WHERE alumnoId ='$this->alumnoId'";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	public function Delete()
	{
		if ($this->Util()->PrintErrors())
			return false;

		$sqlQuery = "DELETE FROM user WHERE userId = " . $this->getUserId();
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();

		$sqlQuery = "DELETE FROM invoice WHERE userId ='" . $this->getUserId() . "'  ";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();

		$sqlQuery = "DELETE FROM user_subject WHERE alumnoId ='" . $this->getUserId() . "'";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10029, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	public function EnumerateByPage($currentPage, $rowsPerPage, $pageVar, $pageLink, &$arrPages, $orderSemester = '')
	{
		global $semester;
		global $group;
		$result = NULL;
		$result2 = NULL;
		$filtro = "";
		$pageExtra = "";
		if ($this->nombre) {
			$filtro .= " and names like '%" . $this->nombre . "%'";
			$pageExtra = "/nombre/{$this->nombre}";
		}
		if ($this->apaterno) {
			$filtro .= " and lastNamePaterno like '%" . $this->apaterno . "%'";
			$pageExtra .= "/paterno/{$this->apaterno}";
		}
		if ($this->amaterno) {
			$filtro .= " and lastNameMaterno like '%" . $this->amaterno . "%'";
			$pageExtra .= "/materno/{$this->amaterno}";
		}
		if ($this->noControl) {
			$filtro .= " and controlNumber = '" . $this->noControl . "'";
			$pageExtra .= "/control/{$this->noControl}";
		}
		if ($this->estatus) {
			if ($this->estatus == 2)
				$filtro .= " and activo = 0";
			else
				$filtro .= " and activo = '" . $this->estatus . "'";
		}
		$sqlSearch = "";
		$totalTableRows = $this->CountTotalRows($sqlSearch);
		$totalPages = ceil($totalTableRows / $rowsPerPage);
		if ($currentPage < 1)
			$currentPage = 1;
		if ($currentPage > $totalPages)
			$currentPage = $totalPages;
		$arrPages['rowBegin']	= ($currentPage * $rowsPerPage) - $rowsPerPage + 1;
		$rowOffset = $arrPages['rowBegin'] - 1;
		$sql = "SELECT *,
						(SELECT COUNT(userId) FROM accepted_regulations WHERE userId = user.userId) AS hasRGP
					FROM user
					WHERE 1 " . $sqlSearch . " " . $filtro . " AND type = 'student'									 
					ORDER BY " . $orderSemester . " lastNamePaterno ASC, lastNameMaterno ASC, `names` ASC 
					LIMIT " . $rowOffset . ", " . $rowsPerPage;
		$this->Util()->DB()->setQuery($sql);
		$result2 = $this->Util()->DB()->GetResult();
		foreach ($result2 as $key => $res) {
			$card = $res;
			$sql = "SELECT user_subject.courseId, user_subject.alumnoId, user_subject.status, subject.name AS name, major.name AS majorName, subject.icon, course.group, course.modality, course.initialDate, course.finalDate, 'Ordinario' AS situation FROM user_subject LEFT JOIN course ON course.courseId = user_subject.courseId LEFT JOIN subject ON subject.subjectId = course.subjectId LEFT JOIN major ON major.majorId = subject.tipo WHERE alumnoId = '{$res['userId']}' AND status = 'activo' AND CURDATE() <= course.finalDate UNION SELECT usr.courseId, usr.alumnoId, usr.status, subject.name AS name, major.name AS majorName, subject.icon, course.group, course.modality, course.initialDate, course.finalDate, 'Recursador' AS situation FROM user_subject_repeat usr LEFT JOIN course ON course.courseId = usr.courseId LEFT JOIN subject ON subject.subjectId = course.subjectId LEFT JOIN major ON major.majorId = subject.tipo WHERE alumnoId = '{$res['userId']}' AND status = 'activo' ORDER BY status ASC";
			// echo $sql;
			$this->Util()->DB()->setQuery($sql);
			$courseId = $this->Util()->DB()->GetResult();
			if (count($courseId) == 0) {
				$sql = "SELECT courseId FROM user_subject WHERE alumnoId = " . $res["userId"] . " ORDER BY registrationId DESC LIMIT 1";
				$this->Util()->DB()->setQuery($sql);
				$courseId = $this->Util()->DB()->GetResult();
			}
			$card["courseId"] = $courseId;
			$card["lastNameMaterno"] = $this->Util()->DecodeTiny($card["lastNameMaterno"]);
			$card["lastNamePaterno"] = $this->Util()->DecodeTiny($card["lastNamePaterno"]);
			$card["names"] = $this->Util()->DecodeTiny($card["names"]);

			if (file_exists(DOC_ROOT . "/alumnos/" . $res["userId"] . ".jpg")) {
				$card["foto"] = '<a href="#open-' . $res["userId"] . '" id="foto-' . $res["userId"] . '">
					<img src="' . WEB_ROOT . '/alumnos/' . $res["userId"] . '.jpg" width="40" height="40" style=" height: auto; width: auto; max-width: 80px; max-height: 80px;"/>
				</a>';
				$card['photo'] = $res["userId"] . ".jpg";
			} else {
				$card["foto"] = '';
				$card['photo'] = $res['rutaFoto'];
			}
			$result[$key] = $card;
		}
		$rowsPerPages = 0;
		$countPageRows = count($result);
		$arrPages['countPageRows'] = $countPageRows;
		$arrPages['rowEnd']		= $arrPages['rowBegin'] + $countPageRows - 1;
		$arrPages['totalTableRows'] = $totalTableRows;
		$arrPages['rowsPerPages'] = $rowsPerPages;
		$arrPages['currentPage'] = $currentPage;
		$arrPages['totalPages']	= $totalPages;
		$arrPages['startPage'] = '';
		$arrPages['previusPage'] = '';
		if ($currentPage > 1) {
			$arrPages['previusPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage - 1) . $pageExtra;
			if ($currentPage > 2)
				$arrPages['startPage'] = $pageLink . '/' . $pageVar . '/' . '1' . $pageExtra;
		}
		$arrPages['nextPage'] = '';
		$arrPages['endPage'] = '';
		if ($currentPage < $arrPages['totalPages']) {
			$arrPages['nextPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage + 1) . $pageExtra;
			if ($currentPage < ($arrPages['totalPages'] - 1))
				$arrPages['endPage'] = $pageLink . '/' . $pageVar . '/' . $arrPages['totalPages'] . $pageExtra;
		}
		$arrPages['refreshPage'] = $pageLink . '/' . $pageVar . '/' . $currentPage . $pageExtra;
		return $result;
	}

	public function CountTotalRows()
	{
		$filtro = "";
		if ($this->nombre)
			$filtro .= " and names like '%" . $this->nombre . "%'";

		if ($this->apaterno)
			$filtro .= " and lastNamePaterno like '%" . $this->apaterno . "%'";

		if ($this->amaterno)
			$filtro .= " and lastNameMaterno like '%" . $this->amaterno . "%'";

		if ($this->noControl)
			$filtro .= " and controlNumber = '" . $this->noControl . "'";

		if ($this->estatus) {
			if ($this->estatus == 2)
				$filtro .= " and activo = 0";
			else
				$filtro .= " and activo = '" . $this->estatus . "'";
		}
		$sql = 'SELECT COUNT(*) FROM user where type = "student" ' . $filtro . '';
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->GetSingle();
	}

	function SearchByGroup()
	{
		global $semester;
		global $group;
		$sql = "SELECT * 
					FROM user
				WHERE semesterId = " . $this->semesterId . " AND majorId = " . $this->majorId . " AND groupId = " . $this->groupId . "
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
		$this->Util()->DB()->setQuery($sql);
		$result2 = $this->Util()->DB()->GetResult();
		$result = array();
		foreach ($result2 as $key => $res) {
			$card = $res;
			$semester->setSemesterId($res['semesterId']);
			$card['semester'] = $semester->GetNameById();
			$group->setGroupId($res['groupId']);
			$card['group'] = $group->GetNameById();
			$result[$key] = $card;
		}
		return $result;
	}

	function GetStdIdByControlNo()
	{
		$sql = 'SELECT userId FROM user WHERE controlNumber = "' . $this->controlNumber . '"';
		$this->Util()->DB()->setQuery($sql);
		$userId = $this->Util()->DB()->GetSingle();
		return $userId;
	}

	function _GetSemesterId()
	{
		$sql = 'SELECT semesterId FROM user WHERE userId = "' . $this->userId . '"';
		$this->Util()->DB()->setQuery($sql);
		$semesterId = $this->Util()->DB()->GetSingle();
		return $semesterId;
	}

	function info_subject($courseId)
	{
		$sql = "SELECT * FROM user_subject WHERE courseId='" . $courseId . "' AND  alumnoId='" . $this->getUserId() . "' ";
		$this->Util()->DB()->setQuery($sql);
		$row = $this->Util()->DB()->GetRow();
		return $row;
	}

	function GetSubByUsrSem()
	{
		$sql = 'SELECT * FROM user_subject WHERE alumnoId = ' . $this->userId . ' AND semesterId = ' . $this->semesterId;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function GetKardex()
	{
		$sql = 'SELECT * FROM kardex_calificacion WHERE userId = ' . $this->userId . ' AND semesterId = ' . $this->semesterId;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function GetSemBySub()
	{
		$sql = 'SELECT * FROM user_subject GROUP BY semesterId';
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function GetNoControl()
	{
		$sql = 'SELECT controlNumber FROM user WHERE userId = ' . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		$controlNumber = $this->Util()->DB()->GetSingle();
		return $controlNumber;
	}

	function GetScoreBySubject()
	{
		$sql = 'SELECT gu.testIdentifier, gu.gradescore, gu.datetest
					FROM gradereport_user AS gu, gradereport AS g, subject_group AS sg
				WHERE gu.gradereportId = g.gradereportId
					AND g.groupId = sg.subgpoId AND gu.alumnoId = ' . $this->userId . ' AND sg.subjectId = ' . $this->subjectId . '
				ORDER BY gu.datetest ASC';

		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		$gradescore = 0;
		foreach ($result as $res) {
			$testIdentifier = $res['testIdentifier'];
			if ($testIdentifier == 'PARCIAL') {
				$gradescore += $res['gradescore'];
				$obs = '';
			} elseif ($testIdentifier == 'GLOBAL') {
				$gradescore = $res['gradescore'];
				$obs = '';
			}
			//Falta definir mas tipos de calificaciones
		}
		if ($testIdentifier == 'PARCIAL')
			$average = $gradescore / 3;
		elseif ($testIdentifier == 'GLOBAL')
			$average = $gradescore;
		else
			$average = 0;
		$info['average'] = number_format($average, 2, '.', '');
		$info['obs'] = $obs;
		return $info;
	}

	function SaveKardexCalif()
	{
		$sql = 'INSERT INTO kardex_calificacion(userId, semesterId, majorId, subjectId, calif, typeCalifId, periodoId)
					VALUES("' . $this->userId . '", "' . $this->semesterId . '", "' . $this->majorId . '", "' . $this->subjectId . '", "' . $this->average . '", "' . $this->type . '", "' . $this->periodoId . '")';
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10070, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	function GetKardexCalif()
	{
		$sql = 'SELECT * 
					FROM kardex_calificacion 
				WHERE userId = "' . $this->userId . '" AND semesterId = "' . $this->semesterId . '" AND majorId = "' . $this->majorId . '"';
		$this->Util()->DB()->setQuery($sql);
		$califs = $this->Util()->DB()->GetResult();
		return $califs;
	}

	function DeleteKardexCalif()
	{
		$sql = 'DELETE FROM  kardex_calificacion WHERE
					userId = "' . $this->userId . '"
					AND	semesterId = "' . $this->semesterId . '" AND majorId = "' . $this->majorId . '"';
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->DeleteData();
		return true;
	}

	function SearchByName()
	{
		$sql = 'SELECT *
					FROM user
				WHERE CONCAT(lastNamePaterno," ",lastNameMaterno," ",names) LIKE "%' . $this->name . '%" LIMIT 15';
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function SearchKardexByUserIdAndSemesterId()
	{
		$sql = 'SELECT majorId
					FROM  kardex_calificacion
				WHERE userId = ' . $this->userId . ' AND semesterId = ' . $this->semesterId . ' LIMIT 1';
		$this->Util()->DB()->setQuery($sql);
		$majorId = $this->Util()->DB()->GetSingle();
		return $majorId;
	}

	function por_beca($id)
	{
		$sql = "SELECT por_beca FROM user_subject WHERE alumnoId = '" . $id . "'";
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->GetSingle();
	}

	function encuentro_monto($courseId)
	{
		$sql = "SELECT subjectId FROM course WHERE courseId='" . $courseId . "' ";
		$this->Util()->DB()->setQuery($sql);
		$res = $this->Util()->DB()->GetRow();
		$sql = "SELECT cost FROM subject WHERE subjectId = '" . $res['subjectId'] . "' ";
		$this->Util()->DB()->setQuery($sql);
		$costo = $this->Util()->DB()->GetRow();
		return $costo['cost'];
	}

	function editarPor($alumnoId, $courseId, $por_beca, $tipo_beca)
	{
		if ($tipo_beca == "Ninguno")
			$por_beca = 0;

		$sqlQuery = "UPDATE user_subject SET por_beca = '" . $por_beca . "', tipo_beca = '" . $tipo_beca . "' WHERE alumnoId = '" . $alumnoId . "'  AND courseId = '" . $courseId . "'";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();

		$sql = "SELECT * FROM invoice WHERE userId = '" . $alumnoId . "'";
		$this->Util()->DB()->setQuery($sql);
		$id_invoices = $this->Util()->DB()->GetResult();
		foreach ($id_invoices as $fila) {
			$sql = "SELECT * FROM payment WHERE invoiceId = '" . $fila[0] . "'";
			$this->Util()->DB()->setQuery($sql);
			$info_payment = $this->Util()->DB()->GetResult();
			if (count($info_payment) == 0) {
				if ($por_beca != 0) {
					$v = (100 - $por_beca) / 100;
					$valor = round($this->encuentro_monto($fila["courseId"]) * $v, 2);
				} else
					$valor = $this->encuentro_monto($fila["courseId"]);
				$sql = "UPDATE invoice SET amount = '" . $valor . "' WHERE invoiceId = '" . $fila[0] . "'";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->ExecuteQuery();
			}
		}
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();
	}

	function AddInvoices($id, $curricula)
	{
		$course = new Course;
		$course->SetCourseId($curricula);
		$por_beca = $this->por_beca($id);
		$myCourse = $course->Info($id);
		//print_r($myCourse);
		$initialExplode = explode("-", $myCourse["initialDate"]);
		$initialYear = $initialExplode[0];
		$initialMonth = $initialExplode[1];
		$initialDay = $initialExplode[2];
		for ($ii = 0; $ii < $myCourse["payments"]; $ii++) {
			if ($initialMonth > 12) {
				$initialMonth = 1;
				$initialYear++;
			}

			if ($initialDay > 28)
				$initialDay = 28;

			if ($por_beca != 0) {
				$v = (100 - $por_beca) / 100;
				$valor = round($myCourse["cost"] * $v, 2);
			} else
				$valor = $myCourse["cost"];

			$sql = "SELECT  * FROM  `invoice` WHERE userId = '" . $id . "' AND courseId = '" . $curricula . "' AND dueDate = '" . $initialYear . "-" . $initialMonth . "-" . $initialDay . "' AND amount = '" . $valor . "'";
			$this->Util()->DB()->setQuery($sql);
			$info_invoice = $this->Util()->DB()->GetResult();


			if (count($info_invoice) == 0) {
				$sql = "INSERT INTO invoice(userId, courseId, dueDate, amount) VALUES('" . $id . "', '" . $curricula . "', '" . $initialYear . "-" . $initialMonth . "-" . $initialDay . "', '" . $valor . "')";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->InsertData();
			}
			$initialMonth++;
		}
	}

	function  StudentCoursesU($userId, $courseId)
	{
		$sql = "SELECT *, subject.name AS nombre, major.name AS majorName
					FROM user_subject
				LEFT JOIN course 
					ON course.courseId = user_subject.courseId
				LEFT JOIN subject 
					ON subject.subjectId = course.subjectId	
				LEFT JOIN major 
					ON major.majorId = subject.tipo
				WHERE
					alumnoId = '" . $userId . "' AND course.courseId = '" . $courseId . "'";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	function StudentCourses($status = NULL, $active = NULL)
	{
		$tmp_status = $status;
		if ($status != NULL)
			$status = " AND status = '" . $status . "'";

		if ($active != NULL)
			$active = " AND course.active = '" . $active . "'";

		if ($tmp_status == 'finalizado') {
			$status = '';
			$finalizado = " AND CURDATE() > course.finalDate";
		} elseif ($tmp_status == 'activo')
			$finalizado = " AND CURDATE() <= course.finalDate";

		$sql = "SELECT user_subject.courseId, 
		 				user_subject.alumnoId, 
						user_subject.status, 
						subject.name AS name, 
						major.name AS majorName, 
						subject.icon, 
						subject.constancia,
						course.group, 
						course.modality, 
						course.initialDate, 
						course.finalDate, 
						'Ordinario' AS situation
					FROM user_subject
						LEFT JOIN course 
							ON course.courseId = user_subject.courseId
						LEFT JOIN subject 
							ON subject.subjectId = course.subjectId	
						LEFT JOIN major 
					ON major.majorId = subject.tipo
				WHERE
					alumnoId = '" . $this->getUserId() . "' " . $status . " " . $active . " " . $finalizado . "
				UNION
				SELECT usr.courseId, 
					usr.alumnoId, 
					usr.status, 
					subject.name AS name, 
					major.name AS majorName, 
					subject.icon, 
					subject.constancia,
					course.group, 
					course.modality, 
					course.initialDate, 
					course.finalDate, 
					'Recursador' AS situation
				FROM user_subject_repeat usr
					LEFT JOIN course
						ON course.courseId = usr.courseId 
					LEFT JOIN subject 
						ON subject.subjectId = course.subjectId 
					LEFT JOIN major 
						ON major.majorId = subject.tipo 
				WHERE alumnoId = " . $this->getUserId() . " " . $status . " 
				ORDER BY majorName, status ASC, courseId DESC";
		// echo $sql;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		foreach ($result as $key => $res) {
			$sql = "SELECT COUNT(*) FROM subject_module WHERE subjectId = '" . $res["subjectId"] . "'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["modules"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(*) FROM user_subject WHERE courseId = '" . $res["courseId"] . "' AND status = 'inactivo'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["alumnInactive"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(*) FROM user_subject WHERE courseId = '" . $res["courseId"] . "' AND status = 'activo'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["alumnActive"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT COUNT(*) FROM course_module WHERE courseId ='" . $res["courseId"] . "'";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["courseModule"] = $this->Util()->DB()->GetSingle();

			$sql = "SELECT * FROM user_credentials WHERE course_id = '" . $res['courseId'] . "' AND user_id ='" . $res['alumnoId'] . "' ";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["credential"] = $this->Util()->DB()->GetRow();
			if ($res['constancia'] == 1) {
				$sql = "SELECT * FROM constancias_conocer WHERE courseId = '" . $res['courseId'] . "' AND studentId ='" . $res['alumnoId'] . "' ";
				$this->Util()->DB()->setQuery($sql);
				$result[$key]["constancia"] = $this->Util()->DB()->GetRow();
			}
			$sql = "SELECT * FROM diplomas WHERE courseId = '" . $res['courseId'] . "' AND studentId ='" . $res['alumnoId'] . "' ";
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["diploma"] = $this->Util()->DB()->GetRow();
		}
		return $result;
	}

	function GetAcumuladoCourseModuleActa($id, $alumnoId)
	{
		// Actividades
		$activity = new Activity;
		$activity->setCourseModuleId($id);
		$activity->setUserId($alumnoId);
		$actividades = $activity->Enumerate();
		$totalScore = 0;
		$countAc = count($actividades);
		foreach ($actividades as $res)
			$totalScore += $res["ponderation"];
		@$total = $totalScore / $countAc;
		return $total;
	}

	function GetAcumuladoCourseModule($id, $alumnoId = 0)
	{
		// Actividades
		$activity = new Activity;
		$activity->setCourseModuleId($id);
		if ($alumnoId)
			$activity->setUserId($alumnoId);
		$actividades = $activity->Enumerate();
		$totalScore = 0;
		foreach ($actividades as $res)
			$totalScore += $res["realScore"];
		return $totalScore;
	}

	function enviarMail()
	{
		$sendmail = new SendMail;
		$sql = "SELECT * FROM user WHERE email = '" . $this->getEmail() . "'";
		$this->Util()->DB()->setQuery($sql);
		$infoDu = $this->Util()->DB()->GetRow();
		if (!$infoDu['email']) {
			return false;
		}
		$msj = "Instituto de Administración Publica del Estado de Chiapas, A. C.
				<br><br>
				Sus datos de acceso para nuestro Sistema de Educación en Línea son:<br>
				Usuario: " . $infoDu["controlNumber"] . "<br>
				Contraseña: " . $infoDu["password"] . "<br>
				<br><br>
				Para una correcta navegación en nuestro Sistema, puede consultar el manual del alumno en:<br>
				<a href=https://app.iapchiapas.edu.mx/manual_alumno.pdf>https://app.iapchiapas.edu.mx/manual_alumno.pdf</a><br>
				Cualquier duda, favor de contactarnos:<br>
				Teléfonos: (961) 125-15-08 Ext. 106 o 114<br>
				Correo: enlinea@iapchiapas.edu.mx<br>
				Saludos.<br>
				IAP-Chiapas<br>
				<img src='" . WEB_ROOT . "/images/logo_correo.jpg'>
				<br><br><br>";
		$sendmail->Prepare("IAP Chiapas | Recuperación de datos de usuario", utf8_decode($msj), "", "", $infoDu["email"], $infoDu["names"]);
		$this->Util()->setError(10030, "complete", "Se ha enviado un correo con tus datos de acceso");
		$this->Util()->PrintErrors();
		return true;
	}

	function InfoPais($Id)
	{
		$sql = "SELECT * FROM pais WHERE paisId = " . $Id . "";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	function InfoEstado($Id)
	{
		$sql = "SELECT * FROM estado WHERE estadoId = " . $Id . "";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	function InfoMunicipio($Id)
	{
		$sql = "SELECT * FROM municipio WHERE municipioId = " . $Id . "";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	function InfoStudentCourses($status = NULL, $active = NULL, $courseId)
	{
		$sql = "SELECT *, subject.name AS name, major.name AS majorName
					FROM user_subject
						LEFT JOIN course 
							ON course.courseId = user_subject.courseId
						LEFT JOIN subject 
							ON subject.subjectId = course.subjectId	
						LEFT JOIN major 
						ON major.majorId = subject.tipo
					WHERE alumnoId = '" . $this->getUserId() . "' AND user_subject.courseId = " . $courseId . "";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();

		$sql = "SELECT COUNT(*) FROM subject_module WHERE subjectId = '" . $result["subjectId"] . "'";
		$this->Util()->DB()->setQuery($sql);
		$result["modules"] = $this->Util()->DB()->GetSingle();

		$sql = "SELECT COUNT(*) FROM user_subject WHERE courseId = '" . $result["courseId"] . "' AND status = 'inactivo'";
		$this->Util()->DB()->setQuery($sql);
		$result["alumnInactive"] = $this->Util()->DB()->GetSingle();

		$sql = "SELECT COUNT(*) FROM user_subject WHERE courseId ='" . $result["courseId"] . "' AND status = 'activo'";
		$this->Util()->DB()->setQuery($sql);
		$result["alumnActive"] = $this->Util()->DB()->GetSingle();

		$sql = "SELECT COUNT(*) FROM course_module WHERE courseId = '" . $result["courseId"] . "'";
		$this->Util()->DB()->setQuery($sql);
		$result["courseModule"] = $this->Util()->DB()->GetSingle();
		return $result;
	}

	public function SaveSolicitud()
	{
		$sqlNot = "INSERT INTO solicitud(fechaSolicitud, tiposolicitudId, estatus, userId)
			   		VALUES('" . date('Y-m-d') . "', '1', 'pendiente', '" . $_SESSION['User']['userId'] . "')";
		$this->Util()->DB()->setQuery($sqlNot);
		$Id = $this->Util()->DB()->InsertData();

		$ext = end(explode('.', basename($_FILES['comprobante']['name'])));
		$filename = "comprobante_" . $Id . "." . $ext;
		$target_path = DOC_ROOT . "/alumnos/comprobantes/comprobante_" . $Id . "." . $ext;

		move_uploaded_file($_FILES['comprobante']['tmp_name'], $target_path);
		$sqlQuery = "UPDATE solicitud SET ruta = '" . $filename . "' WHERE solicitudId = '" . $Id . "'";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	public function GetBaja()
	{
		$sql = "SELECT * FROM solicitud WHERE solicitudId = 3 ORDER BY solicitudId DESC";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	public function muestraMenu($Id)
	{
		$sql = "SELECT * FROM menu_app WHERE menuId = " . $Id . "";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function contenidoSeccion($Id)
	{
		$sql = "SELECT * FROM menu_app WHERE menuAppId = " . $Id . "";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	public function saveContacto($Id)
	{
		$sendmail = new SendMail;
		$contenido = 'Datos de contacto: <br><br>  
					<table>
						<tr>
							<td>Nombre:</td>
							<td>' . $_POST['nombre'] . '</td>
						</tr>
						<tr>
							<td>Telefono:</td>
							<td>' . $_POST['telefono'] . '</td>
						</tr>
						<tr>
							<td>Correo:</td>
							<td>' . $_POST['correo'] . '</td>
						</tr>
						<tr>
							<td>Solicitud:</td>
							<td>' . $_POST['peticion'] . '</td>
						</tr>
					</table>' . $_POST['peticion'];
		$sendmail->enviarCorreo("Formulario de Contacto", $contenido, "", "", "contacto@iapchiapas.org.mx", "Administrador", $attachment, $fileName, $_POST['correo'], $_POST['nombre']);
		return true;
	}

	public function ProcesoReinscripcion($courseMId, $subjectId, $courseId, $semestreId)
	{
		if ($courseMId == 'x')
			$infoS['semesterId'] = $semestreId;
		else {
			$sql = "SELECT * FROM course_module AS c
						LEFT JOIN subject_module AS s 
							ON c.subjectModuleId = s.subjectModuleId
					WHERE courseModuleId = " . $courseMId . "";
			$this->Util()->DB()->setQuery($sql);
			$infoS = $this->Util()->DB()->GetRow();
		}
		$sqlQuery = "INSERT INTO confirma_inscripcion(reinscrito, nivel, userId, subjectId, courseId, courseModuleId)
					VALUES('si', '" . $infoS['semesterId'] . "', '" . $_SESSION['User']['userId'] . "', '" . $subjectId . "', '" . $courseId . "', '" . $courseMId . "')";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->InsertData();
		return true;
	}

	public function confirmaReinscripcion($carreraId, $semestreId)
	{
		$sql = "SELECT count(*) FROM confirma_inscripcion
					WHERE subjectId =  " . $carreraId . " AND nivel = " . $semestreId . " AND userId = " . $_SESSION["User"]["userId"] . "";
		$this->Util()->DB()->setQuery($sql);
		$infoS = $this->Util()->DB()->GetSingle();
		return $infoS;
	}

	public function testFire()
	{
		$sql = "SELECT * FROM alumnos";
		$this->Util()->Dbfire()->setQuery($sql);
		$row = $this->Util()->Dbfire()->GetResult();
		return $row;
	}

	public function infoCarrera()
	{
		$sql = "SELECT * FROM user WHERE userId = " . $_SESSION["User"]["userId"] . "";
		$this->Util()->DB()->setQuery($sql);
		$infoS = $this->Util()->DB()->GetRow();
		$sql = "SELECT * FROM pagosadicio WHERE clavealumno  = '" . $infoS['referenciaBancaria'] . "' ORDER BY id DESC";
		$this->Util()->DB()->setQuery($sql);
		$row6 = $this->Util()->DB()->GetRow();
		return $row6;
	}

	public function verCalendarioPagos()
	{
		$sql = "SELECT * FROM user WHERE userId = " . $_SESSION["User"]["userId"] . "";
		$this->Util()->DB()->setQuery($sql);
		$infoS = $this->Util()->DB()->GetRow();

		$sql = "SELECT * FROM pagosadicio WHERE clavealumno  = '" . $infoS['referenciaBancaria'] . "' ORDER BY id DESC";
		$this->Util()->DB()->setQuery($sql);
		$row6 = $this->Util()->DB()->GetRow();

		$sql = "SELECT periodo FROM pagosadicio WHERE clavealumno  = '" . $infoS['referenciaBancaria'] . "' AND clavenivel = '" . $row6['clavenivel'] . "' GROUP BY periodo";
		$this->Util()->DB()->setQuery($sql);
		$row = $this->Util()->DB()->GetResult();

		foreach ($row as $key => $aux) {
			$sql = "SELECT * FROM pagosadicio 
					WHERE clavealumno = '" . $infoS['referenciaBancaria'] . "' 
						AND clavenivel = '" . $row6['clavenivel'] . "' 
						AND periodo = '" . $aux['periodo'] . "' 
						AND (claveconcepto = 12 or claveconcepto = 21 or claveconcepto = 9)";
			$this->Util()->DB()->setQuery($sql);
			$rowp = $this->Util()->DB()->GetResult();
			foreach ($rowp as $key6 => $aux6) {
				$sql = "SELECT * FROM alumnoshistorial 
						WHERE clave  = '" . $infoS['referenciaBancaria'] . "' 
							AND clavenivel = '" . $row6['clavenivel'] . "' 
							AND ciclo = '" . $row6['ciclo'] . "' 
							AND gradogrupo  = '" . $aux6['gradogrupo'] . "'";
				$this->Util()->DB()->setQuery($sql);
				$rowp8 = $this->Util()->DB()->GetRow();
				$rowp[$key6]['inicioPago'] = $rowp8['fechainiciopagos'];
				$rowp[$key6]['beca'] = $rowp8['becaporcentaje'];
				$rowp[$key6]['numPagos'] = $rowp8['numPagos'];

				if ($aux6['claveconcepto'] == 21) {
					for ($i = 1; $i <= $rowp8['numPagos']; $i++) {
						if ($i == 2) {
							$undiantes = strtotime('+' . ($aux6['pagacada']) . ' day', strtotime($rowp8['fechainiciopagos']));
							$rowp8['fechainiciopagos'] = date('Y-m-d', $undiantes);
						}
						if ($i == 3) {
							$undiantes = strtotime('+' . ($aux6['pagacada']) . ' day', strtotime($rowp8['fechainiciopagos']));
							$rowp8['fechainiciopagos'] = date('Y-m-d', $undiantes);
						}
						if ($i == 4) {
							$undiantes = strtotime('+' . ($aux6['pagacada']) . ' day', strtotime($rowp8['fechainiciopagos']));
							$rowp8['fechainiciopagos'] = date('Y-m-d', $undiantes);
						}
						$rowp[$i]['inicioPago'] = $rowp8['fechainiciopagos'];
						$rowp[$i]['descripcion'] = 'Materia';
						$rowp[$i]['numPagos'] = $rowp8['numPagos'];
						$rowp[$i]['beca'] = $rowp8['becaporcentaje'];
						@$rowp[$i]['total'] = $aux6['importe'];
					}
				} else {
					$rowp[0]['inicioPago'] = $rowp8['fechainiciopagos'];
					$rowp[0]['descripcion'] = $aux6['descripcion'];
					$rowp[0]['numPagos'] = $rowp8['numPagos'];
					$rowp[0]['beca'] = $rowp8['becaporcentaje'];
					$rowp[0]['total'] = $aux6['importe'];
				}
			}
			$row[$key]['pagos'] = $rowp;
		}
		return $row;
	}

	public function verCalendarioPagoscxc()
	{
		$sql = "SELECT * FROM user WHERE userId = " . $_SESSION["User"]["userId"] . "";
		$this->Util()->DB()->setQuery($sql);
		$infoS = $this->Util()->DB()->GetRow();

		$sql = "SELECT * FROM pagosadicio WHERE clavealumno = '" . $infoS['referenciaBancaria'] . "' ORDER BY id DESC";
		$this->Util()->DB()->setQuery($sql);
		$row6 = $this->Util()->DB()->GetRow();

		$sql = "SELECT periodo, ciclo, clavenivel, gradogrupo, nombrenivel 
				FROM pagosadicio 
			WHERE clavealumno = '" . $infoS['referenciaBancaria'] . "' GROUP BY periodo ORDER BY id ASC";
		$this->Util()->DB()->setQuery($sql);
		$row = $this->Util()->DB()->GetResult();

		/**
		 * 12 es inscripcion
		 * 21 materia
		 * 9 resinscripcion
		 */
		$util = new Util;
		foreach ($row as $key => $aux) {
			$sql = "SELECT efectivo 
					FROM pagos 
				WHERE clave = '" . $infoS['referenciaBancaria'] . "' 
					AND ciclo = '" . $aux['ciclo'] . "' 
					AND periodoesc = '" . $aux['periodo'] . "' 
					AND clavenivel = '" . $aux['clavenivel'] . "'
					AND (claveconcepto = 12 or claveconcepto = 21 or claveconcepto = 9) 
				GROUP BY folio";
			$this->Util()->DB()->setQuery($sql);
			$rowabono = $this->Util()->DB()->GetResult();

			$efectivo = 0;
			foreach ($rowabono as $keya => $auxa)
				$efectivo += $auxa['efectivo'];

			$sql = "SELECT * from pagosadicio 
						WHERE clavealumno  = '" . $infoS['referenciaBancaria'] . "' 
							AND clavenivel = '" . $aux['clavenivel'] . "' 
							AND periodo = '" . $aux['periodo'] . "' 
							AND (claveconcepto = 9 or claveconcepto = 12 or claveconcepto = 21) 
						ORDER BY claveconcepto ASC";
			$this->Util()->DB()->setQuery($sql);
			$rowp = $this->Util()->DB()->GetResult();
			$rowp = $util->orderMultiDimensionalArray($rowp, 'claveconcepto', false);
			foreach ($rowp as $key6 => $aux6) {
				$sql = "SELECT * 
						FROM alumnoshistorial 
					WHERE clave  = '" . $infoS['referenciaBancaria'] . "' 
						AND clavenivel = '" . $aux['clavenivel'] . "' 
						AND ciclo = '" . $aux['ciclo'] . "' 
						AND gradogrupo = '" . $aux6['gradogrupo'] . "'";
				$this->Util()->DB()->setQuery($sql);
				$rowp8 = $this->Util()->DB()->GetRow();
				$rowp[$key6]['inicioPago'] = $rowp8['fechainiciopagos'];
				$rowp[$key6]['beca'] = $rowp8['becaporcentaje'];
				$rowp[$key6]['numPagos'] = $rowp8['numPagos'];
				if ($aux6['claveconcepto'] == 21) {
					for ($i = 1; $i < 4; $i++) {
						if ($i == 2) {
							$undiantes = strtotime('+' . ($aux6['pagacada']) . ' day', strtotime($rowp8['fechainiciopagos']));
							$rowp8['fechainiciopagos'] = date('Y-m-d', $undiantes);
						}
						if ($i == 3) {
							$undiantes = strtotime('+' . ($aux6['pagacada']) . ' day', strtotime($rowp8['fechainiciopagos']));
							$rowp8['fechainiciopagos'] = date('Y-m-d', $undiantes);
						}
						if ($i == 4) {
							$undiantes = strtotime('+' . ($aux6['pagacada']) . ' day', strtotime($rowp8['fechainiciopagos']));
							$rowp8['fechainiciopagos'] = date('Y-m-d', $undiantes);
						}

						$abono  = 0;
						$descuento = (($aux6['importe'] * $rowp8['becaporcentaje']) / 100);
						if ($efectivo > 0) {
							$efectivo =  $efectivo - ($aux6['importe'] - $descuento);
							if ($efectivo >= 0)
								$abono = ($aux6['importe'] - $descuento);
							else
								$abono = 0;
						}
						if ($i >= 2) {
							$rowp[$i]['inicioPago'] = $rowp8['fechainiciopagos'];
							$rowp[$i]['numPagos'] = $rowp8['numPagos'];
							$rowp[$i]['beca'] = $rowp8['becaporcentaje'];
							@$rowp[$i]['abono'] = $abono;
							@$rowp[$i]['importe'] = $aux6['importe'];
							$rowp[$i]['descripcion'] = $aux6['descripcion'];
							$descuento = (($aux6['importe'] * $rowp8['becaporcentaje']) / 100);
							@$rowp[$i]['totalPagar'] = $aux6['importe'] - $descuento;
						} else {
							@$rowp[$i]['abono'] = $abono;
							$descuento = (($aux6['importe'] * $rowp8['becaporcentaje']) / 100);
							@$rowp[$i]['totalPagar'] = $aux6['importe'] - $descuento;
						}
					}
				} else {
					$abono  = 0;
					if ($efectivo > 0) {
						$efectivo = $efectivo - $aux6['importe'];
						if ($efectivo >= 0)
							$abono = $aux6['importe'];
						else
							$abono = 0;
					}
					$rowp[$key6]['abono'] =  $abono;
					@$rowp[$key6]['totalPagar'] = $aux6['importe'];
				}
			}
			$row[$key]['pagos'] = $rowp;
		}
		return $row;
	}

	public function extraeInfoFire($tipo)
	{

		// ECHO $tipo;

		if ($tipo == '2') {

			$sql = "select * from user ";
			$this->Util()->Db()->setQuery($sql);
			$lst = $this->Util()->Db()->GetResult();

			foreach ($lst as $key => $aux) {


				$sql = "select * from ALUMNOS where CLAVE = '" . $aux['referenciaBancaria'] . "'";
				$this->Util()->Dbfire()->setQuery($sql);
				$infoAl = $this->Util()->Dbfire()->GetResult();

				$sql = "UPDATE
							 user
					 SET
						porcentajeBeca = '" . $infoAl['PORCBECA'] . "'
					 WHERE 
						referenciaBancaria = '" . $aux['referenciaBancaria'] . "'";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData();
			}
		} else {
			$sql = "select max(id) from pagosadicio";
			$this->Util()->Db()->setQuery($sql);
			$maxIdPago = $this->Util()->Db()->GetSIngle();

			$sql = "select max(id) from alumnoshistorial";
			$this->Util()->Db()->setQuery($sql);
			$maxIdH = $this->Util()->Db()->GetSIngle();

			$sql = "select * from pagosadicio where ID > " . $maxIdPago . " order by ID asc";
			$this->Util()->Dbfire()->setQuery($sql);
			$row6 = $this->Util()->Dbfire()->GetResult();

			$sql = "select * from alumnoshistorial where ID > " . $maxIdH . " order by ID asc";
			$this->Util()->Dbfire()->setQuery($sql);
			$lstHistory = $this->Util()->Dbfire()->GetResult();




			foreach ($row6 as $key => $aux) {

				$sqlNot = "insert into pagosadicio(
					  id,
					  ciclo,
					  periodo,
					  clavenivel,
					  nombrenivel,
					  gradogrupo,
					  clavealumno,
					  claveconcepto,
					  descripcion,
					  periodicidad,
					  importe,
					  iva,
					  formato,
					  formapago,
					  aplicabeca,
					  unidad,
					  pagaren,
					  pagacada,
					  pases,
					  accesos,
					  categoria,
					  usuario,
					  fechacreacion,
					  usuariomodificacion,
					  fechamodificacion
					)
				   values(
							'" . $aux['ID'] . "', 
							'" . $aux['CICLO'] . "', 
							'" . $aux['PERIODO'] . "',
							'" . $aux['CLAVENIVEL'] . "',
							'" . $aux['NOMBRENIVEL'] . "',
							'" . $aux['GRADOGRUPO'] . "',
							'" . $aux['CLAVEALUMNO'] . "',
							'" . $aux['CLAVECONCEPTO'] . "',
							'" . $aux['DESCRIPCION'] . "',
							'" . $aux['PERIODICIDAD'] . "',
							'" . $aux['IMPORTE'] . "',
							'" . $aux['IVA'] . "',
							'" . $aux['FORMATO'] . "',
							'" . $aux['FORMAPAGO'] . "',
							'" . $aux['APLICABECA'] . "',
							'" . $aux['UNIDAD'] . "',
							'" . $aux['PAGAREN'] . "',
							'" . $aux['PAGACADA'] . "',
							'" . $aux['PASES'] . "',
							'" . $aux['ACCESOS'] . "',
							'" . $aux['CATEGORIA'] . "',
							'" . $aux['USUARIO'] . "',
							'" . $aux['FECHACREACION'] . "',
							'" . $aux['USUARIOMODIFICACION'] . "',
							'" . $aux['FECHAMODIFICACION'] . "'
						 )";
				$this->Util()->DB()->setQuery($sqlNot);
				$this->Util()->DB()->InsertData();
			}

			foreach ($lstHistory as $key => $aux) {

				$r = explode('/', $aux['FECHAINICIOPAGOS']);
				$fecha = $r[2] . $r[1] . $r[0];

				$sqlNot = "insert into alumnoshistorial(
					  id,
					  clave,
					  clavenivel,
					  nombrenivel,
					  gradogrupo,
					  ciclo,
					  becapesos,
					  becaporcentaje,
					  nombre,
					  apellidop,
					  apellidom,
					  periodo,
					  fechainiciopagos,
					  infocambio,
					  activado,
					  idplan,
					  idespecialidad,
					  usuario,
					  fechacreacion,
					  usuariomodificacion,
					  fechamodificacion,
					  status,
					  fechastatus,
					  observaciones
					  
					)
				   values(
							'" . $aux['ID'] . "', 
							'" . $aux['CLAVE'] . "', 
							'" . $aux['CLAVENIVEL'] . "',
							'" . $aux['NOMBRENIVEL'] . "',
							'" . $aux['GRADOGRUPO'] . "',
							'" . $aux['CICLO'] . "',
							'" . $aux['BECAPESOS'] . "',
							'" . $aux['BECAPORCENTAJE'] . "',
							'" . $aux['NOMBRE'] . "',
							'" . $aux['APELLIDOP'] . "',
							'" . $aux['APELLIDOM'] . "',
							'" . $aux['PERIODO'] . "',
							'" . $fecha . "',
							'" . $aux['INFOCAMBIO'] . "',
							'" . $aux['ACTIVADO'] . "',
							'" . $aux['IDPLAN'] . "',
							'" . $aux['IDESPECIALIDAD'] . "',
							'" . $aux['USUARIO'] . "',
							'" . $aux['FECHACREACION'] . "',
							'" . $aux['USUARIOMODIFICACION'] . "',
							'" . $aux['FECHAMODIFICACION'] . "',
							'" . $aux['STATUS'] . "',
							'" . $aux['FECHASTATUS'] . "',
							'" . $aux['OBSERVACIONES'] . "'
						 )";

				$this->Util()->DB()->setQuery($sqlNot);
				$this->Util()->DB()->InsertData();
			}

			$sql = "select max(id) from pagosadicio";
			$this->Util()->Db()->setQuery($sql);
			$maxIdPago = $this->Util()->Db()->GetSIngle();

			$sql = "select max(id) from alumnoshistorial";
			$this->Util()->Db()->setQuery($sql);
			$maxIdH = $this->Util()->Db()->GetSIngle();

			$sql = "UPDATE
							tablasincronizada
					SET
						ultimoRegistro = '" . $maxIdPago . "',
						fechaSincronizacion = '" . date('Y-m-d') . "'
					WHERE nombre = 'pagosadicio'";

			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();

			$sql = "UPDATE
							tablasincronizada
					SET
						ultimoRegistro = '" . $maxIdH . "',
						fechaSincronizacion = '" . date('Y-m-d') . "'
					WHERE nombre = 'alumnoshistorial'";

			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		}



		return true;
	}


	public function actualizapago()
	{


		$sql = "select * from alumnoshistorial where ID >= 1649 and ID < 1749 ";
		$this->Util()->DB()->setQuery($sql);
		$rowp = $this->Util()->DB()->GetResult();



		foreach ($rowp as $key => $aux) {



			$sql = "select * from alumnoshistorial where ID = " . $aux['id'] . " ";
			$this->Util()->Dbfire()->setQuery($sql);
			$infoA = $this->Util()->Dbfire()->GetRow();

			$r = explode('/', $infoA['FECHAINICIOPAGOS']);

			$fecha = $r[2] . $r[1] . $r[0] . '<br>';

			$sql = "UPDATE
						alumnoshistorial
						SET
							fechainiciopagos = '" . $fecha . "'
						WHERE ID = '" . $aux['id'] . "'";

			// exit;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		}



		return true;
	}


	public function saveBaja()
	{
		$sql = "UPDATE
				solicitud
				SET
					tipobaja = '" . $this->tipobaja . "',
					motivo = '" . $this->motivo . "'
				WHERE tiposolicitudId = 3 and estatus = 'en progreso' ";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData();

		return true;
	}

	public function miChat()
	{


		$sql = 'SELECT 
				*
				FROM chat as c
				left join user as u on u.userId = c.usuarioId
				WHERE c.yoId = ' . $_SESSION['User']["userId"] . ' or c.usuarioId = ' . $_SESSION['User']["userId"] . '
				group by c.usuarioId,c.yoId ORDER BY  chatId ASC ';

		$this->Util()->DB()->setQuery($sql);
		$data = $this->Util()->DB()->GetResult();
		foreach ($data as $key => $aux) {

			if ($aux["yoId"] == $_SESSION['User']["userId"]) {
				$sql = 'SELECT 
				*
				FROM user 
				WHERE userId = ' . $aux["usuarioId"] . '';
				$this->Util()->DB()->setQuery($sql);
				$infoU = $this->Util()->DB()->GetRow();
				$data[$key]["nombre"] = $infoU["names"];
			} else {
				$sql = 'SELECT 
				*
				FROM user 
				WHERE userId = ' . $aux["yoId"] . '';
				$this->Util()->DB()->setQuery($sql);
				$infoU = $this->Util()->DB()->GetRow();
				$data[$key]["nombre"] = $infoU["names"];
			}
		}


		return $data;
	} //Enumerate

	public function entablandoConversacion($Id)
	{

		$sql = 'SELECT * FROM chat WHERE chatId = ' . $Id . '';
		$this->Util()->DB()->setQuery($sql);
		$info = $this->Util()->DB()->GetRow();

		$sql = 'SELECT 
		* 
		FROM chat as c
		left join user as u on u.userId =   c.usuarioId 
		WHERE (c.usuarioId = ' . $info["usuarioId"] . ' or c.yoId = ' . $info["usuarioId"] . ') and (c.usuarioId = ' . $info["yoId"] . ' or c.yoId = ' . $info["yoId"] . ')';

		$this->Util()->DB()->setQuery($sql);
		$lstChat = $this->Util()->DB()->GetResult();

		// echo '<pre>'; print_r($lstChat);
		// exit;

		return $lstChat;
	} //

	public function SaveMensaje()
	{

		// $sql = 'SELECT * FROM chat WHERE chatId = '.$_POST["chatId"].'';
		// $this->Util()->DB()->setQuery($sql);
		// $infoChat = $this->Util()->DB()->GetRow();

		// if($infoChat["yoId"]<>$_SESSION['User']["userId"]){
		// $userId = $infoChat["yoId"];
		// }else{
		// $userId = $infoChat["usuarioId"];
		// }

		$sql = "
		INSERT INTO  chat (
				`fechaEnvio` ,
				`courseModuleId` ,
				`usuarioId`, 
				`yoId`, 
				`mensaje` 
				)
				VALUES (
				'" . date("Y-m-d") . "',
				'" . $_POST['c5Id'] . "',
				'" . $_POST['profId'] . "',
				'" . $_SESSION['User']["userId"] . "',
				'" . $_POST["mensaje"] . "'
				);";

		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();

		return true;
	}

	public function SaveReply()
	{

		if ($_SESSION['User']['type'] == 'student') {
			$quien = 'alumno';
		} else {
			$quien = 'personal';
		}


		$sql = "
		INSERT INTO  chat (
				`courseModuleId` ,
				`fechaEnvio` ,
				`estatus` ,
				`usuarioId`, 
				`yoId`, 
				`mensaje`, 
				`quienEnvia`, 
				`asunto` 
				)
				VALUES (
				'" . $this->cmId . "',
				'" . date('Y-m-d') . "',
				'" . $this->statusjj . "',
				'" . $this->usuariojjId . "',
				'" . $this->yoId . "',
				'" . $this->mensaje . "',
				'" . $quien . "',
				'" . $this->asunto . "'
				);";

		$this->Util()->DB()->setQuery($sql);
		$aId = $this->Util()->DB()->InsertData();

		// echo '<pre>'; print_r($_FILES);
		// exit;
		foreach ($_FILES as $key => $var) {
			switch ($key) {
				case 'archivos':
					if ($var["name"] <> "") {
						$aux = explode(".", $var["name"]);
						$extencion = end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;
						$foto_name = "doc_" . $aId . "." . $extencion;
						if (move_uploaded_file($temporal, $url . "/doc_inbox/" . $foto_name)) {

							$sql = "UPDATE
							chat
							SET
								rutaAdjunto = '" . $foto_name . "'
							WHERE chatId = '" . $aId . "'";
							$this->Util()->DB()->setQuery($sql);
							$this->Util()->DB()->UpdateData();
						}
					}
			}
		}

		return true;
	}

	public function InfoEstudiate($Id)
	{

		$sql = "
				SELECT * FROM user WHERE userId =  " . $Id . "";
		// exit;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();

		return $result;
	}



	public function GetPorcentajeBeca($clave)
	{

		$sql = "
				SELECT * FROM alumnoshistorial WHERE clave =  " . $clave . " order by id DESC";
		// exit;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();

		return $result;
	}

	function cargarCiudades($Id)
	{


		$sql = "SELECT * FROM municipio WHERE estadoId = '" . $Id . "'";
		// exit;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		return $result;
	}

	function onChangePicture($Id)
	{

		// echo '<pre>'; print_r($_FILES);
		// echo '<pre>'; print_r($_POST);
		// exit;
		$archivo = 'archivos';
		foreach ($_FILES as $key => $var) {
			switch ($key) {
				case $archivo:
					if ($var["name"] <> "") {
						$aux = explode(".", $var["name"]);
						$extencion = end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;
						$foto_name = $Id . "." . $extencion;
						if (move_uploaded_file($temporal, $url . "/alumnos/" . $foto_name)) {

							/* $minFoto = $foto_name;
							$this->resizeImagen($url.'/alumnos/', $foto_name, 340, 340,$minFoto,$extencion); */

							$sql = 'UPDATE 		
								user SET 		
								rutaFoto = "' . $foto_name . '"			      		
								WHERE userId = ' . $Id . '';
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

	public function onSavePerfil($Id)
	{

		$sql = 'UPDATE 		
					user SET 		
					perfil = "' . strip_tags($this->perfil) . '"			      		
					WHERE userId = ' . $Id . '';
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData();

		return true;
	}

	public function onSavePass($Id)
	{

		$sql = "SELECT count(*) FROM user WHERE password = '" . $this->anterior . "' and userId='" . $_SESSION["User"]["userId"] . "'";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetSingle();

		if ($result <= 0) {
			echo 'fail[#]';
			echo '<font color="red">La contraseña anterior no es correcta</font>';
			exit;
		}

		if ($this->nuevo != $this->repite) {
			echo 'fail[#]';
			echo '<font color="red">Las contraseñas no coinciden</font>';
			exit;
		}

		if ($this->nuevo == '') {
			echo 'fail[#]';
			echo '<font color="red">La nueva contraseña no puede estar vacia</font>';
			exit;
		}

		$sqlQuery = "
			UPDATE 
				user 
			set 
				password='" . $this->nuevo . "'
			where userId='" . $_SESSION["User"]["userId"] . "'";

		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();

		return true;
	}


	function resizeImagen($ruta, $nombre, $alto, $ancho, $nombreN, $extension)
	{

		$rutaImagenOriginal = $ruta . $nombre;
		if ($extension == 'GIF' || $extension == 'gif') {
			$img_original = imagecreatefromgif($rutaImagenOriginal);
		}
		if ($extension == 'jpg' || $extension == 'JPG') {
			$img_original = imagecreatefromjpeg($rutaImagenOriginal);
		}
		if ($extension == 'png' || $extension == 'PNG') {
			$img_original = imagecreatefrompng($rutaImagenOriginal);
		}
		$max_ancho = $ancho;
		$max_alto = $alto;
		list($ancho, $alto) = getimagesize($rutaImagenOriginal);
		$x_ratio = $max_ancho / $ancho;
		$y_ratio = $max_alto / $alto;
		if (($ancho <= $max_ancho) && ($alto <= $max_alto)) { //Si ancho
			$ancho_final = $ancho;
			$alto_final = $alto;
		} elseif (($x_ratio * $alto) < $max_alto) {
			$alto_final = ceil($x_ratio * $alto);
			$ancho_final = $max_ancho;
		} else {
			$ancho_final = ceil($y_ratio * $ancho);
			$alto_final = $max_alto;
		}
		$tmp = imagecreatetruecolor($ancho_final, $alto_final);
		imagecopyresampled($tmp, $img_original, 0, 0, 0, 0, $ancho_final, $alto_final, $ancho, $alto);
		imagedestroy($img_original);
		$calidad = 70;
		imagejpeg($tmp, $ruta . $nombreN, $calidad);
	}


	function hasAcceptedRegulation()
	{
		$sql = "SELECT COUNT(userId) FROM accepted_regulations WHERE userId = " . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		$accepted = $this->Util()->DB()->GetSingle() == 1 ? true : false;
		return $accepted;
	}

	function saveAcceptedRegulation()
	{
		$sql = "SELECT COUNT(userId) FROM accepted_regulations WHERE userId = " . $this->userId;
		$hasAccepted = $this->Util()->DB()->setQuery($sql);
		if ($hasAccepted == 0) {
			$sql = "INSERT INTO accepted_regulations(userId, date) VALUES(" . $this->userId . ", CURDATE())";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->InsertData();
		}
		return $hasAccepted;
	}

	function getAcceptedRegulation()
	{
		$sql = "SELECT * FROM accepted_regulations WHERE userId = " . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->GetRow();
	}


	function blockRegulation($status = NULL, $active = NULL, $arrayCourses = NULL)
	{
		if ($status != NULL)
			$status = " AND status = '" . $status . "'";

		if ($active != NULL)
			$active = " AND course.active = '" . $active . "'";

		if ($arrayCourses != NULL)
			$arrayCourses = " AND user_subject.courseId IN (" . $arrayCourses . ")";

		$sql = "SELECT
					COUNT(alumnoId)
				FROM
					user_subject
				LEFT JOIN course ON course.courseId = user_subject.courseId
				LEFT JOIN subject ON subject.subjectId = course.subjectId	
				LEFT JOIN major ON major.majorId = subject.tipo
				WHERE alumnoId = '" . $this->getUserId() . "' " . $status . " " . $active . " " . $arrayCourses;
		$this->Util()->DB()->setQuery($sql);
		$accepted = $this->Util()->DB()->GetSingle() == 0 ? true : false;
		return $accepted;
	}

	function AddUserToCourseModuleFromCatalog($userId, $courseId, $courseModuleId)
	{
		$module = new Module();
		$module->setCourseModuleId($courseModuleId);
		$moduleInfo = $module->InfoCourseModule();
		$module->setSubjectModuleId($moduleInfo["subjectModuleId"]);
		$subjectModuleInfo = $module->Info();

		$user = new User();
		$this->setUserId($userId);
		$info = $this->GetInfo();

		// $info['email'] = 'carloszh04@gmail.com';
		$complete = $this->AddUserToCourseModule($userId, $courseId, $courseModuleId, $info["names"], $info["email"], $info["password"], $subjectModuleInfo["name"]);

		$this->Util()->setError(40104, "complete", $complete);
		$this->Util()->PrintErrors();
		return $complete;
	}

	public function AddUserToCourseModule($id, $curricula, $modulo, $nombre, $email, $password, $moduleName)
	{
		include_once(DOC_ROOT . "/properties/messages.php");
		$sql = "SELECT COUNT(*) FROM user_subject_repeat WHERE alumnoId = " . $id . " AND courseId = " . $curricula . " AND courseModuleId = " . $modulo;
		$this->Util()->DB()->setQuery($sql);
		$count = $this->Util()->DB()->GetSingle();

		/* $sql = "SELECT subjectId FROM course WHERE courseId = '".$curricula."'";
		$this->Util()->DB()->setQuery($sql);
		$subjectId = $this->Util()->DB()->GetSingle(); */

		$status = "activo";
		if ($count > 0)
			return $complete = "Este alumno ya esta registrado en este modulo. Favor de Seleccionar otro Modulo";

		// Se inscribe a modulo 
		$sqlQuery = "INSERT INTO user_subject_repeat(alumnoId, courseId, courseModuleId, status) VALUES(" . $id . ", " . $curricula . ", " . $modulo . ", '" . $status . "')";
		$this->Util()->DB()->setQuery($sqlQuery);
		if ($this->Util()->DB()->InsertData())
			$complete = "Has registrado al alumno exitosamente, le hemos enviado un correo electronico";
		else
			$complete = "no";

		$sendmail = new SendMail;
		$details_body = array(
			"email" => $info["controlNumber"],
			"password" => $password,
			"module" => utf8_decode($moduleName)
		);
		$details_subject = array();
		$attachment = array();
		$fileName = array();

		$sendmail->PrepareAttachment($message[3]["subject"], $message[3]["body"], $details_body, $details_subject, $email, $nombre, $attachment, $fileName);

		return $complete;
	}


	function StudentModulesRepeat($condition = "")
	{
		$sql = "SELECT
					usr.*, s.name AS subjectName, m.name AS majorName, s.icon, c.group, cm.initialDate, cm.finalDate, sm.name AS subjectModuleName, cm.courseModuleId, c.courseId, sm.subjectModuleId, sm.semesterId
				FROM
					user_subject_repeat usr
				LEFT JOIN course c 
					ON c.courseId = usr.courseId
				LEFT JOIN subject s 
					ON s.subjectId = c.subjectId	
				LEFT JOIN major m 
					ON m.majorId = s.tipo
				LEFT JOIN course_module cm 
					ON usr.courseModuleId = cm.courseModuleId 
				LEFT JOIN subject_module sm 
					ON cm.subjectModuleId = sm.subjectModuleId
				WHERE
					usr.alumnoId = " . $this->getUserId() . " {$condition}
				ORDER BY sm.name ASC";

		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		// Calificaciones
		foreach ($result as $key => $res) {
			$sql = "SELECT * FROM course_module_score WHERE courseModuleId = " . $res['courseModuleId'] . " AND userId = " . $res["alumnoId"] . " AND courseId = " . $res["courseId"];
			$this->Util()->DB()->setQuery($sql);
			$infoCc = $this->Util()->DB()->GetRow();
			// CALCULA ACUMULADO
			$activity = new Activity;
			$activity->setCourseModuleId($res['courseModuleId']);
			$actividades = $activity->Enumerate();
			$sql = "SELECT teamNumber FROM team WHERE courseModuleId = " . $res['courseModuleId'] . " AND userId = " . $res["alumnoId"];
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["equipo"] = $this->Util()->DB()->GetSingle();
			$result[$key]["addepUp"] = 0;
			foreach ($actividades as $activity) {
				if ($activity["score"] <= 0)
					continue;
				//revisar calificacion
				$sqlca = "SELECT ponderation FROM activity_score WHERE activityId = " . $activity["activityId"] . " AND userId = " . $res["alumnoId"];
				$this->Util()->DB()->setQuery($sqlca);
				$score = $this->Util()->DB()->GetSingle();
				$result[$key]["score"][] = $score;
				$realScore = $score * $activity["score"] / 100;
				$result[$key]["realScore"][] = $realScore;
				$result[$key]["addepUp"] += $realScore;
			}

			if ($infoCc["calificacion"] == null or $infoCc["calificacion"] == 0) {
				$at = $result[$key]["addepUp"] / 10;

				if ($this->tipoMajor == "MAESTRIA" and $at < 7)
					$at = floor($at);
				else if ($this->tipoMajor == "DOCTORADO" and $at < 8)
					$at = floor($at);
				else
					$at = round($at, 0, PHP_ROUND_HALF_DOWN);
				$infoCc["calificacion"] = $at;
			} else
				$infoCc["calificacion"] = $infoCc["calificacion"];

			if ($this->tipoMajor == "MAESTRIA" and $infoCc["calificacion"] < 7)
				$result[$key]["score"] = 6;
			else if ($this->tipoMajor == "DOCTORADO" and $infoCc["calificacion"] < 8)
				$result[$key]["score"] = 7;
			else
				$result[$key]["score"] = $infoCc["calificacion"];
		}
		return $result;
	}

	public function GetMatricula($courseId)
	{
		$sql = "SELECT matricula FROM user_subject WHERE alumnoId = " . $this->userId . " AND courseId = " . $courseId;
		$this->Util()->DB()->setQuery($sql);
		$matricula = $this->Util()->DB()->GetSingle();
		return $matricula;
	}

	public function GroupHistory($subjectId)
	{
		$sql = "SELECT academicHistoryId,
						subjectId,
						courseId,
						userId,
						semesterId,
						dateHistory,
						type,
						situation 
					FROM academic_history 
				WHERE userId = " . $this->userId . " AND subjectId = " . $subjectId . " ORDER BY type DESC, academicHistoryId ASC";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function BoletaCalificacion($courseId, $period = 0, $english = true, $moduloTerminado = false)
	{
		$condition = "";
		if ($period > 0)
			$condition .= " AND subject_module.semesterId = " . $period;
		if (!$english)
			$condition .= " AND subject_module.tipo <> 0";
		if ($moduloTerminado)
			$condition .= "AND course_module.finalDate <= CURRENT_DATE()";
		// Se obtienen las materias del curso
		$sql = "SELECT *
					FROM course_module
						LEFT JOIN subject_module 
							ON subject_module.subjectModuleId = course_module.subjectModuleId
					WHERE courseId = " . $courseId . " " . $condition . "
					ORDER BY semesterId ASC, orden ASC";
		// echo $sql."<br>";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		// echo "Materias del curso:";
		// print_r($result);
		foreach ($result as $key => $value) {
			//Se obtienen las calificaciones totales de cada materia
			$sql = "SELECT course_module_score.*, cm.calificacionValida
						FROM course_module_score
							LEFT JOIN course_module as cm ON cm.courseModuleId = course_module_score.courseModuleId
						WHERE course_module_score.courseModuleId = " . $value['courseModuleId'] . " AND userId = " . $this->userId . " AND course_module_score.courseId = " . $courseId;
			// echo "$sql<br>";
			$this->Util()->DB()->setQuery($sql);
			$infoCc = $this->Util()->DB()->GetRow();
			// echo "InfoCc:";
			// print_r($infoCc);
			// CALCULA ACUMULADO; Se obtienen las actividades pertenecientes a la materia(módulo).
			$activity = new Activity;
			$activity->setCourseModuleId($value['courseModuleId']);
			$actividades = $activity->Enumerate();
			//Se obtienen los equipos por materias(módulo)
			$sql = "SELECT teamNumber
						FROM team
						WHERE courseModuleId = " . $value['courseModuleId'] . " AND userId = " . $this->userId;
			$this->Util()->DB()->setQuery($sql);
			$result[$key]["equipo"] = $this->Util()->DB()->GetSingle();
			$result[$key]["addepUp"] = 0;
			// print_r($actividades);
			foreach ($actividades as $activity) {
				if ($activity["score"] <= 0)
					continue;
				$sqlca = "SELECT ponderation
							FROM activity_score
							WHERE activityId = " . $activity["activityId"] . " AND userId = " . $this->userId;
				$this->Util()->DB()->setQuery($sqlca);
				$score = $this->Util()->DB()->GetSingle();
				$result[$key]["score"][] = $score;
				$realScore = $score * $activity["score"] / 100;
				$result[$key]["realScore"][] = $realScore;
				$result[$key]["addepUp"] += $realScore;
			}
			if ($infoCc["calificacion"] == null or $infoCc["calificacion"] == 0) {
				$at = $result[$key]["addepUp"] / 10;
				if ($this->tipoMajor == "MAESTRIA" and $at < 7)
					$at = floor($at);
				else if ($this->tipoMajor == "DOCTORADO" and $at < 8)
					$at = floor($at);
				else
					$at = round($at, 0, PHP_ROUND_HALF_DOWN);
				$infoCc["calificacion"] = $at;
			} else
				$infoCc["calificacion"] = $infoCc["calificacion"];
			if ($this->tipoMajor == "MAESTRIA" and $infoCc["calificacion"] < 7)
				$result[$key]["score"] = 6;
			else if ($this->tipoMajor == "DOCTORADO" and $infoCc["calificacion"] < 8)
				$result[$key]["score"] = 7;
			else
				$result[$key]["score"] = $infoCc["calificacion"];
		}
		// print_r($result);
		return $result;
	}

	public function SaveQualifications($courseId, $semesterId, $cycle, $period, $date, $year, $modules, $course, $send_message)
	{
		/* echo "<pre>";
		print_r($course);
		exit; */
		include_once(DOC_ROOT . "/properties/messages.php");
		$infoStudent = $this->GetInfo();
		$qualifications = [];
		foreach ($modules as $item) {
			$score = $item['score'];
			if ($score == 0)
				$score = 'NP';
			$qualifications[] = [
				'extra' => $item['tipo'],
				'courseModule' => $item['courseModuleId'],
				'subjectModule' => $item['subjectModuleId'],
				'start' => $item['initialDate'],
				'end' => $item['finalDate'],
				'score' => $score
			];
		}
		$qualifications = json_encode($qualifications);
		$qr = 'IAP_BC_C' . $courseId . '_S' . $this->userId . '_N' . $semesterId . '_' . $qualifications;
		$qr = base64_encode($qr);
		/* echo "<pre>";
		print_r($infoStudent);
		exit; */
		$sql = "INSERT INTO qualifications(courseId, userId, semesterId, cycle, period, date, year, qualifications, qr, created_at) VALUES(" . $courseId . ", " . $this->userId . ", " . $semesterId . ", '" . $cycle . "', '" . $period . "', '" . $date . "', '" . $year . "', '" . $qualifications . "', '" . $qr . "', NOW())";
		$this->Util()->DB()->setQuery($sql);
		$qualificationsId = $this->Util()->DB()->InsertData();
		// Enviar Correo
		$sendmail = new SendMail;
		$details_body = array(
			"semester" => utf8_decode($course['tipoCuatri']),
			"period" => $semesterId,
			"course" => utf8_decode($course['majorName'] . ' ' . $course['name']),
		);
		$details_subject = array();
		$attachment = [];
		$fileName = [];
		$email = $infoStudent['email'];
		// $email = 'carloszh04@gmail.com';
		// $email = false;
		if ($email != '' && $send_message == 1)
			$sendmail->PrepareAttachment($message[4]["subject"], $message[4]["body"], $details_body, $details_subject, $email, '', $attachment, $fileName);
		return $qualificationsId;
	}

	public function GetQualifications($qualificationId)
	{
		$sql = "SELECT * FROM qualifications WHERE id = " . $qualificationId;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	public function GetLastQualifications($courseId)
	{
		$sql = "SELECT qualifications.*
	  				FROM qualifications
						INNER JOIN (
		  					SELECT MAX(id) AS id
		  						FROM qualifications
		  					WHERE courseId = " . $courseId . " AND userId = " . $this->userId . " GROUP BY semesterId
						) qs ON qualifications.id = qs.id
	  				ORDER BY semesterId";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	public function DownloadQualifications($qualificationId)
	{
		$sql = "UPDATE qualifications SET downloaded = 1, downloaded_at = CURDATE() WHERE id = " . $qualificationId;
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	public function DownloadedQualifications($courseId, $totalPeriods)
	{
		$result = [];
		for ($i = 1; $i <= $totalPeriods; $i++) {
			$sql = "SELECT qualifications.*
	  				FROM qualifications
						INNER JOIN (
		  					SELECT MAX(id) AS id
		  						FROM qualifications
		  					WHERE courseId = " . $courseId . " AND userId = " . $this->userId . " AND semesterId = " . $i . " GROUP BY semesterId
						) qs ON qualifications.id = qs.id
	  				ORDER BY semesterId";
			$this->Util()->DB()->setQuery($sql);
			$tmp = $this->Util()->DB()->GetRow();
			if ($tmp) {
				$result[$i] = [
					'downloaded' => $tmp['downloaded'],
					'downloaded_at' => $tmp['downloaded_at']
				];
			} else {
				$result[$i] = [
					'downloaded' => '',
					'downloaded_at' => ''
				];
			}
		}
		return $result;
	}

	public function HasAllEvalDocente($courseId, $semesterId)
	{
		$sql = "SELECT COUNT(ead.evalalumnodocenteId)
					FROM eval_alumno_docente ead
					 	INNER JOIN course_module cm
						 	ON ead.courseModuleId = cm.courseModuleId
						INNER JOIN subject_module sm 
							ON sm.subjectModuleId = cm.subjectModuleId
					WHERE cm.courseId = " . $courseId . " AND sm.semesterId = " . $semesterId . " AND ead.alumnoId = " . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		$total_eval = $this->Util()->DB()->GetSingle();
		$sql = "SELECT COUNT(cm.courseModuleId)
					FROM course_module cm
						INNER JOIN subject_module sm 
							ON sm.subjectModuleId = cm.subjectModuleId
					WHERE cm.courseId = " . $courseId . " AND sm.semesterId = " . $semesterId;
		$this->Util()->DB()->setQuery($sql);
		$total_modules = $this->Util()->DB()->GetSingle();
		$has_all = $total_eval == $total_modules ? true : false;
		return $has_all;
	}

	public function UpdateRegister()
	{
		include_once(DOC_ROOT . "/properties/messages.php");
		if ($this->Util()->PrintErrors())
			return false;

		$sqlQuery = "UPDATE user				
						SET 
							names = '" . $this->getNames() . "', 
							lastNamePaterno = '" . $this->getLastNamePaterno() . "', 
							lastNameMaterno = '" . $this->getLastNameMaterno() . "', 
							sexo = '" . $this->getSexo() . "', 
							birthdate = '" . $this->getBirthdate() . "', 
							maritalStatus = '" . $this->getMaritalStatus() . "', 
							street = '" . $this->getStreet() . "', 
							number = '" . $this->getNumer() . "', 
							colony = '" . $this->getColony() . "', 
							pais =  '" . $this->getCountry() . "', 
							estado = '" . $this->getState() . "', 
							ciudad = '" . $this->getCity() . "', 
							postalCode = '" . $this->getPostalCode() . "', 
							email = '" . $this->getEmail() . "', 
							mobile = '" . $this->getMobile() . "', 
							phone = '" . $this->getPhone() . "', 
							fax = '" . $this->getFax() . "', 
							workplaceOcupation = '" . $this->getWorkplaceOcupation() . "', 
							workplace = '" . $this->getWorkplace() . "', 
							workplaceAddress = '" . $this->getWorkplaceAddress() . "', 
							paist='" . $this->getPaisT() . "',
							estadot='" . $this->getEstadoT() . "',
							ciudadt='" . $this->getCiudadT() . "',
							workplaceArea = '" . $this->getWorkplaceArea() . "', 
							workplacePosition = '" . $this->getWorkplacePosition() . "', 
						    workplacePhone = '" . $this->getWorkplacePhone() . "', 
							workplaceEmail = '" . $this->getWorkplaceEmail() . "', 
							academicDegree = '" . $this->getAcademicDegree() . "', 
							profesion = '" . $this->getProfesion() . "', 
							school = '" . $this->getSchool() . "', 
							masters = '" . $this->getMasters() . "', 
							mastersSchool = '" . $this->getMastersSchool() . "', 
							highSchool = '" . $this->getHighSchool() . "',
							actualizado = 'si'						
						WHERE 
							userId = " . $this->getUserId();
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();

		$this->setUserId($this->getUserId());
		$info = $this->GetInfo();
		// Informacion Personal
		$this->setControlNumber();
		$this->setNames($info['names']);
		$this->setLastNamePaterno($info['lastNamePaterno']);
		$this->setLastNameMaterno($info['lastNameMaterno']);
		$this->setSexo($info['sexo']);
		$this->setPassword(trim($info['password']));

		// Datos de Contacto
		$this->setEmail($info['email']);
		$this->setMobile($info['mobile']);

		// Datos Laborales
		$this->setWorkplaceOcupation($info['workplaceOcupation']);
		$this->setWorkplace($info['workplace']);
		$this->setWorkplacePosition($info['workplacePosition']);
		$this->setWorkplaceCity($info['nombreciudad']);

		// Estudios
		$this->setAcademicDegree($info['academicDegree']);
		// Create File to Attach
		$sql = "SELECT courseId FROM user_subject WHERE alumnoId = " . $this->getUserId() . " AND status = 'activo' ORDER BY registrationId LIMIT 1";
		$this->Util()->DB()->setQuery($sql);
		$courseId = $this->Util()->DB()->GetSingle();
		$course = new Course();
		$course->setCourseId($courseId);
		$courseInfo = $course->Info();
		// $files  = new Files;
		// $file = $files->CedulaInscripcion($this->getUserId(), $courseId, $this, $courseInfo['majorName'], $courseInfo['name']);
		// Enviar Correo
		$sendmail = new SendMail;
		$details_body = array(
			"email" => $info["controlNumber"],
			"password" => $info['password'],
			"major" => utf8_decode($courseInfo['majorName']),
			"course" => utf8_decode($courseInfo['name']),
			"alumno" => $this->getUserId(),
			"courseId" => $courseId
		);
		$details_subject = array();
		$nombre = $info['names'] . ' ' . $info['lastNamePaterno'] . ' ' . $info['lastNameMaterno'];
		$sendmail->Prepare($message[5]['subject'], $message[5]['body'], $details_body, $details_subject, $info['email'], $nombre);
		return true;
	}

	function hasModulesRepeat()
	{
		$sql = "SELECT COUNT(id) FROM user_subject_repeat WHERE alumnoId = " . $this->getUserId();
		$this->Util()->DB()->setQuery($sql);
		$total = $this->Util()->DB()->GetSingle();
		return $total > 0 ? true : false;
	}

	function setCertificate($status)
	{
		$sql = "INSERT INTO certificate_subject(userId, courseId, date, status, downloaded) 
					VALUES(" . $this->getUserId() . ", " . $this->courseId . ", CURDATE(), " . $status . ", 0)";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
		return true;
	}

	public function enumerateCatProductos()
	{
		$sql = "SELECT *
					FROM catdocumentoalumno
				WHERE status = 'activo'";
		$this->Util()->DB()->setQuery($sql);
		$res = $this->Util()->DB()->GetResult();

		foreach ($res as $key => $aux) {
			$sql = "SELECT ruta
						FROM documentosalumno
					WHERE catdocumentoalumnoId = " . $aux['catdocumentoalumnoId'] . " AND userId = " . $this->userId;
			$this->Util()->DB()->setQuery($sql);
			$count = $this->Util()->DB()->GetRow();

			if ($count['ruta'] <> '') {
				$res[$key]['existArchivo'] = 'si';
				$res[$key]['ruta'] = $count['ruta'];
			} else {
				$res[$key]['existArchivo'] = 'no';
			}
		}
		return $res;
	}

	public function onSaveDocumento($nombre, $descripcion, $documentoId = null)
	{
		if (isset($documentoId)) {
			$sql = "UPDATE catdocumentoalumno
						SET nombre = '" . $nombre . "', descripcion = '" . $descripcion . "'
				WHERE catcodumentoalumnoId = " . $documentoId;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
		} else {
			$sql = "INSERT INTO catdocumentoalumno(nombre, descripcion) VALUES('" . $nombre . "', '" . $descripcion . "')";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->InsertData();
		}
		return true;
	}

	public function infoDocumento($documentoId)
	{
		$sql = 'SELECT * 
					FROM catdocumentoalumno
				WHERE catdocumentoalumnoId = ' . $documentoId;
		$this->Util()->DB()->setQuery($sql);
		$lst = $this->Util()->DB()->GetRow();
		return $lst;
	}

	public function onDeleteDocumento($documentoId)
	{
		$sql = "UPDATE catdocumentoalumno SET status = 'eliminado' WHERE catdocumentoalumnoId = " . $documentoId;
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	public function adjuntarDocAlumno()
	{
		$sql = "SELECT  * FROM documentosalumno WHERE catdocumentoalumnoId = " . $this->documentoId . " AND userId = " . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		$count = $this->Util()->DB()->GetRow();

		if ($count['documentosalumnoId'] == null) {
			$sql = "INSERT INTO documentosalumno(catdocumentoalumnoId, userId)
				 VALUES(" . $this->documentoId . ", " . $this->userId . ")";
			$this->Util()->DB()->setQuery($sql);
			$lastId = $this->Util()->DB()->InsertData();
		} else
			$lastId = $count['documentosalumnoId'];

		foreach ($_FILES as $key => $var) {
			switch ($key) {
				case 'comprobante':
					if ($var["name"] <> "") {
						$aux = explode(".", $var["name"]);
						$extencion = end($aux);
						$temporal = $var['tmp_name'];
						$url = DOC_ROOT;
						$foto_name = "doc_" . $lastId . "." . $extencion;

						if (move_uploaded_file($temporal, $url . "/alumnos/documentos/" . $foto_name)) {
							$sql = "UPDATE documentosalumno SET ruta = '" . $foto_name . "' WHERE documentosalumnoId = " . $lastId;
							$this->Util()->DB()->setQuery($sql);
							$this->Util()->DB()->UpdateData();
						}
					}
					break;
			}
		}
		return  true;
	}

	public function onDeleteDocumentoAlumno($Id)
	{
		if ($this->Util()->PrintErrors())
			return false;

		$sql = "DELETE FROM documentosalumno WHERE userId = " . $this->userId . " AND catdocumentoalumnoId = " . $Id;
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	//Obtiene el semestre en el que se dio de baja en el curso.
	public function bajaCurso($cursoId)
	{
		$sql = "SELECT semesterId FROM academic_history WHERE courseId = '{$cursoId}' AND userId = '{$this->userId}' AND type = 'baja' ORDER BY academicHistoryId DESC";
		$this->Util()->DB()->setQuery($sql);
		$semestre = $this->Util()->DB()->GetSingle();
		// echo $sql;
		return $semestre;
	}
	//Obtiene el periodo en el que se dio de alta en el curso.
	public function periodoAltaCurso($cursoId)
	{
		$sql = "SELECT IF(semesterId = 0, 1, semesterId) as semesterId FROM academic_history WHERE courseId = '{$cursoId}' AND userId = '{$this->userId}' AND type = 'alta' ORDER BY academicHistoryId DESC";
		$this->Util()->DB()->setQuery($sql);
		$periodo = $this->Util()->DB()->GetSingle();
		// echo $sql;
		return $periodo;
	}

	public function primerCurso()
	{
		$sql = "SELECT courseId FROM `user_subject` WHERE alumnoId = '{$this->userId}' AND courseId IN (81,82,98,80,59,137,97) ORDER BY registrationId ASC LIMIT 1;";
		$this->Util()->DB()->setQuery($sql);
		$curso = $this->Util()->DB()->GetSingle();
		return $curso;
	}

	public function cambiarCorreos()
	{
		$sql = "UPDATE user SET correo_institucional = '{$this->correoInstitucional}' WHERE userId = {$this->userId} ";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
	}

	//Obtiene el curso y el periodo de la última baja de acuerdo al tipo de especialidad estudiada.
	public function ultimaBaja()
	{
		$sql = "SELECT semesterId FROM academic_history WHERE userId = {$this->getUserId()} AND subjectId = {$this->subjectId} AND type = 'baja' ORDER BY academicHistoryId DESC LIMIT 1";
		// echo $sql;
		$this->Util()->DB()->setQuery($sql);
		$periodo = $this->Util()->DB()->GetSingle();
		return $periodo;
	}

	//Checa si el alumno no tiene más de historial duplicado, para poder reajustarlo.
	public function historialDuplicado()
	{
		// $sql = "SELECT *, SUM(IF(type = 'alta', 1, 0)) as altas, SUM(IF(type = 'baja', 1, 0)) as bajas, 'revisar' FROM `academic_history` INNER JOIN subject ON subject.subjectId = academic_history.subjectId WHERE userId = {$this->userId} GROUP BY userId, academic_history.subjectId, tipo, courseId HAVING altas > 1 OR bajas > 1;";
		$sql = "SELECT *, SUM(IF(type = 'alta', 1, 0)) as altas, SUM(IF(type = 'baja', 1, 0)) as bajas, 'revisar' FROM `academic_history` WHERE userId = {$this->userId} GROUP BY userId, academic_history.subjectId, courseId HAVING altas > 1 OR bajas > 1;";
		$this->Util()->DB()->setQuery($sql);
		$existe = $this->Util()->DB()->GetRow();
		return $existe['revisar'] ? true : false;
	}

	/**Busca si el alumno cuenta con un pago pendiente y es de tipo periodico */
	public function pago_pendiente()
	{
		$sql = "SELECT pagos.* FROM pagos INNER JOIN user_subject ON user_subject.alumnoId = pagos.alumno_id AND user_subject.courseId = pagos.course_id WHERE pagos.fecha_cobro <= NOW() AND pagos.status <> 2 AND pagos.status <> 4 AND pagos.alumno_id = {$this->userId} AND periodo <> 0 AND user_subject.status = 'activo' AND pagos.deleted_at IS NULL;";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->GetResult();
		$pagoPendiente = false;
		foreach ($resultado as $item) {
			if ($item['status'] == 3) { //Si hay prórroga
				$fecha_limite = date("Y-m-d", strtotime($item['fecha_limite'] . "+ " . ($item['tolerancia']) . " days")); //Se obtiene la fecha límite de acuerdo a los días de prórroga
			} else {
				$fecha_limite = $item['fecha_limite']; //Se obtiene la fecha límite real
			}
			if ($fecha_limite < date('Y-m-d')) { //Si la fecha límite es menor al día actual, ya es un pago pendiente.
				$pagoPendiente = true;
				break;
			}
		}
		return $pagoPendiente;
	}

	public function datos_fiscales()
	{
		$sql = "SELECT fsid.*, (SELECT nom_ent FROM municipalities WHERE cve_ent = fsid.cve_ent LIMIT 1) as estado, (SELECT nom_mun FROM municipalities WHERE cve_ent = fsid.cve_ent AND cve_mun = fsid.cve_mun LIMIT 1) as municipio, (SELECT nom_loc FROM municipalities WHERE cve_ent = fsid.cve_ent AND cve_mun = fsid.cve_mun AND cve_loc = fsid.cve_loc LIMIT 1) as localidad FROM fn_student_invoice_data fsid WHERE userId = {$this->userId} AND deleted_at IS NULL";
		// echo $sql;
		$this->Util()->DBErp()->setQuery($sql);
		$resultado = $this->Util()->DBErp()->GetResult();
		return $resultado;
	}

	public function getCardholder()
	{
		$sql = "SELECT * FROM cardholder_data WHERE userId = " . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;
	}

	public function saveCardholder($city, $country, $email, $name, $last_name, $postal_code, $state_code, $street, $mobile)
	{
		$sql = "INSERT INTO cardholder_data(userId, city, country, email, name, last_name, postal_code, state_code, street, mobile, created_at, updated_at) VALUES(" . $this->userId . ", '" . $city . "', '" . $country . "', '" . $email . "', '" . $name . "', '" . $last_name . "', '" . $postal_code . "', '" . $state_code . "', '" . $street . "', '" . $mobile . "', NOW(), NOW())";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
		return true;
	}

	public function updateCardholder($city, $email, $name, $last_name, $postal_code, $state_code, $street, $mobile)
	{
		$sql = "UPDATE cardholder_data SET city = '" . $city . "', email = '" . $email . "', name = '" . $name . "', last_name = '" . $last_name . "', postal_code = '" . $postal_code . "', state_code = '" . $state_code . "', street = '" . $street . "', mobile = '" . $mobile . "', updated_at = NOW() WHERE userId = " . $this->userId;
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		return true;
	}

	//Retorna la información de la credencial del alumno por curso
	public function getCredential($student, $course)
	{
		$sql = "SELECT * FROM user_credentials WHERE course_id = $course AND user_id = $student";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		if ($result) {
			$result['files'] = [
				"photo" => json_decode($result['photo'], true),
				"credential" => json_decode($result['credential'], true),
				"token"	=> json_decode($result['token'], true)
			];
		}
		return $result;
	}

	public function createCredential($student, $course, $files)
	{
		$sql = "INSERT INTO user_credentials(user_id, course_id, photo, status, created_at, updated_at) VALUES($student, $course, '{$files}', 0, NOW(), NOW())";
		$this->Util()->DB()->setQuery($sql);
		$id = $this->Util()->DB()->InsertData();

		// $token = password_hash($id . $student . $course, PASSWORD_BCRYPT);
		// $sql = "UPDATE user_credentials SET token = '$token' WHERE id = {$id}";
		// $this->Util()->DB()->setQuery($sql);
		// $this->Util()->DB()->UpdateData();
	}

	public function editCredential($student, $course, $files, $status)
	{
		$sql = "UPDATE user_credentials SET photo = '{$files}', status = $status, updated_at = NOW() WHERE user_id = $student AND course_id = $course";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData();
	}

	public function UpdateAvatarCredential()
	{
		$sql = "UPDATE user SET avatar = 1 WHERE userId = {$this->userId}";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData($sql);
	}

	//Actualiza el bloqueo para privilegios de pagos
	function actualizarBloqueo($userId, $bloqueo)
	{
		$sql = "UPDATE user SET bloqueado = {$bloqueo} WHERE userId = {$userId}";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData();
	}

	//Retorna el alumno inscrito en el curso Gestión Documental y Administración de Archivos y, si tiene, la curricula adicional activa. 
	function alumnoConDiplomado($alumnoId)
	{
		$sql = "SELECT * FROM `user_subject` B WHERE alumnoId = {$alumnoId} AND status = 'activo' AND EXISTS(SELECT * FROM user_subject A WHERE A.alumnoId = B.alumnoId AND A.courseId IN (162, 169));";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->GetTotalRows();
		return $resultado;
	}

	public function evaluaciones_diplomado()
	{
		$sql = 'SELECT
			user.controlNumber as usuario,
			user.names,
			user.lastNamePaterno,
			user.lastNameMaterno,
			subject_module.name AS modulo,
			IFNULL(MAX(CASE WHEN activity.activityId = 6214 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_1",
			IFNULL(MAX(CASE WHEN activity.activityId = 6219 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_2",
			IFNULL(MAX(CASE WHEN activity.activityId = 6228 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_3",
			IFNULL(MAX(CASE WHEN activity.activityId = 6243 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_4",
			IFNULL(MAX(CASE WHEN activity.activityId = 6256 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_5", 
			IFNULL(MAX(CASE WHEN activity.activityId = 6282 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_6", 
			IFNULL(MAX(CASE WHEN activity.activityId = 6288 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_7",
			IFNULL(MAX(CASE WHEN activity.activityId = 6304 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_8",
			IFNULL(MAX(CASE WHEN activity.activityId = 6310 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_9",
			IFNULL(MAX(CASE WHEN activity.activityId = 6317 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_10",
			IFNULL(MAX(CASE WHEN activity.activityId = 6335 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_11",
			IFNULL(MAX(CASE WHEN activity.activityId = 6341 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_12",
			IFNULL(MAX(CASE WHEN activity.activityId = 6359 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_13",
			IFNULL(MAX(CASE WHEN activity.activityId = 6382 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_14",
			IFNULL(MAX(CASE WHEN activity.activityId = 6369 THEN activity_score.ponderation ELSE NULL END), 0) AS "actividad_15"
		FROM
			user_subject
		INNER JOIN user ON user.userId = user_subject.alumnoId
		INNER JOIN course_module ON course_module.courseId = user_subject.courseId
		INNER JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
		INNER JOIN activity ON activity.courseModuleId = course_module.courseModuleId
		LEFT JOIN activity_score ON activity_score.activityId = activity.activityId AND activity_score.userId = user.userId
		WHERE
			user_subject.courseId IN (162, 169)
			GROUP BY user.userId;';
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function getActivityScore($typeActivity, $where = "")
	{
		if ($typeActivity == "Tarea") {
			$sql = "SELECT * FROM homework WHERE 1 {$where}";
			$this->Util()->DB()->setQuery($sql);
			return $this->Util()->DB()->GetRow();
		}
		if ($typeActivity == "Examen") {
			$sql = "SELECT * FROM activity_score WHERE 1 {$where}";
			$this->Util()->DB()->setQuery($sql);
			return $this->Util()->DB()->GetRow();
		}
	}

	function getHistory()
	{
		$sql = "SELECT *, GROUP_CONCAT(semesterId ORDER BY type ASC) as periodos, GROUP_CONCAT(type ORDER BY type ASC) as eventos FROM academic_history WHERE userId = {$this->userId} GROUP BY courseId ORDER BY academicHistoryId";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	private $status_payment, $status_evaluation;
	public function setStatusPayment($value) {
		$this->status_payment = $value;
	}
	public function setStatusEvaluation($value) {
		$this->status_evaluation = $value;
	}

	function updateUserCourse() {
		$fields = [
			'status_payment'	=> $this->status_payment, 
			'status_evaluation'	=> $this->status_evaluation
		];
		$updateQuery = $this->Util()->DB()->generateUpdateQuery($fields);
		$sql = "UPDATE user_subject SET $updateQuery WHERE alumnoId = {$this->getUserId()} AND courseId = {$this->getCourseId()}";  
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData();
		return true;
	}

	function getCourses($where = "")
	{
		$sql = "SELECT major.name as major_name, subject.name as subject_name, course.courseId, course.group, subject.icon, course.initialDate, course.finalDate, course.subjectId FROM user_subject INNER JOIN course ON course.courseId = user_subject.courseId INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo WHERE 1 {$where}";
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}

	function updateStudent()
	{
		$fields = [
			'names' 			=> $this->names,
			'lastNamePaterno' 	=> $this->lastNamePaterno,
			'lastNameMaterno' 	=> $this->lastNameMaterno,
			'email' 			=> $this->email,
			'phone' 			=> $this->phone,
			'password' 			=> $this->password,
			'workplace' 		=> $this->workplace,
			'workplacePosition' => $this->workplacePosition,
			'estado' 			=> $this->state,
			'ciudad'			=> $this->city,
			'estadot'			=> $this->state,
			'ciudadt'			=> $this->city,
			'curp'				=> $this->getCurp(),
			'curpDrive'			=> $this->curpDrive,
			'foto'				=> $this->foto,
			'sexo'				=> $this->sexo,
			'workplaceOcupation' => $this->workplaceOcupation,
			'academicDegree'	=> $this->academicDegree,
			'rfc'				=> $this->rfc,
			'adscripcion'		=> $this->adscripcion,
			'coordination'		=> $this->coordination,
			'funcion'			=> $this->funcion
		];
		$updateQuery = $this->Util()->DB()->generateUpdateQuery($fields);
		$sql = "UPDATE user SET $updateQuery WHERE userId = {$this->getUserId()}";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData();
		$resultado['status'] = true;
		return $resultado;
	}

	function addUserCourse()
	{
		$sql = "INSERT INTO user_subject(alumnoId, courseId,status,situation) VALUES ({$this->getUserId()}, {$this->courseId}, 'activo', 'A')";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();
	}

	function saveInai()
	{
		$controlNumber = $this->getControlNumber();
		$sql = "INSERT INTO user(controlNumber, names, lastNamePaterno, lastNameMaterno, email, phone, password, workPlace, workplaceOcupation, paist, estadot, actualizado, estado, curpDrive, curp) VALUES('" . $controlNumber . "', '" . $this->name . "', '" . $this->lastNamePaterno . "', '" . $this->lastNameMaterno . "', '" . $this->email . "', '" . $this->phone . "', '" . $this->password . "', '" . $this->workplace . "', '".$this->workplaceOcupation."', 1, {$this->estadoT}, 'si', {$this->estadoT}, {$this->curpDrive}, '{$this->curp}')";
		
		$this->Util()->DB()->setQuery($sql); 
		$resultado['status'] = $this->Util()->DB()->InsertData();
		$resultado['usuario'] = $controlNumber; 
		return $resultado;
	}
}
