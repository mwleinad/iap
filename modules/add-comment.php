<?php

/* For Session Control - Don't remove this */
//$user->allow_access(8);
//print_r($_SESSION);exit;

// echo "<pre>"; print_r($_POST);
// echo "<pre>"; print_r($_GET);
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
        $forum->AddReply();
    }
    //TODO redirect back to page
	header("Location:".WEB_ROOT."/add-reply/id/".$_POST["moduleId"]."/topicsubId/".$_POST["topicsubId"]."");
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