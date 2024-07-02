<?php

class Major extends Main
{
	private $majorId;
	private $name;
	private $description;
	private $identifier;
	private $authorization;
	
	public function setMajorId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->majorId = $value;
	}
	
	public function getMajorId()
	{
		return $this->majorId;
	}
	
	public function setName($value)
	{
		$this->Util()->ValidateString($value, $max_chars=60, $minChars = 1, "Nombre");
		$this->name = $value;
	}
	
	public function setDescription($value)
	{
		$this->description = $value;
	}
	
	public function setIdentifier($value)
	{
		$this->identifier = $value;
	}
	
	public function setAuthorization($value)
	{
		$this->authorization = $value;
	}
	
	public function Save(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sql = "INSERT INTO 
					`major` 
					(
						name,
						description 
					)
					 VALUES 
					 (
					 	'".$this->name."',
						'".$this->description."'
					)";	
					
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		
		$this->Util()->setError(10073, "complete");
		$this->Util()->PrintErrors();
		
		return true;
				
	}
	
	public function Edit(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sql = "UPDATE 
					`major` 
				SET
					 name = '".$this->name."',
					 description = '".$this->description."'
				WHERE
					majorId = ".$this->majorId;	
					
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		
		$this->Util()->setError(10075, "complete");
		$this->Util()->PrintErrors();
		
		return true;
				
	}
	
	public function Delete(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sql = "DELETE FROM 
					`major`
				WHERE 
					majorId = ".$this->majorId;		
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		
				
		$this->Util()->setError(10074, "complete");
		$this->Util()->PrintErrors();
		
		return true;
				
	}


	public function Enumerate()
	{
		if(in_array($_SESSION['User']['userId'],[253])){
			$sql = "SELECT * FROM major WHERE majorId IN(3,5) ORDER BY name ASC";
		}else{
			$sql = "SELECT * FROM major ORDER BY name ASC";
		}
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		foreach($result as $key => $row)
		{
			$result[$key]["wrappedDescription"] = $this->Util()->ShortString($result[$key]["description"], 50);
		}
		
		return $result;
	}
	
	public function Info()
	{
		$this->Util()->DB()->setQuery("SELECT * FROM major WHERE majorId = '".$this->majorId."'");
		$row = $this->Util()->DB()->GetRow();
		
		$row["decodedDescription"] = $this->Util()->DecodeString($row["description"]);
		return $row;
	}	
	
	public function GetNameById(){
			
		$sql = 'SELECT 
					name 
				FROM 
					major 
				WHERE 
					majorId = '.$this->majorId;
		
		$this->Util()->DB()->setQuery($sql);
		
		return $this->Util()->DB()->GetSingle();
		
	}
	
}


?>