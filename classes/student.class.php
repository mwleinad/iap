<?php

class Student extends User
{
	private $subjectId;
	private $name;
	private $apaterno;
	private $amaterno;
	private $nombre;
	private $noControl;
	private $estatus;

		
	public function setSubjectId($value)
	{
		$this->subjectId = $value;	
	}
	private $alumnoId;
	
	public function setAlumnoId($value)
	{
		$this->alumnoId = $value;	
	}
	
	public function setName($value)
	{	
		$this->name = $value;
	}
	
	public function setNombre($value)
	{	
		$this->nombre = $value;
	}
	
	public function setApaterno($value)
	{	
		$this->apaterno = $value;
	}
	
	public function setAmaterno($value)
	{	
		$this->amaterno = $value;
	}
	
	public function setNocontrol($value)
	{	
		$this->noControl = $value;
	}
	
	public function setEstatus($value)
	{	
		$this->estatus = $value;
	}
	

	public function setTipoBeca($value)
	{	
		$this->tipo_beca = $value;
	}
	
		public function setPorBeca($value)
	{	
		$this->por_beca = $value;
	}
	
	public function UpdateFoto()
	{
			$ext = end(explode('.', basename($_FILES['foto']['name'])));
			if(strtolower($ext) != "jpg" && strtolower($ext) != "jepg")
			{
				$this->Util()->setError(10028, "error", "La extension solo puede ser jpg");
				$this->Util()->PrintErrors();
				return;
			}
			$target_path = DOC_ROOT."/alumnos/".$_POST["userId"].".jpg"; 
			
			if(move_uploaded_file($_FILES['foto']['tmp_name'], $target_path)) {
/*				$sql = "UPDATE
							resource
							SET
								path = '".$relative_path."'
							WHERE resourceId = '".$id."'";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData();
*/
				$this->Util()->setError(10028, "complete", "Has cambiado la foto satisfactoriamente.");
				$this->Util()->PrintErrors();
					
			}

	}
	
	public function desactivar(){
		
	$sql="update user set activo='0' where userId='".$this->getUserId()."' ";
	$this->Util()->DB()->setQuery($sql);
	
	     if(!$this->Util()->DB()->ExecuteQuery()){
		      
            // $sql="delete from user_subjet where alumnoId ='".$this->getUserId()."' "; //Agregado por JRosales 29/09/2014
	        // $this->Util()->DB()->setQuery($sql);                                      //Agregado por JRosales 29/09/2014 
	        // $this->Util()->DB()->DeleteData();                                        //Agregado por JRosales 29/09/2014
              
		 	// $this->Util()->setError(10030, "complete","El Alumno fue dado de Baja Correctamente");
            // $this->Util()->PrintErrors();
		
		  		
		  $infoStudent=$this->GetInfo();
		//print_r($infoStudent); exit;
					$fecha_aplicacion=date("Y-m-d H:i:s"); 
					$hecho=$_SESSION['User']['userId']."p";
				    $actividad="Se ha dado de Baja un Alumno(".$infoStudent['controlNumber']."-".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno'].") desde el panel de Administración ";
					$visto="1p,".$_SESSION['User']['userId']."p";
					$enlace="/student";
					

					$sqlNot="insert into notificacion(notificacionId,actividad,vista,hecho,fecha_aplicacion,tablas,enlace)
			   values(
			              '',
			            '".$actividad."', 
			            '".$visto."',
			            '".$hecho."',
			            '".$fecha_aplicacion."',
			            'reply',
						'".$enlace."'
			     
			         )";
					 
			$this->Util()->DB()->setQuery($sqlNot);
			//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();  
		 
		 

		 
		 return true;
		 }else{
		 $this->Util()->setError(10030, "complete","No ne pudo desactivar al Alumno intente mas tarde");
		$this->Util()->PrintErrors();
		 return false;
		 }}
		 
		 	public function Activar(){
	 $sql="update user set activo='1' where userId='".$this->getUserId()."' ";
	$this->Util()->DB()->setQuery($sql);
	
	     if(!$this->Util()->DB()->ExecuteQuery()){
		 
		 	$this->Util()->setError(10030, "complete","El Alumno fue dado de Alta Correctamente");
		$this->Util()->PrintErrors();
		
		
		  $infoStudent=$this->GetInfo();
		//print_r($infoStudent); exit;
					$fecha_aplicacion=date("Y-m-d H:i:s"); 
					$hecho=$_SESSION['User']['userId']."p";
				    $actividad="Se ha dado de Alta un Alumno(".$infoStudent['controlNumber']."-".$infoStudent['names']." ".$infoStudent['lastNamePaterno']." ".$infoStudent['lastNameMaterno'].") desde el panel de Administración ";
					$visto="1p,".$_SESSION['User']['userId']."p";
					$enlace="/student";
					

					$sqlNot="insert into notificacion(notificacionId,actividad,vista,hecho,fecha_aplicacion,tablas,enlace)
			   values(
			              '',
			            '".$actividad."', 
			            '".$visto."',
			            '".$hecho."',
			            '".$fecha_aplicacion."',
			            'reply',
						'".$enlace."'
			     
			         )";
					 
			$this->Util()->DB()->setQuery($sqlNot);
			//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();
		
		
		
		
		
		
		return true;
		 }else{
		 $this->Util()->setError(10030, "complete","No ne pudo Activar al Alumno intente mas tarde");
		$this->Util()->PrintErrors();
		 return false;
		 }}
	
	
	public function GetInfo()
	{ //print_r($this->userId);exit;
		$this->Util()->DB()->setQuery("SELECT * FROM user WHERE userId = '".$this->userId."'");
		
		$row = $this->Util()->DB()->GetRow();
		$row["names"] = $this->Util()->DecodeTiny($row["names"]);
		$row["lastNamePaterno"] = $this->Util()->DecodeTiny($row["lastNamePaterno"]);
		$row["lastNameMaterno"] = $this->Util()->DecodeTiny($row["lastNameMaterno"]);
		return $row;
	}
	
	public function EnumerateTotal(){
	
	   $sql ="select * from user";
	   $this->Util()->DB()->setQuery($sql);
	   $result = $this->Util()->DB()->GetResult();
	return $result;
	}
	
	public function EnumeratePaises(){
	
	   $sql ="select * from pais";
	   $this->Util()->DB()->setQuery($sql);
	   $result = $this->Util()->DB()->GetResult();
	return $result;
	}
	
		public function EnumerateEstados(){
	
	   $sql ="select * from estado where paisId='".$this->getCountry()."'";
	   $this->Util()->DB()->setQuery($sql);
	   $result = $this->Util()->DB()->GetResult();
	return $result;
	}
	
		public function EnumerateCiudades(){
	
	   $sql ="select * from municipio where estadoId='".$this->getState()."' ";
	   $this->Util()->DB()->setQuery($sql);
	   $result = $this->Util()->DB()->GetResult();
	return $result;
	}
	
	public function EnumerateStudent($sql){
	
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		foreach($result as $key => $res){
			$card = $res;
			$result2[$key] = $card;		
		}
		
		return $result2;
	}
	
	public function Enumerate($orderSemester = '', $sqlSearch = '')
	{
		global $semester;
		global $group;
		
		$sql = "SELECT 
					* 
				FROM 
					user 
				WHERE 
					1".$sqlSearch."
				AND
					type = 'student'
				ORDER BY 
					".$orderSemester."
					lastNamePaterno ASC, 
					lastNameMaterno ASC,  
					`names` ASC";
					
					//print_r($sql);
		
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		foreach($result as $key => $res){
			$card = $res;
			$result2[$key] = $card;		
		}
		
		return $result2;
	}
	
	public function EnumerateCount($sqlSearch = '')
	{		
		
		$this->Util()->DB()->setQuery("
							SELECT 
								COUNT(*) 
							FROM 
								user 
							WHERE 
								1".$sqlSearch."
							AND
								type = 'student'
							"
						);
		$total = $this->Util()->DB()->GetSingle();
						
		return $total;
	}
	
	public function Save($option=""){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		//Verificando que no se duplique el correo electronico
		$this->Util()->DB()->setQuery("
							SELECT 
								COUNT(*) 
							FROM 
								user 
							WHERE 
								email = '".$this->getEmail()."'
							"
						);
		$total = $this->Util()->DB()->GetSingle();
		
		
		
		if($total > 0)
		{
			$this->Util()->setError(10028, "error", "Este e-mail ya ha sido registrado previamente");
			$this->Util()->PrintErrors();
			return false;
		}
                   //Validando contraseña de minimo 6 caracteres
		if(strlen($this->getPassword()) < 6)
		{
			$this->Util()->setError(10028, "error", "El password debe de contener al menos 6 caracteres.");
			$this->Util()->PrintErrors();
			return false;
		}
		
		 $sqlQuery = "INSERT INTO 
						user 
						(
							type,
							names, 
							lastNamePaterno, 
							lastNameMaterno,
							controlNumber,
							birthdate,							
							email, 
							phone, 
							password,
							street, 
							number, 
							colony, 
							ciudad, 
							estado, 
							pais, 
							postalCode, 
							sexo, 
							maritalStatus, 
							fax,
							mobile,
							workplace,
							workplaceOcupation,
							workplaceAddress,
							workplaceArea,
							workplacePosition,
							workplaceCity,
							paist,
							estadot,
							ciudadt,
							workplacePhone,
							workplaceEmail,
							academicDegree,
							profesion,
							school,
							masters,
							mastersSchool,
							highSchool
						)
							VALUES
						(
							'student',
							'".$this->getNames()."', 
							'".$this->getLastNamePaterno()."', 
							'".$this->getLastNameMaterno()."',
							'".$this->getControlNumber()."',
							'".$this->getBirthdate()."',							
							'".$this->getEmail()."', 
							'".$this->getPhone()."', 
							'".$this->getPassword()."',
							'".$this->getStreet()."', 
							'".$this->getNumer()."', 
							'".$this->getColony()."', 
							'".$this->getCity()."', 
							'".$this->getState()."', 
							'".$this->getCountry()."', 
							'".$this->getPostalCode()."', 
							'".$this->getSexo()."', 
							'".$this->getMaritalStatus()."', 
							'".$this->getFax()."', 
							'".$this->getMobile()."', 
							'".$this->getWorkplace()."', 
							'".$this->getWorkplaceOcupation()."', 
							'".$this->getWorkplaceAddress()."', 
							'".$this->getWorkplaceArea()."', 
							'".$this->getWorkplacePosition()."', 
							'".$this->getWorkplaceCity()."', 
							'".$this->getPaisT()."', 
							'".$this->getEstadoT()."', 
							'".$this->getCiudadT()."',
							'".$this->getWorkplacePhone()."', 
							'".$this->getWorkplaceEmail()."', 
							'".$this->getAcademicDegree()."', 
							'".$this->getProfesion()."', 
							'".$this->getSchool()."', 
							'".$this->getMasters()."', 
							'".$this->getMastersSchool()."', 
							'".$this->getHighSchool()."' 
							
						)";
						
						
						
		$this->Util()->DB()->setQuery($sqlQuery);
		
		
		if($this->Util()->DB()->InsertData()){
		          $this->Util()->DB()->setQuery("SELECT MAX(userId) FROM user");
		          $id = $this->Util()->DB()->GetSIngle();
				  $fecha_aplicacion=date("Y-m-d H:i:s"); 
				  $enlace="/student";
		//print_r($this->getRegister()); exit;
		               if($this->getRegister()==0){
					      //$hecho=$this->getNames()." ".$this->getLastNamePaterno()." ".$this->getLastNameMaterno();
					      $hecho=$id."u";
					$actividad="Se ha Registrado un nuevo Alumno";
					 $visto=$id."u,1p";
					}else{
					     $hecho=$_SESSION['User']['userId']."p";
				      $actividad="Se ha registrado un Alumno(".$this->getNames()." ".$this->getLastNamePaterno()." ".$this->getLastNameMaterno().") desde el panel de Administración ";
					$visto="1p,".$_SESSION['User']['userId']."p";
					}
					

					$sqlNot="insert into notificacion(notificacionId,actividad,vista,hecho,fecha_aplicacion,tablas,enlace)
			   values(
			              '',
			            '".$actividad."', 
			            '".$visto."',
			            '".$hecho."',
			            '".$fecha_aplicacion."',
			            'reply',
						'".$enlace."'
			     
			         )";
					 
			$this->Util()->DB()->setQuery($sqlNot);
			//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();  
		
		}

		$this->Util()->DB()->setQuery("SELECT MAX(userId) FROM user");
		$id = $this->Util()->DB()->GetSIngle();
		
	
		
		if($option == "createCurricula")
		{
			$course = new Course();
			
			$course->setCourseId($_POST["curricula"]);
			$courseInfo = $course->Info();
              if($this->tipo_beca=="Ninguno")
			    $this->por_beca=0;
				
			$this->AddUserToCurricula($id, $_POST["curricula"], $this->getNames(), $this->getEmail(), $this->getPassword(), $courseInfo["majorName"], $courseInfo["name"],$this->tipo_beca,$this->por_beca);
			
			if($this->getRegister()==0){
			$complete1 = "Te has registrado exitosamente. Te hemos enviado un correo electronico con los datos de ingreso al sistema";
			$this->Util()->setError(10028, "complete", $complete1);
			$complete2 = "En caso de no estar en tu bandeja de entrada, verifica en correos no deseados";
			$this->Util()->setError(10028, "complete", $complete2);
			$complete4 = "Cualquier problema que llegaras a tener, escribenos a enlinea@iapchiapas.org.mx";
			$this->Util()->setError(10028, "complete", $complete4);
			
			$complete3 = "Bienvenido";
			$this->Util()->setError(10028, "complete", $complete3);
			
			
			
			}
            else{
			$complete="Has ingresado al Alumno exitosamente, Se ha enviado un correo electronico para continuar con su proceso de inscripción";
	        $this->Util()->setError(10028, "complete", $complete);
		   }
	}
	
//print_r($_POST); EXIT;
	
	/*    */
		
		$this->Util()->PrintErrors();
		
		return true;
	}
	
	
	function DeleteStudentCurricula()
	{
		$courseId=$this->getCourseId();
		$userId=$this->getUserId();
	
		$sql="SELECT * FROM invoice where userId='".$userId."'  and courseId='".$courseId."'";
		//print_r($sql);
		$this->Util()->DB()->setQuery($sql);
		$invoices = $this->Util()->DB()->GetResult();
		$x=0;
		if(count($invoices)>0)
		{
			foreach($invoices as $key=>$res){
				$sqlPayment="SELECT * FROM payment WHERE invoiceId='".$invoices[$key]['invoiceId']."' AND status = 'activo'";
				$this->Util()->DB()->setQuery($sqlPayment);
				$payments = $this->Util()->DB()->GetResult();
				if(count($payments)>0){
					$x++;
				}
			}
	 	}

		if($x>0){
	    $this->Util()->setError(10028, "complete","No se puede Eliminar Alumno de Curricula porque ya existen Pagos Realizados");
			$this->Util()->PrintErrors();

			return false;
		}
		
    if((count($invoices)>0 && $x==0) || count($invoices)==0){
		  if(count($invoices)>0){
		     $sql="DELETE FROM invoice WHERE userId='".$userId."'  and courseId='".$courseId."' ";
		     $this->Util()->DB()->setQuery($sql);
		     $this->Util()->DB()->ExecuteQuery();
    	}
			$sql="DELETE FROM user_subject where alumnoId='".$userId."' and courseId='".$courseId."' ";
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->ExecuteQuery();
			$this->Util()->setError(10028, "complete","Alumno eliminado con exito de esta curricula");
			$this->Util()->PrintErrors();
		
			return true;
  	}
	}
	
	
	
	function AddUserToCurriculaFromCatalog($userId, $courseId,$tipo_beca,$por_beca)
	{
			$course = new Course();
			
			$course->setCourseId($courseId);
			$courseInfo = $course->Info();

			$user = new User();
			$this->setUserId($userId);
			//print_r($userId); exit;
 		    $info = $this->GetInfo();
			//echo "<pre>".print_r($info)."</pre>";
			//echo "<pre>".print_r($courseInfo)."</pre>";
			//exit;
			if($courseInfo['majorName']=="ESPECIALIDAD" || $courseInfo['majorName']=="MAESTRIA")
			  $matricula=$this->generaMatricula($info['majorName'],$courseId);
			else
			$matricula="";
			
			
			$complete = $this->AddUserToCurricula($userId, $courseId, $info["names"], $info["email"], $info["password"], $courseInfo["majorName"], $courseInfo["name"],$tipo_beca,$por_beca,$matricula);
			
			$this->Util()->setError(10028, "complete", $complete);
			$this->Util()->PrintErrors();
		return $complete;
	}
	
	public function generaMatricula($major,$courseId){
	
	switch($major)
	{
		case 'MAESTRIA':
								$year=date('Y');
								//print_r($year);
								$year = substr($year, -2);
								
						$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE matricula like '5036%'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
				
				$maestrias = $this->Util()->DB()->GetResult();
				
				      foreach($maestrias as $fila){
					     $num=$fila['matricula'];
					  }
					  
					  $num = substr($num, -3);    // devuelve "ef"
						$num=$num +1;
						
						 if(strlen($num)==2){
			              $num="0".$num;
			            }
						
								
							$matricula="5036101".$year.$num;
							
							return $matricula;
		
		break;
		
		case 'ESPECIALIDAD':
		
		$year=date('Y');
								//print_r($year);
								$year = substr($year, -2);
								
						$this->Util()->DB()->setQuery("
				SELECT *, user_subject.status AS status FROM user_subject
				LEFT JOIN user ON user_subject.alumnoId = user.userId
				WHERE matricula like '5046%'
				ORDER BY lastNamePaterno ASC, lastNameMaterno ASC, names ASC");
				
				$maestrias = $this->Util()->DB()->GetResult();
				
				      foreach($maestrias as $fila){
					     $num=$fila['matricula'];
					  }
					  
					  $num = substr($num, -3);    // devuelve "ef"
						$num=$num +1;
						
						 if(strlen($num)==2){
			              $num="0".$num;
			            }
						
								
							$matricula="5046101".$year.$num;
							
							return $matricula;
		
		
		
		
		
		break;
	
	}
	
	}
	
	public function AddUserToCurricula($id, $curricula, $nombre, $email, $password, $major, $course,$tipo_beca,$por_beca,$matricula)
	{
	
	 
		include_once(DOC_ROOT."/properties/messages.php");

			$sql = "SELECT COUNT(*) FROM user_subject WHERE alumnoId = '".$id."' AND courseId = '".$curricula."'";
			$this->Util()->DB()->setQuery($sql);
			$count = $this->Util()->DB()->GetSingle();

			$sql = "SELECT subjectId FROM course WHERE courseId = '".$curricula."'";
			$this->Util()->DB()->setQuery($sql);
			$subjectId = $this->Util()->DB()->GetSingle();

			$sql = "SELECT payments FROM subject WHERE subjectId = '".$subjectId."'";
			$this->Util()->DB()->setQuery($sql);
			$payments = $this->Util()->DB()->GetSingle();
			
			if($payments > 0)
			{
				$status = 'inactivo';
			}
			else
			{
				$status = 'activo';
			}
//print_r($count);
			if($count > 0)
			{
				return $complete = "Este alumno ya esta registrado en esta curricula. Favor de Seleccionar otra Curricula";
			}
		
			$sqlQuery = "
			INSERT INTO  `user_subject` (
				`alumnoId` ,
				`status` ,
				`courseId`,
				`tipo_beca`,
				`por_beca`,
                `matricula`
				)
				VALUES 
				(
				'".$id."',  
				'".$status."',  
				'".$curricula."',  
				'".$tipo_beca."',  
				'".$por_beca."',
				'".$matricula."'
			)";
			$this->Util()->DB()->setQuery($sqlQuery);
			
			if($this->Util()->DB()->InsertData()){
			   $complete = "Has registrado al alumno exitosamente, le hemos enviado un correo electronico para continuar con el proceso de inscripcion";}
            else  {$complete="no";}
			if($this->getNames() == "")
			{
				$this->setUserId($id);
				$info = $this->GetInfo();
				
				//datos personales
				$this->setControlNumber();
				$this->setNames($info['names']);
				$this->setLastNamePaterno($info['lastNamePaterno']);
				$this->setLastNameMaterno($info['lastNameMaterno']);
				$this->setSexo($info['sexo']);
				$info['birthdate'] = explode("-", $info['birthdate']);
				$this->setBirthdate($info['birthdate'][2], $info['birthdate'][1], $info['birthdate'][0]);
				$this->setMaritalStatus($info['maritalStatus']);
				$this->setPassword(trim($info['password']));

				//domicilio
				//print_r($info);
				$this->setStreet($info['street']);
				$this->setNumber($info['number']);
				$this->setColony($info['colony']);
				$this->setCity($info['city']);
				$this->setState($info['state']);
				$this->setCountry($info['country']);
				$this->setPostalCode($info['postalCode']);

				//datos de contacto
				$this->setEmail($info['email']);
				$this->setPhone($info['phone']);
				$this->setFax($info['fax']);
				$this->setMobile($info['mobile']);

				//datos laborales
				$this->setWorkplace($info['workplace']);
				$this->setWorkplaceOcupation($info['workplaceOcupation']);
				$this->setWorkplaceAddress($info['workplaceAddress']);
				$this->setWorkplaceArea($info['workplaceArea']);
				$this->setWorkplacePosition($info['workplacePosition']);
				$this->setWorkplaceCity($info['workplaceCity']);
				$this->setWorkplacePhone($info['workplacePhone']);
				$this->setWorkplaceEmail($info['workplaceEmail']);
				
				//Estudios
				$this->setAcademicDegree($info['academicDegree']);
				$this->setSchool($info['school']);
				$this->setHighSchool($info['highSchool']);
				$this->setMasters($info['masters']);
				$this->setMastersSchool($info['mastersSchool']);
				$this->setProfesion($info['profesion']);				
				
			}
			
			//crear vencimientos
			$this->AddInvoices($id, $curricula);
			//create file to attach
			$files  = new Files;
			//print_r($this);        //pdf del correo electronico
			$file = $files->CedulaInscripcion($id, $curricula, $this, $major, $course);
			//enviar correo
			$sendmail = new SendMail;

			$details_body = array(
				"email" => $this->getControlNumber(),
				"password" => $password,
				"major" => utf8_decode($major),
				"course" => utf8_decode($course),
			);
			$details_subject = array();
			//$email = "dlopez@trazzos.com";
			
			$attachment[0] = DOC_ROOT."/files/solicitudes/".$file;
			$fileName[0] = "Solicitud_de_Inscripcion.pdf";

			$attachment[1] = DOC_ROOT."/manual_alumno.pdf";
			$fileName[1] = "Manual_Alumno.pdf";
						
			$sendmail->PrepareAttachment($message[1]["subject"], $message[1]["body"], $details_body, $details_subject, $email, $nombre, $attachment, $fileName);
			
			return $complete; 

	}

	
	public function Update(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sqlQuery = "UPDATE user				
						SET 
							names = '".$this->getNames()."', 
							lastNamePaterno = '".$this->getLastNamePaterno()."', 
							lastNameMaterno = '".$this->getLastNameMaterno()."', 
							birthdate = '".$this->getBirthdate()."', 
							email = '".$this->getEmail()."', 
							phone = '".$this->getPhone()."', 
							password = '".$this->getPassword()."', 
							street = '".$this->getStreet()."', 
							number = '".$this->getNumer()."', 
							colony = '".$this->getColony()."', 
							ciudad = '".$this->getCity()."', 
							estado = '".$this->getState()."', 
							pais =  '".$this->getCountry()."', 
							postalCode = '".$this->getPostalCode()."', 
							sexo = '".$this->getSexo()."', 
							maritalStatus = '".$this->getMaritalStatus()."', 
							fax = '".$this->getFax()."', 
							mobile = '".$this->getMobile()."', 
							workplace = '".$this->getWorkplace()."', 
							workplaceOcupation = '".$this->getWorkplaceOcupation()."', 
							workplaceAddress = '".$this->getWorkplaceAddress()."', 
							workplaceArea = '".$this->getWorkplaceArea()."', 
							workplacePosition = '".$this->getWorkplacePosition()."', 
							paist='".$this->getPaisT()."',
							estadot='".$this->getEstadoT()."',
							ciudadt='".$this->getCiudadT()."',
						    workplacePhone = '".$this->getWorkplacePhone()."', 
							workplaceEmail = '".$this->getWorkplaceEmail()."', 
							academicDegree = '".$this->getAcademicDegree()."', 
							profesion = '".$this->getProfesion()."', 
							school = '".$this->getSchool()."', 
							masters = '".$this->getMasters()."', 
							mastersSchool = '".$this->getMastersSchool()."', 
							highSchool = '".$this->getHighSchool()."'						
						WHERE 
							userId = ".$this->getUserId();		
		
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	}
	
	public function UpdateAlumn(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sqlQuery = "UPDATE user				
						SET 
							names = '".$this->getNames()."', 
							lastNamePaterno = '".$this->getLastNamePaterno()."', 
							lastNameMaterno = '".$this->getLastNameMaterno()."', 
							birthdate = '".$this->getBirthdate()."', 
							email = '".$this->getEmail()."', 
							phone = '".$this->getPhone()."', 
							password = '".$this->getPassword()."', 
							street = '".$this->getStreet()."', 
							number = '".$this->getNumer()."', 
							colony = '".$this->getColony()."', 
							ciudad = '".$this->getCity()."', 
							estado = '".$this->getState()."', 
							pais =  '".$this->getCountry()."', 
							postalCode = '".$this->getPostalCode()."', 
							sexo = '".$this->getSexo()."', 
							maritalStatus = '".$this->getMaritalStatus()."', 
							fax = '".$this->getFax()."', 
							mobile = '".$this->getMobile()."', 
							workplace = '".$this->getWorkplace()."', 
							workplaceAddress = '".$this->getWorkplaceAddress()."', 
							workplaceArea = '".$this->getWorkplaceArea()."', 
							workplaceOcupation = '".$this->getWorkplaceOcupation()."', 
							workplacePosition = '".$this->getWorkplacePosition()."', 
						    paist='".$this->getPaisT()."',
							estadot='".$this->getEstadoT()."',
							ciudadt='".$this->getCiudadT()."',
							workplacePhone = '".$this->getWorkplacePhone()."', 
							workplaceEmail = '".$this->getWorkplaceEmail()."', 
							profesion = '".$this->getProfesion()."', 
							academicDegree = '".$this->getAcademicDegree()."', 
							school = '".$this->getSchool()."', 
							masters = '".$this->getMasters()."', 
							mastersSchool = '".$this->getMastersSchool()."', 
							highSchool = '".$this->getHighSchool()."'						
						WHERE 
							userId = ".$this->getUserId();		
		
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	}	
	
	public function UpdateFicha(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
				$sqlQuery = "UPDATE user				
						SET
							mainMajor = ".$this->getMainMajor().", 
							secondMajor = ".$this->getSecondMajor().", 
							thirdMajor = ".$this->getThirdMajor().", 
							mode = ".$this->getMode().",
							names = '".$this->getNames()."', 
							lastNamePaterno = '".$this->getLastNamePaterno()."', 
							lastNameMaterno = '".$this->getLastNameMaterno()."', 
							sexo = '".$this->getSexo()."',													
							birthdate = '".$this->getBirthdate()."', 
							
							cityBorn = '".$this->getCityBorn()."', 
							stateBorn = '".$this->getStateBorn()."', 
							countryBorn = '".$this->getCountryBorn()."',
							
							street = '".$this->getStreet()."', 
							number = '".$this->getNumer()."', 
							colony = '".$this->getColony()."', 
							city = '".$this->getCity()."', 
							state = '".$this->getState()."', 
							country =  '".$this->getCountry()."', 
							postalCode = '".$this->getPostalCode()."',
							phone = '".$this->getPhone()."', 
							curp = '".$this->getCurp()."',
													 
							tutorNames = '".$this->getTutorNames()."', 
							tutorLastNamePaterno = '".$this->getTutorLastNamePaterno()."', 
							tutorLastNameMaterno = '".$this->getTutorLastNameMaterno()."', 
							tutorAddress = '".$this->getTutorAddress()."', 
							tutorPhone = '".$this->getTutorPhone()."', 
							
							prevSchNames = '".$this->getPrevSchNames()."', 
							prevSchType = ".$this->getPrevSchType().", 
							prevSchKey = '".$this->getPrevSchKey()."', 
							prevSchMode = ".$this->getPrevSchMode().", 
							prevSchCity = '".$this->getPrevSchCity()."', 
							prevSchState = '".$this->getPrevSchState()."', 
							prevSchAverage = ".$this->getPrevSchAverage().", 
							prevSchCertified = ".$this->getPrevSchCertified().",
							
							average = '".$this->getAverage()."'					
						WHERE 
							userId = ".$this->getUserId();		
		
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	}
	
	
	public function DeleteLimpia(){
		
		
		
		$sqlQuery = "DELETE FROM user_subject
							WHERE alumnoId ='$this->alumnoId'";		
		
		//echo $sqlQuery." </br>";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		
			
		
				
		return true;
				
	}
	
	
	public function Delete(){
		
		if($this->Util()->PrintErrors()){ 
			return false; 
		}
		
		$sqlQuery = "DELETE FROM user
							WHERE userId = ".$this->getUserId();		
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		$sqlQuery = "DELETE FROM invoice
							WHERE userId ='".$this->getUserId()."'  ";		
		
		//echo $sqlQuery." </br>";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
			$sqlQuery = "DELETE FROM user_subject
							WHERE alumnoId ='".$this->getUserId()."'";		
		
		//echo $sqlQuery." </br>";
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		
		
		$this->Util()->setError(10029, "complete");
		$this->Util()->PrintErrors();
		
		
		
		
		
		return true;
				
	}
	
	public function EnumerateByPage($currentPage, $rowsPerPage, $pageVar, $pageLink, &$arrPages, $orderSemester = '')
	{
		global $semester;
		global $group;
				
		$result = NULL;
		$result2 = NULL;

		$filtro = "";
		
		if($this->nombre){
			$filtro .= " and names like '%".$this->nombre."%'";
		}
		
		if($this->apaterno){
			$filtro .= " and lastNamePaterno like '%".$this->apaterno."%'";
		}
		
		if($this->amaterno){
			$filtro .= " and lastNameMaterno like '%".$this->amaterno."%'";
		}
		
		if($this->noControl){
			$filtro .= " and controlNumber = '".$this->noControl."'";
		}
		
		if($this->estatus){
			if($this->estatus==2){
				$filtro .= " and activo = 0";
			}else{
				$filtro .= " and activo = '".$this->estatus."'";
			}
				
			
		}
		
		
		$totalTableRows = $this->CountTotalRows($sqlSearch);

		$totalPages = ceil($totalTableRows / $rowsPerPage);

		if($currentPage < 1)
			$currentPage = 1;
		if($currentPage > $totalPages)
			$currentPage = $totalPages;

		$arrPages['rowBegin']	= ($currentPage * $rowsPerPage) - $rowsPerPage + 1 ;

		$rowOffset = $arrPages['rowBegin'] - 1;
		
		 $sql = "
								SELECT 
									* 
								FROM 
									user
								WHERE 
									1 ".$sqlSearch." ".$filtro."
								AND
									type = 'student'									 
								ORDER BY 
									".$orderSemester."
									lastNamePaterno ASC, 
									lastNameMaterno ASC,  
									`names` ASC 
								LIMIT 
									".$rowOffset.", ".$rowsPerPage;
		
		$this->Util()->DB()->setQuery($sql);
		$result2 = $this->Util()->DB()->GetResult();
		
		foreach($result2 as $key => $res){
			$card = $res;
			
			$card["lastNameMaterno"] = $this->Util->DecodeTiny($card["lastNameMaterno"]);
			$card["lastNamePaterno"] = $this->Util->DecodeTiny($card["lastNamePaterno"]);
			$card["names"] = $this->Util->DecodeTiny($card["names"]);

			
			
			if(file_exists(DOC_ROOT."/alumnos/".$res["userId"].".jpg"))
			{
				$card["foto"] = '<a href="#open-'.$res["userId"].'" id="foto-'.$res["userId"].'">
					<img src="'.WEB_ROOT.'/alumnos/'.$res["userId"].'.jpg" width="40" height="40" style=" height: auto; 
				width: auto; 
				max-width: 80px; 
				max-height: 80px;"/>
				</a>';
			}
			else
			{
				$card["foto"] = '';
			}
			
			$result[$key] = $card;		
		}
		
		$countPageRows = count($result);

		$arrPages['countPageRows'] = $countPageRows;

		$arrPages['rowEnd']		= $arrPages['rowBegin'] + $countPageRows - 1;

		$arrPages['totalTableRows'] = $totalTableRows;

		$arrPages['rowsPerPages'] = $rowsPerPages;

		$arrPages['currentPage'] = $currentPage;

		$arrPages['totalPages']	= $totalPages;

		$arrPages['startPage'] = '';
		$arrPages['previusPage'] = '';
		if($currentPage > 1)
		{
			$arrPages['previusPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage - 1);

			if($currentPage > 2)
				$arrPages['startPage'] = $pageLink . '/' . $pageVar . '/' . '1';
		}

		$arrPages['nextPage'] = '';
		$arrPages['endPage'] = '';
		if($currentPage < $arrPages['totalPages'])
		{
			$arrPages['nextPage'] = $pageLink . '/' . $pageVar . '/' . ($currentPage + 1);

			if($currentPage < ($arrPages['totalPages'] - 1))
				$arrPages['endPage'] = $pageLink . '/' . $pageVar . '/' . $arrPages['totalPages'];
		}
		$arrPages['refreshPage'] = $pageLink . '/' . $pageVar . '/' . $currentPage ;

		return $result;
	}
	
	public function CountTotalRows()
	{
		
		$filtro = "";
		
		if($this->nombre){
			$filtro .= " and names like '%".$this->nombre."%'";
		}
		
		if($this->apaterno){
			$filtro .= " and lastNamePaterno like '%".$this->apaterno."%'";
		}
		
		if($this->amaterno){
			$filtro .= " and lastNameMaterno like '%".$this->amaterno."%'";
		}
		
		if($this->noControl){
			$filtro .= " and controlNumber = '".$this->noControl."'";
		}
		
		if($this->estatus){
			if($this->estatus==2){
				$filtro .= " and activo = 0";
			}else{
				$filtro .= " and activo = '".$this->estatus."'";
			}
				
			
		}
		
		
	
		$sql = 'SELECT COUNT(*) FROM user where type = "student" '.$filtro.'';
		
		$this->Util()->DB()->setQuery($sql);
		return $this->Util()->DB()->GetSingle();
	}
	
	function SearchByGroup(){
		
		global $semester;
		global $group;
						
		$sql = "SELECT 
					* 
				FROM 
					user
				WHERE
					semesterId = ".$this->semesterId."
				AND
					majorId = ".$this->majorId."
				AND
					groupId = ".$this->groupId."
				ORDER BY 
					lastNamePaterno ASC, lastNameMaterno ASC, names ASC";
		
		$this->Util()->DB()->setQuery($sql);
		$result2 = $this->Util()->DB()->GetResult();
		
		$result = array();
		foreach($result2 as $key => $res){
			$card = $res;
			
			$semester->setSemesterId($res['semesterId']);
			$card['semester'] = $semester->GetNameById();
			
			$group->setGroupId($res['groupId']);
			$card['group'] = $group->GetNameById();
			$result[$key] = $card;		
		}
				
		return $result;	
		
	}
	
	function GetStdIdByControlNo(){
		
		$sql = 'SELECT 
					userId 
				FROM 
					user 
				WHERE 
					controlNumber = "'.$this->controlNumber.'"';
		$this->Util()->DB()->setQuery($sql);
		$userId = $this->Util()->DB()->GetSingle();
		
		return $userId;
	}
	
	function _GetSemesterId(){
		
		$sql = 'SELECT 
					semesterId
				FROM 
					user 
				WHERE 
					userId = "'.$this->userId.'"';
		$this->Util()->DB()->setQuery($sql);
		$semesterId = $this->Util()->DB()->GetSingle();
		
		return $semesterId;
	}
	
	function info_subject($courseId){
	$sql="select * from user_subject where courseId='".$courseId."'  and  alumnoId='".$this->getUserId()."' ";
	$this->Util()->DB()->setQuery($sql);
	$row = $this->Util()->DB()->GetRow();
	return $row;
	}
	
	function GetSubByUsrSem(){
		
		$sql = 'SELECT
					*
				FROM
					user_subject
				WHERE
					alumnoId = '.$this->userId.'
				AND
					semesterId = '.$this->semesterId;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		return $result;
	}
	
	function GetKardex(){
		
		$sql = 'SELECT
					*
				FROM
					kardex_calificacion
				WHERE
					userId = '.$this->userId.'
				AND
					semesterId = '.$this->semesterId;
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		return $result;
	}
	
	function GetSemBySub(){
		
		$sql = 'SELECT
					*
				FROM
					user_subject
				GROUP BY
					semesterId';
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		return $result;
	}
	
	function GetNoControl(){
		
		$sql = 'SELECT
					controlNumber
				FROM
					user
				WHERE
					userId = '.$this->userId;
		$this->Util()->DB()->setQuery($sql);
		$controlNumber = $this->Util()->DB()->GetSingle();
		
		return $controlNumber;
	}
	
	function GetScoreBySubject(){
		
		$sql = 'SELECT gu.testIdentifier, gu.gradescore, gu.datetest
				FROM gradereport_user AS gu, gradereport AS g, subject_group AS sg
				WHERE gu.gradereportId = g.gradereportId
				AND g.groupId = sg.subgpoId
				AND gu.alumnoId = '.$this->userId.'
				AND sg.subjectId = '.$this->subjectId.'
				ORDER BY gu.datetest ASC';
		
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		$gradescore = 0;
		foreach($result as $res){
			
			$testIdentifier = $res['testIdentifier'];
			
			if($testIdentifier == 'PARCIAL'){
				$gradescore += $res['gradescore'];
				$obs = '';
			}elseif($testIdentifier == 'GLOBAL'){
				$gradescore = $res['gradescore'];
				$obs = '';
			}
			
			//Falta definir mas tipos de calificaciones
		}
		
		if($testIdentifier == 'PARCIAL')
			$average = $gradescore / 3;
		elseif($testIdentifier == 'GLOBAL')
			$average = $gradescore;
		else
			$average = 0;
		
		$info['average'] = number_format($average,2,'.','');
		$info['obs'] = $obs;
			
		return $info;
	
	}
	
	function SaveKardexCalif(){
				
		$sql = 'INSERT INTO
						kardex_calificacion					
					(
						userId,
						semesterId,
						majorId,
						subjectId,
						calif,
						typeCalifId,
						periodoId
					)
				VALUES
					(
						"'.$this->userId.'",
						"'.$this->semesterId.'",
						"'.$this->majorId.'",
						"'.$this->subjectId.'",
						"'.$this->average.'",
						"'.$this->type.'",
						"'.$this->periodoId.'"							
					)';
				
		
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10070, "complete");
		$this->Util()->PrintErrors();
		
		return true;
	
	}
	
	function GetKardexCalif(){
		
		$sql = 'SELECT 
					*
				FROM
					kardex_calificacion
				WHERE
					userId = "'.$this->userId.'"
					AND	semesterId = "'.$this->semesterId.'"
					AND majorId = "'.$this->majorId.'"';
					
		$this->Util()->DB()->setQuery($sql);
		$califs = $this->Util()->DB()->GetResult();
	
		return $califs;
	}
	
	function DeleteKardexCalif(){
		
		$sql = 'DELETE FROM 
					kardex_calificacion
				WHERE
					userId = "'.$this->userId.'"
					AND	semesterId = "'.$this->semesterId.'"
					AND majorId = "'.$this->majorId.'"';
					
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->DeleteData();
	
		return true;
	}
	
	function SearchByName(){
		
		$sql = 'SELECT
					*
				FROM
					user
				WHERE
					CONCAT(lastNamePaterno," ",lastNameMaterno," ",names) LIKE "%'.$this->name.'%"
				LIMIT 15';
		
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();
		
		return $result;
		
	}
	
	function SearchKardexByUserIdAndSemesterId(){
		
		$sql = 'SELECT
					majorId
				FROM 
					kardex_calificacion
				WHERE 
					userId = '.$this->userId.'
				AND
					semesterId = '.$this->semesterId.'
				LIMIT 1';
		
		$this->Util()->DB()->setQuery($sql);
		$majorId = $this->Util()->DB()->GetSingle();
		
		return $majorId;
	}
	
	function por_beca($id){
	$sql="select por_beca from user_subject where alumnoId='".$id."'";
	$this->Util()->DB()->setQuery($sql);
	return $this->Util()->DB()->GetSingle();
	}
	
	
	//agregar pagos de usuarios
	
	
	
	function encuentro_monto($courseId){
	    $this->Util()->DB()->setQuery("select subjectId from course where courseId='".$courseId."' ");
	    $res = $this->Util()->DB()->GetRow();
	  //echo $res['subjectId']; 
	    $this->Util()->DB()->setQuery("select cost from subject where subjectId='".$res['subjectId']."' ");
	    $costo = $this->Util()->DB()->GetRow();
		//echo $costo['cost'];
	   return $costo['cost'];
//	echo $courseId;
	
	}
	
	
	function editarPor($alumnoId,$courseId,$por_beca,$tipo_beca){
	       if($tipo_beca=="Ninguno")
		   $por_beca=0;
		   
   $sqlQuery = "UPDATE user_subject set por_beca='".$por_beca."',tipo_beca='".$tipo_beca."'  where alumnoId='".$alumnoId."'  and courseId='".$courseId."'  "; 			
		
		$this->Util()->DB()->setQuery($sqlQuery);
		$this->Util()->DB()->ExecuteQuery();
		
		
	$this->Util()->DB()->setQuery("SELECT * FROM invoice WHERE userId = '".$alumnoId."'");
		$id_invoices = $this->Util()->DB()->cons();
	             foreach($id_invoices as $fila){
	                        $this->Util()->DB()->setQuery("SELECT * FROM payment WHERE invoiceId = '".$fila[0]."'");
							$info_payment = $this->Util()->DB()->cons();
				                 
			if(count($info_payment)==0){
						if($por_beca !=0){
						   	  $v=(100-$por_beca)/100;
							  $valor=round($this->encuentro_monto($fila["courseId"])*$v,2);    
						}else{
						    $valor=$this->encuentro_monto($fila["courseId"]);
						 }	
	                                       $this->Util()->DB()->setQuery("update invoice set amount='".$valor."' where invoiceId='".$fila[0]."'");										  
								           $this->Util()->DB()->ExecuteQuery();
								 
								 
				         
				                    }
				 }
	
		        
		
		
		$this->Util()->setError(10030, "complete");
		$this->Util()->PrintErrors();				
	
	}
	
	function AddInvoices($id, $curricula)
	{
		$course = new Course;
		$course->SetCourseId($curricula);
		$por_beca=$this->por_beca($id);
		$myCourse = $course->Info($id);
		//print_r($myCourse);
		
		$initialExplode = explode("-", $myCourse["initialDate"]);
		$initialYear = $initialExplode[0];
		$initialMonth = $initialExplode[1];
		$initialDay = $initialExplode[2];
		for($ii = 0; $ii < $myCourse["payments"]; $ii++)
		{
			if($initialMonth > 12)
			{
				$initialMonth = 1;
				$initialYear++;
			}
		
			if($initialDay > 28)
			{
				$initialDay = 28;
			}
			
			 if($por_beca !=0){
			  $v=(100-$por_beca)/100;
			  $valor=round($myCourse["cost"]*$v,2);
			  }else{
			  $valor=$myCourse["cost"];
			  }
			  
			
	          $this->Util()->DB()->setQuery("SELECT  * FROM  `invoice` where userId='".$id."' and courseId='".$curricula."'  and  dueDate='".$initialYear."-".$initialMonth."-".$initialDay."'  and amount='".$valor."'   ");
			  $info_invoice = $this->Util()->DB()->cons();
			  
			  
	      if(count($info_invoice)==0)
			{
			$sql = "
			INSERT INTO  `invoice` (
				`userId` ,
				`courseId` ,
				`dueDate` ,
				`amount`
				)
				VALUES (
				'".$id."' ,  '".$curricula."',  '".$initialYear."-".$initialMonth."-".$initialDay."',  '".$valor."')";
			
			$this->Util()->DB()->setQuery($sql);
			$this->Util()->DB()->InsertData();
			}
			$initialMonth++;
			
		}
		
	}
	
	function  StudentCoursesU($userId,$courseId){
	$sql = "SELECT
					*, subject.name AS nombre, major.name AS majorName
				FROM
					user_subject
				LEFT JOIN course ON course.courseId = user_subject.courseId
				LEFT JOIN subject ON subject.subjectId = course.subjectId	
				LEFT JOIN major ON major.majorId = subject.tipo
				WHERE
					alumnoId ='".$userId."' and  course.courseId='".$courseId."'";
        $this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRow();
		return $result;			
	
	}

	function StudentCourses($status = NULL, $active = NULL){
		
		if($status != NULL)
		{
			$status = " AND status = '".$status."'";
		}

		if($active != NULL)
		{
			$active = " AND course.active = '".$active."'";
		}
		$sql = "SELECT
					*, subject.name AS name, major.name AS majorName
				FROM
					user_subject
				LEFT JOIN course ON course.courseId = user_subject.courseId
				LEFT JOIN subject ON subject.subjectId = course.subjectId	
				LEFT JOIN major ON major.majorId = subject.tipo
				WHERE
					alumnoId = '".$this->getUserId()."'
					".$status."
					".$active." 
				ORDER BY status ASC";
		
		$this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetResult();

		foreach($result as $key => $res)
		{
			$this->Util()->DB()->setQuery("
				SELECT COUNT(*) FROM subject_module WHERE subjectId ='".$res["subjectId"]."'");
		
			$result[$key]["modules"] = $this->Util()->DB()->GetSingle();

			$this->Util()->DB()->setQuery("
				SELECT COUNT(*) FROM user_subject WHERE courseId ='".$res["courseId"]."' AND status = 'inactivo'");
			$result[$key]["alumnInactive"] = $this->Util()->DB()->GetSingle();
			
			$this->Util()->DB()->setQuery("
				SELECT COUNT(*) FROM user_subject WHERE courseId ='".$res["courseId"]."' AND status = 'activo'");
		
			$result[$key]["alumnActive"] = $this->Util()->DB()->GetSingle();

			//$this->Util()->DB()->setQuery("
			//	SELECT COUNT(*) FROM course_module WHERE courseId ='".$res["courseId"]."' AND active = 'si'");
			$this->Util()->DB()->setQuery("
				SELECT COUNT(*) FROM course_module WHERE courseId ='".$res["courseId"]."'");
		
			$result[$key]["courseModule"] = $this->Util()->DB()->GetSingle();
			
		}		
		
		return $result;
		
	}

	function GetAcumuladoCourseModule($id, $alumnoId = 0)
	{
		//actividades
		$activity = new Activity;
		$activity->setCourseModuleId($id);
		
		if($alumnoId)
		{
			$activity->setUserId($alumnoId);
		}
		$actividades = $activity->Enumerate();
		
		$realScore = 0;
		
		foreach($actividades as $res)
		{
			$totalScore += $res["realScore"];
		}
		return $totalScore;
	}
}

?>