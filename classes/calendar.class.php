<?php

class Calendar extends Module
{		
    private $calendarDistributionId;
    private $courseId;
    private $calendarConceptId;
    private $period;
    private $amount;
    private $date;
    private $isVisible;
    private $hasDiscount;
    private $discount;
    private $userId;

    public function setCourseId($value)
    {
        $this->courseId = intval($value);
    }

    public function setCalendarConceptId($value)
    {
        $this->calendarConceptId = intval($value);
    }

    public function setCalendarDistributionId($value)
    {
        $this->calendarDistributionId = intval($value);
    }

    public function setPeriod($value)
    {
        $this->period = intval($value);
    }

    public function setAmount($value)
    {
        $this->amount = doubleval($value);
    }

    public function setDiscount($value)
    {
        $this->discount = intval($value);
    }

    public function setUserId($value)
    {
        $this->userId = intval($value);
    }

    public function setDate($value)
    {
        $this->Util()->ValidateString($value, 255, 1, 'Fecha Inicial');
        $value = $this->Util()->FormatDateMySql($value);
        $explode = explode("-", $value);
        if(strlen($explode[0]) == 2)
            $value = $this->Util()->FormatDateBack($value);
		$this->date = $value;
    }

    public function setIsVisible($value)
    {
        $this->isVisible = intval($value);
    }

    public function setHasDiscount($value)
    {
        $this->hasDiscount = intval($value);
    }

    function EnumerateConcepts()
    {
        $sql = "SELECT * FROM calendar_concepts ORDER BY concept";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->GetResult();
        return $result;
    }

    function Save()
    {
        $sql = "SELECT COUNT(calendarDistributionId) 
                    FROM calendar_distribution 
                    WHERE courseId = " . $this->courseId . " AND calendarConceptId = " . $this->calendarConceptId . " AND period = " . $this->period;
        $this->Util()->DB()->setQuery($sql);
        $countConcepts = $this->Util()->DB()->GetSingle();
        $consecutive = $countConcepts + 1;
        $sql = "INSERT INTO calendar_distribution(courseId, calendarConceptId, consecutive, period, amount, date, isVisible, hasDiscount) VALUES(" . $this->courseId . ", " . $this->calendarConceptId . ", " . $consecutive . ", " . $this->period . ", " . $this->amount . ", '" . $this->date . "', " . $this->isVisible . ", " . $this->hasDiscount . ")";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->InsertData();	
		$this->Util()->setError(90000, 'complete', "Has agregado un concepto");
		$this->Util()->PrintErrors();
    }

    function Distribution()
    {
        $sql = "SELECT MAX(period) FROM calendar_distribution WHERE courseId = " . $this->courseId;
        $this->Util()->DB()->setQuery($sql);
        $max_period = $this->Util()->DB()->GetSingle();
        $distribution = null;
        for($i = 1; $i <= $max_period; $i++)
        {
            $sql = "SELECT 
                        cd.*,
                        cc.concept
                    FROM calendar_distribution cd 
                        INNER JOIN calendar_concepts cc
                            ON cd.calendarConceptId = cc.calendarConceptId
                    WHERE cd.courseId = " . $this->courseId . " AND cd.period = " . $i . " ORDER BY cd.date";
            $this->Util()->DB()->setQuery($sql);
            $distribution[$i] =  $this->Util()->DB()->GetResult();
        }
        return $distribution;
    }

    function Info($id = null)
    {
        $id = $this->calendarDistributionId;
        $sql = "SELECT cd.*, 
                        DATE_FORMAT(cd.date, '%d-%m-%Y') AS date_dmy,
                        cc.concept,
                        c.tipo AS tipoCuatri,
                        s.totalPeriods
                FROM calendar_distribution cd 
                    INNER JOIN calendar_concepts cc
                        ON cd.calendarConceptId = cc.calendarConceptId
                    INNER JOIN course c 
                        ON cd.courseId = c.courseId
                    INNER JOIN subject s 
                        ON c.subjectId = s.subjectId
                WHERE cd.calendarDistributionId = " . $id;
        $this->Util()->DB()->setQuery($sql);
		$result = $this->Util()->DB()->GetRoW();
		return $result;
    }

    public function Update($id = null)
    {
        if($this->Util()->PrintErrors())
            return false;
            
        $sql = "UPDATE 
                    calendar_distribution
                SET calendarConceptId = " . $this->calendarConceptId . ", 
                    period = " . $this->period . ",
                    amount = " . $this->amount . ",
                    date = '" . $this->date . "',
                    isVisible = " . $this->isVisible . ",
                    hasDiscount = " . $this->hasDiscount . "
                    WHERE calendarDistributionId = " . $this->calendarDistributionId;
			$this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->UpdateData();
			if($result)
			{
				$result = true;
				$this->Util()->setError(90002,'complete', 'El concepto se ha actualizado correctamente');
			}
			else
			{
				$result = false;
				$this->Util()->setError(90011,'error', "No se pudo modificar el concepto");
			}
			$this->Util()->PrintErrors();
			return $result;
    }
    
    public function Delete($id = null)
    {
        if($this->Util()->PrintErrors())
            return false;
        $sql = "DELETE FROM calendar_distribution WHERE calendarDistributionId = " . $this->calendarDistributionId;
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->DeleteData();
        if($result > 0)
        {
            $result = true;
            $this->Util()->setError(90001,'complete', "Se ha eliminado el curso correctamente");
        }
        else
        {
            $result = false;
            $this->Util()->setError(90012,'error');
        }
        $this->Util()->PrintErrors();
        return $result;
    }

    public function saveDiscount()
    {
        $sql = "SELECT COUNT(userId) FROM calendar_discounts WHERE userId = " . $this->userId . " AND  courseId = " . $this->courseId;
        $this->Util()->DB()->setQuery($sql);
        $countDiscounts = $this->Util()->DB()->GetSingle();
        if($countDiscounts == 0)
        {
            $sql = "INSERT INTO calendar_discounts(courseId, userId, discount) VALUES(" . $this->courseId . ", " . $this->userId . ", " . $this->discount . ")";
            $this->Util()->DB()->setQuery($sql);
            $result = $this->Util()->DB()->InsertData();
        }
        else
        {
            $sql = "UPDATE calendar_discounts SET discount = " . $this->discount . " WHERE courseId = " . $this->courseId . " AND userId = " . $this->userId;
            $this->Util()->DB()->setQuery($sql);
			$result = $this->Util()->DB()->UpdateData();
        }
        return $result;
    }
}