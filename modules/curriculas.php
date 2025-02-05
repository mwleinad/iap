<?php
$major = ""; 
$modality = "";
if ($_POST) {
    $major = $_POST['curricula'] ? $_POST['curricula'] : $major;
    $modality = $_POST['modalidad'] ? $_POST['modalidad'] : $modality;
    if (isset($_GET['id'])) {
        $response = $course->dt_courses_request($_GET['id'], $modality);
        print_r(json_encode($response));
        exit;
    }
}

$smarty->assign("curricula", $major);
$smarty->assign("modalidad", $modality);

if ($User['perfil'] == "Docente") {
    $subjects = $subject->getSubjectsCourse(" AND course_module.access LIKE '%|{$User['userId']}|%' GROUP BY subject.subjectId");
} else {
    if ($User['userId'] != 253) { //Para usuarios que no son RED CONOCER
        $where = "AND major.majorId IN(1, 18, 34, 35)";
        if ($major != "") {
            $where = "AND major.majorId = $major";
        }
        $subjects = $subject->getSubjects($where);
        $major = $subject->getSubjects("AND major.majorId IN(1, 18, 34, 35) GROUP BY major.majorId");
    } else {
        $where = "AND major.majorId IN(3, 5)";
        if ($major != "") {
            $where = "AND major.majorId = $major";
        }
        $subjects = $subject->getSubjects($where);
        $major = $subject->getSubjects("AND major.majorId IN(3, 5) GROUP BY major.majorId");
    }
}

$smarty->assign("subjects", $subjects);
$smarty->assign("major", $major);
$smarty->assign('perfil', $_SESSION['User']['perfil']);
