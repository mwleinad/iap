<?php
$courseId = $_GET['id'];
$credential = $student->getCredential($User['userId'], $courseId);
$course->setCourseId($courseId);
$courseInfo = $course->Info();
$smarty->assign("credential", $credential);
$courseInfo['name'] = preg_replace('/[0-9]+/', '', $courseInfo['name']);
$curso = $courseInfo['majorName'] . " EN " . str_replace("EN", "", $courseInfo['name']);
$smarty->assign("curso", $curso);

if ($_POST) {
    $imagenCodificada = file_get_contents("php://input"); //Obtener la imagen
    if (strlen($imagenCodificada) <= 0) exit("No se recibió ninguna imagen");
    //La imagen traerá al inicio data:image/png;base64, cosa que debemos remover
    $imagenCodificadaLimpia = str_replace("data:image/png;base64,", "", urldecode($imagenCodificada));

    //Venía en base64 pero sólo la codificamos así para que viajara por la red, ahora la decodificamos y
    //todo el contenido lo guardamos en un archivo
    $imagenDecodificada = base64_decode($imagenCodificadaLimpia);

    $token = bin2hex(random_bytes(8));
    //Calcular un nombre único
    $nombreImagen = "foto_$token.png";
    $carpeta = "files/credentials";
    if (!file_exists($carpeta)) {
        mkdir($carpeta);
    }
    if (!$credential) { //No existe la credencial
        $student->createCredential($User['userId'], $courseId, $nombreImagen);
    } else {
        if (file_exists($carpeta . "/" . $credential['image'])) {
            unlink($carpeta . "/" . $credential['image']);
        }
        $student->editCredential($User['userId'], $courseId, $nombreImagen, 0);
    }
    //Escribir el archivo
    file_put_contents($carpeta . "/" . $nombreImagen, $imagenDecodificada);

    //Terminar y regresar el nombre de la foto
    exit(WEB_ROOT . "/" . $carpeta . "/" . $nombreImagen);
}
