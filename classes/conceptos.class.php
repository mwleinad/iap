<?php
class Conceptos extends Module
{
    private $nombre;
    private $costo;
    private $beca; //Aplica Beca
    private $clave;
    private $unidad;
    private $periodicidad;
    private $tolerancia;
    private $cobros;
    private $conceptoId; 
    private $fecha_cobro;
    private $fecha_limite;
    private $conceptoSubject;
    private $conceptoCurso; 
    private $alumno;
    private $periodo;
    private $periodoId;
    private $pagoId;


    public function setNombre($nombre)
    {
        $this->nombre = $nombre;
    }

    public function setCosto($costo)
    {
        $this->costo = $costo;
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

    public function setInicio($inicio)
    {
        $this->inicio = $inicio;
    }

    public function setFechaCobro($fecha_cobro)
    { 
        $this->fecha_cobro = $fecha_cobro;
    }

    public function setFechaLimite($fecha_limite)
    {
        $this->fecha_limite = $fecha_limite;
    }

    public function setConceptoCurso($conceptoCurso)
    {
        $this->conceptoCurso = $conceptoCurso;
    }

    public function setFechaId($fechaId = NULL)
    {
        $this->fechaId = $fechaId;
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

    public function getConcepto()
    {
        $sql = "SELECT * FROM conceptos WHERE concepto_id = {$this->conceptoId}";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->GetRow();
        return $result;
    }

    public function crear()
    {
        $this->Util()->DB()->setQuery("INSERT INTO `conceptos`(`nombre`, `descuento`, `clave_sat`, `unidad_sat`, `total`, `subtotal`, `iva`, `periodicidad`, `cobros`, `tolerancia`) VALUES ('{$this->nombre}','{$this->beca}','{$this->clave}','{$this->unidad}','{$this->costo}',0,0,'{$this->periodicidad}','{$this->cobros}','{$this->tolerancia}') ");
        $result = $this->Util()->DB()->InsertData();
        return $result;
    }

    public function actualizar()
    {
        $sql = "UPDATE conceptos SET nombre = '{$this->nombre}', descuento = '{$this->beca}', clave_sat = '{$this->clave}', unidad_sat ='{$this->unidad}', total ='{$this->costo}', subtotal = 0, iva = 0, periodicidad = '{$this->periodicidad}', cobros = '{$this->cobros}', tolerancia = '{$this->tolerancia}' WHERE concepto_id = '{$this->conceptoId}' ";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->UpdateData();
        return $result;
    }

    public function listar()
    {
        $this->Util()->DB()->setQuery("SELECT concepto_id, nombre, descuento, clave_sat, unidad_sat, total, subtotal, iva, periodicidad, cobros, tolerancia FROM conceptos");
        return $this->Util()->DB()->GetResult();
    }

    //Lista todos los conceptos y checa si la curricula ya está relacionada
    public function conceptos_subjects()
    {
        $this->Util()->DB()->setQuery("SELECT conceptos.concepto_id, conceptos.nombre, conceptos_subject.concepto_subject_id, conceptos_subject.cobros FROM conceptos LEFT JOIN conceptos_subject ON conceptos_subject.concepto_id = conceptos.concepto_id AND conceptos_subject.subject_id = {$this->getSubjectId()};");
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

    public function eliminar_periodos()
    {
        $sql = "DELETE FROM conceptos_subject_periodos WHERE concepto_subject_id = {$this->conceptoSubject}";
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
        $sql = "SELECT conceptos_course.*, conceptos.nombre as concepto_nombre FROM conceptos_course INNER JOIN conceptos ON conceptos.concepto_id = conceptos_course.concepto_id WHERE conceptos_course.course_id = {$this->getCourseId()} ORDER BY conceptos_course.fecha_cobro ASC";
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
        $sql = "UPDATE conceptos_course SET total = {$this->costo}, descuento = {$this->beca}, fecha_cobro = {$this->fecha_cobro}, fecha_limite = {$this->fecha_limite}, periodo = {$this->periodo} WHERE concepto_course_id = {$this->conceptoCurso}";
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    public function crear_relacion_curso_alumno()
    {
        $sql = "INSERT INTO pagos(alumno_id, concepto_course_id, total, iva, subtotal, status, beca, fecha_cobro, fecha_limite, descuento) VALUES({$this->alumno},{$this->conceptoCurso},{$this->costo}, 0, 0, 1, 0, {$this->fecha_cobro}, {$this->fecha_limite}, {$this->beca})"; 
        echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->InsertData();
    }

    public function historial_pagos()
    {
        $sql = "SELECT pagos.pago_id, pagos.concepto_course_id, pagos.alumno_id, pagos.fecha_pago, pagos.total, pagos.iva, pagos.subtotal, CASE WHEN pagos.status = 1 THEN 'Pendiente' WHEN pagos.status = 3 THEN 'Prórroga' ELSE 'Pagado' END as status, pagos.beca, pagos.archivo, pagos.tolerancia as prorroga, conceptos_course.subject_id, conceptos_course.course_id, conceptos_course.concepto_id, conceptos_course.fecha_cobro, conceptos_course.fecha_limite, conceptos_course.periodo, conceptos_course.descuento, conceptos.nombre as concepto_nombre FROM pagos INNER JOIN conceptos_course ON conceptos_course.concepto_course_id = pagos.concepto_course_id INNER JOIN conceptos ON conceptos.concepto_id = conceptos_course.concepto_id WHERE pagos.alumno_id = {$this->alumno} AND conceptos_course.course_id = {$this->getCourseId()} ORDER BY fecha_cobro;";
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

    public function actualizar_beca()
    {
        $sql = "UPDATE pagos INNER JOIN conceptos_course ON conceptos_course.concepto_course_id = pagos.concepto_course_id SET pagos.beca = {$this->beca} WHERE pagos.alumno_id = {$this->alumno} AND conceptos_course.course_id = {$this->getCourseId()} AND conceptos_course.periodo = {$this->periodo} AND conceptos_course.descuento = 1;";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $resultado = $this->Util()->DB()->UpdateData();
        return $resultado;
    }

    public function pago()
    {
         
    }
}
