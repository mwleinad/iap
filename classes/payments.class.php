<?php

class Payments extends Conceptos
{
	private $archivo;

	public function setArchivo($archivo)
	{
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
					$adicional = $archivo != "" ? "<a class='btn btn-info btn-sm' target='_blank' href='" . WEB_ROOT . "/files/solicitudes/{$archivo}'>Ver archivo</a>" : "";
					return $adicional . '<form class="form mt-1" id="form_subida' . $d . '" action="' . WEB_ROOT . '/ajax/new/finanzas.php">
								<input type="hidden" name="pago" value="' . $d . '">
								<input type="hidden" name="opcion" value="subir-archivo">
								<button type="submit" class="btn btn-success btn-sm" data-target="#ajax" data-width="500px" data-toggle="modal">' . $texto . '</button>
							</form>';
				}
			)
		);
		$where = "conceptos.cobros = 0 AND pagos.deleted_at IS NULL";
		return SSP::complex($_POST, $table, $primaryKey, $columns, $where);
	}

	public function actualizar_archivo()
	{
		$sql = "UPDATE pagos SET archivo = '{$this->archivo}' WHERE pago_id = {$this->getPagoId()}";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->UpdateData();
		return $resultado;
	}

	public function alumnos_con_pagos()
	{
		$sql = "SELECT * FROM pagos INNER JOIN user ON user.userId = pagos.alumno_id GROUP BY pagos.alumno_id ORDER BY lastNamePaterno, lastNameMaterno";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->GetResult();
		return $resultado;
	}

	public function curricula_con_pagos()
	{
		$sql = "SELECT pagos.course_id, major.name as especialidad, subject.name, course.group FROM `pagos` INNER JOIN course ON course.courseId = pagos.course_id INNER JOIN subject ON subject.subjectId = course.subjectId INNER JOIN major ON major.majorId = subject.tipo GROUP BY course.courseId ORDER BY subject.tipo ASC, course.finalDate DESC;";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->GetResult();
		return $resultado;
	}

	public function historial_pagos_curso($curso, $estatus = 1)
	{
		$estatus = $estatus == 1 ? "activo" : "inactivo";
		$sql = "SELECT pagos.pago_id, pagos.alumno_id, pagos.concepto_id, conceptos.nombre as concepto, pagos.indice, pagos.periodo, pagos.fecha_limite, SUM(pagos.subtotal) as subtotal, SUM(pagos.total) as total, SUM(cobros.monto) as pagado, (SUM(pagos.subtotal) - SUM(pagos.total)) as descuento FROM pagos INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id LEFT JOIN cobros ON cobros.pago_id = pagos.pago_id INNER JOIN user_subject ON user_subject.alumnoId = pagos.alumno_id AND user_subject.courseId = {$curso} WHERE user_subject.status = '{$estatus}' AND pagos.deleted_at IS NULL GROUP BY pagos.concepto_id, pagos.indice ORDER BY pagos.periodo, pagos.fecha_limite;";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->GetResult();
		$resultadoMap = ["periodicos" => [], "otros" => []];
		foreach ($resultado as $item) {
			$item['pagado'] = is_null($item['pagado']) ? 0 : $item['pagado'];
			if ($item['periodo'] == 0) {
				$resultadoMap['otros'][] = $item;
			} else {
				$resultadoMap['periodicos'][$item['periodo']][] = $item;
			}
		}
		return $resultadoMap;
	}

	public function historial_pagos_fecha($fecha_inicial, $fecha_final, $estatus = 1)
	{
		$estatus = $estatus == 1 ? "activo" : "inactivo";
		$sql = "SELECT pagos.pago_id, pagos.alumno_id, pagos.concepto_id, conceptos.nombre as concepto, pagos.indice, pagos.periodo, pagos.fecha_limite, SUM(pagos.subtotal) as subtotal, SUM(pagos.total) as total, SUM(cobros.monto) as pagado, (SUM(pagos.subtotal) - SUM(pagos.total)) as descuento FROM pagos INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id LEFT JOIN cobros ON cobros.pago_id = pagos.pago_id INNER JOIN user_subject ON user_subject.alumnoId = pagos.alumno_id WHERE user_subject.status = '{$estatus}' AND pagos.fecha_limite >= '$fecha_inicial' AND fecha_limite <= '$fecha_final' AND pagos.deleted_at IS NULL GROUP BY pagos.concepto_id ORDER BY pagos.concepto_id, pagos.indice;";
		$this->Util()->DB()->setQuery($sql);
		$resultado = $this->Util()->DB()->GetResult();
		$resultadoMap = ["periodicos" => [], "otros" => []];
		foreach ($resultado as $item) {
			$item['pagado'] = is_null($item['pagado']) ? 0 : $item['pagado'];
			if ($item['periodo'] == 0) {
				$resultadoMap['otros'][] = $item;
			} else {
				$resultadoMap['periodicos'][$item['periodo']][] = $item;
			}
		}
		return $resultadoMap;
	}

	public function recibo($pago)
	{
		$sql = "SELECT id FROM fn_student_receipt WHERE pago_id = {$pago}";
		$this->Util()->DBErp()->setQuery($sql);
		$resultado = $this->Util()->DBErp()->GetSingle();
		return $resultado;
	}

	public function crear_recibo($pago)
	{
		$sql = "INSERT INTO fn_student_receipt(pago_id, created_at, updated_at) VALUES ('{$pago}', NOW(), NOW())";
		$this->Util()->DBErp()->setQuery($sql);
		$id = $this->Util()->DBErp()->InsertData();
		return $id;
	}
}
