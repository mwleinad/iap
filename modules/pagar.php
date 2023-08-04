<?php
if($_SESSION['User']['type'] != 'student')
    exit;

$pagoId = $_GET['id'];
$conceptos->setPagoId($pagoId);
$pago = $conceptos->pago();
$smarty->assign('pago', $pago);
$student->setUserId($_SESSION['User']["userId"]);
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
        $curl = curl_init('https://via.banorte.com/secure3d/Solucion3DSecure.htm');
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt( $curl, CURLOPT_FOLLOWLOCATION, true );
        curl_setopt($curl, CURLOPT_POST, true);
        $numero_tarjeta = $_POST['card_number'];
        $fecha_exp = $_POST['expiration'];
        $monto = 500;
        $tmp = intval(substr($numero_tarjeta, 0, 1));
        $marca_tarjeta = 'VISA';
        if($tmp == 5)
            $marca_tarjeta = 'MC';
        $id_afiliacion = ID_AFILIACION;
        $nombre_comercio = 'IAP Chiapas';
        $ciudad_comercio = 'Tuxtla Gutiérrez';
        $url_respuesta = WEB_ROOT . '/pagar/id/' . $pagoId . '/datos/Ok';
        $referencia3d = 'TESTINGCZ';
        $ciudad = $cardholder['city'];
        $pais = $cardholder['country'];
        $correo = $cardholder['email'];
        $name = $_POST['name'];
        $last_name = $_POST['last_name'];
        $codigo_postal = $cardholder['postal_code'];
        $estado = $cardholder['state_code'];
        $calle = $cardholder['street'];
        $numero_celular = $cardholder['mobile'];
        $tipo_tarjeta = $_POST['type'];
        $data = [
            'NUMERO_TARJETA' => $numero_tarjeta,
            'FECHA_EXP' => $fecha_exp,
            'MONTO' => $monto,
            'MARCA_TARJETA' => $marca_tarjeta,
            'ID_AFILIACION' => $id_afiliacion,
            'NOMBRE_COMERCIO' => $nombre_comercio,
            'CIUDAD_COMERCIO' => $ciudad_comercio,
            'URL_RESPUESTA' => $url_respuesta,
            'CERTIFICACION_3D' => 03,
            'REFERENCIA_3D' => $referencia3d,
            'CIUDAD' => $ciudad,
            'PAIS' => $pais,
            'CORREO' => $email,
            'NOMBRE' => $name,
            'APELLIDO' => $last_name,
            'CODIGO_POSTAL' => $codigo_postal,
            'ESTADO' => $estado,
            'CALLE' => $calle,
            'VERSION_3D' => 2,
            'NUMERO_CELULAR' => $numero_celular,
            'TIPO_TARJETA' => $tipo_tarjeta
        ];
        $payload = json_encode($data);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $payload);
        // curl_setopt($curl, CURLOPT_COOKIEJAR,  __DIR__.'/cookies.txt');
        curl_setopt($curl, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
        $result = curl_exec($curl);
        curl_close($curl);
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