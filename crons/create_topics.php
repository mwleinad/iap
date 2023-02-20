<?php

define("DOC_ROOT", "/home/iapchiap/public_html");

include_once(DOC_ROOT.'/init.php');
include_once(DOC_ROOT.'/config.php');
include_once(DOC_ROOT.'/libraries.php');

if (!isset($_SESSION)) 
{
  session_start();
}

	$result = $course->AllActiveCourseModules();	
	
	// $topics = array("Dudas para el Docente", "Asesoria Academica", "Presentacion Personal", "Foro de Discusion");
	$topics = array("Presentacion Personal", "Foro de Discusion");
	foreach($result as $key => $val)
	{
		//si no hay foros insertar
		$db->setQuery("SELECT COUNT(*) FROM topic WHERE courseId > 52 AND courseId = '".$val["courseId"]."'");
		echo $count = $db->GetSingle();
		
		if($count == 0)
		{
			foreach($topics as $topic)
			{
				$forum->setSubject($topic);
				$forum->setCourseId($val["courseId"]);
				$forum->setUserId(0);
				$forum->CreateForums();
			}
		}
	}
	$courses = $course->EnumerateActive();

	$topics = array("General");
	
/*	foreach($courses as $key => $val)
	{
		//check if forum exists, if not, create.
		
		foreach($topics as $topic)
		{
			$db->setQuery("SELECT * FROM topicsub WHERE nombre = '".$topic."' AND topicId = '".$val["courseId"]."'");
			$count = $db->GetSingle();
			echo $count;
			if($count == 0)
			{
				$forum->setSubject($topic);
				$forum->setCourseId($val["courseId"]);
				$forum->setUserId(0);
				$forum->AddTopic();
			}
		}
	}
	*/
?>