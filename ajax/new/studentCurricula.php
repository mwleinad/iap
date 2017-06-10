<?php

include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();

switch($_POST["type"])
{
    case "Student":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroup();
        $smarty->assign("courseId",$_POST['id']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-student.tpl');

        break;

    case "StudentAdmin":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroup();
        $smarty->assign("courseId",$_POST['id']);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-studentadmin.tpl');

        break;

    case "calificaciones":

        $module->setCourseModuleId($_POST['id']);
        $infoModule=$module->InfoCourseModule();
        $courseId=$infoModule['courseId'];
        //	print_r($infoModule);
        $activity->setCourseModuleId($_POST['id']);
        $activityInfoTask=$activity->Enumerate("Tarea");
        $userId=$_SESSION['User']['userId'];

        $activity->setUserId($userId);
        //$ponderation=$activity->Score();

        foreach($activityInfoTask as $key => $fila){
            $activity->setCourseModuleId($_POST['id']);
            $activity->setActivityId($fila['activityId']);
            $activityInfoTask[$key]['calificacion']=$activity->Score();
            $activityInfoTask[$key]['retroTotal']=$activity->Retro();

        }
        //print_r($activityInfoTask);exit;

        //print_r($fila['activityId']);

        //print_r($infoModule);
        //$students=$group->DefaultGroup();
        //print_r($_POST);
        //$smarty->assign("DOC_ROOT", DOC_ROOT);
        $tipo=1;
        $smarty->assign("tipo", $tipo);
        $smarty->assign("tareas", $activityInfoTask);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-ponderation-student.tpl');

        break;

    case "calificacionesExa":
        $tipo=2;
        $module->setCourseModuleId($_POST['id']);
        $infoModule=$module->InfoCourseModule();
        $courseId=$infoModule['courseId'];
        //	print_r($infoModule);
        $activity->setCourseModuleId($_POST['id']);
        $activityInfoTask=$activity->Enumerate("Examen");
        $userId=$_SESSION['User']['userId'];

        $activity->setUserId($userId);
        //$ponderation=$activity->Score();

        foreach($activityInfoTask as $key => $fila){
            $activity->setCourseModuleId($_POST['id']);
            $activity->setActivityId($fila['activityId']);
            $activityInfoTask[$key]['calificacion']=$activity->Score();
            $activityInfoTask[$key]['retroTotal']=$activity->Retro();

        }
        //print_r($activityInfoTask);exit;

        //print_r($fila['activityId']);

        //print_r($infoModule);
        //$students=$group->DefaultGroup();
        //print_r($_POST);
        //$smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("tipo", $tipo);
        $smarty->assign("tareas", $activityInfoTask);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-ponderation-student.tpl');

        break;

    case "deleteStudentCurricula":

        $student->setUserId($_POST['userId']);
        $student->setCourseId($_POST['courseId']);

        if(!$student->DeleteStudentCurricula())
        {
            echo "fail[#]";
            //$util->setError(10028, "error","Ocurrio un error al eliminar a este alumno");
            //$util->PrintErrors();
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');

        }else{
            echo "ok[#]";
            $util->setError(10028, "complete","Alumno eliminado con exito de esta curricula");
            $util->PrintErrors();
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');

        }



    case "StudentInactivo":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroupInactivo();

        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-student.tpl');

        break;

    case "StudentInactivoAdmin":

        $group->setCourseId($_POST['id']);
        $students=$group->DefaultGroupInactivo();

        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->assign("students", $students);
        $smarty->display(DOC_ROOT.'/templates/boxes/view-studentadmin.tpl');

        break;



}

?>
