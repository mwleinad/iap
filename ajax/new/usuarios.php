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
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		 $smarty->assign("lstG", $lstG);
		$smarty->display(DOC_ROOT.'/templates/lists/select-grupos.tpl');
	
	break;
	
	case "buscarGrupoModal":
		$lstG = $student->gruposCertificacion($_POST["certificacionId"]);
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		 $smarty->assign("lstG", $lstG);
		$smarty->display(DOC_ROOT.'/templates/lists/select-grupos.tpl');
	break;
	
	case "busEval":
	
		// echo "<pre>"; print_r($_POST);
		// exit;
		$lstCalificador = $subject->extraeCalificador($_POST["subjectId"],$_POST["personalId"]);
		 $smarty->assign("lstCalificador", $lstCalificador);
		$smarty->display(DOC_ROOT.'/templates/lists/select-personal.tpl');
	break;
	
	
	case "buscarCertificacion":
		
		$_GET = $_POST;
		$students = $student->enumerateOk();
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		$smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios.tpl');
	break;
	
	case "LoadPage":
		$student->setPages($_POST['page']);
		$students = $student->enumerateOk();
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		 $smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios.tpl');
	break;
	
	case "buscarCertificacionAdmin":
		
		$_GET = $_POST;
		$student->setPages($_POST['page']);
		$students = $student->enumerateOk();
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		$smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios-admin.tpl');
	break;
	
	case "LoadPageAdmin":
		$student->setPages($_POST['page']);
		$students = $student->enumerateOk();
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		 $smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios-admin.tpl');
	break;
	
	
	case "LoadPageSol":
		$student->setPages($_POST['page']);
		$students = $student->enumerateOk();
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		 $smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios-sol.tpl');
	break;
	
	
	case "LoadPageDoc":
		$student->setPages($_POST['page']);
		$students = $student->enumerateOk();
		$smarty->assign("tipoUs", $_SESSION["User"]["type"]);	
		 $smarty->assign("registros", $students);
		$smarty->display(DOC_ROOT.'/templates/lists/usuarios-doc.tpl');
	break;
	
	case "verForm":
	
		
		$_GET["id"] =$_POST["userId"];
		$_GET["cId"] =$_POST["subjectId"];
		$_GET["auxTpl"] =$_POST["tipo"];
		
		$infoDoc = $solicitud->infoDoc();
		 $smarty->assign("cId", $_POST["subjectId"]);
		 $smarty->assign("id", $_POST["userId"]);
		 $smarty->assign("auxTpl", $_POST["tipo"]);
		 $smarty->assign("infoDoc", $infoDoc);
		$smarty->display(DOC_ROOT.'/templates/new/add-doc.tpl');
	
	break;
	
	case "verFormEva":
	// echo "<pre>"; print_r($_POST);
	// exit;
		$_GET["id"] = $_POST["userId"];
		$_GET["cId"] = $_POST["subjectId"];
		$infoDoc = $solicitud->infoCourse();
		// echo "<pre>"; print_r($_POST);
		$smarty->assign("cId", $_POST["subjectId"]);
		$smarty->assign("id", $_POST["userId"]);
		$smarty->assign("auxTpl", $_POST["tipo"]);
		$smarty->assign("infoDoc", $infoDoc);
		$smarty->display(DOC_ROOT.'/templates/new/add-evaluar.tpl');
	break;
}

?>
