<?php
	$user->allow_access(37);
	$group->setCourseId($_GET['id']);
    $total = $group->CertificateIndicator(1);
    $smarty->assign('total_certificates', $total);
    $smarty->assign('courseId', $_GET['id']);
?>