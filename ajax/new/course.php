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
}
