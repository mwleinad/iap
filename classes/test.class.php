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
		
		public function Enumerate($verResultado=false)
		{
			
			 $sql = "
				SELECT * FROM activity_test
				WHERE activityId = '".$this->getActivityId()."'
				ORDER BY testId ASC";
			
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetResult();

			foreach($result as $key => $res)
			{
				
				if($verResultado == true){
					 $sql = "
						SELECT respuesta FROM resultado
						WHERE preguntaId = '".$res["testId"]."' limit 0,1";
					
					$this->Util()->DB()->setQuery($sql);
					$resu = $this->Util()->DB()->GetRow();

					
					if($resu["respuesta"]==$res["answer"]){
							$result[$key][$resu["respuesta"]] = "<font color='green'>".$result[$key][$resu["respuesta"]]."</font>"; 
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
			//creamos la cadena de seleccion
			$sql = "SELECT 
						noQuestions
					FROM
						activity
					WHERE
							activityId='" . $this->getActivityId() . "'";
			//configuramos la consulta con la cadena de actualizacion
			$this->Util()->DB()->setQuery($sql);
			//ejecutamos la consulta y obtenemos el resultado
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
			
			 $sql = "UPDATE 
						course_module 
					SET
						evalDocenteCompleta = 'si'
					WHERE
							courseId='" . $_POST["courseModuleId"] . "'";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->UpdateData();
			
			
			foreach($answers as $key=>$aux){
				
				$sql = "SELECT 
						puntos
					FROM
						activity_test
					WHERE
							testId='".$key."'"; 
				$this->Util()->DB()->setQuery($sql);
				$puntos = $this->Util()->DB()->GetSingle();
			
			
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
							'.$puntos.'
						)';
// exit;
						$this->Util()->DB()->setQuery($sql);
						$this->id = $this->Util()->DB()->InsertData();
			}
				

			return true;

		}
		
		function estadisticas($Id)
		{
			$sql = "SELECT 
						sum(puntos)
					FROM
						resultado
					WHERE
							activityId='" . $Id . "'";
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->GetSingle();
			
			$sql = "SELECT 
						count(puntos)
					FROM
						resultado
					WHERE
							activityId='" . $Id . "' and puntos<>''";
			$this->Util()->DB()->setQuery($sql);
			$count = $this->Util()->DB()->GetSingle();
			
			$sql = "SELECT 
						sum(puntos)
					FROM
						activity_test
					WHERE
							activityId='" . $Id . "'";
			$this->Util()->DB()->setQuery($sql);
			$results = $this->Util()->DB()->GetSingle();
			
			 $sql = "SELECT 
						*
					FROM
						resultado as r
					left join activity_test as a on a.testId = r.preguntaId
					WHERE
							r.activityId='" . $Id . "' and r.puntos=''";
			// exit;
			$this->Util()->DB()->setQuery($sql);
			$lstRes = $this->Util()->DB()->GetResult();
			
			$data["puntosOk"] = $result;
			$data["countOK"] = $count;
			$data["totalPuntos"] = $results;
			$data["lstRes"] = $lstRes;
			$data["calificacion"] = ($result/$results);
			
			return $data;
			
		}
		
		
	}
	
		
?>