<?php
/* if($_SESSION['User']['type'] != 'student')
    exit; */

if(!isset($_SESSION))
{
    if(isset($_COOKIE['code']) && isset($_COOKIE['type']))
    {
        $data = $user->getLoginData($_COOKIE['code'], $_COOKIE['type']);
        $user->setUsername($data['username']);
        $user->setPassword($data['password']);
        $user->do_login();
        setcookie('code', '', time() - 60);
        setcookie('type', '', time() - 60);
    }
}
if($_POST)
{
    include_once(DOC_ROOT . "/properties/messages.php");
    $sendmail = new SendMail;
    $estatus = intval($_POST['Estatus']);
    $referencia3d = $_POST['REFERENCIA3D'];
    $pagoId = explode('IAP', $referencia3d);
    $pagoId = intval($pagoId[1]);
    $cobro_tarjeta = $conceptos->getCobroTarjeta($referencia3d);
    $conceptos->setCobroTarjetaId($cobro_tarjeta['id']);
    $card_number = $util->cardFormat($cobro_tarjeta['numero_tarjeta']);
    $student->setUserId($_SESSION['User']["userId"]);
	$info = $student->GetInfo();
    if($estatus == 200)
    {
        try
        {
            $eci = $_POST['ECI'];
            $xid = $_POST['XID'];
            $cavv = $_POST['CAVV'];
            $conceptos->setPagoId($pagoId);
            $pago = $conceptos->pago();
            $conceptos->setConcepto($pago['concepto_id']);
            $concepto = $conceptos->getConcepto();
            $abonos = 0;
            if ($pago['cobros'] > 0)
                $abonos = $conceptos->monto();
            $monto = $pago['total'] - $abonos;
            $data = [
                'ID_AFILIACION' => ID_AFILIACION,
                'USUARIO' => BN_USUARIO,
                'CLAVE_USR' => BN_CLAVE,
                'CMD_TRANS' => 'VENTA',
                'ID_TERMINAL' => ID_TERMINAL,
                'MONTO' => 2, // $monto
                'MODO' => BN_MODO,
                'NUMERO_TARJETA' => $cobro_tarjeta['numero_tarjeta'],
                'FECHA_EXP' => $cobro_tarjeta['fecha_exp'],
                'CODIGO_SEGURIDAD' => $cobro_tarjeta['codigo_seguridad'],
                'MODO_ENTRADA' => 'MANUAL',
                'ESTATUS_3D' => $estatus,
                'ECI' => $eci,
                'XID' => $xid,
                'CAVV' => $cavv,
                'VERSION_3D' => 2,
                'REF_CLIENTE2' => $info['controlNumber'],
                'REF_CLIENTE3' => $util->eliminar_acentos($info['names']),
                'REF_CLIENTE4' => $util->eliminar_acentos($info['lastNamePaterno']),
                'REF_CLIENTE5' => $util->eliminar_acentos($info['lastNameMaterno'])
            ];
            /* echo "<pre>";
            print_r($data);
            exit; */
            $data_string = http_build_query($data);
            // echo $data_string; exit;
            $curl = curl_init();
            if ($curl === false)
                throw new Exception('Failed to initialize');
            curl_setopt($curl, CURLOPT_URL, 'https://via.pagosbanorte.com/payw2');
            curl_setopt($curl, CURLOPT_HEADER, true); 
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, BN_SSL);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            $header = curl_exec($curl);
            if ($header === false)
                throw new Exception(curl_error($curl), curl_errno($curl));
            $header_index_array = explode("\r\n", $header);
            $result = [];
            $status_message = array_shift($header_index_array);
            foreach ($header_index_array as $value) 
            {
                if(false !== ($matches = explode(':', $value, 2)))
                    $result["{$matches[0]}"] = trim($matches[1]);           
            }
            curl_close($curl);
            /* echo "<pre>";
            print_r($result);
            exit; */
            $resultado_payw = $result['RESULTADO_PAYW'];
            $texto = $result['TEXTO'];
            $fecha_req_cte = $result['FECHA_REQ_CTE'];
            $codigo_aut = $result['CODIGO_AUT'];
            $referencia = $result['REFERENCIA'];
            $fecha_rsp_cte = $result['FECHA_RSP_CTE'];
            if($resultado_payw == 'A')
            {
                $fecha_pago = date('Y-m-d');
                $fecha_pago = "'{$fecha_pago}'";
                $montoActual = $conceptos->monto();
                $totaltemporal = $monto + $montoActual;
                if($pago['cobros'] == 0 && $monto == $pago['total'])
                { 
                    //Pago único
                    $descuento = $pago['subtotal'] - $pago['total'];
                    $subtotal = $pago['subtotal']; 
                }
                elseif($totaltemporal != $pago['total'])
                { 
                    //Si es un abono
                    $subtotal = $monto;
                    $descuento = 0;  
                }
                else
                { 
                    //Es el último abono
                    $descuento = $pago['subtotal'] - $pago['total'];
                    $subtotal = $pago['subtotal'] - $montoActual;
                }
                $conceptos->setCosto($subtotal); 
                $conceptos->setDescuento($descuento);
                $conceptos->setMonto($monto);
                $conceptos->setFechaPago($fecha_pago);
                $cobroId = $conceptos->guardar_cobro(3); 
                $conceptos->closeCobroTarjeta('Paid', $resultado_payw, $texto, $fecha_req_cte, $codigo_aut, $referencia, $fecha_rsp_cte, $card_number, $cobroId);
                $cobro_tarjeta = $conceptos->getCobroTarjeta($referencia3d);
                $montoTotalCobrado = $conceptos->monto(); 
                if ($montoTotalCobrado == $pago['total']) 
                {
                    $conceptos->setFechaCobro("'{$pago['fecha_cobro']}'");
                    $conceptos->setFechaLimite("'{$pago['fecha_limite']}'"); 
                    $conceptos->setCosto($pago['subtotal']);
                    $conceptos->setTotal($pago['total']);
                    $conceptos->setDescuento($pago['descuento']);
                    $conceptos->setBeca($pago['beca']);
                    $conceptos->setTolerancia($pago['tolerancia']);
                    $conceptos->setStatus(2);
                    $conceptos->setPeriodo($pago['periodo']);
                    $conceptos->setUserId($pago['alumno_id']);
                    $conceptos->actualizar_pago(); 
                }
                $message_txt = '<p>Pago aprobado</p>
                            <p>El pago con su tarjeta fue procesado exitosamente.</p>
                            <p>Detalles de la transacción:</p>
                            <ul style="list-style-type: none;">
                                <li><i class="fas fa-caret-right"></i> Monto total: $' . number_format($cobro_tarjeta['monto'], 2) . '</li>
                                <li><i class="fas fa-caret-right"></i> No. de referencia: ' . $referencia . '</li>
                                <li><i class="fas fa-caret-right"></i> Método de pago: ' . $cobro_tarjeta['tipo_tarjeta'] . ' ' . $cobro_tarjeta['marca_tarjeta'] . '</li>
                                <li><i class="fas fa-caret-right"></i> Fecha y hora: ' . $fecha_rsp_cte . '</li>
                            </ul>
                            <p>En breve se le enviará esta información al correo electrónico ' . $cobro_tarjeta['correo'] . '</p>
                            <p>Si tiene alguna duda, puede comunicarse al Departamento de Finanzas y Contabilidad al teléfono 961 125 1508 Ext. 116 de lunes a viernes de 8:00 am a 4:00 pm</p>';
                $smarty->assign('success', true);
                $smarty->assign('message_txt', $message_txt);
                $details_body = array(
                    "monto" => utf8_decode(number_format($cobro_tarjeta['monto'], 2)),
                    "referencia" => utf8_decode($referencia),
                    "metodo" => utf8_decode($cobro_tarjeta['tipo_tarjeta'] . ' ' . $cobro_tarjeta['marca_tarjeta']),
                    "fecha" => utf8_decode($fecha_rsp_cte)
                );
                $details_subject = array();
                $attachment = [];
                $fileName = [];
                $email = $cobro_tarjeta['correo'];
                if ($email != '')
                    $sendmail->PrepareAttachment($message[6]["subject"], $message[6]["body"], $details_body, $details_subject, $email, '', $attachment, $fileName);
            }
            else
            {
                $conceptos->closeCobroTarjeta('Declined', $resultado_payw, $texto, $fecha_req_cte, $codigo_aut, $referencia, $fecha_rsp_cte, $card_number);
                $message_txt = '<p><i class="fas fa-exclamation-triangle fa-3x"></i></p>
                                <p><b>Pago NO realizado</b></p>
                                <p>El pago con su tarjeta no fue procesado.</p>
                                <p>El pago que intentó realizar con la referencia ' . $referencia . ' por el monto $' . number_format($cobro_tarjeta['monto'], 2) . ' no pudo ser procesado. No se ha realizado ningún cargo a su tarjeta en relación con este intento de pago.</p>
                                <p>Para resolver esta situación y proceder con su pago, le sugerimos seguir los siguientes pasos:</p>
                                <ul style="list-style-type: none;">
                                    <li><i class="fas fa-caret-right"></i> Verifique que los detalles de su tarjeta sean correctos, incluidos el número de tarjeta, la fecha de vencimiento y el código de seguridad CVV.</li>
                                    <li><i class="fas fa-caret-right"></i> Revisar que el monto a pagar se encuentre disponible en su tarjeta.</li>
                                    <li><i class="fas fa-caret-right"></i> Comunicarse al banco emisor de la tarjeta para obtener asistencia adicional.</li>
                                    <li><i class="fas fa-caret-right"></i> Si el problema persiste, le sugerimos intentar realizar su pago con otra tarjeta.</li>
                                </ul>
                                <p>En breve se le enviará esta información al correo electrónico ' . $cobro_tarjeta['correo'] . '</p>
                                <p>Si tiene alguna duda, puede comunicarse al Departamento de Finanzas y Contabilidad al teléfono 961 125 1508 Ext. 116 de lunes a viernes de 8:00 am a 4:00 pm</p>';
                $smarty->assign('success', false);
                $smarty->assign('message_txt', $message_txt);
                $details_body = array(
                    "monto" => utf8_decode(number_format($cobro_tarjeta['monto'], 2)),
                    "referencia" => utf8_decode($referencia)
                );
                $details_subject = array();
                $attachment = [];
                $fileName = [];
                $email = $cobro_tarjeta['correo'];
                if ($email != '')
                    $sendmail->PrepareAttachment($message[7]["subject"], $message[7]["body"], $details_body, $details_subject, $email, '', $attachment, $fileName);
            }
            /**
             * RESULTADO_PAYW
             * A - Aprobada
             * D - Declinada
             * R - Rechazada
             * T - Sin respuesta del autorizador
             * 
             * TEXTO
             * Texto adicional que proporciona mayor explicación sobre el resultado de la transacción
             * 
             * FECHA_REQ_CTE
             * Fecha y hora en que la transacción / comando fue recibida del cliente en horario Payworks. Formato: AAAAMMDD HH:MM:SS.sss
             * 
             * CODIGO_AUT
             * Código de autorización entregado por el autorizador para una transacción aprobada
             * 
             * REFERENCIA
             * Número de referencia asignada a esta transacción por parte de Payworks
             * 
             * ID_AFILIACION
             * El número de afiliación a la que corresponde la transacción respondida
             * 
             * FECHA_RSP_CTE
             * Fecha y hora en que la transacción / comando fue respondido al cliente. Formato: AAAAMMDD HH:MM:SS.sss
             */
        }
        catch(Exception $ex)
        {
            var_dump($ex);
        }
    }
    else
    {
        $message_txt = '<p><i class="fas fa-exclamation-triangle fa-3x"></i></p>
                    <p>Error al procesar el pago</p>
                    <p>Fallo en la autenticación 3D Secure de la tarjeta</p>
                    <p>El pago que intento realizar con la referencia ' . $referencia3d . ' no pudo ser procesado debido a un problema con la autenticación 3D Secure.</p>
                    <p>No se ha realizado ningún cargo a su tarjeta en relación con este intento de pago fallido.</p>
                    <p>Para resolver esta situación y proceder con su pago, le sugerimos verifique que los detalles de su tarjeta sean correctos, incluidos el número de tarjeta, la fecha de vencimiento y el código de seguridad CVV. En caso de continuar con este error, le sugerimos intentar realizar su pago con otra tarjeta.</p>
                    <p>Si tiene alguna duda, puede comunicarse al Departamento de Finanzas y Contabilidad al teléfono 961 125 1508 Ext. 116 de lunes a viernes de 8:00 am a 4:00 pm</p>';
        $conceptos->deleteCobroTarjeta('NoAuth', $card_number);
        $smarty->assign('success', false);
        $smarty->assign('message_txt', $message_txt);
    } 
}