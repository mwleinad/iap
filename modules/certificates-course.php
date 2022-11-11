<?php
	$user->allow_access(37);
	
	$group->setCourseId($_GET['id']);
    $students = $group->DefaultGroup();
    foreach ($students as $key => $value) {
        $dataExtra = $certificates->getHistoryCertificateStudent($_GET['id'], $value['userId']);
        if ($dataExtra) { 
            $students[$key]['folio'] = $dataExtra['folio'];
        }else{
            $students[$key]['folio'] = "";
        }
    }
    $smarty->assign('students', $students);
    $course->setCourseId($_GET['id']);
    $info = $course->Info();
    $smarty->assign('info', $info);
    //var_dump($info); exit;
?>