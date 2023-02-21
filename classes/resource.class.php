<?php
class Resource extends Module
{
	private $resourceId;
	public function setResourceId($value)
	{
		$this->resourceId = $value;
	}

	public function getResourceId()
	{
		return $this->resourceId;
	}

	private $semana;
	public function setSemana($value)
	{
		$this->semana = $value;
	}

	public function SaveResource()
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}

		$sql = "INSERT INTO
					resource_config
					( 	
						subjectModuleId,
						name,
						descriptionW
					)
				VALUES (
						'" . $this->getCourseModuleId() . "', 
						'" . $this->getName() . "',
						'" . $this->getDescription() . "'
					)";

		// exit;
		$this->Util()->DB()->setQuery($sql);
		$id = $this->Util()->DB()->InsertData();

		$target_path = DOC_ROOT . "/resources/config/";

		$ext = end(explode('.', basename($_FILES['path']['name'])));
		$target_path = $target_path . "recurso_" . $id . "." . $ext;
		$relative_path = "recurso_" . $id . "." . $ext;
		// C:/wamp/www/iap/resources/config/recurso_1407.pdf
		// echo $target_path;
		// exit;
		// echo 'llega';
		if (move_uploaded_file($_FILES['path']['tmp_name'], $target_path)) {
			$sql = "UPDATE
						resource_config
						SET
							path = '" . $relative_path . "'
						WHERE resourceConfigId = '" . $id . "'";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		}

		// $this->Util()->setError(90000, 'complete', "Se ha agregado un recurso de apoyo");
		// $this->Util()->PrintErrors();

		return true;
	}

	public function Save()
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}

		$sql = "INSERT INTO
					resource
					( 	
						courseModuleId,
						name,
						description,
						semana
					)
				VALUES (
						'" . $this->getCourseModuleId() . "', 
						'" . $this->getName() . "',
						'" . $this->getDescription() . "',
						'".$this->semana."'
					)";
		$this->Util()->DB()->setQuery($sql);
		$id = $this->Util()->DB()->InsertData();

		$target_path = DOC_ROOT . "/resources/";

		$ext = end(explode('.', basename($_FILES['path']['name'])));
		$target_path = $target_path . "recurso_" . $id . "." . $ext;
		$relative_path = "recurso_" . $id . "." . $ext;

		if (move_uploaded_file($_FILES['path']['tmp_name'], $target_path)) {
			$sql = "UPDATE
						resource
						SET
							path = '" . $relative_path . "'
						WHERE resourceId = '" . $id . "'";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		}

		$this->Util()->setError(90000, 'complete', "Se ha agregado un recurso de apoyo");
		$this->Util()->PrintErrors();
	}

	public function Edit()
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}

		//si no hay errores
		//creamos la cadena de insercion
		$sql = "UPDATE
					resource
					SET
						name = '" . utf8_decode($this->getName()) . "',
						description = '" . utf8_decode($this->getDescription()) . "'
					WHERE resourceId = '" . $this->resourceId . "'";
		//configuramos la consulta con la cadena de insercion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
		$result = $this->Util()->DB()->UpdateData();


		$target_path = DOC_ROOT . "/resources/";

		$ext = end(explode('.', basename($_FILES['path']['name'])));
		$target_path = $target_path . "recurso_" . $this->resourceId . "." . $ext;
		$relative_path = "recurso_" . $this->resourceId . "." . $ext;

		if (move_uploaded_file($_FILES['path']['tmp_name'], $target_path)) {
			$sql = "UPDATE
						resource
						SET
							path = '" . $relative_path . "'
						WHERE resourceId = '" . $this->resourceId . "'";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		}

		$this->Util()->setError(90000, 'complete', "Se ha editado el recurso");
		$this->Util()->PrintErrors();
		return $result;
	}

	public function Delete($id = null)
	{
		if ($this->Util()->PrintErrors()) {
			return false;
		}

		$sql = "DELETE FROM resource
					WHERE resourceId = '" . $this->resourceId . "'";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->DeleteData();
		$this->Util()->setError(90000, 'complete', "Se ha eliminado el recurso");
		$this->Util()->PrintErrors();
		return $result;
	}

	public function Enumerate()
	{
		$this->Util()->DB()->setQuery("
			SELECT * FROM resource
			WHERE courseModuleId = '" . $this->getCourseModuleId() . "'
			ORDER BY semana, name ASC");
		$result = $this->Util()->DB()->GetResult();

		foreach ($result as $key => $res) {
			$result[$key]["descriptionShort"] = substr($result[$key]["description"], 0, 30);
		}
		//print_r($result);
		return $result;
	}

	public function Info($id = null)
	{
		//creamos la cadena de seleccion
		$sql = "SELECT 
					* 
				FROM
					resource
				WHERE
						resourceId='" . $this->getResourceId() . "'";
		//configuramos la consulta con la cadena de actualizacion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y obtenemos el resultado
		$result = $this->Util()->DB()->GetRow();

		if ($result)
			$result = $this->Util->EncodeRow($result);

		return $result;
	}


	public function enumerateResource($Id)
	{

		$sql  = "
			SELECT * FROM resource_config
			WHERE subjectModuleId = '" . $Id . "'
			ORDER BY name ASC";
		// exit;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		foreach ($result as $key => $res) {
			$result[$key]["descriptionShort"] = substr($result[$key]["description"], 0, 30);
		}
		//print_r($result);
		return $result;
	}

	public function deleteResource($Id)
	{
		$sql = "DELETE FROM resource_config
					WHERE resourceConfigId = '" . $Id . "'";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->DeleteData();
		$this->Util()->setError(90000, 'complete', "Se ha eliminado el recurso");
		$this->Util()->PrintErrors();
		return true;
	}

	public function infoResource($Id)
	{
		//creamos la cadena de seleccion
		$sql = "SELECT 
					* 
				FROM
					resource_config
				WHERE
						resourceConfigId='" . $Id . "'";
		//configuramos la consulta con la cadena de actualizacion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y obtenemos el resultado
		$result = $this->Util()->DB()->GetRow();

		if ($result)
			$result = $this->Util->EncodeRow($result);

		return $result;
	}

	public function updateResource($Id)
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}

		//si no hay errores
		//creamos la cadena de insercion
		$sql = "UPDATE
					resource_config
					SET
						name = '" . utf8_decode($this->getName()) . "',
						description = '" . utf8_decode($this->getDescription()) . "'
					WHERE resourceConfigId = '" . $Id . "'";
		//configuramos la consulta con la cadena de insercion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
		$result = $this->Util()->DB()->UpdateData();


		$target_path = DOC_ROOT . "/resources/config/";

		$ext = end(explode('.', basename($_FILES['path']['name'])));
		$target_path = $target_path . "recurso_" . $this->resourceId . "." . $ext;
		$relative_path = "recurso_" . $this->resourceId . "." . $ext;

		if (move_uploaded_file($_FILES['path']['tmp_name'], $target_path)) {
			$sql = "UPDATE
						resource_config
						SET
							path = '" . $relative_path . "'
						WHERE resourceConfigId = '" . $this->resourceId . "'";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->UpdateData();
		}

		return true;
	}
}
