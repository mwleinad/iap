<?php

$student->setUserId($_SESSION['User']["userId"]);
$info = $student->GetInfo();
$smarty->assign("rand", rand());
$smarty->assign("dataStudent", $info);
$smarty->assign("mJodit", "active");

$prof = $profesion->Enumerate();
$prof = $util->EncodeResult($prof);
$smarty->assign('prof', $prof);
