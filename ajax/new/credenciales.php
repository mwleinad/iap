<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
include_once(DOC_ROOT . "/properties/messages.php");
session_start();

$opcion = $_POST['opcion'];
switch ($opcion) {
    case 'validar':
        $credencial = $_POST['credencial'];
        $imagenCodificada = $_POST['foto'];
        $aceptado = boolval($_POST['aceptado']);
        $aceptado =  $aceptado ? 1 : 2;
        $credentials->setCredential($credencial);
        $credencial = $credentials->getCredential();
        if ($aceptado == 1) {
            $imagenCodificadaLimpia = str_replace("data:image/png;base64,", "", $imagenCodificada);
            $imagenDecodificada = base64_decode($imagenCodificadaLimpia);
            $token = bin2hex(random_bytes(8));
            $carpeta = "files/credentials";
            if (!file_exists(DOC_ROOT . "/" . $carpeta)) {
                mkdir(DOC_ROOT . "/" . $carpeta);
            }
            $nombreImagen = "credencial_$token.png";
            file_put_contents(DOC_ROOT . "/" . $carpeta . "/" . $nombreImagen, $imagenDecodificada);
            $carpetaId = "1tsqsqiwewa2BRadf8UvXnQpshXAPyWPX";
            $google = new Google($carpetaId);
            $google->setArchivoNombre($nombreImagen); 
            $google->setArchivo(DOC_ROOT."/".$carpeta."/".$nombreImagen);
            $respuesta = $google->subirArchivo();
            $files = '{
                "filename": "'.$respuesta['name'].'",
                "googleId": "'.$respuesta['id'].'",
                "mimeType": "'.$respuesta['mimeType'].'",
                "urlBlank": "https://drive.google.com/open?id='.$respuesta['id'].'",
                "urlEmbed": "https://drive.google.com/uc?id='.$respuesta['id'].'"
            }'; 
            unlink(DOC_ROOT."/".$carpeta."/".$nombreImagen);
            if (file_exists(DOC_ROOT . "/" . $carpeta."/".$credencial['files']['filename'])) {
                unlink(DOC_ROOT."/".$carpeta."/".$credencial['files']['filename']); 
            }
            $credentials->setFiles($files);
            $credentials->setStatus($aceptado);
            $credentials->updateCredential();

            $student->setUserId($credencial['user_id']);
            $alumno = $student->GetInfo(); 

            $hecho = $_SESSION['User']['userId'] . "p";
            $vista = "p," . $hecho . "," . $credencial['user_id'] . "u";
            $actividad = "Se ha aprobado la foto de tu credencial";
            $notificacion->setActividad($actividad);
            $notificacion->setVista($vista);
            $notificacion->setHecho($hecho);
            $notificacion->setTablas("reply");
            $notificacion->setEnlace("/mi-credencial-digital/id/{$credencial['course_id']}");
            $notificacion->saveNotificacion(); 

            $sendmail = new SendMail;
            $details_body = "";
            $details_subject = array();
            $sendmail->Prepare($message[8]["subject"], $message[8]["body"], $details_body, $details_subject, $alumno['email'], $alumno['names']." ".$alumno['lastNamePaterno']." ".$alumno['lastNameMaterno']);

            echo json_encode([
                'modal'         => true,
                'growl'         => true,
                'message'       => 'Credencial validada',
                'dtreload'      => '#datatable',
                'modal_close'   => true
            ]);
        } else {
            $smarty->assign("credencial", $credencial['id']);
            echo json_encode([
                'html'      => $smarty->fetch(DOC_ROOT . "/templates/items/new/motivo-rechazo.tpl"),
                'selector'  => '.modal-content'
            ]);
        }
        break;
    case 'previo':
        $credencial = $_POST['credencial'];
        $credentials->setCredential($credencial);
        $credencial = $credentials->getCredential();
        $student->setUserId($credencial['user_id']);
        $alumno = $student->GetInfo();
        $course->setCourseId($credencial['course_id']);
        $courseInfo = $course->Info();
        $courseInfo['name'] = preg_replace('/[0-9]+/', '', $courseInfo['name']);
        $curso = $courseInfo['majorName'] . " EN " . str_replace("EN", "", $courseInfo['name']);

        if ($credencial['status'] == 0) {
            $image = $credencial['files']['urlEmbed'];
            $nombreImagen = $credencial['files']['filename'];
            $carpeta = "files/credentials";
            if (!file_exists(DOC_ROOT . "/" . $carpeta."/".$nombreImagen)) {
                file_put_contents(DOC_ROOT . "/" . $carpeta . "/" . $nombreImagen, file_get_contents($image));
            } 
        }
        $smarty->assign("alumno", $alumno);
        $smarty->assign("curso", $curso);
        $smarty->assign("credencial", $credencial); 
        // print_r($alumno);
        echo json_encode([
            'modal'     => true,
            'html'      => $smarty->fetch(DOC_ROOT . "/templates/items/new/credencial.tpl"),
        ]);
        break;
    case 'rechazar':
        $credencial = $_POST['credencial'];
        $motivo = $_POST['rechazo'];
        $errors = [];
        if ($motivo == '') {
            $errors['rechazo'] = "Falta indicar el motivo del rechazo";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $credentials->setCredential($credencial);
        $credentials->setMotivo($motivo);
        $credentials->setStatus(2);
        $credencial = $credentials->getCredential();
        if (file_exists(DOC_ROOT . "/files/credentials/".$credencial['files']['filename'])) {
            unlink(DOC_ROOT."/files/credentials/".$credencial['files']['filename']); 
        }
        $credentials->setFiles(json_encode($credencial['files']));
        $carpetaId = "1tsqsqiwewa2BRadf8UvXnQpshXAPyWPX";
        $google = new Google($carpetaId);
        $google->setArchivoID($credencial['files']['googleId']);
        $respuesta = $google->eliminarArchivo();
        $credentials->updateCredential();


        $student->setUserId($credencial['user_id']);
        $alumno = $student->GetInfo(); 
        $hecho = $_SESSION['User']['userId'] . "p";
        $vista = "p," . $hecho . "," . $credencial['user_id'] . "u";
        $actividad = "Se ha rechazado la foto de tu credencial";
        $notificacion->setActividad($actividad);
        $notificacion->setVista($vista);
        $notificacion->setHecho($hecho);
        $notificacion->setTablas("reply");
        $notificacion->setEnlace("/mi-credencial-digital/id/{$credencial['course_id']}");
        $notificacion->saveNotificacion();

        $sendmail = new SendMail;
        $details_body = array(
            'motivos'   => $motivo
		);
        $details_subject = array();
        $sendmail->Prepare($message[9]["subject"], $message[9]["body"], $details_body, $details_subject, $alumno['email'], $alumno['names']." ".$alumno['lastNamePaterno']." ".$alumno['lastNameMaterno']);
        
        echo json_encode([
            'modal'         => true,
            'growl'         => true,
            'message'       => 'Credencial rechazada',
            'dtreload'      => '#datatable',
            'modal_close'   => true
        ]);
        break;
    case 'descarga':
        $credencial = $_POST['credencial'];
        $credentials->setCredential($credencial);
        $credentials->updateDownload();
        $urlPdf = WEB_ROOT."/pdf/credencial.php?credencial={$credencial}";
        echo json_encode([
            "selector"  => "#form_descarga",
            "html"      => " ",
            'blank'     => $urlPdf
        ]);
        break;
}
