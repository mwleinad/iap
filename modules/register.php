<?php
$student->setCountry(1);
$estados = $student->EnumerateEstados();

$where = "AND major.majorId IN(1, 18, 34) AND subject.listarRegistro = 1 ORDER BY major.majorId, subject.name";
$subjects = $subject->getSubjects($where);

$smarty->assign('curriculas', $subjects);
$smarty->assign('estados', $estados);