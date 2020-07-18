<?php

	class Recording extends Module
	{
		private $title;
		private $embed;

		public function setTitle($value)
		{
			$this->Util()->ValidateString($value, 50000, 1, 'title');
			$this->title = $value;
		}

		public function setEmbed($value)
		{
			$this->Util()->ValidateString($value, 50000, 1, 'embed');
			$this->embed = $value;
		}
		
		public function Info($id = null)
		{
			if(!$id)
			{
				$this->Util()->DB()->setQuery("
					SELECT * FROM recording
					ORDER BY date DESC LIMIT 1");
			}
			else
			{
				$this->Util()->DB()->setQuery("
					SELECT * FROM recording
					WHERE recordingId = '".$id."'");
			}
			$row = $this->Util()->DB()->GetRow();
			
			return $row;
		}
	
		public function Enumerate($courseId = 0, $courseModuleId = 0)
		{
			$this->Util()->DB()->setQuery("
				SELECT * FROM recording
				ORDER BY date DESC LIMIT 100");
			$result = $this->Util()->DB()->GetResult();
			
			return $result;
		}
		
		public function Save()
		{
			if($this->Util()->PrintErrors())
			{
				// si hay errores regresa false
				return false;
			}
			
			$this->Util()->DB()->setQuery("
			INSERT INTO  `recording` (
				`title` ,
				`embed` ,
				`date` 
				)
				VALUES (
				'".$this->title."',  
				'".$this->embed."',  
				'".date("Y-m-d")."'
				)");
			$result = $this->Util()->DB()->InsertData();
			
			$this->Util()->setError(90000, 'complete', "Has agregado una grabacion");
			$this->Util()->PrintErrors();
			return true;

		}
		
		public function Update($id = null)
		{
			if($this->Util()->PrintErrors())
			{
				// si hay errores regresa false
				return false;
			}
			
			$this->Util()->DB()->setQuery("
			UPDATE recording SET
				title = '".$this->title."',
				embed = '".$this->embed."'
			WHERE recordingId = '".$id."'");
			$this->Util()->DB()->UpdateData();
			
			$this->Util()->setError(90000, 'complete', "Has actualizado una grabacion");
			$this->Util()->PrintErrors();
			return true;

		}
		
		public function Delete($id = null)
		{
			$this->Util()->DB()->setQuery("
			DELETE FROM recording 
			WHERE recordingId = '".$id."'");
			echo $this->Util()->DB()->query;
			$this->Util()->DB()->UpdateData();
			
			$this->Util()->setError(90000, 'complete', "Has borrado una grabacion");
			$this->Util()->PrintErrors();
			return true;

		}		
		
	}	
?>