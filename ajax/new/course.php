<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();

$opcion = $_POST['option'];
switch ($opcion) {
    case 'savePeriods':
        $curso = $_POST['course'];
        $util->DB()->setQuery("DELETE FROM course_periods WHERE courseId = {$curso}");
        $util->DB()->DeleteData();
        foreach ($_POST['periodBegin'] as $periodo => $value) {
            $periodoReal = $periodo + 1;
            $course->savePeriod($curso, $periodoReal, $value, $_POST['periodEnd'][$periodo]);
        }
        break;
    case 'dt_diplomas':
        $response = $course->dt_diplomas($_POST);
        print_r(json_encode($response));
        exit;
        break;
    case 'addDiploma':
        $curso = $_POST['curso'];
        $alumno = $_POST['alumno'];
        $token = bin2hex(random_bytes(16));
        $course->setCourseId($curso);
        $course->setUserId($alumno);
        $course->setToken($token);
        if (!$course->getDiploma()) {
            $course->addDiploma();
            echo json_encode([
                'growl'     => true,
                'message'   => 'Diploma generada',
                'dtreload'  => "#datatable"
            ]);
        }
        break;
    case 'deleteDiploma':
        $curso = $_POST['curso'];
        $alumno = $_POST['alumno'];
        $course->setCourseId($curso);
        $course->setUserId($alumno);
        $course->deleteDiploma();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Diploma eliminada',
            'dtreload'  => "#datatable"
        ]);
        break;
    case 'dt_cotejo_conocer':
        $response = $course->dt_cotejo($_POST);
        print_r(json_encode($response));
        exit;
        break;
    case 'changePayment':
        $alumno = $_POST['estudiante'];
        $curso = $_POST['curso'];
        $estatus = $_POST['estatus'];
        $student->setUserId($alumno);
        $student->setCourseId($curso);
        $student->setStatusPayment($estatus);
        $student->updateUserCourse();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Información actualizada',
            'dtreload'  => "#datatable"
        ]);
        break;
    case 'changeEvaluation':
        $alumno = $_POST['estudiante'];
        $curso = $_POST['curso'];
        $estatus = $_POST['estatus'];
        $student->setUserId($alumno);
        $student->setCourseId($curso);
        $student->setStatusEvaluation($estatus);
        $student->updateUserCourse();
        echo json_encode([
            'growl'     => true,
            'message'   => 'Información actualizada',
            'dtreload'  => "#datatable"
        ]);
        break;
    case 'dt_constancias_conocer':
        $response = $course->dt_constancias_conocer($_POST);
        print_r(json_encode($response));
        break;
    case 'add_diploma':
        $cursos = $course->getCourses("AND major.majorId IN(3,5)");
        $smarty->assign("cursos", $cursos);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/forms/new/diplomas-multiples.tpl"),
        ]);
        break;
    case 'newDiplomaMultiple':
        $nombreDiploma = strip_tags($_POST['nombre']);
        if (empty($nombreDiploma)) {
            $errors['nombre'] = 'Error, falta completar el campo nombre';
        }
        $response = $util->Util()->validarSubidaPorArchivo([
            "imagen_portada" => [
                'types'     => ['image/jpeg', 'image/png'],
                'size'         => 5242880,
                'required'    => true
            ],
            "imagen_contraportada"    => [
                'types'     => ['image/jpeg', 'image/png'],
                'size'         => 5242880,
                'required'    => true
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

        $carpetaId = GOOGLE_DRIVE_FOLDER_DIPLOMA;
        $google = new Google($carpetaId);
        $ruta = DOC_ROOT . "/tmp/";

        $nombreParseado = $util->eliminar_acentos(str_replace(' ', '_', trim($nombreDiploma)));

        $extension = pathinfo($_FILES['imagen_portada']['name'], PATHINFO_EXTENSION);
        $temporal =  $_FILES['imagen_portada']['tmp_name'];
        $nombre = $nombreParseado . "_portada";
        $documento =  $nombre . "." . $extension;
        move_uploaded_file($temporal, $ruta . $documento);
        $google->setArchivoNombre($documento);
        $google->setArchivo($ruta . $documento);
        $respuesta = $google->subirArchivo();
        $googleIdPortada = $respuesta['id'];
        unlink($ruta . $documento);

        $extension = pathinfo($_FILES['imagen_contraportada']['name'], PATHINFO_EXTENSION);
        $temporal =  $_FILES['imagen_contraportada']['tmp_name'];
        $nombre = $nombreParseado . "_contraportada";
        $documento =  $nombre . "." . $extension;
        move_uploaded_file($temporal, $ruta . $documento);
        $google->setArchivoNombre($documento);
        $google->setArchivo($ruta . $documento);
        $respuesta = $google->subirArchivo();
        $googleIdContraPortada = $respuesta['id'];
        unlink($ruta . $documento);

        $diplomaId = $course->addDiplomaMultiple($nombreDiploma, $googleIdPortada, $googleIdContraPortada);
        foreach ($_POST['curso'] as $curso) {
            $course->addDiplomaCurso($diplomaId, $curso);
        }
        echo json_encode([
            'growl'        => true,
            'message'      => 'Diploma/Certificado guardado con éxito',
            'modal_close'  => true,
            'dtreload'     => '#datatable'
        ]);
        break;
    case 'addStudentDiploma':
        $diploma = $_POST['diploma'];
        $smarty->assign("diploma", $diploma);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/boxes/new/alumnos_diplomas.tpl"),
        ]);
        break;
    case 'dt_alumnos_diplomas':
        $response = $course->dt_alumnos_diplomas($_POST);
        print_r(json_encode($response));
        break;
    case 'generateDiploma':
        $diploma = $_POST['diploma'];
        $alumno = $_POST['student'];
        $token = bin2hex(random_bytes(16));
        $course->generateDiploma($diploma, $alumno, $token);
        echo json_encode([
            'growl'     => true,
            'message'   => 'Se ha generado el documento',
            'dtreload'  => '#datatable_alumnos'
        ]);
        break;
    case 'deleteDiplomaMultiple':
        $diploma = $_POST['diploma'];
        $alumno = $_POST['student'];
        $course->deleteDiplomaMultiple($diploma, $alumno);
        echo json_encode([
            'growl'     => true,
            'message'   => 'Se ha eliminado el documento',
            'dtreload'  => '#datatable_alumnos'
        ]);
        break;
}
