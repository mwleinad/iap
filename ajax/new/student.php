<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
include_once(DOC_ROOT . "/properties/messages.php");

session_start();
switch ($_POST['opcion']) {
	case 'registro':
		$status = $_POST['status'];
		// Información Personal

		$nombre = $_POST['names'];
		$paterno = $_POST['lastNamePaterno'];
		$materno = $_POST['lastNameMaterno'];
		$sexo = $_POST['sexo'];
		$password = trim($_POST['password']);
		$correo = $_POST['email'];
		$telefono = $_POST['mobile'];
		$ocupacion = $_POST['workplaceOcupation'];
		$lugarTrabajo = $_POST['workplace'];
		$cargo = $_POST['workplacePosition'];
		$pais = $_POST['paist'];
		$estado = $_POST['estadot'];
		$ciudad = $_POST['ciudadt'];
		$curp = $_POST['curp'];
		$funcion = $_POST['funcion'];
		$errors = [];
		if ($nombre == '') {
			$errors['names'] = "Por favor, no se olvide de poner el nombre.";
		}
		if ($paterno == '') {
			$errors['lastNamePaterno'] = "Por favor, no se olvide de poner el apellido parterno.";
		}
		if ($materno == '') {
			$errors['lastNameMaterno'] = "Por favor, no se olvide de poner el apellido materno.";
		}
		if ($password == '') {
			$errors['password'] = "Por favor, no se olvide de poner la contraseña.";
		}
		if ($correo == '') {
			$errors['email'] = "Por favor, no se olvide de poner el correo electrónico.";
		}
		if ($telefono == '') {
			$errors['mobile'] = "Por favor, no se olvide de el número de celular.";
		}
		if ($lugarTrabajo == '') {
			$errors['workplace'] = "Por favor, no se olvide de poner el lugar de trabajo.";
		}
		if ($cargo == '') {
			$errors['workplacePosition'] = "Por favor, no se olvide de poner el puesto.";
		}
		if (empty($pais)) {
			$errors['paist'] = "Por favor, no se olvide de seleccionar el pais.";
		}
		if (empty($estado)) {
			$errors['estadot'] = "Por favor, no se olvide de seleccionar el estado.";
		}
		if (empty($curp)) {
			$errors['curp'] = "Por favor, no se olvide de poner la curp.";
		}

		$nombreAlumno = $util->eliminar_acentos(trim($nombre . "_" . $paterno . "_" . $materno));
		$nombreAlumno = strtolower($nombreAlumno);

		$response = $util->Util()->validarSubidaPorArchivo([
			"curparchivo" => [
				'types' 	=> ['application/pdf'],
				'size' 		=> 5242880,
				'required'	=> true
			],
			"foto"	=> [
				'types' 	=> ['image/jpeg', 'image/png'],
				'size' 		=> 5242880,
				'required'	=> true
			]
		]);
		foreach ($response as $key => $value) {
			if (!$value['status']) {
				$errors[$key] = $value['mensaje'];
			}
		}

		if (!empty($errors)) {
			header('HTTP/1.1 422 Unprocessable Entity');
			header('Content-Type: application/json; charset=UTF-8');
			echo json_encode([
				'errors'    => $errors
			]);
			exit;
		}

		$student->setPermiso($_POST['permiso']);
		$student->setControlNumber();
		$student->setNames($nombre);
		$student->setLastNamePaterno($paterno);
		$student->setLastNameMaterno($materno);
		$student->setSexo($sexo);
		$student->setPassword($password);
		$student->setEmail($correo);
		$student->setMobile($telefono);
		$student->setWorkplaceOcupation($ocupacion);
		$student->setWorkplace($lugarTrabajo);
		$student->setWorkplacePosition($cargo);
		$student->setPaisT($pais);
		$student->setEstadoT($estado);
		$student->setCiudadT(1);
		$student->setCurp($curp);
		$student->setFuncion($funcion);
		$student->setActualizado("si");
		$carpetaId = "1dIsKbt6QM4Y7I56Lgfv8NDyjFlreTD0T";
		$google = new Google($carpetaId);
		foreach ($_FILES as $key => $archivo) {
			$ruta = DOC_ROOT . "/tmp/";
			$extension = pathinfo($archivo['name'], PATHINFO_EXTENSION);
			$temporal =  $archivo['tmp_name'];
			$nombre = $key . "_" . $nombreAlumno;
			$documento =  $nombre . "." . $extension;
			move_uploaded_file($temporal, $ruta . $documento);

			$google->setArchivoNombre($documento);
			$google->setArchivo($ruta . $documento);
			$respuesta = $google->subirArchivo();
			$files[$key] = '{
				"filename": "' . $respuesta['name'] . '",
				"googleId": "' . $respuesta['id'] . '",
				"mimeType": "' . $respuesta['mimeType'] . '",
				"urlBlank": "https://drive.google.com/open?id=' . $respuesta['id'] . '",
				"urlEmbed": "https://drive.google.com/uc?id=' . $respuesta['id'] . '",
				"mimeTypeOriginal":"' . $archivo['type'] . '"
			}';
			unlink($ruta . $documento);
		}
		$student->setCurpDrive("'{$files['curparchivo']}'");
		$student->setFoto("'{$files['foto']}'");
		// Estudios
		$student->setAcademicDegree($_POST['academicDegree']);

		if (!$student->Save("createCurricula")) {
			$json = json_decode($files['curparchivo'], true);
			$google->setArchivoID($json['googleId']);
			$respuesta = $google->eliminarArchivo();

			$json = json_decode($files['foto'], true);
			$google->setArchivoID($json['googleId']);
			$respuesta = $google->eliminarArchivo();

			echo json_encode([
				'errorOld'    => "fail[#]" . $smarty->fetch(DOC_ROOT . '/templates/boxes/status.tpl'),
			]);
		} else {
			echo json_encode([
				'errorOld'	=> "ok[#]" . $smarty->fetch(DOC_ROOT . '/templates/boxes/status.tpl'),
				'location'	=> WEB_ROOT . '/login',
			]);
		}
		break;

	case 'reinscripcion':
	case 'actualizacion':
		$permiso = $_POST['permiso'];
		$alumno = $_POST['id'];
		$student->setPermiso($permiso);
		$student->setUserId($alumno);
		$infoAlumno = $student->GetInfo();
		// print_r($infoAlumno);
		// exit;
		$diplomados = $student->alumnoConDiplomado($_POST['id']);
		$diplomados = isset($_POST['auxAdmin']) ? 0 : $diplomados;
		$errors = [];

		//Campos para todos
		$nombre = strip_tags(trim($_POST['names']));
		$apellidoPaterno = strip_tags(trim($_POST['lastNamePaterno']));
		$apellidoMaterno = strip_tags(trim($_POST['lastNameMaterno']));
		$sexo = strip_tags(trim($_POST['sexo']));
		$contrasena = strip_tags(trim($_POST['password']));
		$correo = strip_tags(trim($_POST['email']));
		$movil = strip_tags(trim($_POST['mobile']));
		$trabajoOcupacion = strip_tags(trim($_POST['workplaceOcupation']));
		$trabajoLugar = strip_tags(trim($_POST['workplace']));
		$trabajoPuesto = strip_tags(trim($_POST['workplacePosition']));
		$trabajoPais = intval($_POST['paist']);
		$trabajoEstado = intval($_POST['estadot']);
		$curp = $_POST['curp'];
		//validaciones para todos
		if (empty($nombre)) {
			$errors['names'] = "Por favor, no se olvide de poner el nombre.";
		}
		if (empty($apellidoPaterno)) {
			$errors['lastNamePaterno'] = "Por favor, no se olvide de poner el apellido paterno.";
		}
		if (empty($apellidoMaterno)) {
			$errors['lastNameMaterno'] = "Por favor, no se olvide de poner el apellido materno.";
		}
		if (empty($contrasena)) {
			$errors['password'] = "Por favor, no se olvide de poner la contrasñea";
		}
		if (empty($correo)) {
			$errors['email'] = "Por favor, no se olvide de poner el correo de contacto";
		} elseif (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
			$errors['email'] = "Por favor, no se olvide de poner un correo de contacto válido";
		}
		if (empty($movil)) {
			$errors['mobile'] = "Por favor, no se olvide de poner el celular";
		}
		if (empty($trabajoLugar)) {
			$errors['workplace'] = "Por favor, no se olvide de poner el lugar de trabajo";
		}
		if (empty($trabajoPuesto)) {
			$errors['workplacePosition'] = "Por favor, no se olvide de poner el puesto.";
		}
		if (empty($trabajoPais)) {
			$errors['paist'] = "Por favor, no se olvide de poner el país.";
		}
		if (empty($trabajoEstado)) {
			$errors['estadot'] = "Por favor, no se olvide de poner el estado.";
		}
		if (empty($curp)) {
			$errors['curp'] = "Por favor, no se olvide de poner la curp.";
		}

		//Campo para los que tienen currícula y tienen o no el diplomado. 
		$fechaNacimiento = $diplomados != 1 ? date('d-m-Y', strtotime(strip_tags($_POST['birthday']))) : "";
		$estadoCivil = $diplomados != 1 ? strip_tags($_POST['maritalStatus']) : "";
		$calle = $diplomados != 1 ? strip_tags(trim($_POST['street'])) : "";
		$numero = $diplomados != 1 ? strip_tags(trim($_POST['number'])) : "";
		$colonia = $diplomados != 1 ? strip_tags(trim($_POST['colony'])) : "";
		$ciudad = $diplomados != 1 ? intval(trim($_POST['ciudad'])) : 0;
		$estado = $diplomados != 1 ? intval(trim($_POST['estado'])) : 0;
		$pais = $diplomados != 1 ? intval(trim($_POST['pais'])) : 0;
		$codigoPostal = $diplomados != 1 ? strip_tags($_POST['postalCode']) : 0;
		$trabajoDireccion = $diplomados != 1 ? strip_tags(trim($_POST['workplaceAddress'])) : "";
		$trabajoCiudad =  $diplomados != 1 ? intval($_POST['ciudadt']) : 0;
		$trabajoArea = $diplomados != 1 ? strip_tags($_POST['workplaceArea']) : 0;
		$trabajoTelefono = $diplomados != 1 ? strip_tags($_POST['workplacePhone']) : "";
		$trabajoCorreo = $diplomados != 1 ? strip_tags($_POST['workplaceEmail']) : "";
		$gradoAcademico = $diplomados != 1 ? strip_tags($_POST['academicDegree']) : "OTROS";
		$profesion = $diplomados != 1 ? intval($_POST['profesion']) : 38;
		$escuela = $diplomados != 1 ? strip_tags($_POST['school']) : "";
		$maestria = $diplomados != 1 ? strip_tags($_POST['masters']) : "";
		$escuelaMaestria = $diplomados != 1 ? strip_tags($_POST['mastersSchool']) : "";
		$bachillerato = $diplomados != 1 ? strip_tags($_POST['highSchool']) : "";
		$telefono = $diplomados != 1 ? strip_tags($_POST['phone']) : "";
		$funcion = $diplomados != 0 && $_POST['funcion'] ? $_POST['funcion'] : 0;
		//Validaciones para los que tienen currícula y tienen o no el diplomado
		if ($diplomados != 1) {
			if (empty($calle)) {
				$errors['street'] = "Por favor, no se olvide de poner la calle.";
			}
			if (empty($numero)) {
				$errors['number'] = "Por favor, no se olvide de poner el número.";
			}
			if (empty($colonia)) {
				$errors['colony'] = "Por favor, no se olvide de poner la colonia, fraccionamiento, etc...";
			}
			if (empty($pais)) {
				$errors['pais'] = "Por favor, no se olvide de seleccionar el país.";
			}
			if (empty($estado)) {
				$errors['estado'] = "Por favor, no se olvide de seleccionar el estado.";
			}
			if (empty($ciudad)) {
				$errors['ciudad'] = "Por favor, no se olvide de seleccionar la ciudad.";
			}
			if (empty($codigoPostal)) {
				$errors['postalCode'] = "Por favor, no se olvide de poner el código postal.";
			}
			if (empty($trabajoDireccion)) {
				$errors['workplaceAddress'] = "Por favor, no se olvide de poner el domicilio.";
			}
			if (empty($trabajoCiudad)) {
				$errors['ciudadt'] = "Por favor, no se olvide de seleccionar la ciudad.";
			}
			if (empty($trabajoArea)) {
				$errors['workplaceArea'] = "Por favor, no se olvide de poner el área.";
			}
			if (empty($trabajoTelefono)) {
				$errors['workplacePhone'] = "Por favor, no se olvide de poner el teléfono.";
			}
			if (empty($trabajoCorreo)) {
				$errors['workplaceEmail'] = "Por favor, no se olvide de poner el correo.";
			}
		}

		//Validaciones solo a alumnos con el diplomado o que cuentan con este.
		$curpArchivo = is_null($infoAlumno['curpDrive']) ? 'NULL' : $infoAlumno['curpDrive'];
		$foto = is_null($infoAlumno['foto']) ? 'NULL' : $infoAlumno['foto'];
		if ($diplomados != 0 && $_POST['opcion'] != "reinscripcion") {
			$carpetaId = "1dIsKbt6QM4Y7I56Lgfv8NDyjFlreTD0T";
			$google = new Google($carpetaId);
			if ($_FILES['curparchivo']['error'] == UPLOAD_ERR_OK) {
				$response = $util->Util()->validarSubidaPorArchivo([
					"curparchivo" => [
						'types' 	=> ['application/pdf'],
						'size' 		=> 5242880
					],
				]);
				if (!$response['curparchivo']['status']) { //No cumple con las validaciones el archivo
					$errors['curparchivo'] = $response['curparchivo']['mensaje'];
				} else {
					$nombreAlumno = $util->eliminar_acentos(trim($infoAlumno['names'] . "_" . $infoAlumno['lastNamePaterno'] . "_" . $infoAlumno['lastNameMaterno']));
					$nombreAlumno = strtolower($nombreAlumno);
					$archivo = $_FILES['curparchivo'];
					$ruta = DOC_ROOT . "/tmp/";
					$extension = pathinfo($archivo['name'], PATHINFO_EXTENSION);
					$temporal =  $archivo['tmp_name'];
					$nombreArchivo = "curparchivo_" . $nombreAlumno;
					$documento =  $nombreArchivo . "." . $extension;
					move_uploaded_file($temporal, $ruta . $documento);

					$google->setArchivoNombre($documento);
					$google->setArchivo($ruta . $documento);
					if ($curpArchivo != "NULL") {
						$google->setArchivoID($curpArchivo->googleId);
						$google->eliminarArchivo();
						$respuesta = $google->subirArchivo();
						$curpArchivo = '\'{
							"filename": "' . $respuesta['name'] . '",
							"googleId": "' . $respuesta['id'] . '",
							"mimeType": "' . $respuesta['mimeType'] . '",
							"urlBlank": "https://drive.google.com/open?id=' . $respuesta['id'] . '",
							"urlEmbed": "https://drive.google.com/uc?id=' . $respuesta['id'] . '",
							"mimeTypeOriginal":"' . $archivo['type'] . '"
						}\'';
					} else {
						$respuesta = $google->subirArchivo();
						$curpArchivo = '\'{
							"filename": "' . $respuesta['name'] . '",
							"googleId": "' . $respuesta['id'] . '",
							"mimeType": "' . $respuesta['mimeType'] . '",
							"urlBlank": "https://drive.google.com/open?id=' . $respuesta['id'] . '",
							"urlEmbed": "https://drive.google.com/uc?id=' . $respuesta['id'] . '",
							"mimeTypeOriginal":"' . $archivo['type'] . '"
						}\'';
					}
					unlink($ruta . $documento);
				}
			} elseif ($curpArchivo != "NULL") {
				$curpArchivo = "'" . json_encode($curpArchivo) . "'";
			}
			if ($_FILES['foto']['error'] == UPLOAD_ERR_OK) {
				$response = $util->Util()->validarSubidaPorArchivo([
					"foto" => [
						'types' 	=> ['image/jpeg', 'image/png'],
						'size' 		=> 5242880
					],
				]);
				if (!$response['foto']['status']) { //No cumple con las validaciones el archivo
					$errors['foto'] = $response['foto']['mensaje'];
				} else {
					$nombreAlumno = $util->eliminar_acentos(trim($infoAlumno['names'] . "_" . $infoAlumno['lastNamePaterno'] . "_" . $infoAlumno['lastNameMaterno']));
					$nombreAlumno = strtolower($nombreAlumno);
					$archivo = $_FILES['foto'];
					$ruta = DOC_ROOT . "/tmp/";
					$extension = pathinfo($archivo['name'], PATHINFO_EXTENSION);
					$temporal =  $archivo['tmp_name'];
					$nombreArchivo = "foto_" . $nombreAlumno;
					$documento =  $nombreArchivo . "." . $extension;
					move_uploaded_file($temporal, $ruta . $documento);

					$google->setArchivoNombre($documento);
					$google->setArchivo($ruta . $documento);
					if ($foto != "NULL") {
						$google->setArchivoID($foto->googleId);
						$google->eliminarArchivo();
						$respuesta = $google->subirArchivo();
						$foto = '\'{
							"filename": "' . $respuesta['name'] . '",
							"googleId": "' . $respuesta['id'] . '",
							"mimeType": "' . $respuesta['mimeType'] . '",
							"urlBlank": "https://drive.google.com/open?id=' . $respuesta['id'] . '",
							"urlEmbed": "https://drive.google.com/uc?id=' . $respuesta['id'] . '",
							"mimeTypeOriginal":"' . $archivo['type'] . '"
						}\'';
					} else {
						$respuesta = $google->subirArchivo();
						$foto = '\'{
							"filename": "' . $respuesta['name'] . '",
							"googleId": "' . $respuesta['id'] . '",
							"mimeType": "' . $respuesta['mimeType'] . '",
							"urlBlank": "https://drive.google.com/open?id=' . $respuesta['id'] . '",
							"urlEmbed": "https://drive.google.com/uc?id=' . $respuesta['id'] . '",
							"mimeTypeOriginal":"' . $archivo['type'] . '"
						}\'';
					}
					unlink($ruta . $documento);
				}
			} elseif ($foto != "NULL") {
				$foto = "'" . json_encode($foto) . "'";
			}
		}

		if (!empty($errors)) {
			header('HTTP/1.1 422 Unprocessable Entity');
			header('Content-Type: application/json; charset=UTF-8');
			echo json_encode([
				'errors'    => $errors
			]);
			exit;
		}
		$student->setNames($nombre);
		$student->setLastNamePaterno($apellidoPaterno);
		$student->setLastNameMaterno($apellidoMaterno);
		$student->setSexo($sexo);
		$student->setPassword(trim($contrasena));
		$student->setEmail($correo);
		$student->setMobile($movil);
		$student->setWorkplace($trabajoLugar);
		$student->setWorkplaceOcupation($trabajoOcupacion);
		$student->setWorkplacePosition($trabajoPuesto);
		$student->setPaisT($trabajoPais);
		$student->setEstadoT($trabajoEstado);
		$student->setAcademicDegree($gradoAcademico);
		$student->setBirthdate($fechaNacimiento);
		$student->setMaritalStatus($estadoCivil);
		$student->setStreet($calle);
		$student->setNumber($numero);
		$student->setColony($colonia);
		$student->setCity($ciudad);
		$student->setState($estado);
		$student->setCountry($pais);
		$student->setPostalCode($codigoPostal);
		$student->setPhone($telefono);
		$student->setWorkplaceAddress($trabajoDireccion);
		$student->setWorkplaceArea($trabajoArea);
		$student->setWorkplacePosition($trabajoPuesto);
		$student->setPaisT($trabajoPais);
		$student->setEstadoT($trabajoEstado);
		$student->setCiudadT($trabajoCiudad);
		$student->setWorkplacePhone($trabajoTelefono);
		$student->setWorkplaceEmail($trabajoCorreo);
		$student->setProfesion($profesion);
		$student->setSchool($escuela);
		$student->setHighSchool($bachillerato);
		$student->setMasters($maestria);
		$student->setMastersSchool($escuelaMaestria);
		$student->setCurp($curp);
		$student->setCurpDrive($curpArchivo);
		$student->setFoto($foto);
		$student->setFuncion($funcion);
		if (!$student->UpdateAlumn()) {
			echo json_encode([
				'growl'    	=> true,
				'message'	=> 'Ocurrió un error, intente de nuevo',
				'type'		=> 'error'
			]);
		} else {
			if ($_POST['opcion'] == "reinscripcion") {
				if ($_POST['semestreId']) {
					$_POST['semestreId'] = $_POST['semestreId'];
				} else {
					$_POST['semestreId'] = 0;
				}
				$student->ProcesoReinscripcion($_POST['courseMxId'], $_POST['subjecxtId'], $_POST['coursexId'], $_POST['semestreId']);
				echo json_encode([
					'growl'		=> true,
					'message'	=> 'Actualización exitosa. Es necesario que descargue e imprima el formato de reinscripción que se encuentra en su menú principal y llevarlo al área de control escolar para recabar las firmas correspondientes',
					'type'		=> 'success',
					'location'	=> WEB_ROOT . "/view-modules-student/id/" . $_POST['courseMxId'],
				]);
			} else {
				echo json_encode([
					'growl'    	=> true,
					'message'	=> 'Se ha actualizado los datos',
					'type'		=> 'success',
					'reload'	=> true,
				]);
			}
		}
		break;
	case 'registro-cobach':
		$name = trim(strip_tags($_POST['name']));
		$firstSurname = trim(strip_tags($_POST['firstSurname']));
		$secondSurname = trim(strip_tags($_POST['secondSurname']));
		$email = trim(strip_tags($_POST['email']));
		$phone = str_replace(' ', '', strip_tags($_POST['phone']));
		$password = trim($_POST['password']);
		$workplacePosition = strip_tags($_POST['workplacePosition']);
		$schoolNumber = intval($_POST['schoolNumber']);
		$academicDegree = strip_tags($_POST['academicDegree']);
		$city = intval($_POST['ciudad']);
		$errors = [];
		if ($name == '') {
			$errors['name'] = "Por favor, no se olvide de poner el nombre.";
		}
		if ($firstSurname == '') {
			$errors['firstSurname'] = "Por favor, no se olvide de poner el apellido parterno.";
		}
		if ($secondSurname == '') {
			$errors['secondSurname'] = "Por favor, no se olvide de poner el apellido materno.";
		}
		if ($password == '') {
			$errors['password'] = "Por favor, no se olvide de poner la contraseña.";
		}
		if ($email == '') {
			$errors['email'] = "Por favor, no se olvide de poner el correo electrónico.";
		}
		if ($phone == '') {
			$errors['phone'] = "Por favor, no se olvide de el número de celular.";
		}
		if ($workplacePosition == '') {
			$errors['workplacePosition'] = "Por favor, no se olvide de poner el puesto.";
		}
		if ($schoolNumber == '') {
			$errors['schoolNumber'] = "Por favor, no se olvide de poner el puesto.";
		}
		if (empty($city)) {
			$errors['ciudad'] = "Por favor, no se olvide de seleccionar la ciudad.";
		}

		if (!empty($errors)) {
			header('HTTP/1.1 422 Unprocessable Entity');
			header('Content-Type: application/json; charset=UTF-8');
			echo json_encode([
				'errors'    => $errors
			]);
			exit;
		}
		$student->setName($name);
		$student->setLastNamePaterno($firstSurname);
		$student->setLastNameMaterno($secondSurname);
		$student->setEmail($email);
		$student->setPhone($phone);
		$student->setPassword($password);
		$student->setWorkplacePosition($workplacePosition);
		$student->setCiudadT($city);
		$student->setAcademicDegree($academicDegree);
		$student->setSchoolNumber($schoolNumber);
		$student->setControlNumber();
		$student->setCourseId(0);
		$student->setSubjectId(0);
		$response = $student->saveCOBACH();
		if ($response > 0) {
			echo json_encode([
				'errorOld'	=> "ok[#]" . $smarty->fetch(DOC_ROOT . '/templates/boxes/status.tpl'),
				// 'location'	=> WEB_ROOT . '/login',
			]);
		}
		break;
	case "registro-inai":
		$name = strip_tags($_POST['names']);
		$firstSurname = strip_tags($_POST['lastNamePaterno']);
		$secondSurname = strip_tags($_POST['lastNameMaterno']);
		$genre = strip_tags($_POST['sexo']);
		$curp = $_POST['curp'];
		$password = $_POST['password'];
		$email = $_POST['email'];
		$phone = $_POST['mobile'];
		$workplace = "INAI";
		$workplaceOcupation = "FUNCIONARIO PÚBLICO FEDERAL";
		$funcion = intval($_POST['funcion']);
		$estado = 9;
		$curso = 169;
		$errors = [];
		if ($name == '') {
			$errors['names'] = "Por favor, no se olvide de poner el nombre.";
		}
		if ($firstSurname == '') {
			$errors['lastNamePaterno'] = "Por favor, no se olvide de poner el apellido parterno.";
		}
		if ($secondSurname == '') {
			$errors['lastNameMaterno'] = "Por favor, no se olvide de poner el apellido materno.";
		}
		if ($password == '') {
			$errors['password'] = "Por favor, no se olvide de poner la contraseña.";
		}
		if ($email == '') {
			$errors['email'] = "Por favor, no se olvide de poner el correo electrónico.";
		}
		if ($phone == '') {
			$errors['mobile'] = "Por favor, no se olvide de el número de celular.";
		}
		if (empty($curp)) {
			$errors['curp'] = "Por favor, no se olvide de poner la curp.";
		}
		$nombreAlumno = $util->eliminar_acentos(str_replace(' ', '_', trim($name . "_" . $firstSurname . "_" . $secondSurname)));
		$nombreAlumno = strtolower($nombreAlumno);
		$response = $util->Util()->validarSubidaPorArchivo([
			"curparchivo" => [
				'types' 	=> ['application/pdf'],
				'size' 		=> 5242880,
				'required'	=> true
			]
		]);
		foreach ($response as $key => $value) {
			if (!$value['status']) {
				$errors[$key] = $value['mensaje'];
			}
		}

		if (!empty($errors)) {
			header('HTTP/1.1 422 Unprocessable Entity');
			header('Content-Type: application/json; charset=UTF-8');
			echo json_encode([
				'errors'    => $errors
			]);
			exit;
		}

		$alumnoActual = $student->GetInfo("AND email = '$email'");
		print_r($infoAlumno);
		if ($alumnoActual['userId']) { //Ya existe un alumno con este correo, hay que actualizarlo. 
			$existeEnCurso = $student->getCourses("AND user_subject.courseId = 169 AND user_subject.alumnoId = " . $alumnoActual['userId']);
			if (count($existeEnCurso) > 0) { //Verificamos que no exista en el curso actual
				echo json_encode([
					'growl'		=> true,
					'type'		=> 'danger',
					'message'	=> 'Este correo ya se encuentra registrado en este curso. Contacte con el administrador.',
				]);
			} else { //Si no existe lo agregamos al curso y actualizamos sus datos 
				$student->setNames($name);
				$student->setLastNamePaterno($firstSurname);
				$student->setLastNameMaterno($secondSurname);
				$student->setEmail($email);
				$student->setPhone($phone);
				$student->setCurp($curp);
				$student->setWorkplace($workplace);
				$student->setWorkplaceOcupation($workplaceOcupation);
				$student->setEstadoT($estado);
				$student->setFuncion($funcion);
				$carpetaId = "1W8OjOFcfVruqCuvaerLArhe9GOvQq82a";
				$google = new Google($carpetaId);
				$ruta = DOC_ROOT . "/tmp/";
				$extension = pathinfo($_FILES['curparchivo']['name'], PATHINFO_EXTENSION);
				$temporal =  $_FILES['curparchivo']['tmp_name'];
				$nombre = $key . "_" . $nombreAlumno;
				$documento =  $nombre . "." . $extension;
				move_uploaded_file($temporal, $ruta . $documento);
				$google->setArchivoNombre($documento);
				$google->setArchivo($ruta . $documento);
				$respuesta = $google->subirArchivo();
				$json = '{ 
					"googleId": "' . $respuesta['id'] . '"
				}';
				unlink($ruta . $documento);
				$student->setCurpDrive("{$json}");
				$student->setAcademicDegree($_POST['academicDegree']);
				$student->setUserId($alumnoActual['userId']);
				$student->setCourseId(169);
				$student->updateStudent();
				$student->addUserCourse();
				$dataCourse = $student->getCourses("AND user_subject.courseId = 169 AND user_subject.alumnoId = " . $alumnoActual['userId']);
				$student->setSubjectId($dataCourse[0]['subjectId']);
				$student->AddAcademicHistory('alta', 'A', 1);
				$details_body = array(
					'major'		=> $dataCourse[0]['major_name'],
					'course'	=> $dataCourse[0]['subject_name'],
					'email'	=> $alumnoActual['controlNumber'],
					'password'	=> $alumnoActual['password'],
				);
				$details_subject = array();
				$sendmail->Prepare($message[1]["subject"], $message[1]["body"], $details_body, $details_subject, $email, $name . " " . $firstSurname . " " . $secondSurname);
				echo json_encode([
					'growl'		=> true,
					'type'		=> 'success',
					'message'	=> 'Se ha completado el registro, se ha enviado un correo con el usuario y contraseña para acceder a la plataforma.',
					// 'location'	=> WEB_ROOT . "/login",
					// 'duracion'	=> 5000
				]);
			}
		} else {
			$student->setControlNumber();
			$student->setName($name);
			$student->setLastNamePaterno($firstSurname);
			$student->setLastNameMaterno($secondSurname);
			$student->setPassword($password);
			$student->setEmail($email);
			$student->setPhone($phone);
			$student->setCurp($curp);
			$student->setWorkplace($workplace);
			$student->setWorkplaceOcupation($workplaceOcupation);
			$student->setEstadoT($estado);
			$student->setFuncion($funcion);

			$carpetaId = "1W8OjOFcfVruqCuvaerLArhe9GOvQq82a";
			$google = new Google($carpetaId);
			$ruta = DOC_ROOT . "/tmp/";
			$extension = pathinfo($_FILES['curparchivo']['name'], PATHINFO_EXTENSION);
			$temporal =  $_FILES['curparchivo']['tmp_name'];
			$nombre = $key . "_" . $nombreAlumno;
			$documento =  $nombre . "." . $extension;
			move_uploaded_file($temporal, $ruta . $documento);
			$google->setArchivoNombre($documento);
			$google->setArchivo($ruta . $documento);
			$respuesta = $google->subirArchivo();
			$json = '{ 
					"googleId": "' . $respuesta['id'] . '"
				}';
			unlink($ruta . $documento);
			$student->setCurpDrive("'{$json}'");
			$student->setAcademicDegree($_POST['academicDegree']);
			$response = $student->saveInai();
			if ($response['status']) {
				$student->setUserId($response['status']);
				$student->setCourseId(169);
				$student->addUserCourse();
				$dataCourse = $student->getCourses("AND user_subject.courseId = 169 AND user_subject.alumnoId = " . $response['status']);
				$student->setSubjectId($dataCourse[0]['subjectId']);
				$student->AddAcademicHistory('alta', 'A', 1);
				$details_body = array(
					'major'		=> $dataCourse[0]['major_name'],
					'course'	=> $dataCourse[0]['subject_name'],
					'email'		=> $response['usuario'],
					'password'	=> $password,
				);
				$details_subject = array();
				$sendmail->Prepare($message[1]["subject"], $message[1]["body"], $details_body, $details_subject, $email, $name . " " . $firstSurname . " " . $secondSurname);

				echo json_encode([
					'growl'		=> true,
					'type'		=> 'success',
					'message'	=> 'Se ha completado el registro, se ha enviado un correo con el usuario y contraseña para acceder a la plataforma.',
					// 'location'	=> WEB_ROOT . "/login",
					// 'duracion'	=> 5000
				]);
			} else {
				echo json_encode([
					'growl'		=> true,
					'type'		=> 'danger',
					'message'	=> $response['message'],
				]);
			}
		}

		break;
}
