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
		if (empty($ciudad)) {
			$errors['ciudadt'] = "Por favor, no se olvide de seleccionar la ciudad.";
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
			"foto"	=>[
				'types' =>['image/jpeg', 'image/png'],
				'size' => 5242880
			]
		]); 
		foreach ($response as $key => $value) {
			if(!$value['status']){
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
		$student->setCiudadT($ciudad);
		$student->setCurp($curp);
		$student->setFuncion($funcion);

		$carpetaId = "1dIsKbt6QM4Y7I56Lgfv8NDyjFlreTD0T";
		$google = new Google($carpetaId);
		foreach ($_FILES as $key => $archivo) {
			$ruta = DOC_ROOT . "/files/";
			$aux = explode(".", $archivo["name"]);
			$extension = end($aux);
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
				"urlEmbed": "https://drive.google.com/uc?id=' . $respuesta['id'] . '"
			}';
			unlink($ruta . $documento);
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

	default:
		# code...
		break;
}
