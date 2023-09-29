<?php

class Credentials extends Student
{ 
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
			array('db' => 'user_credentials.created_at', 	'dt' => 'fecha'),
			array('db' => 'CONCAT(user.names, " ", user.lastNamePaterno," ", user.lastNameMaterno)',  'dt' => 'alumno'), 
			array('db' => 'major.name',  		'dt' => 'tipo'),
			array('db' => 'subject.name',  	'dt' => 'curricula'),
			array('db' => 'course.group',  	'dt' => 'grupo'),
			array(
				'db' => 'image', 'dt' => 'foto',
				'formatter' => function ($d, $row) {
					return $d;
				},
			),
			array('db' => 'CASE WHEN user_credentials.status = 0 THEN "<span class=\"badge badge-warning\">Pendiente</span>" WHEN user_credentials.status = 1 THEN "<span class=\"badge badge-info\">Aprobada</span>" ELSE "<span class=\"badge badge-primary\">Rechazada</span>" END', 'dt' => 'estatus'),
			array(
				
				'db' => 'id', 'dt' => 'acciones',
				'formatter' => function ($d, $row) { 

					return '<form class="form mt-1" id="form_subida' . $d . '" action="' . WEB_ROOT . '/ajax/new/finanzas.php">
								<input type="hidden" name="pago" value="' . $d . '">
								<input type="hidden" name="opcion" value="subir-archivo">
								<button type="submit" class="btn btn-success btn-sm" data-target="#ajax" data-width="500px" data-toggle="modal">btn</button>
							</form>';
				}
			)
		);
		$where = "user_credentials.deleted_at IS NULL";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}
}