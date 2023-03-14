<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');
session_start();
$opcion = $_POST['opcion'];
$User = $_SESSION['User'];
switch ($opcion) {
    case 'inboxGrupos': //Retorna la vista para la creación del inbox al alumno

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
                'nombre'    =>$info['name'],
                'initialDate'=>$info['initialDate'],
                'finalDate' =>$info['finalDate'],
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
        $smarty->assign("modulo", $_POST['modulo']);
        echo json_encode([
            'html'      => $smarty->fetch(DOC_ROOT."/templates/new/inbox-docente.tpl"),
            'selector'  => '#contentInbox'
        ]);
    break;
    case 'vistaInbox':
        $module->setStatusIn('activo');
        $module->setTipoReporte('entrada');
        $module->setQuienEnviaId('personal');
        $module->setRecibeId($_SESSION['User']['userId']);
        $module->setCMId($_POST['modulo']);
        $module->setCourseModuleId($_POST['modulo']);
		$in = $module->InfoCourseModule();
        $course->setCourseId($in['courseId']);
        $infoCourse = $course->Info();
        // print_r($infoCourse);
        $numVacios = substr_count($in['name'],' ');
        $palabra = explode(' ',$in['name']);
        $palabras = '';
        for($i=0;$i<=$numVacios; $i++){
            $palabras .= substr($palabra[$i],0,1);
        }
        $subject = $palabras.'|'.$infoCourse['group'].'|'; 
        
		$infoCM = $module->InfoCourseModule();
		$infoC['yoId'] = $_POST['alumno'];
		$infoC['courseModuleId'] = $infoCM['courseModuleId'];
        $student->setUserId($_POST['alumno']);
        $alumno = $student->GetInfo();
		$para = $alumno['lastNamePaterno']." ".$alumno['lastNameMaterno']." ".$alumno['names']; 
        $smarty->assign('de', $_SESSION['User']["nombreCompleto"]);
        $smarty->assign('subject', $subject);
        $smarty->assign('dataEnviado', $dataEnviado);
        $smarty->assign('id', $_POST['modulo']);
        $smarty->assign('para', $para);
        $smarty->assign('infoPersonal', $infoPersonal);
        $smarty->assign('infoC', $infoC);
        $smarty->assign('courseMId', $_POST['modulo']);
        $smarty->assign('lstMsj', $lstMsj);
        $smarty->assign("vista", "inbox");
        echo json_encode([
            'html'      =>$smarty->fetch(DOC_ROOT."/templates/new/inbox-docente.tpl"),
            'selector'  => '#contentInbox'
        ]);
    break;
    case 'enviarMensaje':
        $student->setAsunto($_POST['asunto1'].''.$_POST['asunto2']);
        $student->setYoId($_SESSION['User']['userId']);
        $student->setStatusjj($_POST['status']);
        $student->setUsuariojjId($_POST['yoId']);
        $student->setCMId($_POST['courseMId']);
        $student->setMensaje($_POST['mensaje']);
        if($student->SaveReply()){
            $sendmail = new SendMail;
            $student->setUserId($_POST['yoId']);
            $alumno = $student->GetInfo();
            $student->setEmail($alumno['email']);
            $msj = "Has recibido un nuevo mensaje de un docente, revisa tu inbox en la plataforma.";
            $sendmail->Prepare("IAP Chiapas | Mensaje nuevo", utf8_decode($msj), "", "", $alumno["email"], $alumno["names"]);
            echo json_encode([
                'growl'     =>true,
                'message'   =>'Se ha enviado el mensaje',
                'location'  =>WEB_ROOT."/inbox",
                'type'      =>'success'
            ]);
            
        }else{
            echo json_encode([
                'growl'     =>true,
                'message'   =>'No se pudo enviar el mensaje, ocurrió un error',
                'location'  =>WEB_ROOT."/inbox",
                'type'      =>'danger'
            ]);
        }
    break;
}
