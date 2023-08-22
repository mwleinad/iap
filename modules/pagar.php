<?php
if($_SESSION['User']['type'] != 'student')
    exit;

$pagoId = $_GET['id'];
$conceptos->setPagoId($pagoId);
$pago = $conceptos->pago();
$smarty->assign('pago', $pago);
$student->setUserId($_SESSION['User']["userId"]);
$smarty->assign('processing', false);
if($_POST)
{
    $option = $_POST['option'];
    $cardholder = $student->getCardholder();
    if($option == 'cardholder')
    {
        $name = $_POST['name'];
        $last_name = $_POST['last_name'];
        $street = $_POST['street'];
        $city = $_POST['city']; 
        $state_code = $_POST['state'];
        $postal_code = $_POST['postal_code'];
        $country = 'MX'; 
        $email = $_POST['email']; 
        $mobile = $_POST['mobile'];
        if(!$cardholder)
            $student->saveCardholder($city, $country, $email, $name, $last_name, $postal_code, $state_code, $street, $mobile);
        else
            $student->updateCardholder($city, $email, $name, $last_name, $postal_code, $state_code, $street, $mobile);
        header('Location:' . WEB_ROOT . '/pagar/id/' . $pagoId . '/datos/Ok');
		exit;
    }

    if($option == 'pay')
    {
        setcookie('code', $_SESSION['User']['userId'], time() + 900);
        setcookie('type', $_SESSION['User']['type'], time() + 900);
        $smarty->assign('processing', true);
        $cobroTarjetaId = 0;
        $card_number = null;
        try
        {
            $conceptos->setConcepto($pago['concepto_id']);
            $concepto = $conceptos->getConcepto();
            $cobrosTarjeta = $conceptos->verificarCobroTarjeta();
            $abonos = 0;
            if ($pago['cobros'] > 0)
                $abonos = $conceptos->monto();

            $numero_tarjeta = $_POST['card_number'];
            $card_number = $util->cardFormat($numero_tarjeta);
            $fecha_exp = $_POST['expiration'];
            $monto = $pago['total'] - $abonos;
            $tmp = intval(substr($numero_tarjeta, 0, 1));
            $marca_tarjeta = 'VISA';
            if($tmp == 5)
                $marca_tarjeta = 'MC';
            $id_afiliacion = ID_AFILIACION;
            $nombre_comercio = 'IAP Chiapas';
            $ciudad_comercio = 'Tuxtla Gutiérrez';
            $url_respuesta = WEB_ROOT . '/procesar-pago';
            $referencia3d = str_pad(($cobrosTarjeta + 1), 2, '0', STR_PAD_LEFT) . 'IAP' . str_pad($pago['pago_id'], 10, '0', STR_PAD_LEFT);
            $ciudad = $cardholder['city'];
            $pais = $cardholder['country'];
            $correo = $cardholder['email'];
            $nombre = $_POST['name'];
            $apellido = $_POST['last_name'];
            $codigo_postal = $cardholder['postal_code'];
            $estado = $cardholder['state_code'];
            $calle = $cardholder['street'];
            $numero_celular = $cardholder['mobile'];
            $tipo_tarjeta = $_POST['type'];
            $codigo_seguridad = $_POST['security'];
            $data = [
                'NUMERO_TARJETA' => $numero_tarjeta,
                'FECHA_EXP' => $fecha_exp,
                'MONTO' => 2, // $monto
                'MARCA_TARJETA' => $marca_tarjeta,
                'ID_AFILIACION' => $id_afiliacion,
                'NOMBRE_COMERCIO' => $nombre_comercio,
                'CIUDAD_COMERCIO' => $ciudad_comercio,
                'URL_RESPUESTA' => $url_respuesta,
                'CERTIFICACION_3D' => '03',
                'REFERENCIA3D' => $referencia3d,
                'CIUDAD' => $ciudad,
                'PAIS' => $pais,
                'CORREO' => $correo,
                'NOMBRE' => $nombre,
                'APELLIDO' => $apellido,
                'CODIGO_POSTAL' => $codigo_postal,
                'ESTADO' => $estado,
                'CALLE' => $calle,
                'VERSION_3D' => 2,
                'NUMERO_CELULAR' => $numero_celular,
                'TIPO_TARJETA' => $tipo_tarjeta
            ];
            $cobro_tarjeta = $conceptos->getCobroTarjeta($referencia3d);
            $conceptos->setPagoId($pagoId);
            $conceptos->setMonto($monto);
            if(!is_array($cobro_tarjeta))
                $cobroTarjetaId = $conceptos->guardarCobroTarjeta($marca_tarjeta, $referencia3d, $correo, $nombre, $apellido, $codigo_postal, $numero_celular, $tipo_tarjeta, $numero_tarjeta, str_replace('/', '', $fecha_exp), $codigo_seguridad, session_id());
            else
                $cobroTarjetaId = $cobro_tarjeta['id'];
            $conceptos->setCobroTarjetaId($cobroTarjetaId);
            $data_string = http_build_query($data);
            $curl = curl_init();
            if ($curl === false)
                throw new Exception('Failed to initialize');
            curl_setopt($curl, CURLOPT_URL, 'https://via.banorte.com/secure3d/Solucion3DSecure.htm');
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, BN_SSL);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data_string);
            $result = curl_exec($curl);
            if ($result === false)
                throw new Exception(curl_error($curl), curl_errno($curl));
            curl_close($curl);
        }
        catch(Exception $ex)
        {
            $conceptos->deleteCobroTarjeta('NoAuth', $card_number);
        }
    }
}

$alumno = $student->getInfo();

$states = [
    'AG' => 'Aguascalientes',
    'BC' => 'Baja California',
    'BS' => 'Baja California Sur',
    'CM' => 'Campeche',
    'CS' => 'Chiapas',
    'CH' => 'Chihuahua',
    'CX' => 'Ciudad de México',
    'CO' => 'Coahuila',
    'CL' => 'Colima',
    'DG' => 'Durango',
    'GT' => 'Guanajuato',
    'GR' => 'Guerrero',
    'HG' => 'Hidalgo',
    'JC' => 'Jalisco',
    'EM' => 'Estado de México',
    'MI' => 'Michoacán',
    'MO' => 'Morelos',
    'NA' => 'Nayarit',
    'NL' => 'Nuevo León',
    'OA' => 'Oaxaca',
    'PU' => 'Puebla',
    'QT' => 'Querétaro',
    'QR' => 'Quintana Roo',
    'SL' => 'San Luis Potosí',
    'SI' => 'Sinaloa',
    'SO' => 'Sonora',
    'TB' => 'Tabasco',
    'TM' => 'Tamaulipas',
    'TL' => 'Tlaxcala',
    'VE' => 'Veracruz',
    'YU' => 'Yucatán',
    'ZA' => 'Zacatecas'
];
$validated_data = $_GET['datos'];
$smarty->assign('validated_data', $validated_data);
if($validated_data == 'Ok')
{
    $conceptos->setConcepto($pago['concepto_id']);
    $concepto = $conceptos->getConcepto();
    $abonos = 0;

    if ($pago['cobros'] > 0)
        $abonos = $conceptos->monto();

    $smarty->assign('concepto', $concepto);
    $smarty->assign('abonos', $abonos);
}
else
    $smarty->assign('states', $states);

$cardholder = $student->getCardholder();
$smarty->assign('cardholder', $cardholder);