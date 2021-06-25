<?php
	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

	switch($_POST["type"])
	{
	
	

		case "saveEditStudentAlumn":	
		
			
				// echo "<pre>"; print_r($_POST);
				// exit;
											
				$status = $_POST['status'];
                $student->setPermiso($_POST['permiso']);
				$student->setUserId($_POST['id']);

				//datos personales
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				$student->setSexo($_POST['sexo']);
				$birthday = explode('-', $_POST['birthday']);
				$student->setBirthdate(intval($birthday[2]), intval($birthday[1]), intval($birthday[0]));
				$student->setMaritalStatus($_POST['maritalStatus']);
				$student->setPassword(trim($_POST['password']));

				//domicilio
				$student->setStreet($_POST['street']);
				$student->setNumber($_POST['number']);
				$student->setColony($_POST['colony']);
				$student->setCity($_POST['ciudad']);
				$student->setState($_POST['estado']);
				$student->setCountry($_POST['pais']);
				$student->setPostalCode($_POST['postalCode']);

				//datos de contacto
				$student->setEmail($_POST['email']);
				$student->setPhone($_POST['phone']);
				// $student->setFax($_POST['fax']);
				$student->setMobile($_POST['mobile']);

				//datos laborales
				$student->setWorkplace($_POST['workplace']);
				$student->setWorkplaceAddress($_POST['workplaceAddress']);
				$student->setWorkplaceArea($_POST['workplaceArea']); 
				$student->setWorkplaceOcupation($_POST['workplaceOcupation']);
				// $student->setWorkplacePosition($_POST['workplacePosition']); 
			    $student->setPaisT($_POST['paist']);
				$student->setEstadoT($_POST['estadot']);
				$student->setCiudadT($_POST['ciudadt']);
				//$student->setWorkplaceCity($_POST['workplaceCity']);
				$student->setWorkplacePhone($_POST['workplacePhone']);
				$student->setWorkplaceEmail($_POST['workplaceEmail']);
				
				//Estudios
				$student->setAcademicDegree($_POST['academicDegree']);
				$student->setProfesion($_POST['profesion']);
				$student->setSchool($_POST['school']);
				$student->setHighSchool($_POST['highSchool']);
				$student->setMasters($_POST['masters']); 
				$student->setMastersSchool($_POST['mastersSchool']);
								
				if ($_POST['semestreId']){
					$_POST['semestreId'] = $_POST['semestreId'];
				}else{
					$_POST['semestreId'] = 0;
				}
					
								
								
				if($student->UpdateAlumn())
				{
					$student->ProcesoReinscripcion($_POST['courseMxId'],$_POST['subjecxtId'],$_POST['coursexId'],$_POST['semestreId']);
					echo "ok[#]";
					echo '<div class="alert alert-success">
					<button class="close" data-dismiss="alert"></button>
							 Es necesario que descargue e imprima el formato de reinscripción que se encuentra en su menú principal y 
							 llevarlo al área de control escolar para recabar las firmas correspondientes
					</div>';
					echo '[#]';
					echo $_POST['courseMxId'];
					
				}
				else
				{
					echo "fail[#]";
					
					$smarty->assign("auxMsj", $_POST["auxMsj"]);
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}		
				break;
				
	}

?>


