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
}
