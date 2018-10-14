<?php
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();

switch($_POST["type"])
{
	
		case 'addSaveSolicitudOk':
		
			$solicitud->setTipo($_POST['solicitudId']);
			$solicitud->setCursoId($_POST['courseId']);
			$solicitud->setObservacion($_POST['observacions']);
			if($Id = $solicitud->SaveSolicitud()){
				echo 'ok[#]';
				echo 'recarga';
				echo '[#]';
					echo '<div class="alert alert-info alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					  La solicitud se genero correctamente
					</div>';
				echo '[#]';
				$lstSol = $solicitud->arraySolicitudes();
				$registros = $solicitud->enumarateSolicitudesStden();
				$smarty->assign('registros', $registros);
				$smarty->assign("lstSol", $lstSol);
				$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
				echo '[#]';
				echo $Id;
			}
		
		break;
	
		case 'addSolicitud':
		
		$student->setUserId($_SESSION["User"]["userId"]);
		$activeCourses = $student->StudentCourses("activo", "si");
		$finishedCourses = $student->StudentCourses("finalizado");
		
		// echo '<pre>'; print_r($activeCourses);
		// exit;
		// $finishedCourses = array();
		
		if(count($activeCourses) == 1 and count($finishedCourses) == 0){
			
			if($_POST['solicitudId'] == 1  or 
			$_POST['solicitudId'] == 2 or 
			$_POST['solicitudId'] == 6 or 
			$_POST['solicitudId'] == 7 or 
			$_POST['solicitudId'] == 8){
				
				echo 'ok[#]';
				
				$smarty->assign('solicitudId', $_POST['solicitudId']);
				$smarty->assign('courseId', $activeCourses[0]['courseId']);
				$smarty->display(DOC_ROOT.'/templates/new/add-observacion-solicitud.tpl');
				exit;
			}

			$solicitud->setTipo($_POST['solicitudId']);
			$solicitud->setCursoId($activeCourses[0]['courseId']);
			if($Id = $solicitud->SaveSolicitud()){
				echo 'ok[#]';
				echo 'recarga';
				echo '[#]';
					echo '<div class="alert alert-info alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					  La solicitud se genero correctamente
					</div>';
				echo '[#]';
				$lstSol = $solicitud->arraySolicitudes();
				$registros = $solicitud->enumarateSolicitudesStden();
				$smarty->assign('registros', $registros);
				$smarty->assign("lstSol", $lstSol);
				$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
				echo '[#]';
				echo $Id;
			}else{
				echo 'fail[#]';
			}
			// echo 'llega';
			exit;
		}
			
			
		
		$smarty->assign("finishedCourses", $finishedCourses);	
		$smarty->assign("solicitudId", $_POST['solicitudId']);	

		echo 'ok[#]';
		$smarty->assign("activeCourses", $activeCourses);
		$smarty->display(DOC_ROOT.'/templates/new/view-curricula.tpl');
		exit;
		if($_POST['solicitudId']==''){
			echo 'fail[#]';
			echo '<center><font color="red">Por favor, seleccione el tipo de solicitud</font></center>';
			exit;
		}

					
	break;
	
	
			
	case 'addSaveSolicitud':

				// echo '<pre>'; print_r($_POST);
				// exit;
				$activa = 0;
				$inactiva = 0;
				foreach($_POST as $key=>$aux){
					$g = explode('_',$key);
					if($g[0]=='activa'){
						if($aux=='on'){
							$valoractiva = $g[1];
							$activa++;
						}
					}
					if($g[0]=='finalizada'){
						if($aux=='on'){
							$valorinactiva = $g[1];
							$inactiva++;
						}
					}
				}
				if(($activa+ $inactiva) <= 0){
						echo 'fail[#]';
						echo '<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						Debe seleccionar al menos una curricula
						</div>';
					exit;
				}
				
				if(($activa+ $inactiva) > 1){
						echo 'fail[#]';
						echo '<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						Solo puede seleccionar una curricula
						</div>';
					exit;
				}
				
				// echo $valoractiva.'___'; 
				// echo $valorinactiva; 
				// echo '<pre>'; print_r($_POST);
				// exit;
				if($valoractiva<>''){
					$cursoId = $valoractiva;
				}
				
				if($valorinactiva<>''){
					$cursoId = $valorinactiva;
				}
				
				
				if($_POST['solicitudjjId'] == 4){
					
					$solicitud->updateSemestre($_POST['soljId'],$cursoId);
					// $solicitud->updateBoleta($_POST["soljId"],$cursoId);
					
					echo 'okBol[#]';
					echo $_POST["soljId"];
					echo '[#]';
					$lstSol = $solicitud->arraySolicitudes();
					$registros = $solicitud->enumarateSolicitudesStden();

//					echo '<pre>'; print_r ($registros);
//					exit;
					$smarty->assign('registros', $registros);
					$smarty->assign("lstSol", $lstSol);
					$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
					// header("Location:".WEB_ROOT."/ajax/formato-constancia.php?q=".$_POST["soljId"]."");
					exit;
				}
				
				// echo $cursoId;
				// exit;
				
				$solicitud->setTipo($_POST['solicitudId']);
				$solicitud->setCursoId($cursoId);
				$solicitud->setObservacion($_POST['observacions']);
				// $solicitud->setPrecio($precio);
				if ($insertId = $solicitud->SaveSolicitud()){
					echo 'ok[#]';
					echo '<div class="alert alert-info alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					  La solicitud se genero correctamente
					</div>';
					echo '[#]';
					$lstSol = $solicitud->arraySolicitudes();
					$registros = $solicitud->enumarateSolicitudesStden();
					$smarty->assign('registros', $registros);
					$smarty->assign("lstSol", $lstSol);
					$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
					echo '[#]';
					echo $insertId;
				}else{
					echo 'fail[#]';
				}
				
			break;			
			case 'enviarArchivo';
			
				// echo '<pre>'; print_r($_POST);
				// echo '<pre>'; print_r($_FILES);
				// exit;
				$solicitud->setSolicitudId($_POST['solicitudId']);
				if ($solicitud->enviarArchivo()){
					echo 'ok[#]';
					echo '<div class="alert alert-info alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					  El Comprobante se adjunto correctamente
					</div>';
					echo '[#]';
					$lstSol = $solicitud->arraySolicitudes();
					$registros = $solicitud->enumarateSolicitudesStden();
					$smarty->assign('registros', $registros);
					$smarty->assign("lstSol", $lstSol);
					$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
				}else{
					echo 'fail[#]';
				}
			
			break;
			
			case 'solicitarReferencia':
			
				
				// echo '<pre>'; print_r($_POST);
				// exit;
				$solicitud->setTipo(5);
				$solicitud->setCursoId($_POST['courseId']);
				if ($solicitud->SaveSolicitud()){
					echo 'ok[#]';
					echo '<div class="alert alert-info alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					  La solicitud se envio correctamente en breve nos pondremos en contacto contigo
					</div>';
					
					$sendmail = new SendMail;
					$student->setUserId($_SESSION["User"]["userId"]);
					$info = $student->GetInfo();
					$html .= 'Solicitud de Referencia Bancaria<br><br><br>';
					$html .= '<b>Alumno:</b> '.$info['names'].' '.$info['lastNamePaterno'].' '.$info['lastNameMaterno'].'<br>';
					$html .= '<b>Numero de Control:</b> '.$info['controlNumber'];
					$sendmail->PrepareAttachment("Solicitud de Referencia Bancaria", $html, "","", 'facturasfinanzas@iapchiapas.org.mx', "Finanzas", $attachment, $fileName);
					$sendmail->PrepareAttachment("Solicitud de Referencia Bancaria",$html, "", "", "enlinea@iapchiapas.org.mx", "Administrador", $attachment, $fileName);
				}else{
					echo 'fail[#]';
				}
			
			break;
			
			case 'cancelar':

			
				// echo '<pre>'; print_r($_POST);
				$solicitud->setSolicitudId($_POST['solicitudId']);
				if ($solicitud->cancelarSolicitud()){
					echo 'ok[#]';
					echo '<div class="alert alert-info alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
						La solicitud se cancelo correctamente
					</div>';
					echo '[#]';
					$lstSol = $solicitud->arraySolicitudes();
					$registros = $solicitud->enumarateSolicitudesStden();
					$smarty->assign('registros', $registros);
					$smarty->assign("lstSol", $lstSol);
					$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
				}else{
					echo 'fail[#]';
				}
				
			break;
			
			
			case 'LoadPage':
			
					$solicitud->setPages($_POST['page']);
					$registros = $solicitud->enumarateSolicitudesStden();
					$smarty->assign('registros', $registros);
					$smarty->assign("lstSol", $lstSol);
					$smarty->display(DOC_ROOT.'/templates/lists/view-solicitud.tpl');
			
			break;
			
			
			
			case 'onAceptar':
			
				if ($solicitud->generarAcuse()){
					echo 'ok[#]';
					
				}else{
					echo 'fail[#]';
				}
			
			break;
			
			case "send":
			
				$test->setUsertId($_SESSION["User"]["userId"]);
				$test->setActivityId($_POST["activityId"]);
				if($test->SendTest($_POST["anwer"])){
					echo "ok[#]";
				}else{
					echo "fail[#]";
					
				}
				
			
			break;
			
			case "sendInfo":
			
				// echo "<pre>"; print_r($_POST); exit;
				if($test->sendInfo($_POST["names"],$_POST["pass"])){
					echo "ok[#]";
				}else{
					echo "fail[#]";
					
				}
			
			break;
			
			case "saveCalificador":
			

				if($personal->saveCalificadorUsuario()){
					echo "ok[#]";
					echo "El evaluador se agrego correctamente";
				}else{
					echo "fail[#]";
					
				}
			
			break;
	}

?>
