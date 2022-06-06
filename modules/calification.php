<?php
$user->allow_access(37);



if($_POST)
{
    $module->setCourseModuleId($_GET["id"]);
    $module->setInitialDate($_POST["initialDate"]);
    $module->setFinalDate($_POST["finalDate"]);
    $module->setDaysToFinish($_POST["daysToFinish"]);
    $module->setPersonalId($_POST["personalId"]);
    $module->setTeacherId($_POST["teacherId"]);
    $module->setTutorId($_POST["tutorId"]);
    $module->setExtraId($_POST["extraId"]);
    $module->setActive($_POST["active"]);
    $module->EditModuleToCourse();
}

$module->setCourseModuleId($_GET["id"]);
$moduleInfo = $module->InfoCourseModule();
$isEnglish = false;
$minCal = 70;
if($moduleInfo['majorId'] == 18)
    $minCal = 80;
if(substr($moduleInfo['claveMateria'], 0, 3) == 'ING')
{
    $isEnglish = true;
}
$activity->setCourseModuleId($_GET["id"]);
$actividades = $activity->Enumerate();
$smarty->assign('actividades', $actividades);

$totalActividades = 0;
foreach($actividades as $value)
{
    if($value["score"] > 0)
    {
        $totalActividades++;
    }
}

// echo $totalActividades;
// exit;
$smarty->assign('totalActividades', $totalActividades);


$totalPonderation = $activity->TotalPonderation();
$smarty->assign('totalPonderation', $totalPonderation);

$majorModality = $activity->GetMajorModality();

$module->setCourseModuleId($_GET["id"]);
$info = $module->InfoCourseModule();

$group->setCourseModuleId($_GET["id"]);
$group->setCourseId($info["courseId"]);
$theGroup = $group->DefaultGroup();

$smarty->assign('theGroup', $theGroup);
$smarty->assign('moduleInfo', $moduleInfo);
$smarty->assign('minCal', $minCal);
$smarty->assign('isEnglish', $isEnglish);
?>