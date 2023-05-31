<?php

/* For Session Control - Don't remove this */
//$user->allow_access(8);
// echo "<pre>"; print_r($_SESSION);
// echo "<pre>"; print_r($_POST);
// exit;

if($_POST)
{
    if(isset($_POST['replyId'])){
        $forum->setTopicsubId($_POST["topicsubId"]);
        $forum->setModuleId($_POST["moduleId"]);
        $forum->setReplyId($_POST["replyId"]);
        $forum->setReply($_POST["reply"]);
        if($User["positionId"]==0 || $User["positionId"]=="" || $User["positionId"]==null || !isset($User["positionId"])){
            $forum->setUserId($User["userId"]);
            $forum->setPersonalId(0);
        }
        else{

            $forum->setUserId(0);
            $forum->setPersonalId($User["userId"]);
        }
        if (empty($_POST['reply'])) {
            $errors['reply'] = "El campo comentario es requerido";
        }
        if (!empty($errors)) {
            header('HTTP/1.1 422 Unprocessable Entity');
            header('Content-Type: application/json; charset=UTF-8');
            echo json_encode([
                'errors'    => $errors
            ]);
            exit;
        }
        $forum->AddReply();
        echo json_encode([
            'growl'     =>true,
            'message'   =>"Comentario agregado",
            'reload'    =>true
        ]);
        exit;
    }

	 
	exit;
}

//print_r($_SESSION);exit;

$forum->setReplyId($_GET['id']);
$reply = $forum->ReplyInfo();
// echo $_GET["Id"];
$smarty->assign('reply', $reply);
$smarty->assign('positionId', $User["positionId"]);

//echo $_GET["course"];
$smarty->assign('id', $_GET["id"]);
$smarty->assign('moduleId', $_GET["moduleId"]);
$smarty->assign('topicsubId', $_GET["topicsubId"]);

if($User["positionId"]!=1 && $User["positionId"]!=4)
    $smarty->assign('mnuMain', "modulo");
?>