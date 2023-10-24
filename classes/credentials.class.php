<?php

class Credentials extends Main
{
	private $credential;
	private $status;
	private $motivo;
	private $archivos;
	function setCredential($credential)
	{
		$this->credential = $credential;
	}

	function setStatus($status)
	{
		$this->status = $status;
	}

	function setMotivo($data) {
		$this->motivo = $data;
	}

	function setFiles($data) {
		$this->archivos = $data;
	}

	public function dt_credentials_request()
	{
		$table = 'user_credentials 
		INNER JOIN course ON course.courseId = user_credentials.course_id
		INNER JOIN subject ON subject.subjectId = course.subjectId
		INNER JOIN major ON major.majorId = subject.tipo 
		INNER JOIN user on user.userId = user_credentials.user_id';
		$primaryKey = 'id';
		$columns = array(
			array('db' => 'id', 'dt' => 'credencial_id'),
			array('db' => 'user.controlNumber', 'dt' => 'usuario'),
			array('db' => 'user_credentials.created_at', 	'dt' => 'fecha'),
			array('db' => 'CONCAT(user.names, " ", user.lastNamePaterno," ", user.lastNameMaterno)',  'dt' => 'alumno'),
			array('db' => 'major.name',  		'dt' => 'tipo'),
			array('db' => 'subject.name',  	'dt' => 'curricula'),
			array('db' => 'course.group',  	'dt' => 'grupo'), 
			array('db' => 'CASE WHEN user_credentials.status = 0 THEN "<span class=\"badge badge-warning\">Pendiente</span>" WHEN user_credentials.status = 1 THEN "<span class=\"badge badge-success\">Aprobada</span>" ELSE "<span class=\"badge badge-danger\">Rechazada</span>" END', 'dt' => 'estatus'),
			array('db'	=>'user_credentials.status','status'), 
			array(
				'db' => 'files', 'dt' => 'foto',
				'formatter' => function ($d, $row) { 
					if($row['status'] != 2 ){
						$jsonFile = json_decode($row['foto'], true);  
						return "<a class='ajax_sin_form' data-data='\"opcion\":\"previo\",\"credencial\":{$row['credencial_id']}' href='".WEB_ROOT."/ajax/new/credenciales.php'><img src='".$jsonFile['urlEmbed']."' style='width:150px; height:auto;border-radius:25px; cursor:pointer;'></a>";
					}else{
						return "No cuenta con foto";
					} 
				},
			),
		);
		$where = "user_credentials.deleted_at IS NULL";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	public function updateCredential()
	{
		$sql = "UPDATE user_credentials SET status = {$this->status}, content = '{$this->motivo}', files = '{$this->archivos}' WHERE id = {$this->credential}";
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData($sql);
	}

	function getCredential() {
		$sql = "SELECT * FROM user_credentials WHERE id = {$this->credential}";
		$this->Util()->DB()->setQuery($sql);
		$response = $this->Util()->DB()->GetRow();
		if ($response) { 
			$response['files'] = json_decode($response['files'], true);
		}
		return $response;
	}

	function updateDownload() {
		$sql = "UPDATE user_credentials SET download = 1 WHERE id = {$this->credential}"; 
		$this->Util()->DB()->setQuery($sql);
		$this->Util()->DB()->UpdateData($sql);
	}
}
