<?php
// echo "<pre>"; print_r($_POST);
// exit;
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');
session_start();

switch($_POST["type"])
{
    case "addPersonal":

        $states = $util->EnumerateStates();
        $listPositions = $position->Enumerate();
        $positions = $util->EncodeResult($listPositions);
        $listRoles = $role->Enumerate();
        $roles = $util->EncodeResult($listRoles);
		
        $lstPd = $personal->enumerateAbreviaciones();


        $smarty->assign('lstPd', $lstPd);
        $smarty->assign('states', $states);
        $smarty->assign("roles",$roles);
        $smarty->assign("positions",$positions);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->display(DOC_ROOT.'/templates/forms/new/add-personal.tpl');

        break;

    case "editPersonal":

	// echo "<pre>"; print_r($_POST);
	// exit;
        $states = $util->EnumerateStates();
        $personal->setPersonalId($_POST['id']);
        $info = $personal->Info();
        $listPositions = $position->Enumerate();
        $positions = $util->EncodeResult($listPositions);
        $listRoles = $role->Enumerate();
        $roles = $util->EncodeResult($listRoles);
		$lstPd = $personal->enumerateAbreviaciones();

        foreach($roles as $key => $val){

            $personal->setRoleId($val['roleId']);

            $roles[$key]["selected"] = false;
            if($personal->IsRoleSelected())
            {
                $roles[$key]["selected"] = true;
            }

/*            if(!$personal->IsRoleSelected())
            {
                $roles2[$key] = $val;
            }*/
        }

		// echo '<pre>'; print_r($info);
		// exit;
        $usrRoles = $personal->EnumerateRoles();

        $smarty->assign('lstPd', $lstPd);
        $smarty->assign('states', $states);
        $smarty->assign("usrRoles",$usrRoles);
        $smarty->assign("roles",$roles);
        $smarty->assign("positions",$positions);
        $smarty->assign("info", $info);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
         $smarty->display(DOC_ROOT.'/templates/forms/new/add-personal.tpl');

        break;

    case "saveAddPersonal":


	// echo "<pre>"; print_r($_FILES);
	// echo "<pre>"; print_r($_POST);
	// exit;
		if($_POST['mostrarP']=='on'){
			$_POST['mostrarP'] = 'si';
		}
	
	    $personal->setPersonalId($_POST['personalId']);
        $personal->setCorreo($_POST['correo']);
        $personal->setName($_POST['name']);
        $personal->setLastnamePaterno($_POST['lastname_paterno']);
        $personal->setLastnameMaterno($_POST['lastname_materno']);
        $personal->setUserName($_POST['username']);
        $personal->setPasswd($_POST['passwd']);


        if(!$personal->Save())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $personal->Enumerate('lastname_paterno ASC');
            $personals = $util->EncodeResult($result);
            $smarty->assign("personals", $personals);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/personal.tpl');
        }

        break;

    case "saveEditPersonal":

	// echo '<pre>'; print_r($_POST['id']);
	// exit;
        $personal->setPositionId($_POST['positionId']);
        $personal->setPersonalId($_POST['id']);
        $personal->setName($_POST['name']);
        $personal->setLastnamePaterno($_POST['lastname_paterno']);
        $personal->setLastnameMaterno($_POST['lastname_materno']);
        $personal->setStateId($_POST['stateId']);
        $personal->setUserName($_POST['username']);
        $personal->setPasswd($_POST['passwd']);
        $personal->setDescription($_POST['description']);
        $personal->setRolesId($_POST['list_roles']);

        $personal->setCurp($_POST['curp']);
        $personal->setRfc($_POST['rfc']);
        $personal->setSexo($_POST['sexo']);
        $personal->setFechaNacimiento($_POST['fecha_nacimiento']);
        $personal->setFechaSep($_POST['fecha_sep']);
        $personal->setFechaDgta($_POST['fecha_dgta']);
        $personal->setClavesPresupuestales($_POST['claves_presupuestales']);
        $personal->setCategoria($_POST['categoria']);
        $personal->setPerfil($_POST['perfil']);
		$personal->setProf($_POST['prof']);

        if(!$personal->Update())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $personal->Enumerate();
            $personals = $util->EncodeResult($result);
            $smarty->assign("personals", $personals);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/personal.tpl');
        }

        break;

    case 'deletePersonal':

        $personal->setPersonalId($_POST['id']);

        if(!$personal->Delete())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $personal->Enumerate();
            $personals = $util->EncodeResult($result);
            $smarty->assign("personals", $personals);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/personal.tpl');
        }

        break;

    case 'getCurp':

        $name = $_POST['name'];
        $paterno = $_POST['paterno'];
        $materno = $_POST['materno'];
        $stateId = $_POST['stateId'];
        $sexo = $_POST['sexo'];
        $fecha = $_POST['fecha'];

        $f = explode('-',$fecha);

        if($stateId)
            $stateClave = $util->GetClaveState($stateId);

        $Curp->SetDatos($name, $paterno, $materno, $sexo, $f[0], $f[1], $f[2], $stateClave);

        if($Curp->CURP != ''){
            echo 'ok[#]';
            echo $Curp->CURP;
        }

        break;

    case 'doLogin':
        $username = strip_tags(trim($_POST['username']));
        $passwd = strip_tags(trim($_POST['passwd']));

        if($username == '' || $passwd == ''){
            echo 'fail[#]';
            echo 'empty';
            exit;
        }

        $user->setUsername($username);
        $user->setPassword($passwd);
        //exit();
        if($user->do_login()){
            echo "ok[#]";
        }else{
            echo "fail[#]";
            echo 'data';
        }

    break;
	
	case 'compruebaFirma':
	
		$count = $personal->compruebaFirma();
		if($count >= 1){
			echo 'fail[#]';
			echo '<font color="red">Ya existe una persona con la opcion de firmar, por favor desactive todos y vuelva a intentar</font>';
		}

	break;
	
	case 'adjuntarDocDocente':
	
		
		$personal->setDocumentoId($_POST['catId']);
		$personal->setPersonalId($_POST["personalId"]);
		if($personal->adjuntarDocDocente()){
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se adjunto correctamente</strong>
				</div>';
				echo '[#]';
				$personal->setPersonalId($_POST["personalId"]);
				$registros = $personal->enumerateCatProductos();
				$smarty->assign("cId", $_POST['cId']);
				$smarty->assign("personalId", $_POST['personalId']);
				$smarty->assign("registros", $registros);
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/new/doc-docente.tpl');
				
			}else{
				echo "fail[#]";
				//$util->ShowErrors();
			}
	
	break;
	
	case 'onDelete':
			
			
		// echo '<pre>'; print_r($_POST);	
		$personal->setPersonalId($_POST["Id"]);
		if($personal->onDelete()){
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Docente se elimino correctamente</strong>
				</div>';
				echo '[#]';
				$personal->setPersonalId($_POST["Id"]);
				$personal->setTipo('Maestro');
				$personals = $personal->EnumerateNew();
				$smarty->assign("cId", $_POST['cId']);
				$smarty->assign("personalId", $_POST['personalId']);
				$smarty->assign("personals", $personals);
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/lst-docentes.tpl');
				
			}else{
				echo "fail[#]";
				//$util->ShowErrors();
			}
			
	break;
	
	case 'onBuscar':
	
		// echo '<pre>'; print_r($_POST);
			$personal->setTipo('Docente');
		$personal->setName($_POST['nombre']);
		$personals = $personal->EnumerateNew();
		$smarty->assign("personals", $personals);
		
		$smarty->display(DOC_ROOT.'/templates/lists/lst-docentes.tpl');
	
	break;
	
	
	case 'onSave':
	
		// echo '<pre>'; print_r($_POST);
		// exit;
			$personal->setPersonalId($_POST['personalId']);
			$personal->setCorreo($_POST['correo']);
			$personal->setName($_POST['nombre']);
			$personal->setLastnamePaterno($_POST['paterno']);
			$personal->setLastnameMaterno($_POST['materno']);
			$personal->setRfc($_POST['rfc']);
			$personal->setFechaNacimiento($_POST['nacimiento']);
			$personal->setUserName($_POST['usuario']);
			$personal->setPasswd($_POST['pass']);
			if($personal->addDocente()){
				echo 'ok[#]';
				echo '
				<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Docente se agrego correctamente</strong>
				</div>
				';
				echo '[#]';
					$personal->setName('');
					$personal->setTipo('Docente');
					$personals = $personal->EnumerateNew();
					$smarty->assign("personals", $personals);
					$smarty->display(DOC_ROOT.'/templates/lists/lst-docentes.tpl');
			}else{
				echo 'fail[#]';
				// $util->PrintErrors();
				$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				
			}
	break;
	
	case 'onSaveDocumento':
	
	
		// echo '<pre>'; print_r($_POST);
		
			// $docente->setPersonalId($_POST['personalId']);
			$docente->setId($_POST['docId']);
			$docente->setNombre($_POST['nombre']);
			$docente->setDescripcion($_POST['descripcion']);
			if($docente->onSaveDocumento()){
				echo 'ok[#]';
				echo '
				<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se agrego correctamente</strong>
				</div>
				';
				 echo '[#]';
					$personal->setPersonalId($_SESSION['User']['userId']);
					$registros = $personal->enumerateCatProductos();
					$smarty->assign("registros", $registros);
					$smarty->display(DOC_ROOT.'/templates/lists/new/add-cat-doc-docente.tpl');
			}else{
				echo 'fail[#]';
			}
	
	break;
	
	case 'onDeleteDocumento':
	// echo '<pre>'; print_r($_POST);	
	// exit;
		$docente->setId($_POST["Id"]);
		if($docente->onDeleteDocumento()){
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se elimino correctamente</strong>
				</div>';
				$personal->setPersonalId($_SESSION['User']['userId']);
				$registros = $personal->enumerateCatProductos();
				echo '[#]';
					
					$smarty->assign("registros", $registros);
					$smarty->display(DOC_ROOT.'/templates/lists/new/add-cat-doc-docente.tpl');
				
			}else{
				echo "fail[#]";
				//$util->ShowErrors();
			}
			
	break;
	
	case 'enviarArchivoRepo':

			$docente->setNombre($_POST['nombre']);
			if($docente->enviarArchivoRepo()){
				echo 'ok[#]';
				echo '
				<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se agrego correctamente</strong>
				</div>
				';
				
				 echo '[#]';
				$registros = $personal->enumerateRepositorio();
				$smarty->assign("registros", $registros);
				$smarty->display(DOC_ROOT.'/templates/lists/new/repositorio.tpl');
			}else{
				echo 'fail[#]';
			}
	
	break;
	
	
	case 'onBuscarMacth':
	
	
		
		
		$lsReporte = $docente->onBuscarMacth();
		// echo '<pre>'; print_r($lsReporte);
		// exit;
		$smarty->assign("lsReporte", $lsReporte);
		$smarty->display(DOC_ROOT.'/templates/lists/new/doc-mat.tpl');
	
	break;
	
	
	case 'adjuntarPlan':
	
		// echo '<pre>'; print_r($_POST);
		// exit;
		// $personal->setDocumentoId($_POST['catId']);
		// $personal->setPersonalId($_POST["personalId"]);
		if($personal->adjuntarPlan($_POST['id'],$_POST['cmId'])){
			// echo 'llea';
			// exit;
			
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se adjunto correctamente</strong>
				</div>';
				echo '[#]';
				$result = $course->getMateriaxCourse($_POST['id']);
				$smarty->assign('result', $result);
					$smarty->assign('cmId', $_POST["cmId"]);
				$smarty->assign('id', $_POST["id"]);
				$smarty->display(DOC_ROOT.'/templates/lists/new/prog-materia.tpl');
				
			}else{
				echo "fail[#]";
				//$util->ShowErrors();
			}
	
	break;
	
	case 'onDeletePlan':
	
		// echo '<pre>'; print_r($_POST);
		// exit;
		if($personal->onDeletePlan($_POST['id'])){
			// echo 'llea';
			// exit;
			
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se ha eliminado correctamente</strong>
				</div>';
				echo '[#]';
				$result = $course->getMateriaxCourse($_POST['courseId']);
				$smarty->assign('id', $_POST['id']);
				$smarty->assign('courseId', $_POST['courseId']);
				$smarty->assign('result', $result);
				$smarty->display(DOC_ROOT.'/templates/lists/new/prog-materia.tpl');
				
			}else{
				echo "fail[#]";
				//$util->ShowErrors();
			}
	
	break;
	
	case 'onDeleteCarta':
	
		if($personal->onDeleteCarta($_POST['id'])){
			// echo 'llea';
			// exit;
			
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se ha eliminado correctamente</strong>
				</div>';
				echo '[#]';
				$result = $course->getMateriaxCourse($_POST['courseId']);
				$smarty->assign('id', $_POST['id']);
				$smarty->assign('courseId', $_POST['courseId']);
				$smarty->assign('result', $result);
				$smarty->display(DOC_ROOT.'/templates/lists/new/prog-materia.tpl');
				
			}else{
				echo "fail[#]";
				//$util->ShowErrors();
			}
	
	break;
	
	
	case 'adjuntarActa':
	
		// echo '<pre>'; print_r($_POST);
		if($url = $group->upFile($_POST["cmId"])){
				echo "ok[#]";
				echo '<div class="alert alert-info alert-dismissable">
				  <button type="button" class="close" data-dismiss="alert">&times;</button>
				  <strong>El Documento se adjunto correctamente</strong>
				</div>';
				echo '[#]';
				$result = $course->getMateriaxCourse($_POST['id']);
				$smarty->assign('cmId', $_POST["cmId"]);
				$smarty->assign('id', $_POST["id"]);
				$smarty->assign('result', $result);
				$smarty->display(DOC_ROOT.'/templates/lists/new/prog-materia.tpl');
			}else{
				echo "fail[#]";
				
			}
	
	
	break;
	
	case 'onChangePicture':
	
		if($url = $group->onChangePicture($_POST["personalId"])){
				echo "ok[#]";
			}else{
				echo "fail[#]";
				
			}
	
	break;
	
	case "ActivarPersonalPopup":
	
        $personal->setPersonalId($_POST['id']);

        if(!$personal->Activar())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $personal->Enumerate();
            $personals = $util->EncodeResult($result);
            $smarty->assign("personals", $personals);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/personal.tpl');
        }

	break;
	
	case "AgregarCertificacion":
	
	
		
		$lstSub = $subject->EnumerateCertificacion();
		
		$smarty->assign('lstSub', $lstSub);					

		// echo "<pre>"; print_r($_POST);
		// exit;
		$smarty->assign("id", $_POST["id"]);
		$smarty->assign("DOC_ROOT", DOC_ROOT);
		$smarty->display(DOC_ROOT.'/templates/new/add-certificacion.tpl');
	
	break;
	
	case "saveGuardarCertificacion":
	
		// echo "<pre>"; print_r($_POST);
		 if(!$personal->saveGuardarCertificacion())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
			echo "Las certificaciones se agregaron correctamente";
            // $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $personal->Enumerate();
            $personals = $util->EncodeResult($result);
            $smarty->assign("personals", $personals);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/personal.tpl');
        }
	
	break;
	
	case "buscarPersonal":
	
		// echo "<pre>"; print_r($_POST);
		 $result = $personal->Enumerate();
            $personals = $util->EncodeResult($result);
            $smarty->assign("personals", $personals);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/personal.tpl');
	
	break;
}

?>
