<?php

	class Test extends Activity
	{
		private $testId;
		private $usertId;
		
		
		
		public function setTestId($value)
		{
			$this->testId = $value;
		}

		
		public function setUsertId($value)
		{
			 $this->usertId = $value;
		}
		
		public function getTestId()
		{
			return $this->testId;
		}
		
		private $question;

		public function setQuestion($value)
		{
			$this->Util()->ValidateString($value, 5000, 1, 'Pregunta');
			$this->question = $value;
		}

		public function getQuestion()
		{
			return $this->question;
		}
		
		private $opcionA;

		public function setOpcionA($value)
		{
			$this->Util()->ValidateString($value, 1000, 1, 'Opcion A');
			$this->opcionA = $value;
		}

		public function getOpcionA()
		{
			return $this->opcionA;
		}

		private $opcionB;

		public function setOpcionB($value)
		{
			$this->Util()->ValidateString($value, 1000, 1, 'Opcion B');
			$this->opcionB = $value;
		}

		public function getOpcionB()
		{
			return $this->opcionB;
		}
		
		private $opcionC;

		public function setOpcionC($value)
		{
			$this->Util()->ValidateString($value, 1000, 0, 'Opcion C');
			$this->opcionC = $value;
		}

		public function getOpcionC()
		{
			return $this->opcionC;
		}

		private $opcionD;

		public function setOpcionD($value)
		{
			$this->Util()->ValidateString($value, 1000, 0, 'Opcion D');
			$this->opcionD = $value;
		}

		public function getOpcionD()
		{
			return $this->opcionD;
		}

		private $opcionE;

		public function setOpcionE($value)
		{
			$this->Util()->ValidateString($value, 1000, 0, 'Opcion E');
			$this->opcionE = $value;
		}

		public function getOpcionE()
		{
			return $this->opcionE;
		}

		private $answer;

		public function setAnswer($value)
		{
			$this->Util()->ValidateString($value, 1000, 0, 'Respuesta');
			$this->answer = $value;
		}

		public function getAnswer()
		{
			return $this->answer;
		}
		
		public function Enumerate($verResultado=false,$user=false)
		{
			
			$filtro = "";
			if($verResultado == true){
				$filtro =  " and answer <>''";
			}
			
			 $sql = "
				SELECT * FROM activity_test
				WHERE activityId = '".$this->getActivityId()."' ".$filtro."
				ORDER BY numero ASC";
			
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();

			foreach($result as $key => $res)
			{
			
				if($verResultado == true){
					
					
					  $sql = "
						SELECT respuesta FROM resultado
						WHERE preguntaId = '".$res["testId"]."' and usuarioId = ".$user." limit 0,1";
					// exit;
					$this->Util()->DB()->setQuery($sql);
					$resu = $this->Util()->DB()->GetRow();

					
					if($resu["respuesta"]==$res["answer"]){
							$result[$key][$resu["respuesta"]] = "<b><font color='#73b760'>".$result[$key][$resu["respuesta"]]."</font></b>"; 
					}
					else{
						$opciones = array("opcionA","opcionB","opcionC","opcionD","opcionE");
						
						foreach($opciones as $keyo=>$auxo){
							if($auxo==$res["answer"])
							$result[$key][$auxo] = "<font color='red'>".$result[$key][$auxo]."</font>";
						
						}						
					}
					
					$result[$key]["res"] = $resu["respuesta"];
				}
				

				$result[$key]["opcionAShort"] = substr($res["opcionA"], 0, 20);
				$result[$key]["opcionBShort"] = substr($res["opcionB"], 0, 20);
				$result[$key]["opcionCShort"] = substr($res["opcionC"], 0, 20);
				$result[$key]["opcionDShort"] = substr($res["opcionD"], 0, 20);
				$result[$key]["opcionEShort"] = substr($res["opcionE"], 0, 20);
				$result[$key]["ponderation"] = $this->PonderationPerQuestion();
				
			}

			return $result;
		}
		
		function Randomize($questions, $max)
		{
			$keys = array_rand($questions, $max);
			
			foreach($keys as $key)
			{
				$returnArray[] = $questions[$key];
			}
			return $returnArray;
		}

		public function Access($maxTries)
		{
			
			 $sql = "
				SELECT try FROM activity_score
				WHERE activityId = '".$this->getActivityId()."'
				AND userId = '".$this->getUserId()."'";
			// exit;
			$this->Util()->DB()->setQuery($sql);
			$try = $this->Util()->DB()->GetSingle();
			if($try < $maxTries)
			{
				return 1;
			}
			
			return 0;
		}

		public function TestScore()
		{
			$this->Util()->DB()->setQuery("
				SELECT ponderation FROM activity_score
				WHERE activityId = '".$this->getActivityId()."'
				AND userId = '".$this->getUserId()."'");
			$score = $this->Util()->DB()->GetSingle();
			return $score;
		}
		
		public function Info()
		{
			//creamos la cadena de seleccion
			$sql = "SELECT 
						* 
					FROM
						activity_test
					WHERE
							testId='" . $this->getTestId() . "'";
			//configuramos la consulta con la cadena de actualizacion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y obtenemos el resultado
			$result = $this->Util()->DB()->GetRow();

			if($result)
				$result = $this->Util->EncodeRow($result);

			return $result;	
		}

		

		public function Edit()
		{
			//creamos la cadena de seleccion
			$sql = "UPDATE 
						activity_test 
					SET
						question = '".$this->question."',
						opcionA = '".$this->opcionA."',
						opcionB = '".$this->opcionB."',
						opcionC = '".$this->opcionC."',
						opcionD = '".$this->opcionD."',
						opcionE = '".$this->opcionE."',
						answer = '".$this->answer."'
					WHERE
							testId='" . $this->getTestId() . "'";
			//configuramos la consulta con la cadena de actualizacion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y obtenemos el resultado
			$result = $this->Util()->DB()->UpdateData();

			$this->Util()->setError(90010, 'complete', "Se ha actualizado la pregunta.");
			$this->Util()->PrintErrors();
			return $result;			
		}
		
		public function PonderationPerQuestion()
		{

			$sql = "SELECT 
						noQuestions
					FROM
						activity
					WHERE
							activityId='" . $this->getActivityId() . "'";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetSingle();
			
			if($result == 0)
			{
				$result = 1;
			}
			
			$ponderation = 100/$result;
			return $ponderation;	
		}
		
		function SendTest($answers)
		{
			
			if($answers==null){
					echo "fail[#]";
					echo "<font color='red'>Necesita responder todas las preguntas </font>";
					exit;
			}
			
			foreach($_POST["preguntas"] as $key=>$aux){
				if($answers[$key]==null){
						echo "fail[#]";
						echo "<font  color='red'>Necesita responder la pregunta numero ".($key)."</font>";
						exit;
					}
				
			}
		
			
			 $sql = "UPDATE 
						user_subject 
					SET
						evalDocenteCompleta = 'si'
					WHERE
							alumnoId ='" . $_POST["userId"] . "' and courseId = ".$_POST["courseId"]."";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->UpdateData();
			
			
			foreach($answers as $key=>$aux){
				
				 $sql = "SELECT 
						puntos,
						answer
					FROM
						activity_test
					WHERE
							testId='".$key."'"; 
				$this->Util()->DB()->setQuery($sql);
				$puntos = $this->Util()->DB()->GetRow();
				
				
				if($puntos["answer"]<>$aux){ 
					$puntos["puntos"] = 0;
				}

					 $sql = 'INSERT INTO resultado (
							preguntaId, 
							respuesta, 
							encuestaId, 
							activityId, 
							usuarioId,
							puntos
						)
						VALUES(
							"'.$key.'",
							"'.$aux.'",
							1,
							"'.$_POST["activityId"].'",
							'.$_POST["userId"].',
							'.$puntos["puntos"].'
						)';
						$this->Util()->DB()->setQuery($sql);
						$this->id = $this->Util()->DB()->InsertData(); 
			}
				
			// firma
			$sqlQuery = 'SELECT 
					firma
				FROM 
					user
				WHERE  userId = '.$_POST["userId"].'';
			$this->Util()->DB()->setQuery($sqlQuery);
			$firma = $this->Util()->DB()->GetRow();	
			
			$sqlNot="insert into 
				firma(
				procesoId,
				firma,
				userId,
				fecha,
				tablaFirmada,
				registroFirmado
				)
			   values(
			            '2', 
			            '".$firma["firma"]."', 
			            '".$_POST["userId"]."',
			            '".date("Y-m-d h:i:s")."',
						'course',
						'".$_POST["courseId"]."'
			         )";

			$this->Util()->DB()->setQuery($sqlNot);
			$Id = $this->Util()->DB()->InsertData(); 		

			return true;

		}
		
		function estadisticas($Id,$userId =null)
		{
			$sql = "SELECT 
						sum(puntos)
					FROM
						resultado
					WHERE
							activityId='" . $Id . "' and usuarioId = ".$userId."";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetSingle();
			
			$sql = "SELECT 
						count(puntos)
					FROM
						resultado
					WHERE
							activityId='" . $Id . "' and puntos<>0 and usuarioId = ".$userId."";
			$this->Util()->DB()->setQuery($sql);
			$count = $this->Util()->DB()->GetSingle();
			
			$sql = "SELECT 
						sum(puntos)
					FROM
						activity_test
					WHERE
							activityId='" . $Id . "' and answer <>'' ";
			$this->Util()->DB()->setQuery($sql);
			$results = $this->Util()->DB()->GetSingle();
			
			 $sql = "SELECT 
						*
					FROM
						resultado as r
					left join activity_test as a on a.testId = r.preguntaId
					left join activity as ac on ac.activityId = a.activityId
					WHERE
							r.activityId='" . $Id . "' and r.puntos=0 order by numero and r.usuarioId = ".$userId."";
			// exit;
			$this->Util()->DB()->setQuery($sql);
			$lstRes = $this->Util()->DB()->GetResult();
			
			$data["puntosOk"] =number_format( $result,2);
			$data["countOK"] = $count;
			$data["totalPuntos"] = number_format($results,2);
			$data["lstRes"] = $lstRes;
			$data["limiteAprobatorio"] = $lstRes[0]["timeLimit"];
			$data["calificacion"] = number_format(($result/$results),2);
			
			return $data;
			
		}
		
		function sendInfo($name,$pass){
			
			// $sendmail = new SendMail;
					
			$sql = "SELECT 
						*
					FROM
						user
					WHERE
							controlNumber='" . $name . "'";
			$this->Util()->DB()->setQuery($sql);
			$lstRes = $this->Util()->DB()->GetRow();
			
			// echo "<pre>"; print_r($lstRes);
			// exit;
			
			$msj = "
				 Instituto de Administración Publica del Estado de Chiapas, A. C.
				<br>
				<br>
				Sus datos de acceso para nuestro Sistema de Educación en Línea son:<br>
				Usuario: ".$name."<br>
				Contraseña: ".$pass."<br>
				<br>
				<br>
				
				Cualquier duda, favor de contactarnos:<br>
				Teléfonos: (961) 125-15-08, 125-15-09, 125-15-10 Ext. 106 o 114<br>
				Correo: enlinea@iapchiapas.org.mx<br>
				Saludos.<br>
				IAP-Chiapas<br>
				<img src='".WEB_ROOT."/images/logo_correo.jpg'>

				<br>
				<br>
				<br>
				
				";
				
				// echo $msj ;
				// exit;
				
				$sendmail->PrepareAttachment("IAP Chiapas | Recuperacion de datos de usuario", utf8_decode($msj), "","", $lstRes["email"], $name, $attachment, $fileName);
				
				// $this->Util()->setError(10030, "complete","Se ha enviado un correo con tus datos de acceso");
				// $this->Util()->PrintErrors();	
				
				return true;

		}
		
	}
	
		
?>