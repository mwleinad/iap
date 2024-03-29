<?php

	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();
	
	switch($_POST['type']){
	
		case 'showDetails':
		
			$id_comprobante = $_POST['id_item'];			
			
			$compInfo = $comprobante->GetInfoComprobante($id_comprobante);
			$user->setUserId($compInfo['userId'],1);
			$usr = $user->GetUserInfo();
			$nomRfc = $usr['rfc'];
						
			$serie = $compInfo['serie'];
			$folio = $compInfo['folio'];
			
			$smarty->assign('id_comprobante', $id_comprobante);
			$smarty->assign('rfc', $nomRfc);
			$smarty->assign('serie', $serie);
			$smarty->assign('folio', $folio);
			$smarty->assign('DOC_ROOT', DOC_ROOT);		
			
			$info = $user->Info();
			$smarty->assign("info", $info);	
			$smarty->display(DOC_ROOT.'/templates/boxes/acciones-factura-popup.tpl');
			
			break;
		
		case 'cancelar_div':
		
			$id_comprobante = $_POST['id_item'];			
			
			$compInfo = $comprobante->GetInfoComprobante($id_comprobante);
			$user->setUserId($compInfo['userId'],1);
			$usr = $user->GetUserInfo();
			$nomRfc = $usr['rfc'];
						
			$serie = $compInfo['serie'];
			$folio = $compInfo['folio'];
			$status = $compInfo['status'];
			
			$smarty->assign('status', $status);
			$smarty->assign('id_comprobante', $id_comprobante);
			$smarty->assign('rfc', $nomRfc);
			$smarty->assign('serie', $serie);
			$smarty->assign('folio', $folio);
			$smarty->assign('DOC_ROOT', DOC_ROOT);			
			$smarty->display(DOC_ROOT.'/templates/boxes/cancelar-factura-popup.tpl');
			
			break;
		
		case 'cancelar_factura':
		
			$empresa->setComprobanteId($_POST['id_comprobante']);
			$empresa->setMotivoCancelacion($_POST['motivo']);
															
			if(!$empresa->CancelarComprobante()){
				echo 'fail[#]';
				$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
			}else{				
				echo 'ok[#]';
				$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');				
				echo '[#]';				
				//$smarty->assign('folios', $folios->GetFoliosByEmpresa());
				//$smarty->assign('DOC_ROOT', DOC_ROOT);
				//$smarty->display(DOC_ROOT.'/templates/lists/folios.tpl');				
			}//else
			break;			
		
		case 'buscar':
				
				foreach($_POST as $key => $val){
					$values[$key] = $val;
				}
				
				$comprobantes = array();
				$comprobantes = $comprobante->SearchComprobantesByRfc($values);				
				$smarty->assign('comprobantes',$comprobantes);
				
				$total = 0;
				foreach($comprobantes as $res){
					$total += $res['total'];
				}
				
				echo 'ok[#]';
				echo '$'.number_format($total,2,'.',',');
				echo '[#]';
								
				$smarty->assign('DOC_ROOT', DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/facturas.tpl');
				
			break;	
		
		case 'enviar_email':
		
			$id_comprobante = $_POST['id_comprobante'];
			$comprobante = new Comprobante;
			$comprobante->SendComprobante($id_comprobante);
			
			echo 'ok[#]';
			$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
		
			break;
			
		case 'exportar':
				
				foreach($_POST as $key => $val){
					$values[$key] = $val;
				}
				
				$comprobantes = array();
				$comprobantes = $comprobante->SearchComprobantesByRfc($values);		
				//print_r($comprobantes);		
				//$smarty->assign('comprobantes',$comprobantes);

				$data .= "Serie,Folio,RFC,Razon Social,Fecha,Subtotal,% Descuento,Descuento,Iva,Total,Tipo Moneda,Tipo de Cambio,% Retencion Iva,% Retencion ISR,% IEPS \n";
				foreach($comprobantes["items"] as $comprobante)
				{
					foreach($comprobante as $key => $value)
					{
						$comprobante[$key] = str_replace(",", " ", $value);
						if($key == "total" || $key == "comprobanteId")
						{
							unset($comprobante[$key]);
						}
						
						if($key == "status")
						{
							if($value == 1)
							{
								$comprobante[$key] = "Activa";
							}
							else
							{
								$comprobante[$key] = "Cancelada";
							}
						}
						if($key == "subTotal" || $key == "ivaTotal" || $key == "total_formato" || $key == "tipoDeCambio")
						{
							$comprobante[$key] = "$".number_format($value, 2, ".", "");
						}
						
						if($key == "porcentajeRetIva" || $key == "porcentajeRetIsr" || $key == "porcentajeIEPS" || $key == "porcentajeDescuento")
						{
							$comprobante[$key] = number_format($value, 2, ".", "")."%";
						}
					}
					//print_r($comprobante);
					$data .= implode(",", $comprobante);
					$data .= "\n";
				}
				
				$data = utf8_decode($data);
				$data = html_entity_decode($data);
				//echo $data;
				//$data = urldecode($data);
				$myFile = DOC_ROOT."/reporte_comprobantes.csv";
				$fh = fopen($myFile, 'w') or die("can't open file");
				fwrite($fh, $data);
				fclose($fh);
				echo "Reporte Generado. Ahora puedes descargarlo";
			break;				
				
	}//switch

?>
