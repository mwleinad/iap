<?php

class Producto extends Sucursal
{
	private $productoId;
	private $noIdentificacion;
	private $codigoProveedor;
	private $cantidad;
	private $unidad;
	private $descripcion;
	private $costo;
	private $porcUtiUnitario;
	private $valorUnitario;
	private $valorUnitarioIva;
	private $porcUtiMayoreo;
    private $valorMayoreo;
	private $valorMayoreoIva;
	private $porcUtiMedioMayoreo;
	private $valorMedioMayoreo;
	private $valorMedioMayoreoIva;
	private $porcUtiEspecial;
    private $valorEspecial;
	private $valorEspecialIva;
	private $importe;
	private $excentoIva;
	private $id_producto;
	private $tasa;
	private $impuesto;
	private $tipo;
	private $tasaIva;
	private $importeImpuesto;
	private $sucursalId;
	
	private $entregaId;
	private $idNota;
	private $conceptoId;
	private $fecha;
	private $usuarioId;
	
	private $prodCatId;
	private $name;
		
	public function setProductoId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->productoId = $value;
	}
	
	public function setProdCatId($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Categor&iacute;a");
		$this->prodCatId = $value;
	}
	
	public function setSucursalId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->sucursalId = $value;
	}	
	
	public function setTasaIva($value)
	{
		$this->Util()->ValidateFloat($value, 6);
		$this->tasaIva = $value;
	}

	public function getTasaIva()
	{
		return $this->tasaIva;
	}

	public function setName($value)
	{
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, "Nombre");
		$this->name = $value;
	}
	
	public function setImpuesto($value)
	{
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, "Impuesto");
		$this->impuesto = $value;
	}	

	public function getImpuesto()
	{
		return $this->impuesto;
	}

	public function setTipo($value)
	{
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, "Tipo");
		$this->tipo = $value;
	}	

	public function getTipo()
	{
		return $this->tipo;
	}
	
	public function setTasa($value)
	{
		$this->Util()->ValidateFloat($value, 6);
		$this->tasa = $value;
	}	

	public function getTasa()
	{
		return $this->tasa;
	}

	public function setNoIdentificacion($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "No. Identificacion");
		$this->noIdentificacion = $value;
	}

	public function getNoIdentificacion()
	{
		return $this->noIdentificacion;
	}
	
	public function setCodigoProveedor($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "C&oacute;digo del Proveedor");
		$this->codigoProveedor = $value;
	}

	public function setExcentoIva($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "Excento Iva");
		$this->excentoIva = $value;
	}

	public function getExcentoIva()
	{
		return $this->excentoIva;
	}

	public function setUnidad($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Unidad");
		$this->unidad = $value;
	}	

	public function getUnidad()
	{
		return $this->unidad;
	}

	public function setCantidad($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Cantidad");
		$this->Util()->ValidateFloat($value, 6);
		$this->cantidad = $value;
	}	

	public function getCantidad()
	{
		return $this->cantidad;
	}
	
	public function setPorcUtiUnitario($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "Porcentaje de Utilidad");
		$this->Util()->ValidateFloat($value, 6);
		$this->porcUtiUnitario = $value;
	}

	public function setValorUnitario($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio P&uacute;blico");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorUnitario = $value;
	}

	public function getValorUnitario()
	{
		return $this->valorUnitario;
	}
	
	public function setValorUnitarioIva($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio P&uacute;blico con IVA");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorUnitarioIva = $value;
	}
	
	public function setCosto($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Costo");
		$this->Util()->ValidateFloat($value, 6);
		$this->costo = $value;
	}
	
	public function setPorcUtiMayoreo($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "Porcentaje de Utilidad");
		$this->Util()->ValidateFloat($value, 6);
		$this->porcUtiMayoreo = $value;
	}

    public function setValorMayoreo($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio Mayoreo");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorMayoreo = $value;
	}

	public function getValorMayoreo()
	{
		return $this->valorMayoreo;
	}
	
	public function setValorMayoreoIva($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio Mayoreo con IVA");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorMayoreoIva = $value;
	}
	
	public function setPorcUtiMedioMayoreo($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "Porcentaje de Utilidad");
		$this->Util()->ValidateFloat($value, 6);
		$this->porcUtiMedioMayoreo = $value;
	}
	
	public function setValorMedioMayoreo($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio Medio Mayoreo");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorMedioMayoreo = $value;
	}
	
	public function setValorMedioMayoreoIva($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio Medio Mayoreo con IVA");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorMedioMayoreoIva = $value;
	}
	
	public function setPorcUtiEspecial($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 0, "Porcentaje de Utilidad");
		$this->Util()->ValidateFloat($value, 6);
		$this->porcUtiEspecial = $value;
	}       

    public function setValorEspecial($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio Menudeo");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorEspecial = $value;
	}
	
	public function setValorEspecialIva($value)
	{
		$this->Util()->ValidateString($value, $max_chars=50, $minChars = 1, "Precio Menudeo con IVA");
		$this->Util()->ValidateFloat($value, 6);
		$this->valorEspecialIva = $value;
	}
	
	public function getValorEspecial()
	{
		return $this->valorEspecial;
	}

	public function setImporteImpuesto($value)
	{
		$this->Util()->ValidateFloat($value, 6);
		$this->importeImpuesto = $value;
	}	

	public function getImporteImpuesto()
	{
		return $this->importeImpuesto;
	}

	public function setImporte()
	{
		$value = $this->valorUnitario * $this->cantidad;
		$this->Util()->ValidateFloat($value, 6);
		$this->importe = $value;
	}

	public function getImporte()
	{
		return $this->importe;
	}

	public function setDescripcion($value)
	{
		$this->Util()->ValidateString($value, $max_chars=10000, $minChars = 1, "Descripcion");
		$this->descripcion = $value;
	}	

	public function getDescripcion()
	{
		return $this->descripcion;
	}
	
	public function setIdNota($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->idNota = $value;
	}
	
	public function setConceptoId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->conceptoId = $value;
	}
	
	public function setUsuarioId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->usuarioId = $value;
	}
	
	public function setEntregaId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->entregaId = $value;
	}
	
	public function setFecha($value)
	{
		$this->fecha = $value;
	}


	function Suggest($value)
	{
		$empresa = $this->Info();
		
		$sql = "SELECT 
					* 
				FROM 
					producto 
				WHERE 
				(
					noIdentificacion LIKE '%".$value."%' 
					OR descripcion LIKE '%".$value."%'
					OR codigoProveedor LIKE '%".$value."%'
				) 
				AND 
					empresaId = ".$empresa["empresaId"]." 
				ORDER BY 
					noIdentificacion 
				LIMIT 
					10";
		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$result = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();		

		return $result;
	}

	

	function GetProductosByRfc()
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM producto WHERE rfcId = ".$this->getRfcActive()." ORDER BY noIdentificacion");
		$total = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		$pages = $this->Util->HandleMultipages($this->page, $total ,WEB_ROOT."/admin-productos/nuevos-productos");
	
		$info = $this->Info();
		
		$sqlAdd = "LIMIT ".$pages["start"].", ".$pages["items_per_page"];
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery(
                        "SELECT *,(SELECT suc.identificador FROM sucursal suc WHERE suc.sucursalId = prod.sucursalId) as nombreSucursal
                         FROM producto prod
                         WHERE prod.rfcId = ".$this->getRfcActive()." 
                         ORDER BY prod.descripcion ".$sqlAdd
                );
		$result = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();
		
		$center = new Center;
		$centros = $center->EnumerateAll();
		
		foreach($result as $key => $res)
		{
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$res["productoId"]."' AND status = 'existe' AND sucursalId = ".$info["sucursalId"]);
			
			$result[$key]["debe"] = $result[$key]["cantidad"];
			$result[$key]["cantidad"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$res["productoId"]."' AND status = 'existe' AND sucursalId = '0'");
			$result[$key]["cantidadAlmacen"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
			foreach($centros as $centro)
			{
				$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$res["productoId"]."' AND status = 'existe' AND sucursalId = ".$centro["centerId"]);
				
				$result[$key][$centro["centerId"]] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
				
			}

//			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM productoProveedor WHERE productoId = '".$res["productoId"]."'");

//			$result[$key]["cantidadProveedores"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
		}

		$data["items"] = $result;
		$data["pages"] = $pages;

		return $data;
	}
	
	function GetProductosByReport()
	{
		$empresaId = $_SESSION['empresaId'];
		
		$sql = "SELECT COUNT(*) 
				FROM producto 
				WHERE rfcId = ".$this->getRfcActive()." 
				ORDER BY noIdentificacion";		
		$this->Util()->DBSelect($empresaId)->setQuery($sql);
		$total = $this->Util()->DBSelect($empresaId)->GetSingle();

		$pages = $this->Util->HandleMultipages($this->page, $total ,WEB_ROOT."/admin-productos/reporte-almacen");
		
		$sqlAdd = "LIMIT ".$pages["start"].", ".$pages["items_per_page"];

		$sql = "SELECT *
                FROM producto prod
                WHERE prod.rfcId = ".$this->getRfcActive()." 
                ORDER BY prod.descripcion ".$sqlAdd;
		$this->Util()->DBSelect($empresaId)->setQuery($sql);		
		$result = $this->Util()->DBSelect($empresaId)->GetResult();
		
		$products = array();
		foreach($result as $key => $res){
			$card = $res;
			
			$sql = "SELECT COUNT(*) 
					FROM almacen 
					WHERE productoId = ".$res["productoId"]." 
					AND status = 'existe' 
					AND sucursalId = '".$this->sucursalId."'";
			$this->Util()->DBSelect($empresaId)->setQuery($sql);			
			$card['enSucursal'] = $this->Util()->DBSelect($empresaId)->GetSingle();
									
			$sql = "SELECT COUNT(*) 
					FROM almacen 
					WHERE productoId = '".$res["productoId"]."' 
					AND status = 'existe' AND sucursalId = '0'";
			$this->Util()->DBSelect($empresaId)->setQuery($sql);
			$card['enAlmacen'] = $this->Util()->DBSelect($empresaId)->GetSingle();
				
			$card['total'] = $card['enAlmacen'] + $card['enSucursal'];			
			
			$products[] = $card;
			
		}

		$data["items"] = $products;
		$data["pages"] = $pages;
		
		return $data;
	}
	
	function EnumerateAll()

	{
		$empresaId = $_SESSION['empresaId'];
		
		$sql = "SELECT *
				FROM producto 
				WHERE rfcId = ".$this->getRfcActive()." 
				ORDER BY descripcion ASC";		
		$this->Util()->DBSelect($empresaId)->setQuery($sql);
		$result = $this->Util()->DBSelect($empresaId)->GetResult();
		
		$products = array();
		foreach($result as $key => $res){
			$card = $res;
			
			$sql = "SELECT COUNT(*) 
					FROM almacen 
					WHERE productoId = ".$res["productoId"]." 
					AND status = 'existe' 
					AND sucursalId = '".$this->sucursalId."'";
			$this->Util()->DBSelect($empresaId)->setQuery($sql);			
			$card['enSucursal'] = $this->Util()->DBSelect($empresaId)->GetSingle();
			
			$sql = "SELECT COUNT(*) 
					FROM almacen 
					WHERE productoId = ".$res["productoId"]." 
					AND status = 'existe' 
					AND sucursalId <> 0";
			$this->Util()->DBSelect($empresaId)->setQuery($sql);			
			$card['enSucursales'] = $this->Util()->DBSelect($empresaId)->GetSingle();
									
			$sql = "SELECT COUNT(*) 
					FROM almacen 
					WHERE productoId = '".$res["productoId"]."' 
					AND status = 'existe' AND sucursalId = '0'";
			$this->Util()->DBSelect($empresaId)->setQuery($sql);
			$card['enAlmacen'] = $this->Util()->DBSelect($empresaId)->GetSingle();
				
			$card['total'] = $card['enAlmacen'] + $card['enSucursal'];
			$card['totales'] = $card['enAlmacen'] + $card['enSucursales'];
			
			$products[] = $card;
			
		}
		
		return $products;
	}

	function Search(){
	
		$activeRfc =  $this->getRfcActive();
		$empresaId = $_SESSION['empresaId'];
		$info = $this->Info();
		
		if($this->prodCatId)
			$sqlAdd = ' AND prodCatId = "'.$this->prodCatId.'"';
		
		$sql = 'SELECT *,(
							SELECT suc.identificador 
							FROM sucursal suc 
							WHERE suc.sucursalId = prod.sucursalId
						) 
						as nombreSucursal
                FROM 
					producto prod
				WHERE 
					prod.rfcId = "'.$this->getRfcActive().'" 
				AND 
					(
						descripcion LIKE "%'.$this->descripcion.'%" 
						OR noIdentificacion LIKE "%'.$this->descripcion.'%"
						OR codigoProveedor LIKE  "%'.$this->descripcion.'%"
					) 
				'.$sqlAdd.'
                ORDER BY 
					prod.descripcion';
		
		$this->Util()->DBSelect($empresaId)->setQuery($sql);

		$center = new Center;
		$centros = $center->EnumerateAll();

		$result = $this->Util()->DBSelect($empresaId)->GetResult();
		foreach($result as $key => $res)
		{
			$result[$key]["debe"] = $result[$key]["cantidad"];
		
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = ".$res["productoId"]." AND status = 'existe' AND sucursalId = ".$info["sucursalId"]);			
			$result[$key]["cantidad"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
						
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$res["productoId"]."' AND status = 'existe' AND sucursalId = '0'");
			$result[$key]["cantidadAlmacen"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			foreach($centros as $centro)
			{
				$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$res["productoId"]."' AND status = 'existe' AND sucursalId = ".$centro["centerId"]);
				
				$result[$key][$centro["centerId"]] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
				
			}
//			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM productoProveedor WHERE productoId = '".$res["productoId"]."'");

			$result[$key]["cantidadProveedores"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
		}

		$data["items"] = $result;
		$data["pages"] = $pages;
		
		return $data;
	}	


	function GetProductoInfo()
	{
		$empresa = $this->Info();

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM producto WHERE noIdentificacion = '".$this->noIdentificacion."'  AND empresaId = ".$empresa["empresaId"]);

		$result = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
		
		$info = $this->Info();
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$result["productoId"]."' AND sucursalId = '".$info["sucursalId"]."' AND status = 'existe'");
		$result["disponible"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		return $result;

	}

	function InfoProd()
	{
		$sql = "SELECT * FROM producto WHERE productoId = '".$this->productoId."'";		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$info = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();		
		
		return $info;
	}

	function AgregarConcepto()
	{
		if($this->Util()->PrintErrors())
		{
			return false;
		}
		
		//Checar disponibilidad		
		$sql = "SELECT 
					* 
				FROM 
					producto 
				WHERE 
					noIdentificacion = '".$this->noIdentificacion."'  
				AND 
					empresaId = ".$_SESSION["empresaId"];
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$row = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
		
		$info = $this->Info();
		
		$sql = "SELECT 
					COUNT(*) 
				FROM 
					almacen 
				WHERE 
					productoId = '".$row["productoId"]."' 
				AND 
					sucursalId = '".$info["sucursalId"]."'  
				AND 
					status = 'existe'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$disponible = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
				
		end($_SESSION["conceptos"]);

		$conceptos = key($_SESSION["conceptos"]) + 1;

		$_SESSION["conceptos"][$conceptos]['productoId'] = $this->productoId;
		$_SESSION["conceptos"][$conceptos]["noIdentificacion"] = $this->noIdentificacion;
		$_SESSION["conceptos"][$conceptos]["cantidad"] = $this->cantidad;
		$_SESSION["conceptos"][$conceptos]["unidad"] = $this->unidad;
		$_SESSION["conceptos"][$conceptos]["valorUnitario"] = $this->valorUnitario;
		$_SESSION["conceptos"][$conceptos]["importe"] = $this->importe;
		$_SESSION["conceptos"][$conceptos]["excentoIva"] = $this->excentoIva;
		$_SESSION["conceptos"][$conceptos]["descripcion"] = urldecode($this->descripcion);

		return true;

	}



	function AgregarImpuesto()

	{

		if($this->Util()->PrintErrors())

		{

			return false;

		}

		

		end($_SESSION["impuestos"]);

		$impuestos = key($_SESSION["impuestos"]) + 1;

		$_SESSION["impuestos"][$impuestos]["tasa"] = $this->tasa;

		$_SESSION["impuestos"][$impuestos]["impuesto"] = urldecode($this->impuesto);

		$_SESSION["impuestos"][$impuestos]["tipo"] = $this->tipo;

		$_SESSION["impuestos"][$impuestos]["importe"] = $this->importeImpuesto;

		$_SESSION["impuestos"][$impuestos]["parent"] = 0;

		$_SESSION["impuestos"][$impuestos]["tasaIva"] = $this->tasaIva;

		

		//desglosar otro para el iva

		if($this->tasaIva)

		{

			end($_SESSION["impuestos"]);

			$impuestos = key($_SESSION["impuestos"]) + 1;

			$_SESSION["impuestos"][$impuestos]["tasa"] = $this->tasa * ($this->tasaIva / 100);

			$_SESSION["impuestos"][$impuestos]["impuesto"] = urldecode($this->tasaIva."% IVA ".$this->impuesto);

			$_SESSION["impuestos"][$impuestos]["tipo"] = $this->tipo;

			$_SESSION["impuestos"][$impuestos]["importe"] = $this->importeImpuesto * ($this->tasaIva / 100);

//			$_SESSION["impuestos"][$impuestos]["parent"] = $impuestos - 1;

			$_SESSION["impuestos"][$impuestos]["tasaIva"] = $this->tasaIva;

			

		}

		return true;

	}



	function BorrarImpuesto($key)

	{

		unset($_SESSION["impuestos"][$key]);

		return true;

	}



	function BorrarConcepto($key)

	{

		unset($_SESSION["conceptos"][$key]);

		return true;

	}



	function CleanImpuestos()

	{

		unset($_SESSION["impuestos"]);

	}



	function CleanConceptos()

	{

		unset($_SESSION["conceptos"]);

	}

	

	function GetTotalDesglosado($data = null)
	{
		$values = explode("&", $_POST["form"]);
		foreach($values as $key => $val)
		{
			$array = explode("=", $values[$key]);
			$data[$array[0]] = $array[1];
		}
		
		$ivaForm = $data['tasaIva'];

		if(!$_SESSION["conceptos"])
		{
			return false;
		}

		$data["subtotal"] = 0;
		$data["descuento"] = 0;
		$data["iva"] = 0;
		$data["ieps"] = 0;
		$data["retIva"] = 0;
		$data["retIsr"] = 0;
		$data["total"] = 0;
		
		foreach($data as $key => $value)
		{
			$data[$key] = $this->Util()->RoundNumber($data[$key]);
		}

		$info = $this->Info();
		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("
			SELECT * FROM sucursal 
			LEFT JOIN rfc ON rfc.rfcId = sucursal.rfcId
			WHERE sucursal.sucursalId ='".$info["sucursalId"]."'");
		$sucursal = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
		
		$suc['iva'] = $ivaForm;
		
		foreach($_SESSION["conceptos"] as $key => $concepto)
		{
			$data["subtotalOriginal"] = $this->Util()->RoundNumber($data["subtotalOriginal"] + $importe);

			$data["subtotal"] = $this->Util()->RoundNumber($data["subtotal"] + $concepto["importe"]);

			if($concepto["excentoIva"] == "si")
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = 0;
			}
			else
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = $suc["iva"];
			}


			if($data["porcentajeDescuento"])
			{
				$data["porcentajeDescuento"];
			}

			$data["descuentoThis"] = $this->Util()->RoundNumber($_SESSION["conceptos"][$key]["importe"] * ($data["porcentajeDescuento"] / 100));
			$data["descuento"] += $data["descuentoThis"]; 

			$afterDescuento = $_SESSION["conceptos"][$key]["importe"] - $data["descuentoThis"];
			if($concepto["excentoIva"] == "si")
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = 0;
			}
			else
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = $suc["iva"];
			}

			$data["ivaThis"] = $this->Util()->RoundNumber($afterDescuento * ($_SESSION["conceptos"][$key]["tasaIva"] / 100));

			if(isset($_SESSION["conceptos"][$key]["hardCodedIva"]))
			{
				$data["iva"] = $_SESSION["conceptos"][$key]["hardCodedIva"];
			}
			else
			{
				$data["iva"] += $data["ivaThis"];
			}
		}

		$data["impuestos"] = $_SESSION["impuestos"];

		$afterDescuento = $data["subtotal"] - $data["descuento"];

		$data["afterDescuento"] = $afterDescuento;

		$data["afterIva"] = $afterDescuento + $data["iva"];

		if(!$data["porcentajeIEPS"])
		{
			$data["porcentajeIEPS"] = 0;
		}

		$data["ieps"] = $this->Util()->RoundNumber($data["afterDescuento"] * ($data["porcentajeIEPS"] / 100));
		$afterImpuestos = $afterDescuento + $data["iva"] + $data["ieps"];
		$data["afterImpuestos"] = $afterImpuestos;

		$data["retIva"] = $this->Util()->RoundNumber($data["afterDescuento"] * ($data["porcentajeRetIva"] / 100));
		$data["retIsr"] = $this->Util()->RoundNumber($data["afterDescuento"] * ($data["porcentajeRetIsr"] / 100));
		$data["total"] = $this->Util()->RoundNumber($data["subtotal"] - $data["descuento"] + $data["iva"] + $data["ieps"] - $data["retIva"] - $data["retIsr"]);

		return $data;
	}
	
	function GetTotalDesglosado2()
	{		
	
		if(!$_SESSION["conceptos"])
		{
			return false;
		}
		
		$data = array();

		$data["subtotal"] = 0;
		$data["descuento"] = 0;
		$data["iva"] = 0;
		$data["ieps"] = 0;
		$data["retIva"] = 0;
		$data["retIsr"] = 0;
		$data["total"] = 0;
		
		foreach($data as $key => $value)
		{
			$data[$key] = $this->Util()->RoundNumber($data[$key]);
		}

		$info = $this->Info();
		
		if($info['type'] == 'facturacion')
			$info['sucursalId'] = $_SESSION['sucFactId'];
		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("
			SELECT * FROM sucursal 
			LEFT JOIN rfc ON rfc.rfcId = sucursal.rfcId
			WHERE sucursal.sucursalId ='".$info["sucursalId"]."'");
		$suc = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
		
		foreach($_SESSION["conceptos"] as $key => $concepto)
		{
			$data["subtotalOriginal"] = $this->Util()->RoundNumber($data["subtotalOriginal"] + $importe);

			$data["subtotal"] = $this->Util()->RoundNumber($data["subtotal"] + $concepto["importe"]);

			if($concepto["excentoIva"] == "si")
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = 0;
			}
			else
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = $suc["iva"];
			}


			if($data["porcentajeDescuento"])
			{
				$data["porcentajeDescuento"];
			}

			$data["descuentoThis"] = $this->Util()->RoundNumber($_SESSION["conceptos"][$key]["importe"] * ($data["porcentajeDescuento"] / 100));
			$data["descuento"] += $data["descuentoThis"]; 

			$afterDescuento = $_SESSION["conceptos"][$key]["importe"] - $data["descuentoThis"];
			if($concepto["excentoIva"] == "si")
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = 0;
			}
			else
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = $suc["iva"];
			}

			$data["ivaThis"] = $this->Util()->RoundNumber($afterDescuento * ($_SESSION["conceptos"][$key]["tasaIva"] / 100));

			if(isset($_SESSION["conceptos"][$key]["hardCodedIva"]))
			{
				$data["iva"] = $_SESSION["conceptos"][$key]["hardCodedIva"];
			}
			else
			{
				$data["iva"] += $data["ivaThis"];
			}
									
		}
		

		$data["impuestos"] = $_SESSION["impuestos"];

		$afterDescuento = $data["subtotal"] - $data["descuento"];

		$data["afterDescuento"] = $afterDescuento;

		$data["afterIva"] = $afterDescuento + $data["iva"];

		if(!$data["porcentajeIEPS"])
		{
			$data["porcentajeIEPS"] = 0;
		}

		$data["ieps"] = $this->Util()->RoundNumber($data["afterDescuento"] * ($data["porcentajeIEPS"] / 100));
		$afterImpuestos = $afterDescuento + $data["iva"] + $data["ieps"];
		$data["afterImpuestos"] = $afterImpuestos;

		$data["retIva"] = $this->Util()->RoundNumber($data["afterDescuento"] * ($data["porcentajeRetIva"] / 100));
		$data["retIsr"] = $this->Util()->RoundNumber($data["afterDescuento"] * ($data["porcentajeRetIsr"] / 100));
		$data["total"] = $this->Util()->RoundNumber($data["subtotal"] - $data["descuento"] + $data["iva"] + $data["ieps"] - $data["retIva"] - $data["retIsr"]);
				
		return $data;
		
	}//GetTotalDesglosado2

	function GetTotalDesglosadoNota($ivaForm = 0)
	{
		if(!$_SESSION["conceptos"])
		{
			return false;
		}

		$data["subtotal"] = 0;
		$data["iva"] = 0;
		$data["total"] = 0;
		
		$info = $this->Info();		
		
		$sucursal['iva'] = $ivaForm;
		
		foreach($_SESSION["conceptos"] as $key => $concepto)
		{
			$data["subtotal"] = $this->Util()->RoundNumber($data["subtotal"] + $concepto["importe"]);		
		}
		
		$data["total"] = $data["subtotal"];

		return $data;
	}
	
	function GetTotalDesglosadoCotizacion($ivaForm = 0)
	{
		if(!$_SESSION["conceptos"])
		{
			return false;
		}

		$data["subtotal"] = 0;
		$data["iva"] = 0;
		$data["total"] = 0;
		
		$info = $this->Info();		
		
		$sucursal['iva'] = $ivaForm;
		
		foreach($_SESSION["conceptos"] as $key => $concepto)
		{
			$data["subtotalOriginal"] = $this->Util()->RoundNumber($data["subtotalOriginal"] + $importe);

			$data["subtotal"] = $this->Util()->RoundNumber($data["subtotal"] + $concepto["importe"]);

			if($concepto["excentoIva"] == "si")
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = 0;
			}
			else
			{
				$_SESSION["conceptos"][$key]["tasaIva"] = $sucursal["iva"];
			}
			
		}
		
		$data["iva"] = $this->Util()->RoundNumber($data['subtotal'] * ($_SESSION["conceptos"][$key]["tasaIva"] / 100));
		$data["total"] = $this->Util()->RoundNumber($data["subtotal"] + $data["iva"]);

		return $data;
	}

	function AddProducto(){

		if($this->Util()->PrintErrors()){ 
			return false; 
		}	

		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery("
			INSERT INTO `producto` (
				`empresaId`,
				prodCatId,
				`noIdentificacion`,
				codigoProveedor,
				`unidad`,
				costo,
				porcUtiUnitario,
				`valorUnitario`,
				`valorUnitarioIva`, 
				porcUtiMayoreo,
				`valorMayoreo`,
				`valorMayoreoIva`,
				porcUtiMedioMayoreo,
				valorMedioMayoreo,
				valorMedioMayoreoIva,
				porcUtiEspecial,
				`valorEspecial`,
				`valorEspecialIva`,
				`cantidad`,
				`excentoIva`,
				`descripcion`,
				`rfcId`
			) 
			VALUES (
				'".$this->getEmpresaId()."',
				'".$this->prodCatId."',
				'".$this->getNoIdentificacion()."',
				'".$this->codigoProveedor."',
				'".$this->getUnidad()."',
				'".$this->costo."',
				'".$this->porcUtiUnitario."',
				'".$this->getValorUnitario()."',
				'".$this->valorUnitarioIva."',
				'".$this->porcUtiMayoreo."',
				'".$this->getValorMayoreo()."',
				'".$this->valorMayoreoIva."',
				'".$this->porcUtiMedioMayoreo."',
				'".$this->valorMedioMayoreo."',
				'".$this->valorMedioMayoreoIva."',
				'".$this->porcUtiEspecial."',
				'".$this->getValorEspecial()."',
				'".$this->valorEspecialIva."',
				'0',
				'".$this->getExcentoIva()."',
				'".$this->getDescripcion()."',
				'".$this->getRfcId()."')"
			);	

		$id_producto = $this->Util()->DBSelect($_SESSION['empresaId'])->InsertData();
		
/*		for($ii = 0; $ii < $this->getCantidad(); $ii++){
			$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery("
				INSERT INTO `almacen` (
					`productoId`,
					`sucursalId`,
					`status`
					) 
				VALUES (
					'".$id_producto."',
					'0',				
					'existe')"
				);
			$this->Util()->DBSelect($_SESSION['empresaId'])->InsertData();
		}
*/		
		$this->Util()->setError(20014, 'complete', "Has agregado un producto satisfactoriamente");
		$this->Util()->PrintErrors();	

		return true;	

	}//AddProducto

	function EditProducto(){

		if($this->Util()->PrintErrors()){ 
			return false; 
		}

		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery("
			UPDATE `producto` SET 
				`empresaId` = '".$this->getEmpresaId()."',
				`prodCatId` = '".$this->prodCatId."',
				`noIdentificacion` = '".$this->getNoIdentificacion()."',
				`codigoProveedor` = '".$this->codigoProveedor."',
				`unidad` = '".$this->getUnidad()."',
				`costo` = '".$this->costo."', 
				porcUtiUnitario = '".$this->porcUtiUnitario."',
				`valorUnitario` = '".$this->getValorUnitario()."',
				`valorUnitarioIva` = '".$this->valorUnitarioIva."',
				porcUtiMayoreo = '".$this->porcUtiMayoreo."',
				`valorMayoreo` = '".$this->getValorMayoreo()."',
				`valorMayoreoIva` =  '".$this->valorMayoreoIva."',
				porcUtiMedioMayoreo =  '".$this->porcUtiMedioMayoreo."',
				valorMedioMayoreo =  '".$this->valorMedioMayoreo."',
				valorMedioMayoreoIva =  '".$this->valorMedioMayoreoIva."',
				porcUtiEspecial =  '".$this->porcUtiEspecial."',
				`valorEspecial` =  '".$this->getValorEspecial()."',
				`valorEspecialIva` =  '".$this->valorEspecialIva."',
				`cantidad` = '".$this->getCantidad()."',
				`excentoIva` = '".$this->getExcentoIva()."',
				`descripcion` = '".$this->getDescripcion()."', 
				`rfcId` = '".$this->getRfcId()."'				
			WHERE productoId = '".$this->id_producto."'"
			);
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();
		$this->Util()->setError(20016, "complete", "Has editado el producto satisfactoriamente");
		$this->Util()->PrintErrors();		

		return true;	

	}//EditProducto	

	function DeleteProducto(){
		
		$sql = "DELETE FROM 
					producto 
				WHERE 
					productoId = '".$this->id_producto."'";		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->DeleteData();
		
		$sql = "DELETE FROM 
					almacen 
				WHERE 
					productoId = '".$this->id_producto."'";		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->DeleteData();
		
		$this->Util()->setError(20015, "complete");
		$this->Util()->PrintErrors();
		
		return true;

	}
	
	public function setProductoDelete($value){

		$this->Util()->ValidateString($value, $max_chars=13, $minChars = 1, "ID Producto");
		$this->id_producto = $value;

	}

	

	function getInfoProducto(){

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM producto WHERE productoId ='".$this->id_producto."'");

		$info = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();

	

		return $info;

	}


	function LoadConceptos($id)
	{
		if($this->Util()->PrintErrors())
		{
			return false;
		}
		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM concepto WHERE idNota ='".$id."'");
		$loaded = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();
		
		$_SESSION['conceptos'] = array();
		
		foreach($loaded as $key => $concepto)
		{
			$_SESSION["conceptos"][$key]["noIdentificacion"] = $concepto["noIdentificacion"];
			$_SESSION["conceptos"][$key]["cantidad"] = $concepto["cantidad"];
			$_SESSION["conceptos"][$key]["unidad"] = $concepto["unidad"];
			$_SESSION["conceptos"][$key]["valorUnitario"] = $concepto["valorUnitario"];
			$_SESSION["conceptos"][$key]["importe"] = $concepto["importe"];
			$_SESSION["conceptos"][$key]["excentoIva"] = $concepto["excentoIva"];
			$_SESSION["conceptos"][$key]["descripcion"] = urldecode($concepto["descripcion"]);
		}
		return true;
	}

	function LoadConceptoPublico($notas)
	{
		global $info;
		if($this->Util()->PrintErrors())
		{
			return false;
		}
		
		$count = 0;

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT iva FROM sucursal WHERE sucursalId ='".$info["sucursalId"]."'");	
		$ivaPercent = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		//Checamos si es sistema ESPECIAL o Normal
		
		if(SF_TIPO == 'E'){
			
			$sql = "SELECT MAX(folioFacturadoNota) FROM notaVenta WHERE sucursalId ='".$info["sucursalId"]."'";
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
			$maxFolio = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
		}//if

		$subtotal = 0;
		$iva = 0;

		if($notas)
		{
			foreach($notas as $id)
			{
				if(SF_TIPO == 'E'){
					$maxFolio++;
					$notasFacturadas .= $maxFolio.",";
				}else{
					$notasFacturadas .= $id.",";
				}
				
				$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM concepto WHERE idNota ='".$id."'");	
				$loaded = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();
				
				foreach($loaded as $key => $concepto)
				{
					$subtotal += $concepto["importe"];
					if($concepto["excentoIva"] == "no")
					{
						$single = $concepto["importe"] * ($ivaPercent / 100);
						$iva += $single;
					}
				}
			}
		}
		
		$_SESSION["conceptos"][$count]["noIdentificacion"] = "PEG";
		$_SESSION["conceptos"][$count]["cantidad"] = 1;
		$_SESSION["conceptos"][$count]["unidad"] = "NotaVenta";
		$_SESSION["conceptos"][$count]["valorUnitario"] = $subtotal;
		$_SESSION["conceptos"][$count]["importe"] = $subtotal;
		$_SESSION["conceptos"][$count]["hardCodedIva"] = $iva;
		$_SESSION["conceptos"][$count]["excentoIva"] = "no";
		$_SESSION["conceptos"][$count]["descripcion"] = urldecode("Factura Correspondiente a las notas de venta: ".$notasFacturadas);
		
		return true;
	}
	
	function AddCantidad()
	{
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
				
		for($ii = 0; $ii < $this->cantidad; $ii++)
		{
			$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery("
				INSERT INTO `almacen` (
					`productoId`,
					`sucursalId`,
					`status`
					) 
				VALUES (
					'".$this->productoId."',
					'".$this->sucursalId."',				
					'existe')"
				);
			$this->Util()->DBSelect($_SESSION['empresaId'])->InsertData();
		}
		
		$this->Util()->setError(20030, "complete", "Has agregado producto al inventario");
		$this->Util()->PrintErrors();
		
		return true;
	}
	
	function DelCantidad()
	{
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
				
		$sql = "DELETE FROM 
					`almacen`
				WHERE
					sucursalId = 0
				AND
					productoId = '".$this->productoId."'
				AND
					status = 'existe'
				ORDER BY
					idAlmacen DESC
				LIMIT
					".$this->cantidad;
					
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION['empresaId'])->DeleteData();		
		
		$this->Util()->setError(20033, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	}
	
	function AddSolicitud()
	{
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		//Cuantos hay
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery("
				SELECT COUNT(*) FROM `almacen` WHERE productoId = '".$_POST["id_producto"]."' AND sucursalId = '0'");
		$total = $this->Util()->DBSelect($_SESSION['empresaId'])->GetSingle();
		
		if($this->cantidad > $total)
		{
			$this->Util()->setError(20032, "error");
			$this->Util()->PrintErrors();
			return false;
		}
		
		$info = $this->Info();
		$fecha = date("Y-m-d H:i:s");
		
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery("
			INSERT INTO  `solicitud` (
				`idSolicitud` ,
				`productoId` ,
				`cantidad` ,
				`fecha` ,
				`sucursalId`,
				usuarioId
				)
			VALUES (
				NULL,  
				'".$_POST["id_producto"]."',  
				'".$this->cantidad."',  
				'".$fecha."',  
				'".$info["sucursalId"]."',
				'".$info["usuarioId"]."'
			)");
		$this->Util()->DBSelect($_SESSION['empresaId'])->ExecuteQuery();
		
		$this->Util()->setError(20031, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	}	
			
	function Solicitudes($status = 'solicitud')
	{
		global $sucursal;
		global $util;
		
		$info = $this->Info();
		
		if($info["sucursalId"] != 0)
		{
			$sqlAdd = "AND solicitud.sucursalId = '".$info["sucursalId"]."'";
		}
		
		$sql = "SELECT 
					solicitud.*, 
					producto.productoId, 
					producto.noIdentificacion, 
					producto.descripcion, 
					producto.unidad
				FROM solicitud
				LEFT JOIN 
					producto 
				ON 
					solicitud.productoId = producto.productoId
				WHERE 
					solicitud.status = '".$status."' ".$sqlAdd;
			
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$result = $this->Util()->DBSelect($_SESSION['empresaId'])->GetResult();
		
		$solicitudes = array();
		foreach($result as $key => $res)
		{
			$card = $res;
			
			$sql = "SELECT 
						COUNT(*) 
					FROM 
						almacen 
					WHERE 
						productoId = '".$res["productoId"]."' 
					AND 
						status = 'existe' 
					AND 
						sucursalId = ".$info["sucursalId"];
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
			$card["disponible"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			$sql = "SELECT 
						COUNT(*) 
					FROM 
						almacen 
					WHERE 
						productoId = '".$res["productoId"]."' 
					AND 
						status = 'existe' 
					AND 
						sucursalId = '0'";
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
			$card["cantidadAlmacen"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
			$sucursal->setSucursalId($res['sucursalId']);
			$card['sucursal'] = $sucursal->GetNameById();
			
			$card['status'] = $util->GetSolicitudStatus($res['status']);
			$card['fecha'] = date('d-m-Y H:i:s',strtotime($res['fecha']));			
			$card['fechaRecibido'] = date('d-m-Y H:i:s',strtotime($res['fechaRecibido']));
			$card['fechaEnvio'] = date('d-m-Y H:i:s',strtotime($res['fechaEnvio']));
			
			$solicitudes[] = $card;
			
		}		
		
		return $solicitudes;
	}
	
	function EnumSolicitudes($status = 'solicitud')
	{
		global $sucursal;
		global $util;
		
		$info = $this->Info();
		
		if($info["sucursalId"] != 0)
		{
			$sqlAdd = "AND solicitud.sucursalId = '".$info["sucursalId"]."'";
		}
		
		$sql = "SELECT 
					solicitud.*, 
					producto.productoId, 
					producto.noIdentificacion, 
					producto.descripcion, 
					producto.unidad
				FROM solicitud
				LEFT JOIN 
					producto 
				ON 
					solicitud.productoId = producto.productoId
				WHERE 
					solicitud.status = '".$status."'".$sqlAdd;
			
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$result = $this->Util()->DBSelect($_SESSION['empresaId'])->GetResult();
		
		$solicitudes = array();
		foreach($result as $key => $res)
		{
			$card = $res;
			
			$sql = "SELECT 
						COUNT(*) 
					FROM 
						almacen 
					WHERE 
						productoId = '".$res["productoId"]."' 
					AND 
						status = 'existe' 
					AND 
						sucursalId = ".$info["sucursalId"];
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
			$card["disponible"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			$sql = "SELECT 
						COUNT(*) 
					FROM 
						almacen 
					WHERE 
						productoId = '".$res["productoId"]."' 
					AND 
						status = 'existe' 
					AND 
						sucursalId = '0'";
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
			$card["cantidadAlmacen"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
			$sucursal->setSucursalId($res['sucursalId']);
			$card['sucursal'] = $sucursal->GetNameById();
			
			$card['status'] = $util->GetSolicitudStatus($res['status']);
			$card['fecha'] = date('d-m-Y H:i:s',strtotime($res['fecha']));			
			$card['fechaRecibido'] = date('d-m-Y H:i:s',strtotime($res['fechaRecibido']));
			$card['fechaEnvio'] = date('d-m-Y H:i:s',strtotime($res['fechaEnvio']));
			
			$solicitudes[] = $card;
			
		}		
		
		return $solicitudes;
	}
	
	function EnumSolicitudesEnv($status = 'recibido')
	{
		global $sucursal;
		global $util;
		
		$info = $this->Info();
		
		if($info["sucursalId"] != 0)
		{
			$sqlAdd = "AND solicitud.sucursalId = '".$info["sucursalId"]."'";
		}
		
		$sql = "SELECT 
					solicitud.*, 
					producto.productoId, 
					producto.noIdentificacion, 
					producto.descripcion, 
					producto.unidad
				FROM solicitud
				LEFT JOIN 
					producto 
				ON 
					solicitud.productoId = producto.productoId
				WHERE 					
					solicitud.status = '".$status."' ".$sqlAdd;
			
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$result = $this->Util()->DBSelect($_SESSION['empresaId'])->GetResult();
		
		$solicitudes = array();
		foreach($result as $key => $res)
		{
			$card = $res;
						
			$sucursal->setSucursalId($res['sucursalId']);
			$card['sucursal'] = $sucursal->GetNameById();
			
			$card['status'] = $util->GetSolicitudStatus($res['status']);
			$card['fecha'] = date('d-m-Y H:i:s',strtotime($res['fecha']));			
			$card['fechaRecibido'] = date('d-m-Y H:i:s',strtotime($res['fechaRecibido']));
			$card['fechaEnvio'] = date('d-m-Y H:i:s',strtotime($res['fechaEnvio']));
			
			$solicitudes[] = $card;
			
		}		
		
		return $solicitudes;
	}

	function GetAllProductos($id = 0)
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery(
                        "SELECT *
                         FROM producto
                         ORDER BY descripcion ");

		$result = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();

		if($id == 0)
		{
			return $result;
		}

		foreach($result as $key => $value)
		{
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("
				SELECT precio FROM productoProveedor WHERE idProveedor = '".$id."' AND productoId = '".$value["productoId"]."'");
			$result[$key]["precioProveedor"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		}
		//print_r($result);
		return $result;
	}
	
	function GetProductosToExport()
	{

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM producto WHERE rfcId = ".$this->getRfcActive()." ORDER BY noIdentificacion");
		$productos = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM sucursal WHERE rfcId = '".$this->getRfcActive()."'");
		$sucursales = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM proveedor");
		$proveedores = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();
		
		foreach($productos as $key => $producto)
		{
			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$producto["productoId"]."' AND sucursalId = 0 AND status = 'existe'");
			$productos[$key]["existeEnAlmacen"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$producto["productoId"]."' AND sucursalId != 0 AND status = 'existe'");
			$productos[$key]["disponibleEnTiendas"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$producto["productoId"]."' AND sucursalId != 0 AND status = 'vendido'");
			$productos[$key]["vendidosEnTiendas"] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
			
			//por sucursal
			foreach($sucursales as $sucursal)
			{
				$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$producto["productoId"]."' AND sucursalId = ".$sucursal["sucursalId"]." AND status = 'vendido'");
				$productos[$key]["vendidoSucursal"][$sucursal["identificador"]] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

				$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM almacen WHERE productoId = '".$producto["productoId"]."' AND sucursalId = ".$sucursal["sucursalId"]." AND status = 'existe'");
				$productos[$key]["existeSucursal"][$sucursal["identificador"]] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			}
			
			//por proveedor
			foreach($proveedores as $proveedor)
			{
				$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT precio FROM productoProveedor WHERE productoId = '".$producto["productoId"]."' AND idProveedor = '".$proveedor["idProveedor"]."'");
				$productos[$key]["precioProveedor"][$proveedor["nombre"]] = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

			}
		}
		return $productos;
	}

	function GetTotalDisponible(){
		
		$sql = "SELECT 
					COUNT(*) 
				FROM 
					almacen 
				WHERE 
					productoId = '".$this->productoId."' 
				AND 
					status = 'existe'";				
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$total = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		return $total;
	}
	
	function GetDisponibleBySuc(){
		
		$sql = "SELECT 
					COUNT(*) 
				FROM 
					almacen 
				WHERE 
					productoId = '".$this->productoId."' 
				AND 
					status = 'existe' 
				AND 
					sucursalId = ".$this->sucursalId;
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$total = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		return $total;
	}
	
	function GetTotalEnt(){
		
		$sql = "SELECT 
					SUM(cantidad) 
				FROM 
					entregaProducto
				WHERE 
					conceptoId = '".$this->conceptoId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$total = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();
		
		return $total;
	}
	
	function GetNameById()
	{		
		$sql = 'SELECT descripcion FROM producto
				WHERE productoId = "'.$this->productoId.'"';		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$nombre = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

		return $nombre;
	}
	
	function SaveEntrega(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sql = "INSERT INTO  `entrega` (
				`idNota` ,				
				`fecha`,
				usuarioId,
				sucursalId
				)
			VALUES (				
				'".$this->idNota."', 				
				'".$this->fecha."',
				'".$this->usuarioId."',
				'".$this->sucursalId."'
			)";
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$entregaId = $this->Util()->DBSelect($_SESSION['empresaId'])->InsertData();
		
		$this->Util()->setError(30016, "complete");
		$this->Util()->PrintErrors();
		
		return $entregaId;
	
	}
	
	function UpdateEntregado(){
		
		$sql = "UPDATE 
					concepto
				SET 
					entregado = entregado + ".$this->cantidad." 
				WHERE 
					conceptoId = '".$this->conceptoId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();
		
		return true;
		
	}
	
	function UpdateRemoveEntregado(){
		
		$sql = "UPDATE 
					concepto
				SET 
					entregado = entregado - ".$this->cantidad." 
				WHERE 
					conceptoId = '".$this->conceptoId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();
		
		return true;
		
	}
	
	function RemoveSucursal(){
		
		$sql = "UPDATE 
					almacen 
				SET 
					status = 'vendido' 
				WHERE 
					productoId = '".$this->productoId."' 
				AND 
					status = 'existe' 
				AND 
					sucursalId = '".$this->sucursalId."' 
				LIMIT 
					".$this->cantidad;
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();
		
	}
	
	function RestoreSucursal(){
		
		$sql = "UPDATE 
					almacen 
				SET 
					status = 'existe' 
				WHERE 
					productoId = '".$this->productoId."' 
				AND 
					status = 'vendido' 
				AND 
					sucursalId = '".$this->sucursalId."'
				ORDER BY
					idAlmacen DESC
				LIMIT 
					".$this->cantidad;
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->UpdateData();
		
	}
	
	function EnumEntProductos(){
		
		$sql = "SELECT 
					* 
				FROM 
					entregaProducto
				WHERE 
					entregaId = '".$this->entregaId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$productos = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();
		
		return $productos;
	}
	
	function InfoEntrega(){
		
		$sql = "SELECT 
					* 
				FROM 
					entrega
				WHERE 
					entregaId = '".$this->entregaId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$row = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
		
		return $row;
	}
	
	function DeleteEntrega(){
		
		$sql = "DELETE FROM
					entrega
				WHERE 
					entregaId = '".$this->entregaId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$this->Util()->DBSelect($_SESSION["empresaId"])->DeleteData();
		
		$sql = "DELETE FROM
					entregaProducto
				WHERE 
					entregaId = '".$this->entregaId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$this->Util()->DBSelect($_SESSION["empresaId"])->DeleteData();
		
		$this->Util()->setError(30020, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	}
	
	function SaveEntregaProd(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sql = "INSERT INTO  `entregaProducto` (
				`idNota` ,				
				`entregaId`,
				conceptoId,
				productoId,
				cantidad
				)
			VALUES (				
				'".$this->idNota."', 				
				'".$this->entregaId."',
				'".$this->conceptoId."',
				'".$this->productoId."',
				'".$this->cantidad."'
			)";
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION['empresaId'])->InsertData();
				
		return true;
	
	}
	
	
	//CATEGORIAS
	
	function InfoCategory(){
		
		$sql = "SELECT 
					* 
				FROM 
					productoCategoria
				WHERE 
					prodCatId = '".$this->prodCatId."'";
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);	
		$row = $this->Util()->DBSelect($_SESSION["empresaId"])->GetRow();
		
		return $row;
	}
	
	function EnumAllCategories()
	{	
		$sql = "SELECT * FROM productoCategoria ORDER BY nombre ASC";
		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$categorias = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();

		return $categorias;
	}
	
	function EnumCategories()
	{
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT COUNT(*) FROM productoCategoria");
		$total = $this->Util()->DBSelect($_SESSION["empresaId"])->GetSingle();

		$pages = $this->Util->HandleMultipages($this->page, $total ,WEB_ROOT."/admin-productos/categorias");

		$sqlAdd = " LIMIT ".$pages["start"].", ".$pages["items_per_page"];

		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery("SELECT * FROM productoCategoria ORDER BY nombre ASC".$sqlAdd);
		$categorias = $this->Util()->DBSelect($_SESSION["empresaId"])->GetResult();

		$data["items"] = $categorias;
		$data["pages"] = $pages;

		return $data;
	}
	
	function SaveCategory(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sql = "INSERT INTO  `productoCategoria` 
				(
					nombre				
				)
			VALUES (				
				'".utf8_decode($this->name)."'
			)";
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION['empresaId'])->ExecuteQuery();
		
		$this->Util()->setError(30021, "complete", "Has agregado una categoria satisfactoriamente");
		$this->Util()->PrintErrors();
		
		return true;
	
	}
	
	function UpdateCategory(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		echo $sql = "UPDATE 
					`productoCategoria` 
				SET
					nombre = '".utf8_decode($this->name)."'
				WHERE
					prodCatId = ".$this->prodCatId;
		$this->Util()->DBSelect($_SESSION['empresaId'])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION['empresaId'])->ExecuteQuery();
		
		$this->Util()->setError(30022, "complete", "Has actualizado una categoria exitosamente");
		$this->Util()->PrintErrors();
		
		return true;
	
	}
	
	function DeleteCategory(){
		
		$sql = "DELETE FROM 
					productoCategoria
				WHERE 
					prodCatId = '".$this->prodCatId."'";		
		$this->Util()->DBSelect($_SESSION["empresaId"])->setQuery($sql);
		$this->Util()->DBSelect($_SESSION["empresaId"])->DeleteData();
		
		$this->Util()->setError(30023, "complete", "Has borrado una categoria satisfactoriamente");
		$this->Util()->PrintErrors();
		
		return true;

	}

}//Producto

?>