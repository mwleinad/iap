<?php
class Constancias extends Module
{
    private $fecha_expedicion, $periodo, $rvoe, $folio, $alumno, $curso, $Util;

    function setFechaExpedicion($data): void
    {
        $this->fecha_expedicion = $data;
    }

    function setPeriodo($data): void
    {
        $this->periodo = $data;
    }

    function setRvoe($data): void
    {
        $this->rvoe = $data;
    }

    function setFolio($data): void
    {
        $this->folio = $data;
    }

    function setAlumno($data): void
    {
        $this->alumno = $data;
    }

    function setCurso($data): void
    {
        $this->curso = $data;
    }

     function Util()
    {
        if ($this->Util == null) {
            $this->Util = new Util();
        }
        return $this->Util;
    }

    function getConstancia($where = "1") {
        $sql = "SELECT * FROM constancias WHERE {$where}";
        $this->Util()->DB()->setQuery($sql);
        $response = $this->Util()->DB()->GetRow($sql);
        return $response;
    }

    function crearConstancia() {
        $sql = "INSERT INTO constancias(fecha_expedicion, periodo, rvoe, folio, alumno_id, course_id) VALUES('{$this->fecha_expedicion}','{$this->periodo}', '{$this->rvoe}', '{$this->folio}', '{$this->alumno}', '{$this->curso}')";

        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->InsertData();
    }

    function actualizarConstancia() {
        $sql = "UPDATE constancias SET fecha_expedicion = '{$this->fecha_expedicion}', periodo = '{$this->periodo}', rvoe = '{$this->rvoe}', folio = '{$this->folio}' WHERE alumno_id = '{$this->alumno}' AND course_id = '{$this->curso}'";

        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->UpdateData();
    }

    function getConstanciaConocer($where = "1") {
        $sql = "SELECT * FROM constancias_conocer WHERE {$where}";
        $this->Util()->DB()->setQuery($sql);
        $response = $this->Util()->DB()->GetRow($sql);
        return $response;
    }

    function crearConstanciaConocer() {
        $sql = "INSERT INTO constancias_conocer(folio, studentId, courseId, created_at, updated_at) VALUES('{$this->folio}', '{$this->alumno}', '{$this->curso}', NOW(), NOW())";
        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->InsertData();
    }

    function actualizarConstanciaConocer() {
        $sql = "UPDATE constancias_conocer SET folio = '{$this->folio}', updated_at = NOW() WHERE studentId = '{$this->alumno}' AND courseId = '{$this->curso}'";

        $this->Util()->DB()->setQuery($sql);
        $this->Util()->DB()->UpdateData();
    }
}
