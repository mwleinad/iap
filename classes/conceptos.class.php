<?php
class Conceptos extends Module
{
    private $nombre;
    private $costo;
    private $beca; //Aplica Beca
    private $clave;
    private $unidad;
    private $nombre_unidad;
    private $periodicidad;
    private $tolerancia;
    private $cobros;
    private $conceptoId;
    private $fecha_cobro;
    private $fecha_limite;
    private $fecha_pago;
    private $conceptoSubject;
    private $conceptoCurso;
    private $alumno;
    private $periodo;
    private $periodoId;
    private $pagoId;
    private $descuento;
    private $status;
    private $total;
    private $monto;
    private $fecha_eliminacion;
    private $cobroTarjetaId;

    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    public function setCosto($costo)
    {
        $this->costo = $costo;
    }

    public function setTotal($total)
    {
        $this->total = $total;
    }

    public function setBeca($beca)
    {
        $this->beca = $beca;
    }

    public function setClave($clave)
    {
        $this->clave = $clave;
    }

    public function setUnidad($unidad)
    {
        $this->unidad = $unidad;
    }

    public function setNombreUnidad($nombre_unidad)
    {
        $this->nombre_unidad = $nombre_unidad;
    }

    public function setPeriodicidad($periodicidad)
    {
        $this->periodicidad = $periodicidad;
    }

    public function setTolerancia($tolerancia)
    {
        $this->tolerancia = $tolerancia;
    }

    public function setCobros($cobros)
    {
        $this->cobros = $cobros;
    }

    public function setConcepto($concepto)
    {
        $this->conceptoId = $concepto;
    }

    public function setFechaCobro($fecha_cobro)
    {
        $this->fecha_cobro = $fecha_cobro;
    }

    public function setFechaLimite($fecha_limite)
    {
        $this->fecha_limite = $fecha_limite;
    }

    public function setFechaPago($fecha_pago)
    {
        $this->fecha_pago = $fecha_pago;
    }

    public function setConceptoCurso($conceptoCurso)
    {
        $this->conceptoCurso = $conceptoCurso;
    }

    public function setAlumno($alumno)
    {
        $this->alumno = $alumno;
    }

    public function setPeriodo($periodo)
    {
        $this->periodo = $periodo;
    }

    public function setPeriodoId($periodoId)
    {
        $this->periodoId = $periodoId;
    }

    public function setConceptoSubject($conceptoSubject)
    {
        $this->conceptoSubject = $conceptoSubject;
    }

    public function setPagoId($pagoId)
    {
        $this->pagoId = $pagoId;
    }

    public function getPagoId()
    {
        return $this->pagoId;
    }

    public function setDescuento($descuento)
    {
        $this->descuento = $descuento;
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function setMonto($monto)
    {
        $this->monto = $monto;
    }

    function setFechaEliminacion($fecha_eliminacion)
    {
        $this->fecha_eliminacion = $fecha_eliminacion;
    }

    public function setCobroTarjetaId($value)
    {
        $this->cobroTarjetaId = intval($value);
    }

    public function getConcepto()
    {
        $sql = "SELECT * FROM conceptos WHERE concepto_id = {$this->conceptoId}";
        $this->Util()->DB()->setQuery($sql);
        // echo $sql;
        $result = $this->Util()->DB()->GetRow();
        return $result;
    }

    public function crear()
    {
        $sql = "INSERT INTO `conceptos`(`nombre`, `descuento`, `clave_sat`, `unidad_sat`, `nombre_unidad_sat`, `total`, `subtotal`, `iva`, `periodicidad`, `cobros`, `tolerancia`) VALUES ('{$this->nombre}','{$this->beca}','{$this->clave}','{$this->unidad}', '{$this->nombre_unidad}','{$this->costo}',0,0,'{$this->periodicidad}','{$this->cobros}','{$this->tolerancia}') ";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->InsertData();
        return $result;
    }

    public function actualizar()
    {
        $sql = "UPDATE conceptos SET nombre = '{$this->nombre}', descuento = '{$this->beca}', clave_sat = '{$this->clave}', unidad_sat ='{$this->unidad}', nombre_unidad_sat = '{$this->nombre_unidad}', total ='{$this->costo}', subtotal = 0, iva = 0, periodicidad = '{$this->periodicidad}', cobros = '{$this->cobros}', tolerancia = '{$this->tolerancia}' WHERE concepto_id = '{$this->conceptoId}' ";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->UpdateData();
        return $result;
    }

    public function listar()
    {
        $this->Util()->DB()->setQuery("SELECT concepto_id, nombre, descuento, clave_sat, unidad_sat, total, subtotal, iva, periodicidad, cobros, tolerancia FROM conceptos WHERE conceptos.deleted_at IS NULL");
        return $this->Util()->DB()->GetResult();
    }

    public function eliminar_concepto()
    {
        $sql = "UPDATE conceptos SET deleted_at = NOW() WHERE concepto_id = {$this->conceptoId}";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    //Lista todos los conceptos y checa si la curricula ya está relacionada
    public function conceptos_subjects()
    {
        $sql = "SELECT conceptos.concepto_id, conceptos.nombre, conceptos_subject.concepto_subject_id, conceptos_subject.cobros FROM conceptos LEFT JOIN conceptos_subject ON conceptos_subject.concepto_id = conceptos.concepto_id AND conceptos_subject.subject_id = {$this->getSubjectId()} WHERE conceptos.deleted_at IS NULL;";
        $this->Util()->DB()->setQuery($sql);
        // echo $sql;
        return $this->Util()->DB()->GetResult();
    }

    public function getConceptoSubject()
    {
        $sql = "SELECT conceptos_subject.*, conceptos.nombre FROM conceptos_subject INNER JOIN conceptos ON conceptos.concepto_id = conceptos_subject.concepto_id WHERE conceptos_subject.concepto_subject_id = {$this->conceptoSubject}";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        return $this->Util()->DB()->GetRow();
    }

    //Crea la relación del concepto con la curricula
    public function crear_relacion()
    {
        $sql = "INSERT INTO conceptos_subject(concepto_id, subject_id, iva, total, subtotal, descuento, periodicidad, cobros, tolerancia) VALUE('{$this->conceptoId}','{$this->getSubjectId()}', 0, '{$this->costo}', 0, {$this->beca}, {$this->periodicidad}, {$this->cobros}, {$this->tolerancia}) ";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->InsertData();
        return $resultado;
    }

    public function actualizar_relacion()
    {
        $sql = "UPDATE conceptos_subject SET total = {$this->costo}, descuento = {$this->beca}, periodicidad = {$this->periodicidad}, cobros = {$this->cobros}, tolerancia = {$this->tolerancia} WHERE concepto_subject_id = {$this->conceptoSubject} ";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    public function eliminar_conceptos()
    {
        $sql = "DELETE FROM conceptos_subject WHERE subject_id = {$this->getSubjectId()}";
        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->DeleteData();
    }

    public function eliminar_concepto_subject()
    {
        $sql = "DELETE FROM conceptos_subject WHERE concepto_subject_id = {$this->conceptoSubject}";
        // echo $sql;d
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->DeleteData();
        return $resultado;
    }

    public function eliminar_periodos()
    {
        $sql = "DELETE FROM conceptos_subject_periodos WHERE concepto_subject_id = {$this->conceptoSubject}";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->DeleteData();
        return $resultado;
    }

    //Obtiene los periodos actuales del concepto de la curricula
    public function periodos_subject()
    {
        $sql = "SELECT * FROM conceptos_subject_periodos WHERE concepto_subject_id = {$this->conceptoSubject} ORDER BY periodo_id ASC";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetResult();
        return $resultado;
    }

    public function crear_periodo()
    {
        $sql = "INSERT INTO conceptos_subject_periodos(concepto_subject_id,periodo) VALUES({$this->conceptoSubject}, 0)";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->InsertData();
        return $resultado;
    }

    public function actualizar_periodos()
    {
        $sql = "UPDATE conceptos_subject_periodos SET periodo = {$this->periodo} WHERE periodo_id = {$this->periodoId}";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    //Verifica si hay conceptos relacionados a la curricula
    public function conceptos_subjects_count()
    {
        $sql = "SELECT COUNT(*) as existe FROM conceptos_subject WHERE subject_id = {$this->getSubjectId()}";
        $this->Util()->DB()->setQuery($sql);
        $existe = $this->Util()->DB()->GetSingle();
        return $existe;
    }

    //Verfica que no exista una currícula con periodos cero
    public function conceptos_subjects_periodos_count()
    {
        $sql = "SELECT COUNT(*) as existe FROM conceptos_subject INNER JOIN conceptos_subject_periodos csp ON csp.concepto_subject_id = conceptos_subject.concepto_subject_id WHERE subject_id = {$this->getSubjectId()} AND periodo = 0";
        $this->Util()->DB()->setQuery($sql);
        $existe = $this->Util()->DB()->GetSingle();
        return $existe;
    }

    //Obtiene solo los conceptos relacionados con la currícula
    public function conceptos_subjects_relacionados()
    {
        $sql = "SELECT CS.*, CSP.periodo FROM conceptos_subject CS LEFT JOIN conceptos_subject_periodos CSP ON CSP.concepto_subject_id = CS.concepto_subject_id WHERE CS.subject_id = {$this->getSubjectId()} ORDER BY CS.concepto_id, CSP.periodo_id";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetResult();
        return $resultado;
    }

    public function crear_relacion_curso()
    {
        $sql = "INSERT INTO conceptos_course(subject_id,course_id, concepto_id,iva, total, subtotal, descuento, fecha_cobro, fecha_limite, periodo) VALUES({$this->getSubjectId()},{$this->getCourseId()},{$this->conceptoId}, 0, {$this->costo}, 0, {$this->beca}, {$this->fecha_cobro}, {$this->fecha_limite},{$this->periodo})";
        // echo $sql."<br> \n";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->InsertData();
        return $resultado;
    }

    public function conceptos_cursos_relacionados()
    {
        $sql = "SELECT conceptos_course.*, conceptos.nombre as concepto_nombre FROM conceptos_course INNER JOIN conceptos ON conceptos.concepto_id = conceptos_course.concepto_id WHERE conceptos_course.course_id = {$this->getCourseId()} AND conceptos_course.deleted_at IS NULL ORDER BY conceptos_course.fecha_cobro ASC";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetResult();
        $clasificados = [];
        foreach ($resultado as $item) {
            if (is_null($item['fecha_cobro'])) {
                $clasificados['otros'][] = $item;
            } else {
                $clasificados['periodicos'][] = $item;
            }
        }
        return $clasificados;
    }

    public function concepto_curso()
    {
        $sql = "SELECT * FROM conceptos_course WHERE conceptos_course.concepto_course_id = {$this->conceptoCurso}";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetRow();
        return $resultado;
    }

    public function actualizar_concepto_curso()
    {
        $sql = "UPDATE conceptos_course SET total = {$this->costo}, descuento = {$this->beca}, fecha_cobro = {$this->fecha_cobro}, fecha_limite = {$this->fecha_limite}, periodo = {$this->periodo}, deleted_at = {$this->fecha_eliminacion} WHERE concepto_course_id = {$this->conceptoCurso}";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    public function eliminar_concepto_curso()
    {
        $sql = "UPDATE conceptos_course SET deleted_at = {$this->fecha_eliminacion} WHERE concepto_course_id = {$this->conceptoCurso}";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    public function crear_relacion_curso_alumno()
    {
        $sql = "INSERT INTO pagos(alumno_id, course_id, concepto_id, total, iva, subtotal, status, beca, fecha_cobro, fecha_limite, descuento, periodo) VALUES({$this->alumno},{$this->getCourseId()}, {$this->conceptoId}, {$this->costo}, 0, {$this->costo}, 1, 0, {$this->fecha_cobro}, {$this->fecha_limite}, {$this->beca}, {$this->periodo})";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->InsertData();
    }

    public function historial_pagos()
    {
        $sql = "SELECT pagos.pago_id, pagos.course_id, pagos.alumno_id, pagos.concepto_id, pagos.fecha_cobro, if(pagos.status = 3, DATE_ADD(pagos.fecha_limite, INTERVAL pagos.tolerancia DAY), pagos.fecha_limite) as fecha_limite, pagos.total, pagos.iva, pagos.subtotal, CASE WHEN pagos.status = 1 THEN '<span class=\"badge badge-warning\">Pendiente</span>' WHEN pagos.status = 3 THEN '<span class=\"badge badge-info\">Prórroga</span>' ELSE '<span class=\"badge badge-primary\">Pagado</span>' END AS status_btn, pagos.status, pagos.descuento, pagos.beca, pagos.archivo, pagos.tolerancia, pagos.periodo, conceptos.nombre AS concepto_nombre FROM pagos INNER JOIN conceptos ON conceptos.concepto_id = pagos.concepto_id WHERE pagos.alumno_id = {$this->alumno} AND pagos.course_id = {$this->getCourseId()} AND pagos.deleted_at IS NULL ORDER BY fecha_cobro;";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetResult();

        $clasificados = [];
        foreach ($resultado as $item) {
            $this->pagoId = $item['pago_id'];
            $item['cobros'] = $this->cobros();
            $item['monto'] = $this->monto();
            if ($item['periodo'] == 0) {
                $clasificados['otros'][] = $item;
            } else {
                $clasificados['periodicos'][] = $item;
            }
        }
        // print_r($clasificados);
        return $clasificados;
    }

    public function actualizar_beca()
    {
        $adicional = ""; //$this->beca == 100 ? ",pagos.status =  2" : ",pagos.status = 1";
        $sql = "SELECT pagos.*, (SELECT count(*) FROM cobros WHERE cobros.pago_id = pagos.pago_id) as cobros FROM `pagos` WHERE pagos.alumno_id = {$this->alumno} AND pagos.course_id = {$this->getCourseId()} AND pagos.periodo = {$this->periodo} AND pagos.descuento = 1;";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetResult();
        foreach ($resultado as $item) {
            if ($item['cobros'] == 0) {
                $descuento = $item['subtotal'] * ($this->beca / 100);
                $total = $item['subtotal'] - $descuento;
                $item['status'] = $total == 0 ? 2 : ($item['status'] == 2 ? 1 : $item['status']);
                $this->total = $total;
                $this->costo = $item['subtotal'];
                $this->fecha_cobro = "'{$item['fecha_cobro']}'";
                $this->fecha_limite = "'{$item['fecha_limite']}'";
                $this->descuento = $item['descuento'];
                $this->tolerancia = intval($item['tolerancia']);
                $this->status = $item['status'];
                $this->periodo = $item['periodo'];
                $this->pagoId = $item['pago_id'];
                $this->actualizar_pago();
            }
        }
        // echo $sql;

        return $resultado;
    }

    public function pago()
    {
        $sql = "SELECT pagos.*, (SELECT count(*) FROM cobros WHERE cobros.pago_id = {$this->pagoId}) as cobros FROM pagos WHERE pago_id = {$this->pagoId}";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetRow();
        return $resultado;
    }

    //Obtiene todos los pagos relacionados al concepto del curso
    public function pagos_curso_concepto()
    {
        $sql = "SELECT *, (SELECT COUNT(*) FROM cobros WHERE pago_id = pagos.pago_id) as cobros FROM pagos WHERE concepto_course_id = {$this->conceptoCurso}";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->GetResult();
        return $resultado;
    }

    function eliminar_curso_concepto()
    {
    }

    public function guardar_pago()
    {
        $sql = "INSERT INTO pagos(alumno_id, course_id, concepto_id, fecha_cobro, fecha_limite, total, iva, subtotal, status, descuento, beca, periodo, concepto_course_id) VALUES({$this->alumno},{$this->getCourseId()},{$this->conceptoId}, {$this->fecha_cobro}, {$this->fecha_limite}, {$this->total}, 0, {$this->costo}, 1, {$this->descuento}, {$this->beca}, {$this->periodo}, {$this->conceptoCurso})";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $pago = $this->Util()->DB()->InsertData();

        $sql = "INSERT INTO pagos_historial(`pago_id`, `user_id`, `fecha_cobro`, `fecha_limite`, `total`, `iva`, `subtotal`, `status`, `descuento`, `beca`, `periodo`) VALUES({$pago},{$this->getUserId()}, {$this->fecha_cobro},{$this->fecha_limite}, {$this->costo}, 0,{$this->total}, 1 ,{$this->descuento}, {$this->beca},{$this->periodo}) ";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->InsertData();
    }

    public function actualizar_pago()
    {
        $sql = "UPDATE pagos SET total = {$this->total}, subtotal = {$this->costo}, fecha_cobro = {$this->fecha_cobro}, fecha_limite = {$this->fecha_limite}, descuento = {$this->descuento}, beca = {$this->beca}, status = {$this->status}, tolerancia = '{$this->tolerancia}', periodo = {$this->periodo} WHERE pago_id = {$this->pagoId};";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $actualizado = $this->Util()->DB()->UpdateData();
        if ($actualizado) {
            $sql = "INSERT INTO pagos_historial(`pago_id`, `user_id`, `fecha_cobro`, `fecha_limite`, `total`, `iva`, `subtotal`, `status`, `descuento`, `beca`, `tolerancia`, `periodo`) VALUES({$this->pagoId},{$this->getUserId()}, {$this->fecha_cobro},{$this->fecha_limite}, {$this->costo}, 0,{$this->total}, {$this->status},{$this->descuento}, {$this->beca}, '{$this->tolerancia}',{$this->periodo}) ";
            // echo $sql;
            $this->Util()->DB()->setQuery($sql);
            $this->Util()->DB()->InsertData();
        }
    }

    public function eliminar_pago()
    {
        $sql = "UPDATE pagos SET deleted_at = {$this->fecha_eliminacion} WHERE pago_id = {$this->pagoId}";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    //Retorna el total pagado del concepto
    public function monto()
    {
        $sql = "SELECT SUM(monto) FROM cobros WHERE pago_id = {$this->pagoId}";
        $this->Util()->DB()->setQuery($sql);
        $monto = $this->Util()->DB()->GetSingle();
        return $monto > 0 ? $monto : 0;
    }

    public function cobros()
    {
        $sql = "SELECT * FROM cobros WHERE pago_id = {$this->pagoId}";
        $this->Util()->DB()->setQuery($sql);
        $cobros = $this->Util()->DB()->GetResult();
        foreach ($cobros as $key => $value) {
            if ($value['facturado'] == 1) {
                $sql = "SELECT fei.files FROM fn_education_charge_invoice feci INNER JOIN fn_education_invoices fei ON fei.id = feci.invoice_id WHERE feci.charge_id = {$value['id']}";
                $this->Util()->DBErp()->setQuery($sql);
                $facturas = $this->Util()->DBErp()->GetSingle();
                $cobros[$key]['facturas'] = json_decode($facturas, true);
            }
        }
        return $cobros;
    }

    public function guardar_cobro()
    {
        $sql = "INSERT INTO cobros(pago_id, monto, fecha_pago, facturado, subtotal, descuento) VALUES({$this->pagoId},{$this->monto}, {$this->fecha_pago},0, {$this->costo}, {$this->descuento})";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->InsertData();
        return $resultado;
    }

    public function guardarCobroTarjeta($marca_tarjeta, $referencia3d, $correo, $nombre, $apellido, $codigo_postal, $celular, $tipo_tarjeta, $numero_tarjeta, $fecha_exp, $codigo_seguridad)
    {
        $sql = "INSERT INTO cobros_tarjeta(pago_id, monto, marca_tarjeta, referencia3d, correo, nombre, apellido, codigo_postal, celular, tipo_tarjeta, estatus, numero_tarjeta, fecha_exp, codigo_seguridad, created_at, updated_at) VALUES(" . $this->pagoId . ", " . $this->monto . ", '" . $marca_tarjeta . "', '" . $referencia3d . "', '" . $correo . "', '" . $nombre . "', '" . $apellido . "', '" . $codigo_postal . "', '" . $celular . "', '" . $tipo_tarjeta . "', 'Auth', '" . $numero_tarjeta . "', '" . $fecha_exp . "', '" . $codigo_seguridad . "', NOW(), NOW())";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->InsertData();
        return $resultado;
    }

    public function getCobroTarjeta($referencia3d = null)
    {
        $sql = "SELECT * FROM cobros_tarjeta WHERE deleted_at IS NULL AND referencia3d = '" . $referencia3d . "'";
        if($this->cobroTarjetaId > 0)
            $sql = "SELECT * FROM cobros_tarjeta WHERE id = " . $this->cobroTarjetaId;
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->GetRow();
        return $result;
    }

    public function deleteCobroTarjeta($estatus, $numero_tarjeta = null)
    {
        $sql = "UPDATE cobros_tarjeta SET estatus = '" . $estatus . "', numero_tarjeta = '" . $numero_tarjeta . "', fecha_exp = NULL, codigo_seguridad = NULL, deleted_at = NOW() WHERE id = " . $this->cobroTarjetaId . " AND deleted_at IS NULL";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->UpdateData();
        return $result;
    }

    public function verificarCobroTarjeta()
    {
        $sql = "SELECT COUNT(*) AS qty FROM cobros_tarjeta WHERE pago_id = " . $this->pagoId . " AND cobro_id IS NULL AND estatus <> 'Auth' AND deleted_at IS NULL";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->GetSingle();
        return $result;
    }

    public function closeCobroTarjeta($estatus, $resultado_payw, $texto, $fecha_req_cte, $codigo_aut, $referencia, $fecha_rsp_cte, $numero_tarjeta, $cobroId = null)
    {
        $sql = "UPDATE cobros_tarjeta SET cobro_id = " . $cobroId . ", estatus = '" . $estatus . "', numero_tarjeta = '" . $numero_tarjeta . "', fecha_exp = NULL, codigo_seguridad = NULL, resultado_payw = '" . $resultado_payw . "', texto = '" . $texto . "', fecha_req_cte = '" . $fecha_req_cte . "', codigo_aut = '" . $codigo_aut . "', referencia = '" . $referencia . "', fecha_rsp_cte = '" . $fecha_rsp_cte . "' WHERE id = " . $this->cobroTarjetaId . " AND deleted_at IS NULL";
        // echo $sql; exit;
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->UpdateData();
        return $result;
    }
}
