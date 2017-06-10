<?php

	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

//print_r($_POST);
	
	switch($_POST["type"])
	{
	
	
      case "addCurriculaStudent":
	   $complete=$student->AddUserToCurriculaFromCatalog($_POST["userId"], $_POST["courseId"],"Ninguno",0);
	   if($complete=="no" || $complete=="Este alumno ya esta registrado en esta curricula. Favor de Seleccionar otra Curricula"){
				echo "fail[#]";
				//$util->setError(10028, "error");
				$util->PrintErrors();
		        $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
			}
			else{	
			echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
		        }
		break; 
		
		
		case "addStudent": 
		
				$activeCourses = $course->EnumerateActive();
				$smarty->assign("activeCourses", $activeCourses);	
		
		        $paises=$student->EnumeratePaises();	
		        $smarty->assign('paises',$paises);
		
				$prof = $profesion->Enumerate();
				$prof = $util->EncodeResult($prof);
				$smarty->assign('prof',$prof);
			
				$resCode = $code->Enumerate();
				$codes = $util->EncodeResult($resCode);
				$smarty->assign('codes',$codes);	
				
				$resSem = $semester->Enumerate();
				$semesters = $util->EncodeResult($resSem);
				$smarty->assign('semesters',$semesters);
				
				$resGroup = $group->Enumerate();
				$groups = $util->EncodeResult($resGroup);
				$smarty->assign('groups',$groups);
				
				$resSchTypes = $schoolType->EnumerateAll();
				$schTypes = $util->EncodeResult($resSchTypes);
				$smarty->assign('schTypes',$schTypes);
							
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$resMajorList = $major->Enumerate();
				$majorList = $util->EncodeResult($resMajorList);
				$smarty->assign("majorList", $majorList);
				$smarty->display(DOC_ROOT.'/templates/boxes/add-student-popup.tpl');//mando a llamar mi vista
				break;	
		
		case "editStudent":
				
				$resCode = $code->Enumerate();
				$codes = $util->EncodeResult($resCode);
				$smarty->assign('codes',$codes);			
				
				
				
				$resSem = $semester->Enumerate();
				$semesters = $util->EncodeResult($resSem);
				$smarty->assign('semesters',$semesters);
							
				$resMajorList = $major->Enumerate();
				$majorList = $util->EncodeResult($resMajorList);
				$smarty->assign("majorList", $majorList);
				
				$resSchTypes = $schoolType->EnumerateAll();
				$schTypes = $util->EncodeResult($resSchTypes);
				$smarty->assign('schTypes',$schTypes);

				$prof = $profesion->Enumerate();
				$prof = $util->EncodeResult($prof);
				$smarty->assign('prof',$prof);
				
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$student->setUserId($_POST['id']);
				$result = $student->GetInfo();
				$info = $util->EncodeRow($result);
				
				$student->setCountry($info['pais']);
				$student->setState($info['estado']);
				
				$paises=$student->EnumeratePaises();	
		        $smarty->assign('paises',$paises);
				
				$estados=$student->EnumerateEstados();	
		        $smarty->assign('estados',$estados);
				
				$ciudades=$student->EnumerateCiudades();	
		        $smarty->assign('ciudades',$ciudades);
				
				
				
				$resGroup = $group->Enumerate();
				$groups = $util->EncodeResult($resGroup);
				$smarty->assign('groups',$groups);
				
				$bd = explode('-',$info['birthdate']);
				$info['dayBirthdate'] = $bd[0];
				$info['monthBirthdate'] = $bd[1];
				$info['yearBirthdate'] = $bd[2];
				$smarty->assign("info", $info);
				$smarty->display(DOC_ROOT.'/templates/boxes/edit-student-popup.tpl');
				break;
	
		case "saveAddStudent":  ///cuando el admin da de alta al alumno 
				
				//print_r($_POST);
				
				$status = $_POST['status'];
				
				//datos personales
				//$util= new Util();
				$student->setPermiso($_POST['permiso']);
				$student->setControlNumber();
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				$student->setSexo($_POST['sexo']);
				$student->setBirthdate($_POST['day'],$_POST['month'],$_POST['year']);
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
				$student->setFax($_POST['fax']);
				$student->setMobile($_POST['mobile']);

				//datos laborales
				$student->setWorkplace($_POST['workplace']);
				$student->setWorkplaceOcupation($_POST['workplaceOcupation']);
				$student->setWorkplaceAddress($_POST['workplaceAddress']);
				$student->setWorkplaceArea($_POST['workplaceArea']);
				$student->setWorkplacePosition($_POST['workplacePosition']);
				//$student->setWorkplaceCity($_POST['workplaceCity']);
				$student->setPaisT($_POST['paist']);
				$student->setEstadoT($_POST['estadot']);
				$student->setCiudadT($_POST['ciudadt']);
				$student->setWorkplacePhone($_POST['workplacePhone']);
				$student->setWorkplaceEmail($_POST['workplaceEmail']);
				
				//Estudios
				$student->setAcademicDegree($_POST['academicDegree']);
				$student->setSchool($_POST['school']);
				$student->setHighSchool($_POST['highSchool']);
				$student->setMasters($_POST['masters']);
				$student->setMastersSchool($_POST['mastersSchool']);
				$student->setProfesion($_POST['profesion']);
				$student->setTipoBeca($_POST['tipo_beca']);
				$student->setPorBeca($_POST['por_beca']);
				
				if(isset($_POST['RegisterAdmin']))
				  $student->setRegister($_POST['RegisterAdmin']);
				else
				  $student->setRegister(0);
				  
				  
				if(!$student->Save("createCurricula"))
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}
				else
				{
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					echo "[#]";				
					
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
					$students = $util->EncodeResult($students);
					$smarty->assign('students', $students);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
					echo "[#]";
					$ids = array();
					foreach($students as $student)
					{
						$ids[] = $student["userId"];
					}
					echo count($ids);
					echo "[#]";
					echo $ids = implode(",", $ids);
					
				}		
				break;
		case "saveAddStudentRegister":
				
				//print_r($_POST); 
				
				$status = $_POST['status'];
				
				//datos personales
				$student->setPermiso($_POST['permiso']);
				$student->setControlNumber();
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				$student->setSexo($_POST['sexo']);
				$student->setBirthdate($_POST['day'],$_POST['month'],$_POST['year']);
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
				$student->setFax($_POST['fax']);
				$student->setMobile($_POST['mobile']);

				//datos laborales
				$student->setWorkplace($_POST['workplace']);
				$student->setWorkplaceAddress($_POST['workplaceAddress']);
				$student->setWorkplaceArea($_POST['workplaceArea']);
				$student->setWorkplacePosition($_POST['workplacePosition']);
				//$student->setWorkplaceCity($_POST['workplaceCity']);
				$student->setPaisT($_POST['paist']);
				$student->setEstadoT($_POST['estadot']);
				$student->setCiudadT($_POST['ciudadt']);
				
				
				$student->setWorkplacePhone($_POST['workplacePhone']);
				$student->setWorkplaceEmail($_POST['workplaceEmail']);
				
				//Estudios
				$student->setAcademicDegree($_POST['academicDegree']);
				$student->setSchool($_POST['school']);
				$student->setHighSchool($_POST['highSchool']);
				$student->setMasters($_POST['masters']);
				$student->setMastersSchool($_POST['mastersSchool']);
				$student->setWorkplaceOcupation($_POST['workplaceOcupation']);
				$student->setProfesion($_POST['profesion']);
				$student->setTipoBeca($_POST['tipo_beca']);
				$student->setPorBeca($_POST['por_beca']);
				
				
				
				if(!$student->Save("createCurricula"))
				{
					echo "fail[#]";
				
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				}
				else
				{
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				}	


				
				break;		
		case "saveEditStudent":	
						
//print_r($_POST);						
				$status = $_POST['status'];

				$student->setUserId($_POST['id']);

				//datos personales
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				$student->setSexo($_POST['sexo']);
				$student->setBirthdate($_POST['day'],$_POST['month'],$_POST['year']);
				$student->setMaritalStatus($_POST['maritalStatus']);
				$student->setPassword(trim($_POST['password']));

				//domicilio
				$student->setStreet($_POST['street']);
				$student->setNumber($_POST['number']);
				$student->setColony($_POST['colony']);
				$student->setCountry($_POST['pais']);
				$student->setState($_POST['estado']);
				$student->setCity($_POST['ciudad']);
				$student->setPostalCode($_POST['postalCode']);

				//datos de contacto
				$student->setEmail($_POST['email']);
				$student->setPhone($_POST['phone']);
				$student->setFax($_POST['fax']);
				$student->setMobile($_POST['mobile']);

				//datos laborales
				$student->setWorkplace($_POST['workplace']);
				$student->setWorkplaceOcupation($_POST['workplaceOcupation']);
				$student->setWorkplaceAddress($_POST['workplaceAddress']);
				$student->setWorkplaceArea($_POST['workplaceArea']);
				$student->setWorkplacePosition($_POST['workplacePosition']);
				$student->setPaisT($_POST['paist']);
				$student->setEstadoT($_POST['estadot']);
				$student->setCiudadT($_POST['ciudadt']);
		    	//$student->setWorkplaceCity($_POST['workplaceCity']);
				$student->setWorkplacePhone($_POST['workplacePhone']);
				$student->setWorkplaceEmail($_POST['workplaceEmail']);
				
				//Estudios
				$student->setAcademicDegree($_POST['academicDegree']);
				$student->setSchool($_POST['school']);
				$student->setHighSchool($_POST['highSchool']);
				$student->setMasters($_POST['masters']);
				$student->setMastersSchool($_POST['mastersSchool']);
				$student->setProfesion($_POST['profesion']);
								
				if(!$student->Update())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}
				else
				{
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					echo "[#]";
					
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
					
					$students = $util->EncodeResult($students);
					$smarty->assign('students', $students);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
					echo "[#]";
					$ids = array();
					foreach($students as $student)
					{
						$ids[] = $student["userId"];
					}
					echo count($ids);
					echo "[#]";
					echo $ids = implode(",", $ids);
				}
	
						
				break;
				
		case 'deleteStudent':
			
				$student->setUserId($_POST['id']);	
						
				if(!$student->Delete())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}
				else
				{
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					echo "[#]";
					
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
					$students = $util->EncodeResult($students);
					$smarty->assign('students', $students);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
					echo "[#]";
					$ids = array();
					foreach($students as $student)
					{
						$ids[] = $student["userId"];
					}
					echo count($ids);
					echo "[#]";
					echo $ids = implode(",", $ids);

				}
					
				break;
				
				
				
				
		case 'filtro':
				
				//print_r($_POST);
				
						if($_POST['vista']==1)
						$sqlSearch="select * from user ORDER BY  lastNamePaterno ASC,lastNameMaterno ASC,names ASC";
					    if($_POST['vista']==2)
                       $sqlSearch="select * from user where activo=1 ORDER BY  lastNamePaterno ASC,lastNameMaterno ASC,names ASC";
						if($_POST['vista']==3)
						 $sqlSearch="select * from user where activo=0 ORDER BY  lastNamePaterno ASC,lastNameMaterno ASC,names ASC";
						
				echo "ok[#]";
				
					$resStudents = $student->EnumerateStudent($sqlSearch);
				
				if($resStudents)
					$students = $util->EncodeResult($resStudents);
				$smarty->assign('students', $students);	
							
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
				
				
						
			break;
		
		case 'searchStudent':
				
				$name = $_POST['name'];
				$controlNumber = $_POST['controlNumber'];
				$apPaterno = $_POST['apPaterno'];
				$apMaterno = $_POST['apMaterno'];
				$activo=$_POST['activo'];
				
		
				if($name){
					$sqlSearch = ' AND names LIKE "%'.$name.'%"';
					$card['name'] = $name;			
				}
				if($controlNumber){
					$sqlSearch .= ' AND controlNumber LIKE "%'.$controlNumber.'%"';
					$card['controlNumber'] = $controlNumber;
				}
				if($apPaterno){
					$sqlSearch .= ' AND lastNamePaterno LIKE "%'.$apPaterno.'%"';
					$card['apPaterno'] = $apPaterno;
				}
				if($apMaterno){
					$sqlSearch .= ' AND lastNameMaterno LIKE "%'.$apMaterno.'%"';
					$card['apMaterno'] = $apMaterno;
				}
				
						
				if($activo<2){				
				$sqlSearch .= ' AND activo="'.$activo.'"  ';
				$card['activo']=$activo;
				}
				
				
				print_r($sqlSearch);
				
				$_SESSION['stdSearch'] = $card;
								
				echo "ok[#]";
				
				if($sqlSearch)			
					$resStudents = $student->Enumerate(' semesterId ASC, ', $sqlSearch);
				
				if($resStudents)
					$students = $util->EncodeResult($resStudents);
				$smarty->assign('students', $students);	
							
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
						
			break;
		
		case 'searchStudentCalificacion':
				
				if($_POST['name'])
					$sqlSearch = ' AND names LIKE "%'.$_POST['name'].'%"';
				if($_POST['controlNumber'])
					$sqlSearch .= ' AND controlNumber LIKE "%'.$_POST['controlNumber'].'%"';
				if($_POST['apPaterno'])
					$sqlSearch .= ' AND lastNamePaterno LIKE "%'.$_POST['apPaterno'].'%"';
				if($_POST['apMaterno'])
					$sqlSearch .= ' AND lastNameMaterno LIKE "%'.$_POST['apMaterno'].'%"';
								
				echo "ok[#]";
							
				$resStudents = $student->Enumerate(' semesterId ASC, ', $sqlSearch);
				$students = $util->EncodeResult($resStudents);
				$smarty->assign('students', $students);	
							
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->display(DOC_ROOT.'/templates/lists/report-calificacion.tpl');
						
			break;
		
		case 'changeStatus':
			
			$status = $_POST['status'];
					
			$user->setUserId($_POST['userId']);
			$user->setStatus($status);
			
			if($status == 'baja')
				$user->setCodeId(0);
			
			if(!$user->changeStatus())
			{
				echo "fail[#]";
				$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
			}
			else
			{
				echo "ok[#]";
				$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				echo "[#]";
			}
			
			break;
		
		case 'LoadGroups':
			
			$semesterId = intval($_POST['semesterId']);
			$majorId = $_POST['majorId'];
			
			$group->setSemesterId($semesterId);
			$group->setMajorId($majorId);
			$result = $group->Search();
			
			echo 'ok[#]';
			
			$smarty->assign('groups',$result);
			$smarty->assign("DOC_ROOT", DOC_ROOT);
			$smarty->display(DOC_ROOT.'/templates/lists/list-group.tpl');
					
			break;

		case "saveEditStudentAlumn":	
											
				$status = $_POST['status'];
                $student->setPermiso($_POST['permiso']);
				$student->setUserId($_POST['id']);

				//datos personales
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				$student->setSexo($_POST['sexo']);
				$student->setBirthdate($_POST['day'],$_POST['month'],$_POST['year']);
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
								
				if(!$student->UpdateAlumn())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}
				else
				{
					echo "ok[#]";
					echo '<div class="alert alert-success">
					<button class="close" data-dismiss="alert"></button>
							El Alumno fue editado correctamente
					</div>';
					// $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
//					header("Location: ".WEB_ROOT."/alumn-services");
/*					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					echo "[#]";
					
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
					
					$students = $util->EncodeResult($students);
					$smarty->assign('students', $students);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
*/				}		
				break;
				
			case 'desactivar':
			
		//	print_r($_POST);
			
				$student->setUserId($_POST['id']);	
						
				if(!$student->desactivar())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}
				else
				{
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					echo "[#]";
					
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
					$students = $util->EncodeResult($students);
					$smarty->assign('students', $students);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
					echo "[#]";
					$ids = array();
					foreach($students as $student)
					{
						$ids[] = $student["userId"];
					}
					echo count($ids);
					echo "[#]";
					echo $ids = implode(",", $ids);

				}
					
				break;	
				
					case 'activar':
			
		//	print_r($_POST);
			
				$student->setUserId($_POST['id']);	
						
				if(!$student->Activar())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
				}
				else
				{
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					echo "[#]";
					
					$arrPage = array();		
					$viewPage = 1;			
					$rowsPerPage = 30;		
					
					$pageVar = 'p';	
					
					if(isset($_GET["$pageVar"]))
						$viewPage = $_GET["$pageVar"];	
					
					$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
					$students = $util->EncodeResult($students);
					$smarty->assign('students', $students);	
					$smarty->assign('arrPage', $arrPage);
					
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
					echo "[#]";
					$ids = array();
					foreach($students as $student)
					{
						$ids[] = $student["userId"];
					}
					echo count($ids);
					echo "[#]";
					echo $ids = implode(",", $ids);

				}
					
				break;	
	
	}

?>


