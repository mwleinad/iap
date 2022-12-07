<?php
class Notificacion extends Main{


private $notificacionId;
private $actividad;
private $vista;
private $hecho;
//private $fecha_aplicacion=;
private $tablas;
private $enlace;

public function setNotificacionId($value){
   $this->notificacionId=$value;
}


public function setActividad($value){
  $this->actividad=$value;
}

public function setVista($value){
$this->vista=$value;
}

public function setHecho($value){
$this->hecho=$value;
}


public function setTablas($value){
$this->tablas=$value;
}

public function setEnlace($value){
$this->enlace=$value;
}


public function Enumerate(){

$positionId=$_SESSION['User']['positionId'];

if($positionId==0){
$visto=$_SESSION['User']['userId'].'u';
}else{
$visto=$_SESSION['User']['userId'].'p';
}

$fecha = date("Y-m-d", strtotime(date("Y-m-d")." - ".DAYS_NOTIFICATION." DAY"));
$sql="select * from notificacion WHERE fecha_aplicacion > '".$fecha."' order by fecha_aplicacion DESC LIMIT 1000";

$this->Util()->DB()->setQuery($sql);
$notificaciones=$this->Util()->DB()->GetResult();


			foreach($notificaciones as $key=>$result){

				$notificaciones[$key]["actividad"] = str_replace('<label style="color:#ff0000;font-size:200%"><strong>&raquo;</strong></label', "", $notificaciones[$key]["actividad"]);
			
//***************************OBTENIENDO PERMISOS DE IMPRESION EN AREA DE NOTIFICACIONES****************************///
			$vista = explode(",", $result["vista"]);
  
		  	     if(in_array($visto, $vista))
			     {
				     $notificaciones[$key]['vistaPermiso'] =1;
				     
			     }else
				     $notificaciones[$key]['vistaPermiso'] =0;
//********************************** fin de permisos de impresion en area de noficaciones******************************************************************* 
		          $userId=substr($notificaciones[$key]['hecho'], 0, -1);
			      $tipoUser = substr($notificaciones[$key]['hecho'], -1);
  //print_r($tipoUser);exit;
 				  if($tipoUser=="p"){
                          //echo $fila['hecho']; exit;
			             $personal=new Personal;
						 $personal->setPersonalId($userId);
						 $infoUser=$personal->info();
						 $notificaciones[$key]["nombre"]=$infoUser['name']." ".$infoUser['lastname_paterno']." ".$infoUser['lastname_materno'];
						//print_r($infoUser);
					   }else{
					      $student= new Student;
						  $student->setUserId($userId);
						  $infoUser=$student->GetInfo();
						  $notificaciones[$key]["nombre"]=$infoUser['names']." ".$infoUser['lastNamePaterno']." ".$infoUser['lastNameMaterno'];
						  //print_r($infoUser); exit;
					   }
		
		
		
		 }


// print_r($notificaciones); exit;

return $notificaciones;
}

public function saveNotificacion(){
	 $sqlNot="insert into notificacion(notificacionId,actividad,vista,hecho,fecha_aplicacion,tablas,enlace)
			   values( 
				'',
			            '".$this->actividad."', 
			            '".$this->vista."',
			            '".$this->hecho."',
			            '".date("Y-m-d H:i:s")."',
			            '".$this->tablas."',
						'".$this->enlace."' 
			         )";
					 
			$this->Util()->DB()->setQuery($sqlNot);
			//ejecutamos la consulta y guardamos el resultado, que sera el ultimo positionId generado
			$this->Util()->DB()->InsertData();
}

	function deleteNotificacion()
	{
		if($this->Util()->PrintErrors())
			return false;
		
		$sql = "DELETE FROM notificacion WHERE notificacionId = " . $this->notificacionId;	
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->ExecuteQuery();
		$this->Util()->setError(10074, "complete");
		$this->Util()->PrintErrors();
		return true;
	}



}
?>