<?php
class Solicitud extends Module
{

	private $nombre;
	private $Id;
	private $tipo;
	private $motivo;
	private $status;
	private $userId;
	private $tiposolicitudId;
	private $solicitudId;
	private $cursoId;
	private $observacion;
	private $pages;
	private $semestrejId;
	

	public function setSemestrejId($value)
	{
		$this->semestrejId = $value;
	}
	
	public function setPages($value)
	{
		$this->pages = $value;
	}
	
	
	public function setCursoId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->cursoId = $value;
	}
	
	public function setId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->Id = $value;
	}
	
	public function setSolicitudId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->solicitudId = $value;
	}
	
	public function setUserId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->userId = $value;
	}
	
	public function setTipoSolicitudId($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->tiposolicitudId = $value;
	}

	public function setTipo($value)
	{
		$this->Util()->ValidateInteger($value);
		$this->tipo = $value;
	}
	
	public function setNombre($value)
	{
		$this->Util()->ValidateString($value);
		$this->nombre = $value;
	}
	
	
	public function setObservacion($value)
	{
		$this->Util()->ValidateString($value);
		$this->observacion = $value;
	}
	
	public function setStatus($value)
	{
		$this->Util()->ValidateString($value);
		$this->status = $value;
	}
	
	public function setMotivo($value)
	{
		$this->Util()->ValidateString($value);
		$this->motivo = $value;
	}
	
	
	public function Info($id = null)
	{
		 $sqlQuery = 'SELECT 
					u.*,
					sb.*,
					s.*,
					c.*,
					s.folio as folioSolicitud,
					m.name as nombreMajor,
					s.horario as imprimeHorario
				FROM 
					solicitud as s
				left join user as u on u.userId = s.userId 
				left join subject as sb on sb.subjectId = s.subjectId 
				left join major as m on m.majorId = sb.tipo 
				left join course as c on c.courseId = s.courseId 
				WHERE   s.solicitudId  = '.$id.'';
// exit;
		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetRow();
		
		return $result;
	}
	
	public function enumarateSolicitudes($value)
	{
		$sqlQuery = 'SELECT 
					* 
				FROM 
					solicitud 
				WHERE  userId = '.$_SESSION['User']['userId'].' and tiposolicitudId  = '.$this->tipo.'';

		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetResult();
		
		return $result;
	}
	
	public function enumarateSolicitudesStden($value)
	{
		$filtro = '';
		
		if($this->nombre){
			$filtro .= ' and u.names like "%'.$this->nombre.'%"';
		}
		
		if($this->tiposolicitudId){
			$filtro .= ' and t.tiposolicitudId = '.$this->tiposolicitudId;
		}
		
		if($this->status){
			$filtro .= ' and s.estatus = "'.$this->status.'"';
		}
		
		if($this->inicio and $this->fin){
			$filtro .= ' and s.fechaSolicitud >= "'.$this->inicio.'" and fechaSolicitud <= "'.$this->fin.'"';
		}
		
		
		
		 $sqlQuery = 'SELECT 
					count(*)
				FROM 
					solicitud as s 
				left join user as u on u.userId = s.userId
				left join tiposolicitud as t on t.tiposolicitudId = s.tiposolicitudId
				left join subject as sb on sb.subjectId = s.subjectId
				WHERE  1 '.$filtro.' and s.tiposolicitudId <> 5 and s.userId = '.$_SESSION['User']['userId'].' order by orden asc';
// exit;
			
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$total = $this->Util()->DB()->GetSingle();
		
		
		$resPage = $this->Util->HandlePagesAjax($this->pages, $total , '');		
		$sqlLim = "LIMIT ".$resPage['pages']['start'].", ".$resPage['pages']['items_per_page'];
		
		 $sqlQuery = 'SELECT 
					*,
					t.nombre as solicitud,
					s.precio as costo
				FROM 
					solicitud as s 
				left join user as u on u.userId = s.userId
				left join tiposolicitud as t on t.tiposolicitudId = s.tiposolicitudId
				left join subject as sb on sb.subjectId = s.subjectId
				WHERE  1 '.$filtro.' and s.tiposolicitudId <> 5 and s.userId = '.$_SESSION['User']['userId'].' order by orden asc 
				'.$sqlLim.'';
// exit;
			
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$result7 = $this->Util()->DB()->GetResult();
		
		foreach($result as $key=>$aux){
			
			if(file_exists(DOC_ROOT."/alumnos/solicitud/".$aux['rutaAdjunto'])){
				$result[$key]['existeArchivo'] = 'si';
			}else{
				$result[$key]['existeArchivo'] = 'no';
			}
			
		}
		
		
		
		$result['result'] = $result7;
		
		$result['pages'] = $resPage['pages'];
		$result['info'] = $resPage['info'];
		
		
		return $result;
	}
	
	public function enumarateSolicitudesAdmin($value)
	{
		$filtro = '';
		
		if($this->nombre){
			$filtro .= ' and u.names like "%'.$this->nombre.'%"';
		}
		
		if($this->tiposolicitudId){
			$filtro .= ' and t.tiposolicitudId = '.$this->tiposolicitudId;
		}
		
		if($this->status){
			$filtro .= ' and s.estatus = "'.$this->status.'"';
		}
		
		if($this->inicio and $this->fin){
			$filtro .= ' and s.fechaSolicitud >= "'.$this->inicio.'" and fechaSolicitud <= "'.$this->fin.'"';
		}
		
		
		
		 $sqlQuery = 'SELECT 
					*,
					t.nombre as solicitud
				FROM 
					solicitud as s 
				left join user as u on u.userId = s.userId
				left join tiposolicitud as t on t.tiposolicitudId = s.tiposolicitudId
				WHERE  1 '.$filtro.'';
// exit;
			
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetResult();
		// echo '<pre>'; print_r($result);
		// exit;
		return $result;
	}
	
	
	public function SaveSolicitud()
	{
		$status = "";
		
		if($this->tipo == 4){
			$status = "completado";
		}
		else if($this->tipo == 3){
			$status = "pendiente";
		}
		else{
			$status = "pendiente";
		}
		
		
		
		
		
		 $sqlQuery = 'SELECT 
					count(*)
				FROM 
					solicitud 
				WHERE    estatus <> "completado" and 
				estatus <> "cancelado"
				and( tiposolicitudId = '.$this->tipo.' and userId = '.$_SESSION['User']['userId'].')';
		$this->Util()->DB()->setQuery($sqlQuery);
		$countS = $this->Util()->DB()->GetSingle();
		// exit;
		
		if($this->tipo <> 5){
			if($countS >= 1){
				echo 'fail[#]';
				echo '<center><font color="red">Existe una solicitud del mismo tipo en progreso</font></center>';
				exit;
			}
		}
		
		
		
		$sql = 'SELECT 
					*
				FROM 
					tiposolicitud 
				WHERE  tiposolicitudId = '.$this->tipo.'';
		
		$this->Util()->DB()->setQuery($sql);
		$infoSol =$this->Util()->DB()->GetRow();
		
		
		if($this->cursoId==''){
			$sql = 'SELECT 
					*
				FROM 
					user_subject as u
				left join  course as c on c.courseId = u.courseId
				WHERE  u.status = "activo" and alumnoId = '.$_SESSION['User']['userId'].' order by u.registrationId DESC';
			$this->Util()->DB()->setQuery($sql);
			$infoCo = $this->Util()->DB()->GetRow();
			$this->cursoId = $infoCo['courseId'];
		}else{
			$sql = 'SELECT 
					*
				FROM 
					course 
				WHERE  courseId = '.$this->cursoId.'';
			$this->Util()->DB()->setQuery($sql);
			$infoCo =$this->Util()->DB()->GetRow();
		}
		

		
		 $sqlNot="insert into 
				solicitud(
				subjectId,
				courseId,
				fechaSolicitud,
				tiposolicitudId,
				estatus,
				motivo,
				userId,
				precio,
				observacion
				)
			   values(
			            '".$infoCo['subjectId']."', 
			            '".$this->cursoId."', 
			            '".date('Y-m-d')."', 
			            '".$this->tipo."',
			            '".$status."',
			            '".$this->motivo."',
			            '".$_SESSION['User']['userId']."',
			            '".$infoSol['precio']."',
			            '".$this->observacion."'
			         )";
					 
			$this->Util()->DB()->setQuery($sqlNot);
			$Id = $this->Util()->DB()->InsertData(); 
			
			// if($this->tipo ==1 or $this->tipo ==2){ 
				// $ext = end(explode('.', basename($_FILES['comprobante']['name'])));
				// $filename  = "comprobante_".$Id.".".$ext;
				// $target_path = DOC_ROOT."/alumnos/comprobantes/comprobante_".$Id.".".$ext; 
				
				// move_uploaded_file($_FILES['comprobante']['tmp_name'], $target_path);
				
				// $sqlQuery = "UPDATE solicitud set ruta ='".$filename."'  where solicitudId = '".$Id."'"; 	
				// $this->Util()->DB()->setQuery($sqlQuery);
				// $this->Util()->DB()->ExecuteQuery();			  
			// }
		return $Id ;
	}
	
	
	public function SaveSolicitudAdmin($userId)
	{
		$status = "";
		
		if($this->tipo == 4){
			$status = "completado";
		}
		else if($this->tipo == 3){
			$status = "completado";
		}
		else{
			$status = "completado";
		}
		
		
		
		
		
		 $sqlQuery = 'SELECT 
					count(*)
				FROM 
					solicitud 
				WHERE    estatus <> "completado" and 
				estatus <> "cancelado"
				and( tiposolicitudId = '.$this->tipo.' and userId = '.$userId.')';
		$this->Util()->DB()->setQuery($sqlQuery);
		$countS = $this->Util()->DB()->GetSingle();
		// exit;
		
		if($this->tipo <> 5){
			if($countS >= 1){
				echo 'fail[#]';
				echo '<center><font color="red">Existe una solicitud del mismo tipo en progreso</font></center>';
				exit;
			}
		}
		
		
		
		$sql = 'SELECT 
					*
				FROM 
					tiposolicitud 
				WHERE  tiposolicitudId = '.$this->tipo.'';
		
		$this->Util()->DB()->setQuery($sql);
		$infoSol =$this->Util()->DB()->GetRow();
		
		
		if($this->cursoId==''){
			$sql = 'SELECT 
					*
				FROM 
					user_subject as u
				left join  course as c on c.courseId = u.courseId
				WHERE  u.status = "activo" and alumnoId = '.$userId.' order by u.registrationId DESC';
			$this->Util()->DB()->setQuery($sql);
			$infoCo = $this->Util()->DB()->GetRow();
			$this->cursoId = $infoCo['courseId'];
		}else{
			$sql = 'SELECT 
					*
				FROM 
					course 
				WHERE  courseId = '.$this->cursoId.'';
			$this->Util()->DB()->setQuery($sql);
			$infoCo =$this->Util()->DB()->GetRow();
		}
		

		
		 $sqlNot="insert into 
				solicitud(
				subjectId,
				courseId,
				fechaSolicitud,
				tiposolicitudId,
				estatus,
				motivo,
				userId,
				personalId,
				precio
				)
			   values(
			            '".$infoCo['subjectId']."', 
			            '".$this->cursoId."', 
			            '".date('Y-m-d')."', 
			            '".$this->tipo."',
			            '".$status."',
			            '".$this->motivo."',
			            '".$userId."',
			            '".$_SESSION['User']['userId']."',
			            '".$infoSol['precio']."'
			         )";
					 
			$this->Util()->DB()->setQuery($sqlNot);
			$Id = $this->Util()->DB()->InsertData(); 
			
			$this->validarPago($Id);
			
			// if($this->tipo ==1 or $this->tipo ==2){ 
				// $ext = end(explode('.', basename($_FILES['comprobante']['name'])));
				// $filename  = "comprobante_".$Id.".".$ext;
				// $target_path = DOC_ROOT."/alumnos/comprobantes/comprobante_".$Id.".".$ext; 
				
				// move_uploaded_file($_FILES['comprobante']['tmp_name'], $target_path);
				
				// $sqlQuery = "UPDATE solicitud set ruta ='".$filename."'  where solicitudId = '".$Id."'"; 	
				// $this->Util()->DB()->setQuery($sqlQuery);
				// $this->Util()->DB()->ExecuteQuery();			  
			// }
		return $Id ;
	}
	
	public function buscaBaja()
	{
		$sqlQuery = 'SELECT 
					* 
				FROM 
					solicitud 
				WHERE  userId = '.$_SESSION['User']['userId'].' and tiposolicitudId  = 3 and tipobaja <> ""';

		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetRow();
		
		return $result;
	}
	
	
	public function buscaBajaId($Id)
	{
		$sqlQuery = 'SELECT 
					* 
				FROM 
					solicitud 
				WHERE   solicitudId  = '.$Id.'';

		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetRow();
		
		return $result;
	}
	
	public function upSolicitudBaja()
	{
		// buscar la ultima baja y actulizarle la ruta
		$ext = end(explode('.', basename($_FILES['comprobante']['name'])));
		$filename  = "solicitud_".$Id.".".$ext;
		$target_path = DOC_ROOT."/alumnos/bajas/solicitud_".$Id.".".$ext; 
		
		move_uploaded_file($_FILES['comprobante']['tmp_name'], $target_path);
		
		$sqlQuery = "UPDATE solicitud set ruta ='".$filename."'  where solicitudId = '".$Id."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
	
	
	public function arraySolicitudes()
	{
		$sqlQuery = 'SELECT 
					* 
				FROM 
					tiposolicitud 
				WHERE  tiposolicitudId <> 5 order by orden asc';

		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetResult();
		
		return $result;
	}
	
	
	
	public function countReferenciaBancaria()
	{
		
		// echo '<pre>'; print_r($_SESSION);
		// exit;
		$sqlQuery = 'SELECT 
					count(*)
				FROM 
					solicitud 
				WHERE  tiposolicitudId = 5 and userId = '.$_SESSION['User']['userId'].'';

		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetSingle();
		
		return $result;
	}
	
	
	public function enviarArchivo()
	{
		// buscar la ultima baja y actulizarle la ruta
		$ext = end(explode('.', basename($_FILES['comprobante']['name'])));
		$filename  = "solicitud_".$this->solicitudId.".".$ext;
		$target_path = DOC_ROOT."/alumnos/comprobantes/solicitud_".$this->solicitudId.".".$ext; 
		
		move_uploaded_file($_FILES['comprobante']['tmp_name'], $target_path);
		
		$sqlQuery = "UPDATE solicitud set ruta ='".$filename."', estatus ='en progreso'  where solicitudId = '".$this->solicitudId."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
	public function enviarArchivoConstancia()
	{
		// buscar la ultima baja y actulizarle la ruta
		$ext = end(explode('.', basename($_FILES['comprobante']['name'])));
		$filename  = "doc_".$this->solicitudId.".".$ext;
		$target_path = DOC_ROOT."/alumnos/doc_adjuntos/doc_".$this->solicitudId.".".$ext; 
		
		move_uploaded_file($_FILES['comprobante']['tmp_name'], $target_path);
		
		$sqlQuery = "UPDATE solicitud set rutaAdjunto ='".$filename."', estatus ='completado'  where solicitudId = '".$this->solicitudId."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	public function cursoActivo()
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					user_subject as u
				left join course as c on c.courseId  = u.courseId
				WHERE  c.active = "si" and u.alumnoId = '.$_SESSION['User']['userId'].'';
		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetResult();
		return $result;
	}
	
	public function semestresxSubject($Id,$courseId)
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					subject_module as s
				WHERE  subjectId = '.$Id.' group by semesterId';
		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetResult();
		
		$sem = 2;
		foreach ($result  as $key=>$aux){
		if($key == 0 or $key == 1){
				$result2[$key]['semesterId'] = $aux['semesterId'];
			}
			else{
					
				 $sqlQuery = 'SELECT 
					count(*)
				FROM 
					confirma_inscripcion as c
				WHERE  subjectId = '.$Id.' and userId  = '.$_SESSION['User']['userId'].' and nivel = '.$sem.'';
				$this->Util()->DB()->setQuery($sqlQuery);
				$coun1 = $this->Util()->DB()->GetSingle();
				if($coun1 >= 1){
					$result2[$key]['semesterId'] = $sem+1;
				}
				$sem++;
			}
			
		}
		foreach ($result2  as $key=>$aux){
			 $sqlQuery = 'SELECT 
					count(*)
				FROM 
					confirma_inscripcion as c
				WHERE  subjectId = '.$Id.' and userId  = '.$_SESSION['User']['userId'].' and nivel = '.$aux['semesterId'].'';
			$this->Util()->DB()->setQuery($sqlQuery);
			$coun = $this->Util()->DB()->GetSingle();
			
			$sql = "
				SELECT * FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				WHERE courseId = '".$info["courseId"]."'
				ORDER BY semesterId ASC, initialDate ASC";
			
			
			
			 $sqlQuery = 'SELECT 
					count(*)
				FROM 
					course_module as c
				left join subject_module as sm on sm.subjectModuleId = c.subjectModuleId
				WHERE  sm.subjectId = '.$Id.' and sm.semesterId  = '.$aux['semesterId'].' and c.courseId = '.$courseId.' order by finalDate desc';
			
			$this->Util()->DB()->setQuery($sqlQuery);
			$dataCMAc = $this->Util()->DB()->GetSingle();
			
			if($dataCMAc['finalDate'] >= 1){
				$result2[$key]['verFormato'] = 'si';
			}else{
				$result2[$key]['verFormato'] = 'no';
			}
			
			if($coun >= 1){
				$result2[$key]['tiene'] = 'si';
			}
			
			
		}
		
		return $result2;
	}
	
	public function enumerateTiposSolicitud()
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					tiposolicitud
				WHERE  1';
			$this->Util()->DB()->setQuery($sqlQuery);
			$coun = $this->Util()->DB()->GetResult();
			
		return $coun;
	}
	
	
	public function enumerateSolicitudes()
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					tiposolicitud
				WHERE  tiposolicitudId = 1 or tiposolicitudId = 2 or tiposolicitudId = 3 or tiposolicitudId = 4 or tiposolicitudId = 6 or tiposolicitudId = 7 ORDER BY orden asc';
			$this->Util()->DB()->setQuery($sqlQuery);
			$coun = $this->Util()->DB()->GetResult();
			
		return $coun;
	}
	
	
	public function infoSolicitud($Id)
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					tiposolicitud
				WHERE  tiposolicitudId = '.$Id.'';
			$this->Util()->DB()->setQuery($sqlQuery);
			$coun = $this->Util()->DB()->GetRow();
			
		return $coun;
	}
	
	
	
	public function enumerateSincronizacion($Id)
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					tablasincronizada
				WHERE  1';
			$this->Util()->DB()->setQuery($sqlQuery);
			$coun = $this->Util()->DB()->GetResult();
			
		return $coun;
	}

	public function cancelarSolicitud($Id)
	{
		$sqlQuery = "UPDATE solicitud set estatus ='cancelado'  where solicitudId = '".$this->solicitudId."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
	
	public function realizarBaja($Id)
	{
		$sqlQuery = "UPDATE solicitud set estatus ='completado'  where solicitudId = '".$Id."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$sqlQuery = 'SELECT 
					*
				FROM 
					solicitud
				WHERE  solicitudId = '.$Id.'';
		$this->Util()->DB()->setQuery($sqlQuery);
		$coun = $this->Util()->DB()->GetRow();
		
		$sqlQuery = "UPDATE user_subject set status ='inactivo'  where alumnoId = '".$coun['userId']."' and courseId = ".$coun['courseId'].""; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
	public function validarPagoAdjunto($Id)
	{
		
		 $sqlQuery = 'SELECT 
					*
				FROM 
					folio
				WHERE  folioId = 1';
		$this->Util()->DB()->setQuery($sqlQuery);
		$infoFol = $this->Util()->DB()->GetRow();
		
		$folio = $infoFol['nomenclatura'].'/'.$infoFol['folioSiguiente'];
		
		$sqlQuery = 'SELECT 
					*
				FROM 
					solicitud
				WHERE  solicitudId = '.$Id.'';
		$this->Util()->DB()->setQuery($sqlQuery);
		$coun = $this->Util()->DB()->GetRow();
		
				
		//busca donde en el moduleCourse donde se encuentra inscrito
		$sqlQuery = 'SELECT 
					*
				FROM 
					confirma_inscripcion
				WHERE userId = '.$coun['userId'].' order by confirmaInscripcionId DESC ';
			$this->Util()->DB()->setQuery($sqlQuery);
		$infoConfirma = $this->Util()->DB()->GetRow();
		
		$url = DOC_ROOT;
		$archivo = "archivos";
		
		foreach($_FILES as $key=>$var)
		{
		   switch($key)
		   {
				   case $archivo:
					   if($var["name"]<>""){
							$aux = explode(".",$var["name"]);
							$extencion=end($aux);
							$temporal = $var['tmp_name'];
							$foto_name="solicitud_".$Id.".".$extencion;		
							if(move_uploaded_file($temporal,$url."/alumnos/solicitud/".$foto_name)){						
									$sql = "
											UPDATE
												solicitud 
											SET 
												rutaAdjunto = '".$foto_name."'
											WHERE 
												solicitudId = ".$Id;
									
									$this->Util()->DB()->setQuery($sql);
									$this->Util()->DB()->ExecuteQuery();
							}   
						}
					break;
			}
		}
		
		
		$sqlQuery = "
			UPDATE 
				solicitud 
			set 
				estatus = 'completado',
				folio ='".$folio."',
				courseModuleId ='".$infoConfirma['courseModuleId']."',
				nivelInscrito ='".$infoConfirma['nivel']."',
				nombreFirma ='',
				sexoFirma ='',
				puestofirmante ='',
				horario ='',
				fechaEntrega ='".date('Y-m-d')."'
			where 
				solicitudId = '".$Id."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$sqlQuery = "
			UPDATE 
				folio 
			set 
				folioSiguiente = '".($infoFol['folioSiguiente']+1)."', 
				folioActual ='".$infoFol['folioSiguiente']."' 
			where
				folioId = 1 "; 	
// exit;	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
		
	}
	
	public function validarPago($Id)
	{
		
		$sqlQuery = 'SELECT 
					*
				FROM 
					solicitud
				WHERE  solicitudId = '.$Id.'';
		$this->Util()->DB()->setQuery($sqlQuery);
		$coun = $this->Util()->DB()->GetRow();
		
		$sqlQuery = 'SELECT 
					*
				FROM 
					course
				WHERE  courseId = '.$coun['courseId'].'';
				// exit;
		$this->Util()->DB()->setQuery($sqlQuery);
		$infoCo = $this->Util()->DB()->GetRow();
		
		 $sqlQuery = 'SELECT 
					*
				FROM 
					folio
				WHERE  folioId = 1';
		$this->Util()->DB()->setQuery($sqlQuery);
		$infoFol = $this->Util()->DB()->GetRow();
		
		$sqlQuery = 'SELECT 
					*
				FROM 
					personal
				WHERE  firmaConstancia = "si"';
		$this->Util()->DB()->setQuery($sqlQuery);
		$infoFirma = $this->Util()->DB()->GetRow();
		
		$folio = $infoFol['nomenclatura'].'/'.$infoFol['folioSiguiente'];
		
		if($infoFirma['sexo']=='m'){
			$puestofirmante ='Directora Academica';
		}else{
			$puestofirmante ='Director Academico';
		}
		
		//busca donde en el moduleCourse donde se encuentra inscrito
		$sqlQuery = 'SELECT 
					*
				FROM 
					confirma_inscripcion
				WHERE userId = '.$coun['userId'].' order by confirmaInscripcionId DESC ';
			$this->Util()->DB()->setQuery($sqlQuery);
		$infoConfirma = $this->Util()->DB()->GetRow();
		
		
		
		$sqlQuery = "
			UPDATE 
				solicitud 
			set 
				estatus = 'completado',
				folio ='".$folio."',
				courseModuleId ='".$infoConfirma['courseModuleId']."',
				nivelInscrito ='".$infoConfirma['nivel']."',
				nombreFirma ='".$infoFirma['name']." ".$infoFirma['lastname_materno']." ".$infoFirma['lastname_paterno']."',
				sexoFirma ='".$infoFirma['sexo']."',
				puestofirmante ='".$puestofirmante."',
				horario ='".$infoCo['dias']." con un horario de ".$infoCo['horario']."',
				fechaEntrega ='".date('Y-m-d')."'
			where 
				solicitudId = '".$Id."'"; 	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$sqlQuery = "
			UPDATE 
				folio 
			set 
				folioSiguiente = '".($infoFol['folioSiguiente']+1)."', 
				folioActual ='".$infoFol['folioSiguiente']."' 
			where
				folioId = 1 "; 	
// exit;	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	public function buscaDondeIns($Id)
	{
		 $sqlQuery = 'SELECT 
					*
				FROM 
					confirma_inscripcion
				WHERE  subjectId = '.$Id.' and userId = '.$_SESSION['User']['userId'].' ORDER BY  nivel DESC';
			// exit;
			$this->Util()->DB()->setQuery($sqlQuery);
		$coun = $this->Util()->DB()->GetRow();
		
		return $coun;
	}
	
	
	
	public function buscaCalificaciones($Id,$userId)
	{
		

		$this->Util()->DB()->setQuery("
				SELECT 
					course_module.courseId,
					subject_module.name,
					subject_module.semesterId,
					course_module.courseModuleId
				FROM 
					course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				LEFT JOIN subject ON subject.subjectId = subject_module.subjectId
				WHERE courseId = '".$Id."' and subject_module.semesterId = ".$this->semestrejId."
				group BY subject_module.semesterId, initialDate asc");
		$result = $this->Util()->DB()->GetResult();
			
		foreach($result as $key=>$aux){
			$materias = 0;
			 $sql = "
				SELECT 
					cms.calificacion
				FROM course_module
				LEFT JOIN subject_module ON subject_module.subjectModuleId = course_module.subjectModuleId
				LEFT JOIN course_module_score as cms ON cms.courseModuleId = course_module.courseModuleId
				WHERE 
					course_module.courseModuleId = '".$aux['courseModuleId']."' and
					subject_module.semesterId = ".$aux['semesterId']." and 
					userId = ".$userId." and 
					calificacionValida = 'si'";

			$this->Util()->DB()->setQuery($sql);
			$materias = $this->Util()->DB()->GetSingle();
			$result[$key]['calificacionValida'] = $materias;
		}
		
		
		return $result;
	}
	
	public function actualizaBaja($Id)
	{
		$sqlQuery = "
			UPDATE 
				solicitud 
			set 
				estatus = 'en progreso'
			where
				solicitudId = '".$Id."'"; 	
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
	}
	
	
	
	public function actulizarRutaBoleta($Id)
	{
		$sqlQuery = "
			UPDATE 
				solicitud 
			set 
				rutaAdjunto = 'solicitud_".$Id.".pdf'
			where
				solicitudId = '".$Id."'"; 	
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
	
	public function updateBoleta($Id,$cId)
	{
		$sqlQuery = "
			UPDATE 
				solicitud 
			set 
				courseModuleId = '".$cId."'
			where
				solicitudId = '".$Id."'"; 	
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
	public function updateSemestre($Id,$cursoId)
	{
		
		 $sqlQuery = 'SELECT 
					*
				FROM 
					folio
				WHERE  folioId = 1';
		$this->Util()->DB()->setQuery($sqlQuery);
		$infoFol = $this->Util()->DB()->GetRow();
		
		$folio = $infoFol['nomenclatura'].'/'.$infoFol['folioSiguiente'];
		
			$sqlQuery = "
			UPDATE 
				solicitud
			set 
				nivelInscrito = '".$cursoId ."',
				folio ='".$folio."'
			where
				solicitudId = '".$Id."'"; 	
	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$sqlQuery = "
			UPDATE 
				folio 
			set 
				folioSiguiente = '".($infoFol['folioSiguiente']+1)."', 
				folioActual ='".$infoFol['folioSiguiente']."' 
			where
				folioId = 1 "; 	
// exit;	
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	
}	
?>