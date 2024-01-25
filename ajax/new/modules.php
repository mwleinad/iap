<?php

include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
include_once(DOC_ROOT . "/properties/messages.php");
session_start();
$user = $_SESSION['User']['userId'];
switch ($_POST["option"]) {
	case 'sendLetter':
		$response = $group->onSendCarta($_POST["id"]);
		$personal->setPersonalId(250);
		$encargado = $personal->Info();

		$personal->setPersonalId($user);
		$docenteInfo = $personal->Info();

		if ($response['estatus']) {
			$hecho = $docenteInfo['personalId'] . "p";
			$vista = "1p," . $encargado['personalId'] . "p";
			$actividad = "El docente {$docenteInfo['name']} {$docenteInfo['lastname_materno']} {$docenteInfo['lastname_paterno']} ha actualizado la Carta Descriptiva";
			$notificacion->setActividad($actividad);
			$notificacion->setVista($vista);
			$notificacion->setHecho($hecho);
			$notificacion->setTablas("reply");
			$notificacion->setEnlace("/docentes/carta/{$response['documento']}");
			$notificacion->saveNotificacion();

			$details_body = array(
				'docente'   => $docenteInfo['name'] . $docenteInfo['lastname_materno'] . $docenteInfo['lastname_paterno'],
				'documento'	=> 'Carta Descriptiva'
			);

			$details_subject = array();
			$sendmail->Prepare($message[10]["subject"], $message[10]["body"], $details_body, $details_subject, $encargado['correo'], $encargado['name'] . " " . $encargado['lastname_paterno'] . " " . $encargado['lastname_materno'], DOC_ROOT . "/docentes/carta/{$response['documento']}", $response['documento']);

			echo json_encode([
				'growl'		=> true,
				'message'	=> 'Carta Descriptiva enviada.',
				'type'		=> 'success',
				'reload'	=> true
			]);
		} else {
			echo json_encode([
				'growl'     => true,
				'message'    => $response['mensaje'],
				'type'        => 'danger'
			]);
		}
	break;
	case 'deleteLetter':
		$response = $personal->onDeleteCarta($_POST["id"]);
		if ($response['estatus']) {
			echo json_encode([
				'growl'		=> true,
				'message'	=> 'Carta Descriptiva eliminada.',
				'type'		=> 'success',
				'reload'	=> true
			]);
		}
	break;
	case 'sendFraming':
		$response = $group->onSendEncuadre($_POST["id"]);
		$personal->setPersonalId(250);
		$encargado = $personal->Info();

		$personal->setPersonalId($user);
		$docenteInfo = $personal->Info();

		if ($response['estatus']) {
			$hecho = $docenteInfo['personalId'] . "p";
			$vista = "1p," . $encargado['personalId'] . "p";
			$actividad = "El docente {$docenteInfo['name']} {$docenteInfo['lastname_materno']} {$docenteInfo['lastname_paterno']} ha actualizado el Encuadre";
			$notificacion->setActividad($actividad);
			$notificacion->setVista($vista);
			$notificacion->setHecho($hecho);
			$notificacion->setTablas("reply");
			$notificacion->setEnlace("/docentes/encuadre/{$response['documento']}");
			$notificacion->saveNotificacion();

			$details_body = array(
				'docente'   => $docenteInfo['name'] . $docenteInfo['lastname_materno'] . $docenteInfo['lastname_paterno'],
				'documento'	=> 'Encuadre'
			);

			$details_subject = array();
			$sendmail->Prepare($message[10]["subject"], $message[10]["body"], $details_body, $details_subject, $encargado['correo'], $encargado['name'] . " " . $encargado['lastname_paterno'] . " " . $encargado['lastname_materno'], DOC_ROOT . "/docentes/encuadre/{$response['documento']}", $response['documento']);

			echo json_encode([
				'growl'		=> true,
				'message'	=> 'Encuadre enviado.',
				'type'		=> 'success',
				'reload'	=> true
			]);
		} else {
			echo json_encode([
				'growl'     => true,
				'message'    => $response['mensaje'],
				'type'        => 'danger'
			]);
		}
	break;
	case 'deleteFraming':
		$response = $personal->onDeleteEncuadre($_POST["id"]);
		if ($response['estatus']) {
			echo json_encode([
				'growl'		=> true,
				'message'	=> 'Encuadre eliminado.',
				'type'		=> 'success',
				'reload'	=> true
			]);
		}
	break;
	case 'sendReport':
		$response = $group->onSendInforme($_POST["id"]);
		$personal->setPersonalId(250);
		$encargado = $personal->Info();

		$personal->setPersonalId($user);
		$docenteInfo = $personal->Info();

		if ($response['estatus']) {
			$hecho = $docenteInfo['personalId'] . "p";
			$vista = "1p," . $encargado['personalId'] . "p";
			$actividad = "El docente {$docenteInfo['name']} {$docenteInfo['lastname_materno']} {$docenteInfo['lastname_paterno']} ha actualizado el Informe";
			$notificacion->setActividad($actividad);
			$notificacion->setVista($vista);
			$notificacion->setHecho($hecho);
			$notificacion->setTablas("reply");
			$notificacion->setEnlace("/docentes/informe/{$response['documento']}");
			$notificacion->saveNotificacion();

			$details_body = array(
				'docente'   => $docenteInfo['name'] . $docenteInfo['lastname_materno'] . $docenteInfo['lastname_paterno'],
				'documento'	=> 'Informe'
			);

			$details_subject = array();
			$sendmail->Prepare($message[10]["subject"], $message[10]["body"], $details_body, $details_subject, $encargado['correo'], $encargado['name'] . " " . $encargado['lastname_paterno'] . " " . $encargado['lastname_materno'], DOC_ROOT . "/docentes/informe/{$response['documento']}", $response['documento']);

			echo json_encode([
				'growl'		=> true,
				'message'	=> 'Informe enviado.',
				'type'		=> 'success',
				'reload'	=> true
			]);
		} else {
			echo json_encode([
				'growl'     => true,
				'message'    => $response['mensaje'],
				'type'        => 'danger'
			]);
		}
	break;
	case 'deleteFraming':
		$response = $personal->onDeleteEncuadre($_POST["id"]);
		if ($response['estatus']) {
			echo json_encode([
				'growl'		=> true,
				'message'	=> 'Encuadre eliminado.',
				'type'		=> 'success',
				'reload'	=> true
			]);
		}
	break;
}
