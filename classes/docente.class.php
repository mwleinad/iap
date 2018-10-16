<?php
class Docente extends Empresa{

	private $id_serie;
	private $id_empresa;
	private $id_rfc;
	private $respuesta;
	private $comentario;
	private $nombre;
	private $descripcion;
	private $Id;
	private $inicioContrato;
	private $finContrato;
	private $noContrato;
	private $habilitar;
	private $inicioMateria;
	private $finMateria;
	private $subtotal;
	
	
	
	
	public function setSubtotal($value){
		
		// $this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Inicio Materia');
		$this->subtotal = $value;
	}
	
	public function setInicioMateria($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Inicio Materia');
		$this->inicioMateria = $value;
	}
	
	public function setFinMateria($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Fin Materia');
		$this->finMateria = $value;
	}

	
	public function setInicioContrato($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Inicio Contrato');
		$this->inicioContrato = $value;
	}
	
	public function setFinContrato($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Fin Contrato');
		$this->finContrato = $value;
	}
	
	public function setNoContrato($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'No. Contrato');
		$this->noContrato = $value;
	}
	
	public function setHabilitar($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Respuesta');
		$this->habilitar = $value;
	}
	
	public function setIdSerie($value){
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Serie ID');
		$this->id_serie = $value;
	}
	
	
	public function setId($value){
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, '');
		$this->Id = $value;
	}

	
	
	public function setRespuesta($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Respuesta');
		$this->respuesta = $value;
	}
	
	
	public function setNombre($value){
		
		$this->Util()->ValidateString($value, $max_chars=255, $minChars = 1, 'Nombre');
		$this->nombre = $value;
	}
	
	public function setDescripcion($value){
		
		$this->Util()->ValidateString($value, $max_chars=2555555555555555, $minChars = 1, 'Descripcion');
		$this->descripcion = $value;
	}
	
	public function setComentario($value){
		
		$this->Util()->ValidateString($value, $max_chars=2555555555555555, $minChars = 0, '');
		$this->comentario = $value;
	}
	
	
	function SaveEncuesta($courseModuleId,$personalId){
	
		$sql = 'SELECT * 
				from
					pregunta 
				where
					encuestaId = 1 and tiporespuesta = "opcional"';
		$this->Util()->DB()->setQuery($sql);
		$lst = $this->Util()->DB()->GetResult();
		
		if(trim($_POST['comentario'])==''){
			echo 'fail[#]';
					echo '<div class="alert alert-warning alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					 <strong> Campo Requerido: Comentario
					 </strong>';
					 exit;
		}
		
		
		
		foreach($lst as $key=>$aux){
				if($_POST['check_'.$aux['preguntaId']] ==""){
					echo 'fail[#]';
					echo '<div class="alert alert-warning alert-dismissable">
					  <button type="button" class="close" data-dismiss="alert">&times;</button>
					 <strong> Para poder enviar su evaluación es necesario asignar calificación en cada una de las preguntas, favor de revisar
					 y completar su evaluación.
					 </strong>
					 <br>
					 <br>
					 Pregunta numero '.($key+1).' sin respuesta
					</div>';
					exit;
				}
		}
		
		// if($_POST['comentario']){
			// echo 'fail[#]';
			// echo '<div class="alert alert-warning alert-dismissable">
					  // <button type="button" class="close" data-dismiss="alert">&times;</button>
					  // <strong>La pregunta numero '.($key+1).' se encuentra sin respuesta</strong>
					// </div>';
			// exit;
		// }
		
		
		
		
		foreach($_POST as $key=>$aux){
			
			$r = explode("_",$key);
			if($r[0]=="check"){

				$this->setRespuesta($aux);
				 $sql = 'INSERT INTO resultado (
						preguntaId, 
						respuesta, 
						encuestaId, 
						courseModuleId, 
						profesorId, 
						usuarioId
					)
					VALUES(
						"'.$r[1].'",
						"'.$this->respuesta.'",
						1,
						"'.$courseModuleId.'",
						"'.$personalId.'",
						'.$_SESSION["User"]["userId"].'
					)';

					$this->Util()->DB()->setQuery($sql);
					$this->id = $this->Util()->DB()->InsertData();
			}
		}
		
		
		$sql = "INSERT INTO
							eval_alumno_docente
							( 	
								courseModuleId,
								docenteId,
								comentario,
								alumnoId
							)
						VALUES (
								'".$courseModuleId. "', 
								'".$personalId. "',
								'".$this->comentario. "',
                                '".$_SESSION["User"]["userId"]."'
							)";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->InsertData();

		return true;

		
	}
	
	public function onSaveDocumento()
	{
		
		if ($this->Id){
			 $sql = "
				UPDATE
					catalogodocumento 
				SET 
					nombre = '".$this->nombre."',
					descripcion = '".$this->descripcion."'
				WHERE 
					catalogodocumentoId = ".$this->Id;
					
		
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
		}else{
			
			$sql = "INSERT INTO 
			catalogodocumento 
			(						
				nombre, 
				descripcion
			)
		 VALUES 
			(						
				'".$this->nombre."',
				'".$this->descripcion."'
			)";
								
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->InsertData();
		}
		
					
		return true;
	}	
	
	public function infoDocumento()
	{
		$sql = 'SELECT * 
				from
					catalogodocumento 
				where
					catalogodocumentoId = '.$this->Id.'';
		$this->Util()->DB()->setQuery($sql);
		$lst = $this->Util()->DB()->GetRow();
		
		return $lst;
	}
	
	public function onDeleteDocumento()
	{
		 $sql = "
				UPDATE
					catalogodocumento 
				SET 
					estatus = 'eliminado'
				WHERE 
					catalogodocumentoId = ".$this->Id;
					
		
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	public function enviarArchivoRepo()
	{
		
		$sql = "INSERT INTO 
			repositorio 
			(						
				nombre
			)
		 VALUES 
			(						
				'".$this->nombre."'
			)";
								
		$this->Util()->DB()->setQuery($sql);
		$Id = $this->Util()->DB()->InsertData();
		
		$url = DOC_ROOT;
		$archivo = "comprobante";
		foreach($_FILES as $key=>$var)
		{
		   switch($key)
		   {
				   case $archivo:
					   if($var["name"]<>""){
							$aux = explode(".",$var["name"]);
							$extencion=end($aux);
							$temporal = $var['tmp_name'];
							$foto_name="doc_".$Id.".".$extencion;		
							if(move_uploaded_file($temporal,$url."/docentes/repositorio/".$foto_name)){						
								$sql = "UPDATE repositorio SET
										ruta = '".$foto_name."'
									WHERE
										repositorioId = ".$Id;
								$this->Util()->DB()->setQuery($sql);
								$this->Util()->DB()->ExecuteQuery();
							}   
						}
					break;
			}
		}
		
		return true;
		
	}
	
	
	
	public function deleteRepositorio($Id)
	{
		 $sql = "
				delete
					from 
					repositorio 
				WHERE 
					repositorioId = ".$Id;
					
		
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
		
		return true;
	}
	
	public function saveEditContrato(){
		
		 $sql = "
				UPDATE
					course_module 
				SET 
					initialDate = '".$this->inicioMateria."',
					finalDate = '".$this->finMateria."',
					fechaContrato = '".$this->inicioContrato."',
					fechaMateria = '".$this->finContrato."',
					noContrato = '".$this->noContrato."',
					subtotal = '".$this->subtotal."',
					habilitarDescargaContrato = '".$this->habilitar."'
				WHERE 
					courseModuleId = ".$this->Id;
					// exit;
		
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
		
		
		return true;
	} 
	
	
	public function onSendDoc(){
		
	
		
		$url = DOC_ROOT;
		$archivo = "cedula";
		
		foreach($_FILES as $key=>$var)
		{
		   switch($key)
		   {
				   case $archivo:
					   if($var["name"]<>""){
							$aux = explode(".",$var["name"]);
							$extencion=end($aux);
							$temporal = $var['tmp_name'];
							$foto_name="cedula_".$this->Id.".".$extencion;		
							if(move_uploaded_file($temporal,$url."/docentes/cedula/".$foto_name)){						
									$sql = "
											UPDATE
												course_module 
											SET 
												rutaCedula = '".$foto_name."'
											WHERE 
												courseModuleId = ".$this->Id;
									
									$this->Util()->DB()->setQuery($sql);
									$this->Util()->DB()->ExecuteQuery();
							}   
						}
					break;
			}
		}
		
		return true;
		
	}
	
	
	public function onSendContrato(){
		
	
		
		$url = DOC_ROOT;
		$archivo = "cedula";
		
		foreach($_FILES as $key=>$var)
		{
		   switch($key)
		   {
				   case $archivo:
					   if($var["name"]<>""){
							$aux = explode(".",$var["name"]);
							$extencion=end($aux);
							$temporal = $var['tmp_name'];
							$foto_name="contrato_".$this->Id.".".$extencion;		
							if(move_uploaded_file($temporal,$url."/docentes/contrato/".$foto_name)){						
									$sql = "
											UPDATE
												course_module 
											SET 
												rutaContrato = '".$foto_name."'
											WHERE 
												courseModuleId = ".$this->Id;
									
									$this->Util()->DB()->setQuery($sql);
									$this->Util()->DB()->ExecuteQuery();
							}   
						}
					break;
			}
		}
		
		return true;
		
	}
	
	
	
	public function onSendContratoFirmado(){
		
	
		
		$url = DOC_ROOT;
		$archivo = "cedula";
		
		foreach($_FILES as $key=>$var)
		{
		   switch($key)
		   {
				   case $archivo:
					   if($var["name"]<>""){
							$aux = explode(".",$var["name"]);
							$extencion=end($aux);
							$temporal = $var['tmp_name'];
							$foto_name="contrato_f_".$this->Id.".".$extencion;		
							if(move_uploaded_file($temporal,$url."/docentes/contrato/".$foto_name)){						
									$sql = "
											UPDATE
												course_module 
											SET 
												rutaContratoFirmado = '".$foto_name."'
											WHERE 
												courseModuleId = ".$this->Id;
									
									$this->Util()->DB()->setQuery($sql);
									$this->Util()->DB()->ExecuteQuery();
							}   
						}
					break;
			}
		}
		
		return true;
		
	}
	
	
	public function onBuscarMacth(){
		
		$filtro = "";
		
		if($_POST['activo']=='on' && $_POST['programado']=='on'){
			$filtro .= "";
		}
		else if($_POST['activo']=='on'){
			$filtro .= ' and IF(  "'.date('Y-m-d').'" >= cm.initialDate
						AND  "'.date('Y-m-d').'" <= cm.finalDate,  
						"Activo", IF( cm.initialDate >  "'.date('Y-m-d').'",  "Programado",  "Finalizada" ) ) = "Activo"';
		}
		else if($_POST['programado']=='on'){
			
			$filtro .= ' and IF(  "'.date('Y-m-d').'" >= cm.initialDate
						AND  "'.date('Y-m-d').'" <= cm.finalDate,  
						"Activo", IF( cm.initialDate >  "'.date('Y-m-d').'",  "Programado",  "Finalizada" ) ) = "Programado"';
		}
		
		
		if($_POST['linea']=='on' && $_POST['presencial']=='on'){
			$filtro .= " and  (cs.modality =  'Online' or  cs.modality =  'Local')";
		}
		else if($_POST['presencial']=='on'){
			$filtro .= " and cs.modality =  'Local'";
		}
		else if($_POST['linea']=='on'){
			$filtro .= " and cs.modality =  'Online'";
		}
		
		 $sqlQuery = 'SELECT 
					p.*, 
					cm.*,
					s.name as nameS,
					cs.modality,
					cs.group,
					sm.name as nameM,
					m.name as tipoC,
					IF(  "'.date('Y-m-d').'" >= cm.initialDate
						AND  "'.date('Y-m-d').'" <= cm.finalDate,  
						"Activo", IF( cm.initialDate >  "'.date('Y-m-d').'",  "Programado",  "Finalizada" ) ) AS estatusMateria
				FROM 
					course_module_personal AS cmp
				left join course_module AS cm ON cm.courseModuleId = cmp.courseModuleId 
				left join course AS cs ON cs.courseId = cm.courseId 
				left join subject_module AS sm ON sm.subjectmoduleId = cm.subjectmoduleId 
				left join subject AS s ON s.subjectId = sm.subjectId 
				left join course as c ON c.courseId = cm.courseId 
				left join major as m ON m.majorId = s.tipo 
				left join personal as p ON p.personalId = cmp.personalId 
				where 1 '.$filtro.' limit 0,50';
				
				// exit;
// exit;
		$this->Util()->DB()->setQuery($sqlQuery);
		$result = $this->Util()->DB()->GetResult();
		
		// foreach($result as $key=>$aux){
			
			
			// if($aux['finalDate'] > date('Y-m-d')){
				// $result[$key]['estatusAc'] = 'Activo';
			// }else{
				// $result[$key]['estatusAc'] = 'Finalizada';
			// }
			
			
		// }
		
		return $result;
		
	}
	
	
	public function onDeleteContra($Id){
		
		$sql = "
				UPDATE
					course_module 
				SET 
					rutaContrato = ''
				WHERE 
					courseModuleId = ".$Id;
		
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		
		$url = DOC_ROOT."/docentes/contrato/contrato_".$Id.".pdf";
		unlink($url);
		
		return true;
		
		
	}
	
	public function onDeleteContraF($Id){
		
		$sql = "
				UPDATE
					course_module 
				SET 
					rutaContratoFirmado = ''
				WHERE 
					courseModuleId = ".$Id;
		
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		
		 $sqlQuery = 'SELECT 
					*
				FROM 
					course_module
				where courseModuleId = '.$Id.'';
// exit;
		$this->Util()->DB()->setQuery($sqlQuery);
		$info = $this->Util()->DB()->GetRow();
		
		$url = DOC_ROOT."/docentes/contrato/contrato_f_".$info['rutaContratoFirmado'].".pdf";
		unlink($url);
		
		return true;
	}
	
	
	
	
	public function guadarDoc()
	{
		
		$sql = "INSERT INTO 
			repositorio 
			(						
				tipoDocumentoId,
				userId,
				subjectId
			)
		 VALUES 
			(						
				'".$_POST["tipoDocumentoId"]."',
				'".$_POST["usuarioId"]."',
				'".$_POST["subjectId"]."'
				
			)";
								
		$this->Util()->DB()->setQuery($sql);
		$Id = $this->Util()->DB()->InsertData();
		// exit;
		$url = DOC_ROOT;
		$archivo = "comprobante";
		foreach($_FILES as $key=>$var)
		{
		   switch($key)
		   {
				   case $archivo:
					   if($var["name"]<>""){
							$aux = explode(".",$var["name"]);
							$extencion=end($aux);
							$temporal = $var['tmp_name'];
							$foto_name="doc_".$Id.".".$extencion;		
							if(move_uploaded_file($temporal,$url."/alumnos/repositorio/".$foto_name)){						
								$sql = "UPDATE repositorio SET
										ruta = '".$foto_name."'
									WHERE
										repositorioId = ".$Id;
								$this->Util()->DB()->setQuery($sql);
								$this->Util()->DB()->ExecuteQuery();
							}   
						}
					break;
			}
		}
		
		return true;
		
	}
	
	
	public function onDoc($cmId)
	{
		$sql = "SELECT 
					* 
				FROM 
					repositorio
				WHERE
					repositorioId = ".$cmId."";
		// exit;
		$this->Util()->DB()->setQuery($sql);
		$info = $this->Util()->DB()->GetRow();
		
		 @unlink(DOC_ROOT.'/alumnos/repositorio/'.$info['ruta']);
		
		 $sql = "
				delete
					from 
					repositorio 
				WHERE 
					repositorioId = ".$cmId;
					
		
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
		
	
		
		
		return true;
	
	}
	
	public function saveEstatus()
	{
		// echo "<pre>"; print_r($_POST);
		// exit;
		$sql = "
				UPDATE
					user_subject 
				SET 
					aprobado = '".$_POST["estatus"]."'
				WHERE 
					courseId = ".$_POST["subjectId"]." and alumnoId = ".$_POST["usuarioId"];
					
		// exit;
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
			
			
		return true;
		
	}	
	
	
	
}//Docente


?>