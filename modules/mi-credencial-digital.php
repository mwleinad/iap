<?php
include_once 'google-api/vendor/autoload.php';
$courseId = $_GET['id'];
$credential = $student->getCredential($User['userId'], $courseId); 
$course->setCourseId($courseId);
$courseInfo = $course->Info();
$smarty->assign("credential", $credential);
$courseInfo['name'] = preg_replace('/[0-9]+/', '', $courseInfo['name']);
$curso = $courseInfo['majorName'] . " EN " . str_replace("EN", "", $courseInfo['name']);
$smarty->assign("curso", $curso);  
if ($_POST) { 
    $imagenCodificada = $_POST['imagen']; 
    if (strlen($imagenCodificada) <= 0) exit("No se recibió ninguna imagen");
    //La imagen traerá al inicio data:image/png;base64, cosa que debemos remover 
    $imagenCodificadaLimpia = str_replace("data:image/png;base64,", "", urldecode($imagenCodificada));

    //Venía en base64 pero sólo la codificamos así para que viajara por la red, ahora la decodificamos y
    //todo el contenido lo guardamos en un archivo
    $imagenDecodificada = base64_decode($imagenCodificadaLimpia);

    $token = bin2hex(random_bytes(8));
    //Calcular un nombre único
    $carpeta = "files/credentials";
    if (!file_exists($carpeta)) {
        mkdir($carpeta);
    }
    $nombreImagen = "foto_$token.png";  
    file_put_contents($carpeta . "/" . $nombreImagen, $imagenDecodificada);
    $carpetaId = "1tsqsqiwewa2BRadf8UvXnQpshXAPyWPX";
    $google = new Google($carpetaId);
    $google->setArchivoNombre($nombreImagen); 
    $google->setArchivo(DOC_ROOT."/".$carpeta."/".$nombreImagen);
    $respuesta = $google->subirArchivo(); 
    $files = '{
        "filename": "'.$respuesta['name'].'",
        "googleId": "'.$respuesta['id'].'",
        "mimeType": "'.$respuesta['mimeType'].'",
        "urlBlank": "https://drive.google.com/open?id='.$respuesta['id'].'",
        "urlEmbed": "https://drive.google.com/uc?id='.$respuesta['id'].'"
    }'; 
    unlink(DOC_ROOT."/".$carpeta."/".$nombreImagen);
    if (!$credential) { //No existe la credencial
        $student->createCredential($User['userId'], $courseId, $files);
    } else {  
        $response = $credential['files']['photo'];
        $google->setArchivoID($response['googleId']);
        $respuesta = $google->eliminarArchivo();
        $student->editCredential($User['userId'], $courseId, $files, 0);
    }

    // $photoCredential = $_POST['perfil']; 
    // $student->UpdateAvatarCredential($User['userId'], $photoCredential);
    
    print_r(json_encode([
        'respuesta' =>true
    ]));
    exit;
}
