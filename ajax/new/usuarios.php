<?php
// echo "<pre>"; print_r($_POST);
// exit;
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');
session_start();

switch($_POST["type"])
{
   
	case 'enviarArchivo':
	
			if($docente->guadarDoc()){
				echo 'ok[#]';
				echo '
				El Documento se agrego correctamente
				';
				 echo '[#]';
			}else{
				echo 'fail[#]';
			}
	
	break;
	
	
	case "onDeleteCarta":

		if($docente->onDoc($_POST["id"])){  
				echo 'ok[#]';
				echo '
				  El Documento se ha eliminado correctamente
				';
				 echo '[#]';
			}else{
				echo 'fail[#]';
			}
		
	break;
	
	
	case "buscarCertificacion":
		
		$students = $student->enumerateOk();
		$smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios.tpl');
	break;
	
	
	
	case "LoadPage":
		$student->setPages($_POST['page']);
		$students = $student->enumerateOk();
		 $smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios.tpl');
	break;
	
	
	case "saveEstatus":
	
		if($docente->saveEstatus($_POST["id"])){  
				echo 'ok[#]';
				echo '
				 Los datos se guardaron correctamente
				';
				 echo '[#]';
			}else{
				echo 'fail[#]';
			}
	
	break;
	
	case "buscarGrupos":
	
		// echo "<pre>"; print_r($_POST);
		$lstG = $student->gruposCertificacion($_POST["certificacionId"]);
		 $smarty->assign("lstG", $lstG);
		$smarty->display(DOC_ROOT.'/templates/lists/select-grupos.tpl');
	
	break;
}

?>
