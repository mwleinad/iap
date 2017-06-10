<?php

	class Announcement extends Module
	{
		private $title;
		private $description;
		private $announcementId;
		
		
		public function setAnnouncementId($value)
		{
			$this->Util()->ValidateInteger($value);
			$this->announcementId = $value;
		}
		
		public function setTitle($value)
		{
			$this->Util()->ValidateString($value, 50000, 0, 'title');
			$this->title = $value;
		}

		public function setDescription($value)
		{
			$this->Util()->ValidateString($value, 50000, 0, 'description');
			$this->description = $value;
		}
		
		public function setStudentLimit($value)
		{
			$this->Util()->ValidateInteger($value, 100, 1);
			$this->student_limit = $value;
		}
		
		public function Enumerate($courseId = 0, $courseModuleId = 0)
		{
			//if($courseModuleId)
			//{
				$courseModuleId = "AND courseModuleId = '".$courseModuleId."'";
			//}
			
			 $sql = "
				SELECT * FROM announcement
				WHERE courseId = '".$courseId."' ".$courseModuleId." 
				ORDER BY date DESC LIMIT 20";
			// exit;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();
			
			foreach($result as $key => $res)
			{
				$result[$key]["description"] = $this->Util()->DecodeTiny($result[$key]["description"]);
			}
			return $result;
		}
		
		public function Save()
		{
			$module = new Module;
			if($this->getCourseModuleId())
			{
				$module->setCourseModuleId($this->getCourseModuleId());
				$myModule = $module->InfoCourseModule();
				$courseId = $myModule["courseId"];
				$courseModuleId = $this->getCourseModuleId();
				$group = new Group;
				$group->setCourseModuleId($this->getCourseModuleId());
				$group->setCourseId($myModule["courseId"]);
				$theGroup = $group->DefaultGroup();
				$modulo=$this->Util()->acento($myModule["name"]);
                $titulo=$this->Util()->acento($this->title);
				//echo $modulo;
				$message[3]["subject"] = "Nuevo anuncio disponible en el modulo ".$modulo." | ".$titulo;
				$message[3]["body"] = $this->Util()->DecodeTiny($this->description);
				
				$details_body = array();
				$details_subject = array();
				$sendmail = new Sendmail;
				 foreach($theGroup as $key => $value)
				{
                $nombremail=$this->Util()->acento($value["names"]);
				 $sendmail->Prepare($message[3]["subject"], $message[3]["body"], $details_body, $details_subject, $value["email"], $nombremail); 		
					
				}
						
			}
			else
			{
				$courseId = 0;		
				$courseModuleId = 0;		
			}

			$this->Util()->DB()->setQuery("
			INSERT INTO  `announcement` (
				`courseId` ,
				`courseModuleId` ,
				`title` ,
				`date` ,
				`personalId` ,
				`description`
				)
				VALUES (
				'".$courseId."',  
				'".$courseModuleId."',  
				'".$this->title."',  
				'".date("Y-m-d H:i:s")."',  
				'".$_SESSION["User"]["userId"]."',  
				'".$this->description."'
				)");
			$result = $this->Util()->DB()->InsertData();
			
			$this->Util()->setError(90000, 'complete', "Has agregado un aviso");
			$this->Util()->PrintErrors();

		}
		
		
	public function Delete(){
		
		 $sql = "DELETE FROM 
					announcement
				WHERE 
					announcementId = ".$this->announcementId;
							
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->DeleteData();
	
		$this->Util()->setError(10032, "complete");
		$this->Util()->PrintErrors();
		
		return true;
				
	}
	
	
	
	
		
}
		
?>