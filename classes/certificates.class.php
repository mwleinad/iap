<?php

class Certificates extends Module
{		
    private $courseId;
    private $userId;
    private $date;
    private $folio;
    private $period;
    private $r_name;
    private $r_gender;
    private $sa_name;
    private $sa_gender;
    private $jdse_name;
    private $jdse_gender;
    private $des_name;
    private $des_gender;
    private $cajg_name;
    private $cajg_gender;
    private $c_name;
    private $jo_name;
    private $jo_gender;

    public function setCourseId($value)
    {
        $this->courseId = intval($value);
    }

    public function setUserId($value)
    {
        $this->userId = intval($value);
    }
}