<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();


switch($_POST["type"])
{
    case 'recupera':
        $correo = strip_tags($_POST['email']);
        $student->setPermiso(0);
        $student->setEmail($correo);
        if(empty($_POST['email'])){
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    =>[
                    'email' =>'Por favor, no se olvide de introducir el correo'
                ]
            ]);
            exit;
        }elseif (!filter_var($correo, FILTER_VALIDATE_EMAIL)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    =>[
                    'email' =>'Por favor, introduzca un correo válido'
                ]
            ]);
            exit;
        }
 
		
        if(!$student->enviarMail())
        {
            echo json_encode([
                'selector'  =>"#divMsj",
                'html'      =>"Ocurrió un error con el envío de correo, intente más tarde"
            ]);
        }else{
            echo json_encode([
                'selector'  =>"#divMsj",
                'html'      =>'Se ha enviado un correo con tus datos de acceso <script>$("#divMsj").removeAttr("style");</script>',
                'duracion'  =>3000,
                'location'  =>WEB_ROOT
            ]);
        }
        break;
}

?>
