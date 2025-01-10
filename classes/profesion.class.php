<?php
class Profesion extends Main
{
	private $profesionId;			//identificador del puesto dentro de la base de datos
	private $profesionName;			//nombre del puesto

	public function setProfesionId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->profesionId = (int)$value;
	}

	public function setProfesionName($value)
	{
		$this->Util()->ValidateString($value, 60, 1, "profesionName");
		$this->profesionName = $value;
	}

	public function getProfesionId()
	{
		return $this->profesionId;
	}

	public function getProfesionName()
	{
		return $this->profesionName;
	}


	public function Enumerate()
	{
		//configaramos la consulta de seleccion
		$this->Util()->DB()->setQuery('SELECT * FROM profesion WHERE profesionId <> 1 ORDER BY profesionName');
		//ejecutamos la consulta y regresamos el resultado
		return $this->Util()->DB()->GetResult();
	}

	public function Save()
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}
		//si no hay errores
		//creamos la cadena de insercion
		$sql = "INSERT INTO
						profesion
						( 	
							profesionName
						)
					VALUES ('" .
			$this->profesionName . "')";
		//echo $sql;		// <---para propositos de duparacion
		//configuramos la consulta con la cadena de insercion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
		$result = $this->Util()->DB()->InsertData();
		if ($result > 0) {
			//si el resultado es mayor a cero, se inserto el nuevo registro con exito...se regresara true
			$result = true;
			$this->Util()->setError(60000, 'complete', "Has insertado una profesion");
		} else {
			//si el resultado es cero, no se pudo insertar el nuevo registro...se regresara false
			$result = false;
			$this->Util()->setError(60010, 'error', "No se pudo insertar la posicion");
		}
		$this->Util()->PrintErrors();
		return $result;
	}

	public function Update()
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}
		//si no hay errores
		//creamos la cadena de actualizacion
		$sql = "UPDATE 
						profesion 
					SET
						profesionName='"  		. $this->profesionName . "' 
						WHERE profesionId='" . $this->profesionId . "'";
		//echo $sql;		// <---para propositos de duparacion
		//configuramos la consulta con la cadena de actualizacion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y guardamos el resultado, que sera el numero de columnas afectadas
		$this->Util()->DB()->UpdateData();
		$result = 1;
		if ($result > 0) {
			//si el resultado es mayor a cero, se actualizo el registro con exito
			$result = true;
			$this->Util()->setError(60002, 'complete', "Se ha actualizado la profesion");
		} else {
			//si el resultado es cero, no se pudo modificar el registro...se regresa false
			$result = false;
			$this->Util()->setError(60011, 'error', "No se pudo modificar la profesion");
		}
		$this->Util()->PrintErrors();
		return $result;
	}

	public function Delete()
	{
		if ($this->Util()->PrintErrors()) {
			// si hay errores regresa false
			return false;
		}
		//si no hay errores
		//creamos la cadena de eliminacion
		$sql = "DELETE FROM 
						profesion 
					WHERE 
						profesionId='" . $this->profesionId . "'";
		//configuramos la consulta con la cadena de eliminacion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y regresamos el resultado, que sera el numero de columnas afectadas
		$result = $this->Util()->DB()->DeleteData();
		if ($result > 0) {
			//si el resultado es mayor a cero, se actualizo el registro con exito
			$result = true;
			$this->Util()->setError(60001, 'complete', "Se ha eliminado la profesion");
		} else {
			//si el resultado es cero, no se pudo modificar el registro...se regresa false
			$result = false;
			$this->Util()->setError(60012, 'error', "No se pudo eliminar la profesion");
		}
		$this->Util()->PrintErrors();
		return $result;
	}

	public function Info()
	{
		//creamos la cadena de seleccion
		$sql = "SELECT 
						* 
					FROM
						profesion
					WHERE
						profesionId='" . $this->profesionId . "'";
		//configuramos la consulta con la cadena de actualizacion
		$this->Util()->DB()->setQuery($sql);
		//ejecutamos la consulta y obtenemos el resultado
		$result =  $this->Util()->DB()->GetRow();
		//guardamos en los demas miembros de la clase los datos obtenidos por si los necesitamos individualmente
		//***el valor de positionId fue establecido antes de ejecutarse la consulta 
		//***al obtener el valor desde $_POST, por lo que no es necesario recuperarlo
		$this->profesionName = $result->profesionName;
		//regresamos el resultado obtenido por si fuera necesario usar todos los datos en otra variable
		return $result;
	}
}
