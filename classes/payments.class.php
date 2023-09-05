<?php

class Payments extends Conceptos
{
	private $archivo; 

	public function setArchivo($archivo){
		$this->archivo = $archivo;
	} 

	public function dt_payments_request()
	{
		$table = 'pagos INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id INNER JOIN course ON course.courseId = pagos.course_id INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo INNER JOIN user on user.userId = pagos.alumno_id';
		$primaryKey = 'pago_id';
		$columns = array(
			array('db' => 'pago_id', 			'dt' => 'pago_id'),
			array('db' => 'pagos.created_at', 	'dt' => 'fecha'),
			array('db' => 'conceptos.nombre',	'dt' => 'concepto'),
			array('db' => 'course.group',  	'dt' => 'grupo'),
			array('db' => 'major.name',  		'dt' => 'tipo'),
			array('db' => 'subject.name',  	'dt' => 'nombre'),
			array('db' => 'CONCAT(user.names, " ", user.lastNamePaterno," ", user.lastNameMaterno)',  'dt' => 'alumno'),
			array('db' => 'CASE WHEN pagos.status = 1 THEN "<span class=\"badge badge-warning\">Pendiente</span>" WHEN pagos.status = 3 THEN "<span class=\"badge badge-info\">Prórroga</span>" ELSE "<span class=\"badge badge-primary\">Pagado</span>" END', 'dt' => 'estatus'),
			array(
				'db' => 'pago_id', 'dt' => 'acciones',
				'formatter' => function ($d, $row) {
					$this->setPagoId($d);
					$pago = $this->pago();
					$archivo = $pago['archivo'];
					$texto = $archivo != "" ? "Actualizar archivo" : "Subir archivo";
					$adicional = $archivo != "" ? "<a class='btn btn-info btn-sm' target='_blank' href='".WEB_ROOT."/files/solicitudes/{$archivo}'>Ver archivo</a>" : "";
					return $adicional.'<form class="form mt-1" id="form_subida'.$d.'" action="'.WEB_ROOT.'/ajax/new/finanzas.php">
								<input type="hidden" name="pago" value="'.$d.'">
								<input type="hidden" name="opcion" value="subir-archivo">
								<button type="submit" class="btn btn-success btn-sm" data-target="#ajax" data-width="500px" data-toggle="modal">'.$texto.'</button>
							</form>';
				}
			)
		);
		$where = "conceptos.cobros = 0";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	} 

	public function actualizar_archivo() {
		$sql = "UPDATE pagos SET archivo = '{$this->archivo}' WHERE pago_id = {$this->getPagoId()}"; 
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->UpdateData();
		return $resultado;
	}

	public function alumnos_con_pagos() {
		$sql = "SELECT * FROM pagos INNER JOIN user ON user.userId = pagos.alumno_id GROUP BY pagos.alumno_id ORDER BY lastNamePaterno, lastNameMaterno";
		$this->Util()->DB()->setQuery($sql);
		$respuesta = $this->Util()->DB()->GetResult();
		return $respuesta;
	}

	public function curricula_con_pagos() {
		// $sql = "SELECT pagos.course_id, major.name as especialidad, subject.name, course.group FROM `pagos` INNER JOIN course ON course.courseId = pagos.course_id INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo GROUP BY course.courseId ORDER BY subject.tipo ASC, course.finalDate DESC;";
		// $this->Util()->DB()->setQuery($sql);
		// $respuesta = $this->Util()->DB()->GetResult();
		// return $respuesta;

		$sql = "SELECT * FROM `pagos` WHERE periodo <> 0 AND deleted_at IS NULL ORDER BY alumno_id, fecha_cobro";
		$this->Util()->DB()->setQuery($sql);
		$respuesta = $this->Util()->DB()->GetResult();
		echo "<pre>";
		// print_r($respuesta);
		$indices = [];
		
		foreach ($respuesta as $item) {
			if(!isset($indices[$item['course_id']][$item['alumno_id']][$item['concepto_id']])){
				$indices[$item['course_id']][$item['alumno_id']][$item['concepto_id']] = 1;
				$sql = "UPDATE pagos SET indice = 1 WHERE pago_id = {$item['pago_id']}";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData(); 
			}else{
				$contador = $indices[$item['course_id']][$item['alumno_id']][$item['concepto_id']] + 1;
				$indices[$item['course_id']][$item['alumno_id']][$item['concepto_id']] = $contador;
				$sql = "UPDATE pagos SET indice = {$contador} WHERE pago_id = {$item['pago_id']}";
				$this->Util()->DB()->setQuery($sql);
				$this->Util()->DB()->UpdateData();
			}
		}
		// print_r($indices);
		exit;
	}
}
