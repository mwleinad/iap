<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');


switch ($_POST['opcion']) {
    case 'addSubject':
        $errors = [];
        $majorId = intval($_POST['tipo']);
        $name = strip_tags($_POST['name']);
        $code = strip_tags($_POST['code']);
        $welcomeText = strip_tags($_POST['welcomeText']);
        $introduction = strip_tags($_POST['introduction']);
        $intentions = strip_tags($_POST['intentions']);
        $objectives = strip_tags($_POST['objectives']);
        $methodology = strip_tags($_POST['methodology']);
        $politics = strip_tags($_POST['politics']);
        if (empty($majorId)) {
            $errors['tipo'] = "No se olvide de seleccionar el tipo.";
        }
        if (empty($name)) {
            $errors['name'] = "No se olvide de poner el nombre.";
        }
        if (empty($code)) {
            $errors['code'] = "No se olvide de poner la clave.";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $subject->setTipo($majorId);
        $subject->setName($name);
        $subject->setClave($code);
        $subject->setWelcomeText($welcomeText);
        $subject->setIntroduction($introduction);
        $subject->setIntentions($intentions);
        $subject->setObjectives($objectives);
        $subject->setMethodology($methodology);
        $subject->setPolitics($politics);
        $response = $subject->Save();
        if ($response > 0) {
            echo json_encode([
                'growl'     => true,
                'message'   => 'Se ha creado la currícula',
                'type'      => 'success',
                'modal_close'   => true,
                'dtreload'  => '#datatable'
            ]);
        } else {
            echo json_encode([
                'growl'     => true,
                'message'   => 'No se ha podido crear la currícula.',
                'type'      => 'error'
            ]);
        }
        break;
    case 'addModule': 
        $smarty->assign('id', $_POST["subject"]); 
        $subject->setSubjectId($_POST["subject"]);
        $mySubject = $subject->Info($_GET["subject"]);
        $smarty->assign('subject', $mySubject);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/new/new-module.tpl")
        ]);
        break;
    default:
        $id = $_POST['subject'];
        $smarty->assign('id', $id);
        echo json_encode([
            'modal' => true,
            'html'  => $smarty->fetch(DOC_ROOT . "/templates/boxes/new/view-modules-popup.tpl")
        ]);
        break;
}
