<?php

class Invoice extends Util
{
	private $alumnoId;
	private $regimenId;
	private $nombre_comercial;
	private $nombre_empresa;
	private $rfc;
	private $telefono;
	private $correo;
	private $calle;
	private $num_ext;
	private $num_int;
	private $codigo_postal;
	private $estado;
	private $municipio;
	private $localidad;
	private $datoFiscalId;

	public function setAlumnoId($alumnoId)
	{
		$this->alumnoId = $alumnoId;
	}

	public function setRegimenId($regimenId)
	{
		$this->regimenId = $regimenId;
	}

	public function setNombreComercial($nombre_comercial)
	{
		$this->nombre_comercial = $nombre_comercial;
	}

	public function setNombreEmpresa($nombre_empresa)
	{
		$this->nombre_empresa = $nombre_empresa;
	}

	public function setRFC($rfc)
	{
		$this->rfc = $rfc;
	}

	public function setTelefono($telefono)
	{
		$this->telefono = $telefono;
	}

	public function setCorreo($correo)
	{
		$this->correo = $correo;
	}

	public function setCalle($calle)
	{
		$this->calle = $calle;
	}

	public function setNumExt($num_ext)
	{
		$this->num_ext = $num_ext;
	}

	public function setNumInt($num_int)
	{
		$this->num_int = $num_int;
	}

	public function setCodigoPostal($codigo_postal)
	{
		$this->codigo_postal = $codigo_postal;
	}

	public function setEstado($estado)
	{
		$this->estado = $estado;
	}

	public function setMunicipio($municipio)
	{
		$this->municipio = $municipio;
	}

	public function setLocalidad($localidad)
	{
		$this->localidad = $localidad;
	}

	public function setDatoFiscalId($datoFiscalId)
	{
		$this->datoFiscalId = $datoFiscalId;
	}

	public function tax_regime()
	{
		$sql = "SELECT * FROM cfdi_tax_regime";
		$this->Util()->DBErp()->setQuery($sql);
		$resultado = $this->Util()->DBErp()->GetResult();
		return $resultado;
	}
	
	public function cfdi_payment_methods(){
		$sql = "SELECT * FROM cfdi_payment_methods";
		$this->Util()->DBErp()->setQuery($sql);
		$resultado = $this->Util()->DBErp()->GetResult();
		return $resultado;
	}

	public function guardar()
	{
		$sql = "INSERT INTO  `fn_student_invoice_data`(`userId`, `cfdi_tax_regime_id`, `commercial_name`, `company_name`, `rfc`, `phone`, `email`, `street`, `ext_number`, `int_number`, `zip_code`, `cve_ent`, `cve_mun`, `cve_loc`, `created_at`, `updated_at`) VALUES ('{$this->alumnoId}','{$this->regimenId}',{$this->nombre_comercial},'{$this->nombre_empresa}','{$this->rfc}',{$this->telefono},{$this->correo},{$this->calle},{$this->num_ext},{$this->num_int},'{$this->codigo_postal}',{$this->estado},{$this->municipio},{$this->localidad},NOW(),NOW())";
		// echo $sql;
		$this->Util()->DBErp()->setQuery($sql);
		$resultado = $this->Util()->DBErp()->InsertData();
		return $resultado;
	}

	public function getDatoFiscal()
	{
		$sql = "SELECT * FROM fn_student_invoice_data WHERE id = {$this->datoFiscalId}";
		$this->Util()->DBErp()->setQuery($sql);
		$resultado = $this->Util()->DBErp()->GetRow();
		return $resultado;
	}
}
