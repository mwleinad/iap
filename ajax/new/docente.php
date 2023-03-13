<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();
$opcion = $_POST['opcion'];
$User = $_SESSION['User'];
switch ($opcion) {
    case 'crear-inbox': //Retorna la vista para la creación del inbox al alumno

        $gradosAcademicos = $course->EnumerateSubjectByPage(); 
        $user->setUserId($User['userId']);
        $permisosDocente = $user->PermisosDocente(); 
        foreach($gradosAcademicos as $key => $value)
        {
            if(!in_array($value["subjectId"], $permisosDocente["subject"]))
            {
                unset($gradosAcademicos[$key]);
            }
        }

        // print_r($permisosDocente);
        $gruposYmodulos = [];
        foreach ($permisosDocente['courseModule'] as $key => $permiso) {  
            $module->setCourseModuleId($permiso);
            $info = $module->InfoCourseModule(); 
            $gruposYmodulos[$permisosDocente['subject'][$key]][$info['groupA']][] = [
                'modulo'    =>$permiso,
                'nombre'    =>$info['name']
            ]; 
        }
        // print_r($gruposYmodulos);
        $smarty->assign("gradosAcademicos", $gradosAcademicos); 
        $smarty->assign("grupos", $gruposYmodulos); 
        $smarty->assign("vista", "grupos");
        echo json_encode([
            'html'      => $smarty->fetch(DOC_ROOT."/templates/new/inbox-docente.tpl"),
            'selector'  => '#contentInbox'
        ]);
    break;
    case 'inboxAlumnos':
        $lstGrupo = $group->getGrupo($_POST['modulo']);
        $module->setCourseModuleId($_POST['modulo']);
        $info = $module->InfoCourseModule();
        $periodoActual = $info["semesId"];  
        foreach ($lstGrupo as $key => $value) {
            $student->setUserId($value['userId']);
            $periodo = $student->periodoAltaCurso($info['courseId']);
            if($periodoActual < $periodo){
                if($value['situation'] != "Recursador"){
                    unset($lstGrupo[$key]);
                }
            } 
        }
        // print_r($lstGrupo);
	    $smarty->assign("alumnos", $lstGrupo);
        $smarty->assign("vista", "alumnos");
        echo json_encode([
            'html'      => $smarty->fetch(DOC_ROOT."/templates/new/inbox-docente.tpl"),
            'selector'  => '#contentInbox'
        ]);
    break;
}
