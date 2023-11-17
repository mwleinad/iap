<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');

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
				'types' => ['application/pdf'],
				'size' => 5242880
			],
			"foto"	=> [
				'types' => ['image/jpeg', 'image/png'],
				'size' => 5242880
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
			if ($respuesta['mimeType'] != "application/json") {
				unlink($ruta . $documento);
			}
		}
		$student->setCurpDrive($files['curparchivo']);
		$student->setFoto($files['foto']);
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

	case 'actualizacion':
		$permiso = $_POST['permiso'];
		$alumno = $_POST['id'];


		$nombre = strip_tags(trim($_POST['names']));
		$apellidoPaterno = strip_tags($_POST['lastNamePaterno']);
		$apellidoMaterno = strip_tags($_POST['lastNameMaterno']);
		$sexo = strip_tags($_POST['sexo']);
		$contrasena = strip_tags(trim($_POST['password']));
		$correo = strip_tags($_POST['email']);
		$movil = strip_tags($_POST['mobile']);
		$trabajoLugar = strip_tags($_POST['workplace']);
		$trabajoOcupacion = strip_tags($_POST['workplaceOcupation']);
		$trabajoPuesto = strip_tags($_POST['workplacePosition']);
		$trabajoPais = intval($_POST['paist']);
		$trabajoEstado = intval($_POST['estadot']);
		$gradoAcademico = strip_tags($_POST['academicDegree']); 
		$fechaNacimiento = date('Y-m-d', strtotime(strip_tags($_POST['birthday'])));
		$estadoCivil = strip_tags($_POST['maritalStatus']);
		$calle = strip_tags($_POST['street']);
		$numero = strip_tags($_POST['number']);
		$colonia = strip_tags($_POST['colony']);
		$ciudad = strip_tags($_POST['ciudad']);
		$estado = strip_tags($_POST['estado']);
		$pais = strip_tags($_POST['pais']);
		$codigoPostal = strip_tags($_POST['postalCode']);
		$telefono = strip_tags($_POST['phone']);
		$trabajoDireccion = strip_tags($_POST['workplaceAddress']);
		$trabajoArea = strip_tags($_POST['workplaceArea']);
		$trabajoCiudad = intval($_POST['ciudadt']);
		$trabajoTelefono = strip_tags($_POST['workplacePhone']);
		$trabajoCorreo = strip_tags($_POST['workplaceEmail']);
		$profesion = intval($_POST['profesion']);
		$escuela = strip_tags($_POST['school']);
		$maestria = strip_tags($_POST['masters']);
		$escuelaMaestria = strip_tags($_POST['mastersSchool']);
		$bachillerato = strip_tags($_POST['highSchool']); 

		$errors = [];
		if ($nombre == '') {
			$errors['names'] = "Por favor, no se olvide de poner el nombre.";
		}
		if ($apellidoPaterno == '') {
			$errors['lastNamePaterno'] = "Por favor, no se olvide de poner el apellido parterno.";
		}
		if ($apellidoMaterno == '') {
			$errors['lastNameMaterno'] = "Por favor, no se olvide de poner el apellido materno.";
		}
		if ($contrasena == '') {
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

		if (!empty($errors)) {
			header('HTTP/1.1 422 Unprocessable Entity');
			header('Content-Type: application/json; charset=UTF-8');
			echo json_encode([
				'errors'    => $errors
			]);
			exit;
		}

		$student->setPermiso($permiso);
		$student->setUserId($alumno);
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

		 
		$diplomados = $student->alumnoConDiplomado($_POST['id']);
		if (!$student->UpdateAlumn()) {
			echo "fail[#]";

			$smarty->assign("auxMsj", $_POST["auxMsj"]);
			$smarty->display(DOC_ROOT . '/templates/boxes/status_on_popup.tpl');
		} else {
			echo "ok[#]";
			echo '<div class="alert alert-success">
					<button class="close" data-dismiss="alert"></button>
							El Alumno fue editado correctamente
					</div>';
		}
		break;
}
