<?php
	include_once('../init.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();

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
				
				$_POST['password'] = date("His").rand(5,15);
				
				$status = $_POST['status'];
				
				//datos personales
				$student->setPermiso($_POST['permiso']);
				$student->setControlNumber();
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				// $student->setSexo($_POST['sexo']);
				// $student->setBirthdate($_POST['day'],$_POST['month'],$_POST['year']);
				// $student->setMaritalStatus($_POST['maritalStatus']);
				$student->setPassword(trim($_POST['password']));

				//domicilio
				// $student->setStreet($_POST['street']);
				// $student->setNumber($_POST['number']);
				// $student->setColony($_POST['colony']);
				$student->setCity($_POST['ciudad']);
				// $student->setState($_POST['estado']);
				// $student->setCountry($_POST['pais']);
				// $student->setPostalCode($_POST['postalCode']);

				//datos de contacto
				$student->setEmail($_POST['email']);
				// $student->setPhone($_POST['phone']);
				// $student->setFax($_POST['fax']);
				$student->setMobile($_POST['mobile']);

				//datos laborales
				// $student->setWorkplace($_POST['workplace']);
				// $student->setWorkplaceAddress($_POST['workplaceAddress']);
				// $student->setWorkplaceArea($_POST['workplaceArea']);
				// $student->setWorkplacePosition($_POST['workplacePosition']);
				//$student->setWorkplaceCity($_POST['workplaceCity']);
				// $student->setPaisT($_POST['paist']);
				// $student->setEstadoT($_POST['estadot']);
				// $student->setCiudadT($_POST['ciudadt']); 
				
				
				// $student->setWorkplacePhone($_POST['workplacePhone']);
				// $student->setWorkplaceEmail($_POST['workplaceEmail']);
				
				//Estudios
				// $student->setAcademicDegree($_POST['academicDegree']);
				// $student->setSchool($_POST['school']);
				// $student->setHighSchool($_POST['highSchool']);
				// $student->setMasters($_POST['masters']);
				// $student->setMastersSchool($_POST['mastersSchool']);
				// $student->setWorkplaceOcupation($_POST['workplaceOcupation']);
				// $student->setProfesion($_POST['profesion']);
				// $student->setTipoBeca($_POST['tipo_beca']);
				// $student->setPorBeca($_POST['por_beca']);
				
				
				
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
		
		
		// echo "<pre>"; print_r($_POST);
		// exit;
				
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
								
				if(!$student->UpdateAlumn())
				{
					echo "fail[#]";
					
					$smarty->assign("auxMsj", $_POST["auxMsj"]);
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
				}
					
				break;	
				
			case "DoSearch":
			
				$arrPage = array();		
				$viewPage = 1;			
				$rowsPerPage = 30;		
		
				
				// echo "<pre>"; print_r($_POST);
				// exit;
				$student->setNombre($_POST["nombre"]);
				$student->setApaterno($_POST["apPaterno"]);
				$student->setAmaterno($_POST["apMaterno"]);
				$student->setNocontrol($_POST["noControl"]);
				$student->setEstatus($_POST["vista"]);
				$students = $student->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/student', $arrPage, ' semesterId ASC, ');
				
				echo "ok[#]";
				$smarty->assign("DOC_ROOT", DOC_ROOT);
				$smarty->assign('students', $students);	
				$smarty->display(DOC_ROOT.'/templates/lists/student.tpl');
				
			break;
	
			case "viewCourse":
			
			
				// echo "<pre>"; print_r($_POST);
				// exit;
				$course->setCourseId($_POST["courseId"]);

				$date = date("d-m-Y");
				$addedModules = $course->StudentCourseModules();
				
				// echo "<pre>"; print_r($addedModules );
				// exit;
				$smarty->assign('date', $date);
				$smarty->assign('invoiceId', $_POST["courseId"]);
				$smarty->assign('subjects', $addedModules);
	
				echo "ok[#]";
				$smarty->display(DOC_ROOT.'/templates/lists/new/asig-course.tpl');
			
			break;
			
			case "addModuls":
			
				// echo "<pre>"; print_r($_POST);
				// exit;
				
				$complete=$student->AddUserToCurriculaFromCatalog($_POST["userId"], $_POST["courseId"],"Ninguno",0);
			   if($complete=="no" || $complete=="Este alumno ya esta registrado en esta curricula. Favor de Seleccionar otra Curricula"){
						echo "fail[#]";
						//$util->setError(10028, "error");
						$util->PrintErrors();
						$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					}
					else{	
						echo "ok[#]";
						$student->setUserId($_POST["userId"]);
						$activeCourses = $student->StudentCourses("activo", "si");
						$inactiveCourses = $student->StudentCourses("inactivo", "si");
						$finishedCourses = $student->StudentCourses("finalizado");
							
						$smarty->assign("finishedCourses", $finishedCourses);	
						$smarty->assign("inactiveCourses", $inactiveCourses);	
						$smarty->assign("activeCourses", $activeCourses);
						$smarty->display(DOC_ROOT.'/templates/lists/curriculas.tpl');
					}

			break;
			
			case "generaSolicitud":
			
				echo "<pre>"; print_r($_POST);
				$course->setCourseId($_POST["courseId"]);
				$courseInfo = $course->Info();
				echo "<pre>"; print_r($courseInfo);
				exit;
				// if($files->CedulaInscripcion($_POST["alumnoId"], $curricula, $this, $courseInfo["majorName"],  $courseInfo["name"])){
					// echo "si";
				// }else{
					// echo "no";
				// }
				
			break;
			
			case 'saveConcepto';
			
			// echo '<pre>'; print_r($_POST);
			// exit;
				
				$course->setId($_POST['solicitudId']);
				$course->setNombre($_POST['nombre']);
				$course->setPrecio($_POST['precio']);
				$course->setFire($_POST['id']);
				if($course->saveConcepto5()){
					echo 'ok[#]';
					$registros = $solicitud->enumerateTiposSolicitud();
					$smarty->assign("DOC_ROOT", DOC_ROOT);
					$smarty->assign("registros", $registros);
					$smarty->display(DOC_ROOT.'/templates/lists/new/concepto.tpl');
				}else{
					echo 'fail[#]';
				}
				// echo '<pre>'; 
				// echo "<pre>"; print_r($courseInfo);
				
			break;
			
			
			case "cargaInbox":
			
				
			
				// echo '<pre>'; print_r($_POST);
				// exit;
				if($_SESSION['User']['perfil'] == 'Administrador'){
					if($_POST['tipo']=='entrada'){
						$module->setStatusIn('activo');
						$module->setTipoReporte('entrada');
						$module->setRecibeId($_SESSION['User']['userId']);
						$module->setCMId($_GET["courseMId"]);
						if ($_SESSION['User']['type']=='student'){
							$module->setQuienEnviaId('personal');
						}else{
							$module->setQuienEnviaId('alumno');
						}
						
					}else if($_POST['tipo']=='borrador'){
						$module->setStatusIn('borrador');
						$module->setTipoReporte($_POST['tipo']);
						$module->setYoId($_SESSION['User']['userId']);
						$module->setCMId($_POST['courseMId']);
						if ($_SESSION['User']['type']=='student'){
							$module->setQuienEnviaId('alumno');
						}else{
							$module->setQuienEnviaId('personal');
						}
					}else if($_POST['tipo']=='eliminados'){
						$module->setStatusIn('eliminado');
						$module->setTipoReporte($_POST['tipo']);
						$module->setRecibeId($_SESSION['User']['userId']);
						$module->setCMId($_POST['courseMId']);
						if ($_SESSION['User']['type']=='student'){
							$module->setQuienEnviaId('alumno');
						}else{
							$module->setQuienEnviaId('personal');
						}
					}else if($_POST['tipo']=='enviados'){
						$module->setStatusIn('activo');
						$module->setTipoReporte($_POST['tipo']);
						$module->setYoId($_SESSION['User']['userId']);
						$module->setCMId($_POST['courseMId']);
						
						$module->setQuienEnviaId('personal');
						
					}
					
					$lstMsj = $module->EnumerateInboxAdmin();
				
				}else{
					
					if($_POST['tipo']=='entrada'){
					$module->setStatusIn('activo');
					$module->setTipoReporte('entrada');
					$module->setRecibeId($_SESSION['User']['userId']);
					$module->setCMId($_GET["courseMId"]);
					if ($_SESSION['User']['type']=='student'){
						$module->setQuienEnviaId('personal');
					}else{
						$module->setQuienEnviaId('alumno');
					}
					
				}else if($_POST['tipo']=='borrador'){
					$module->setStatusIn('borrador');
					$module->setTipoReporte($_POST['tipo']);
					$module->setYoId($_SESSION['User']['userId']);
					$module->setCMId($_POST['courseMId']);
					if ($_SESSION['User']['type']=='student'){
						$module->setQuienEnviaId('alumno');
					}else{
						$module->setQuienEnviaId('personal');
					}
				}else if($_POST['tipo']=='eliminados'){
					$module->setStatusIn('eliminado');
					$module->setTipoReporte($_POST['tipo']);
					$module->setRecibeId($_SESSION['User']['userId']);
					$module->setCMId($_POST['courseMId']);
					if ($_SESSION['User']['type']=='student'){
						$module->setQuienEnviaId('alumno');
					}else{
						$module->setQuienEnviaId('personal');
					}
				}else if($_POST['tipo']=='enviados'){
					$module->setStatusIn('activo');
					$module->setTipoReporte($_POST['tipo']);
					$module->setYoId($_SESSION['User']['userId']);
					$module->setCMId($_POST['courseMId']);
					if ($_SESSION['User']['type']=='student'){
						$module->setQuienEnviaId('alumno');
					}else{
						$module->setQuienEnviaId('personal');
					}
				}
				
				$lstMsj = $module->EnumerateInbox();
				
				}
				
				
				
				$smarty->assign("courseMId", $_POST['courseMId']);
				$smarty->assign("tipo", $_POST['tipo']);
				$smarty->assign("lstMsj", $lstMsj);
				$smarty->display(DOC_ROOT.'/templates/lists/inbox.tpl');
				
			break;
			
			
			
			
			case 'onChangePicture':

				if($url = $student->onChangePicture($_POST["userId"])){
				echo "ok[#]";
				}else{
				echo "fail[#]";

				}

			break;
			
		
		
		case 'onSavePerfil':
		
			// echo '<pre>'; print_r($_SESSION);
			// exit;
			$student->setPerfil($_POST["desc"]);
				if($url = $student->onSavePerfil($_SESSION['User']['userId'])){
				$_SESSION['msjC'] = 'si';
				echo "ok[#]";
			}else{
				echo "fail[#]";
			}
		
		break;
		
		case 'onSavePass':
		
			// echo '<pre>'; print_r($_POST);
			$student->setAnterior($_POST["anterior"]);
			$student->setNuevo($_POST["nuevo"]);
			$student->setRepite($_POST["repite"]);
				if($url = $student->onSavePass()){
				$_SESSION['msjCc'] = 'si';
				echo "ok[#]";
			}else{
				echo "fail[#]";
			}
		
		break;
		
		case "saveAddStudentCompleto":
			
			
			
				if(!isset($_POST["confirma"])){
					echo "fail[#]";
				$errors["value"] = "Necesita autorizar el envio de Información";
					$smarty->assign("errors", $errors);	
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
					exit;
				}
				
				//datos personales  
				$student->setUserId($_POST['userId']);
				$student->setNames($_POST['names']);
				$student->setLastNamePaterno($_POST['lastNamePaterno']);
				$student->setLastNameMaterno($_POST['lastNameMaterno']);
				$student->setSexo($_POST['genero']);
				$student->setCurp($_POST['curp']);
				$student->setBirthdate($_POST['year'],$_POST['month'],$_POST['day']);
				$student->setNacionality($_POST['nacionality']);
				$student->setAcademicDegree($_POST['academicDegree']);
				$student->setCityBorn($_POST['cityBorn']);
				$student->setLee($_POST['lee']);
				$student->setEstudios($_POST['estudios']);
				$student->setDEstudios($_POST['d_estudios']);
				$student->setDiscapacidad($_POST['discapacidad']);
				// $student->setDiscapacidades($_POST['discapacidades']);
				$student->setIdiomas($_POST['idiomas']);
				$student->setTrabaja($_POST['trabaja']);
				$student->setExperienciaLaboral($_POST['experienciaLaboral']);
				$student->setCertificacion($_POST['certificacion']);
				$student->setCertificaciones($_POST['certificaciones']);
				// echo "<pre>"; print_r($_POST);
			// exit;

				//domicilio
				$student->setStreet($_POST['street']);
				$student->setNumber($_POST['number']);
				$student->setColony($_POST['colony']);
				// $student->setCity($_POST['ciudad']);
				$student->setState($_POST['estado']);
				// $student->setCountry($_POST['pais']);
				$student->setPostalCode($_POST['postalCode']);

				//datos de contacto
				$student->setEmail($_POST['email']);
				$student->setPhone($_POST['mobile']);
				// $student->setFax($_POST['fax']);
				$student->setMobile($_POST['mobile']);

				//datos laborales
				
				$student->setWorkplacePosition($_POST['workplacePosition']);
				
				
				
				// $student->setWorkplacePhone($_POST['workplacePhone']);
				// $student->setWorkplaceEmail($_POST['workplaceEmail']);
				
				//Estudios
						
				
				
				if(!$student->Update())
				{
					echo "fail[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				}
				else
				{
					// exit;
					echo "ok[#]";
					$smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
				}	

		break;
	}

?>


