<?php
		
	/* For Session Control - Don't remove this */
//	$user->allow_access(8);	

        

	$module->setCourseModuleId($_GET["id"]);
	
	
	$myModule = $module->InfoCourseModule();
	$smarty->assign('myModule', $myModule);
	
		
	
		
	$forum->setCourseId($myModule["courseId"]);
    $smarty->assign('id', $myModule["courseId"]);
	
	

	 $topicId=$_GET["topicId"];

	
	
	$forum->setTopicId($topicId);
	$smarty->assign('topicId',$topicId);
	
	$dato=$forum->TopicInfo();
	$forum = $forum->Enumeratesub();
	
    //$dato = $forum->TopicInfo();
	
	// echo "<pre>"; print_r($_GET);
	// exit;
	//	print_r($forum);
$smarty->assign('positionId', $User["positionId"]);
	$smarty->assign('forum', $forum);
	$smarty->assign('asunto', $dato["subject"]);
	
	$smarty->assign('id', $_GET["id"]);
	
	
	if($User["positionId"]==0)
	$smarty->assign('mnuMain', "modulo");
	
	
	$smarty->assign('mnuSubmain','foro');

?>