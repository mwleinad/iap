<?php
header('Content-type: application/pdf');
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');

session_start();

$alumno = $_GET['alumnoId'];
$curso = $_GET['cursoId'];
$course->setCourseId($curso);
$courseInfo = $course->Info();
$student->setUserId($alumno);
$info = $student->GetInfo(); 
// echo "<pre>";
// return print_r($courseInfo);
$activeCourses = $course->EnumerateActive();
foreach ($activeCourses as $item) {
    if ($item['courseId'] == $curso) {
        $courseInfo['group'] = "SIN ASIGNAR";
        break;
    }
}

//Datos personales
$student->setControlNumber();
$student->setNames($info['names']);
$student->setLastNamePaterno($info['lastNamePaterno']);
$student->setLastNameMaterno($info['lastNameMaterno']);
$student->setSexo($info['sexo']);
$info['birthdate'] = explode("-", $info['birthdate']);
$student->setBirthdate($info['birthdate'][0], $info['birthdate'][1], $info['birthdate'][2]);
$student->setMaritalStatus($info['maritalStatus']); 
//Datos dirección
$student->setStreet($info['street']);
$student->setNumber($info['number']);
$student->setColony($info['colony']);
$student->setCity($info['ciudad']);
$student->setState($info['estado']);
$student->setCountry($info['pais']);
$student->setPostalCode($info['postalCode']);
// Datos de Contacto
$student->setEmail($info['email']);
$student->setPhone($info['phone']);
$student->setFax($info['fax']);
$student->setMobile($info['mobile']);
// Datos Laborales
$student->setWorkplace($info['workplace']);
$student->setWorkplaceOcupation($info['workplaceOcupation']);
$student->setWorkplaceAddress($info['workplaceAddress']);
$student->setWorkplaceArea($info['workplaceArea']);
$student->setWorkplacePosition($info['workplacePosition']);
$student->setWorkplaceCity($info['nombreciudad']);
$student->setWorkplacePhone($info['workplacePhone']);
$student->setWorkplaceEmail($info['workplaceEmail']); 
// Estudios
$student->setAcademicDegree($info['academicDegree']);
$student->setSchool($info['school']);
$student->setHighSchool($info['highSchool']);
$student->setMasters($info['masters']);
$student->setMastersSchool($info['mastersSchool']);
$student->setProfesion($info['profesion']);

$files  = new Files;
$files->CedulaInscripcion($alumno, $curso, $student, $courseInfo);
?>