<?php 

class Institution extends Main
{
	private $institutionId;
	private $name;
	private $name_long;
	private $identifier;
	private $ubication;
	private $ubication_long;
	private $phone;
	private $fax;
	private $jefeOficina;
	private $presidente;
	private $respServiciosEscolares;
	private $directorAcademico;
	private $jefeServiciosEscolares;

	public function setDirectorAcademico($value)
	{
		$this->Util()->ValidateString($value, 255, 1, 'Director Academico');
		$this->directorAcademico = $value;
	}

	public function setJefeServiciosEscolares($value)
	{
		$this->Util()->ValidateString($value, 255, 1, 'Jefe de Servicios Escolares');
		$this->jefeServiciosEscolares = $value;
	}

	public function setJefeOficina($value)
	{
		$this->Util()->ValidateString($value, 255, 1, 'Jefe de Oficina');
		$this->jefeOficina = $value;
	}

	public function setPresidente($value)
	{
		$this->Util()->ValidateString($value, 255, 1, 'Presidente');
		$this->presidente = $value;
	}

	public function setRespServiciosEscolares($value)
	{
		$this->Util()->ValidateString($value, 255, 1, 'Responsable de Servicios Escolares');
		$this->respServiciosEscolares = $value;
	}

	public function setInstitutionId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->institutionId = $value;
	}

	public function getInstitutionId()
	{
		return $this->institutionId;
	}

	public function setName($value)
	{
		$this->Util()->ValidateString($value, 50, 1, 'Nombre');
		$this->name = $value;
	}


	public function getName()
	{
		return $this->name;
	}

	public function setName_long($value)
	{
		$this->Util()->ValidateString($value, 120, 1, 'Nombre Completo');
		$this->name_long = $value;
	}

	public function getName_long()
	{
		return $this->name_long;
	}

	public function setIdentifier($value)
	{
		$this->Util()->ValidateString($value, 30, 1, 'Clave C.T.');
		$this->identifier = $value;
	}

	public function getIdentifier()
	{
		return $this->identifier;
	}

	public function setUbication($value)
	{
		$this->Util()->ValidateString($value, 60, 1, 'Ubicacion');
		$this->ubication = $value;
	}

	public function getUbication()
	{
		return $this->ubication;
	}

	public function setUbication_long($value)
	{
		$this->Util()->ValidateString($value, 80, 1, 'Direccion');
		$this->ubication_long = $value;
	}

	public function getUbication_long()
	{
		return $this->ubication_long;
	}

	public function setPhone($value)
	{
		$this->Util()->ValidateString($value, 14, 14, 'Telefono');
		if(!preg_match('/\d{2,3}-\d{2}-\d-\d{2}-\d{2}/', $value))
			$this->Util()->setError(50104, 'error');
		$this->phone = $value;
	}

	public function getPhone()
	{
		return $this->phone;
	}

	public function setFax($value)
	{
		$this->Util()->ValidateString($value, 14, 14, 'Fax');
		if(!preg_match('/\d{2,3}-\d{2}-\d-\d{2}-\d{2}/', $value))
			$this->Util()->setError(50105, 'error');
		$this->fax = $value;
	}

	public function getFax()
	{
		return $this->fax;
	}

	public function Enumerate()
	{
		$this->Util()->DB()->setQuery('SELECT * FROM institution ORDER BY institutionId ASC');
		$result = $this->Util()->DB()->GetResult();

		foreach($result as $key => $row)
		{
		}
		return $result;
	}

	public function Info()
	{
		$this->Util()->DB()->setQuery("SELECT * FROM institution WHERE institutionId = '".$this->institutionId."'");
		$row = $this->Util()->EncodeRow($this->Util()->DB()->GetRow());
		return $row;
	}

	public function Edit()
	{
		if($this->Util()->PrintErrors()){ return false; }

		$this->Util()->DB()->setQuery("
			UPDATE
				institution
			SET
				`institutionId` = '" . $this->institutionId . "',
				`name` = '" . $this->name . "',
				`name_long` = '" . $this->name_long . "',
				`identifier` = '" . $this->identifier . "',
				`ubication` = '" . $this->ubication . "',
				`ubication_long` = '" . $this->ubication_long . "',
				`phone` = '" . $this->phone . "',
				`jefeOficina` = '" . $this->jefeOficina . "',
				`presidente` = '" . $this->presidente . "',
				`respServiciosEscolares` = '" . $this->respServiciosEscolares . "',
				`directorAcademico` = '" . $this->directorAcademico . "',
				`jefeServiciosEscolares` = '" . $this->jefeServiciosEscolares . "',
				`fax` = '" . $this->fax . "'
			WHERE institutionId = '".$this->institutionId."'");
		$this->Util()->DB()->UpdateData();

		$this->Util()->setError(50101, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	/*
	public function Save()
	{
		if($this->Util()->PrintErrors()){ return false; }

		$this->Util()->DB()->setQuery("
			INSERT INTO
				institution
			(
				`institutionId`,
				`name`,
				`name_long`,
				`identifier`,
				`ubication`,
				`ubication_long`,
				`phone`,
				`fax`
		)
		VALUES
		(
				'".$this->institutionId."',
				'".$this->name."',
				'".$this->name_long."',
				'".$this->identifier."',
				'".$this->ubication."',
				'".$this->ubication_long."',
				'".$this->phone."',
				'".$this->fax."'
		);");
		$this->Util()->DB()->InsertData();
		$this->Util()->setError(50100, "complete");
		$this->Util()->PrintErrors();
		return true;
	}

	public function Delete()
	{
		if($this->Util()->PrintErrors()){ return false; }

		$this->Util()->DB()->setQuery("
			DELETE FROM
				institution
			WHERE
				institutionId = '".$this->institutionId."'");
		$this->Util()->DB()->DeleteData();
		$this->Util()->setError(50103, "complete");
		$this->Util()->PrintErrors();
		return true;
	}
	*/

}

?>