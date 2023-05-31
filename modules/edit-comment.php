<?php
$comentarioId = intval($_GET['id']);
$forum->setReplyId($comentarioId);
$infoComentario = $forum->ReplyInfo();
if ($_POST) {
    $comentario = $_POST['reply'];
    $forum->setReply($comentario);
    // print_r($infoComentario);
    if (empty($_POST['reply'])) {
        $errors['reply'] = "El campo comentario es requerido";
    }
    if ($_FILES) {
        $response = $util->Util()->validarSubida(['types' => ['image/jpeg'], 'size' => 5242880]);
        if (!$response['estatus']) {
            $errors["path"] = $response['mensaje'];
        } else {
            $forum->setArchivo($_FILES);
            $forum->setArchivoActual($infoComentario['path']);
            $forum->setUserId($infoComentario['userId']);
            $forum->setTopicId($infoComentario['topicId']);
        }
    }

    if (!empty($errors)) {
        header('HTTP/1.1 422 Unprocessable Entity');
        header('Content-Type: application/json; charset=UTF-8');
        echo json_encode([
            'errors'    => $errors
        ]);
        exit;
    }
    $forum->EditReply();
    echo json_encode([
        'growl'     => true,
        'message'   => 'Comentario actualizado',
        'reload'    => true
    ]);
    exit;
}
$smarty->assign("comentario", $infoComentario);
