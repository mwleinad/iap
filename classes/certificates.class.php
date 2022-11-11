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

    public function getSettings()
    {
        $sqlQuery = 'SELECT * FROM setting_certificate LIMIT 1';
        $this->Util()->DB()->setQuery($sqlQuery);
        $result = $this->Util()->DB()->GetRow();
        return $result;
    }

    public function updateSettings($rector, $secretary, $school_services, $director_education, $coordinator, $comparison, $head_office, $genre_rector, $genre_secretary, $genre_school, $genre_director, $genre_coordinator, $genre_head)
    {
        $sqlQuery = "UPDATE setting_certificate SET 
                            rector = '{$rector}', 
                            secretary = '{$secretary}', 
                            school_services = '{$school_services}', 
                            director_education = '{$director_education}', 
                            coordinator = '{$coordinator}', 
                            comparison = '{$comparison}', 
                            head_office = '{$head_office}', 
                            genre_rector = '{$genre_rector}',
                            genre_secretary = '{$genre_secretary}',
                            genre_school = '{$genre_school}',
                            genre_director = '{$genre_director}',
                            genre_coordinator = '{$genre_coordinator}', 
                            genre_head = '{$genre_head}'
                        WHERE id = 1;";
        $this->Util()->DB()->setQuery($sqlQuery);
        $result = $this->Util()->DB()->UpdateData();
        return $result;
    }

    public function getHistoryCertificateStudent($courseId, $studentId)
    {
        $sql = "SELECT * FROM certificate_history WHERE courseId = '{$courseId}' AND studentId = '{$studentId}'";
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->GetRow();
        return $result;
    }

    public function addHistoryCertificateStudent($courseId, $studentId, $rector, $secretary, $school_services, $director_education, $coordinator, $comparison, $head_office, $genre_rector, $genre_secretary, $genre_school, $genre_director, $genre_coordinator, $genre_head, $expedition_date, $school_cycle, $folio)
    {
        $sql = "INSERT INTO `certificate_history`(`courseId`, `studentId`, `rector`, `secretary`, `school_services`, `director_education`, `coordinator`, `comparison`, `head_office`, `genre_rector`, `genre_secretary`, `genre_school`, `genre_director`, `genre_coordinator`, `genre_head`, `expedition_date`, `school_cycle`,`folio`) VALUES ('$courseId', '$studentId', '$rector', '$secretary', '$school_services', '$director_education', '$coordinator', '$comparison', '$head_office', '$genre_rector', '$genre_secretary', '$genre_school', '$genre_director', '$genre_coordinator', '$genre_head', '$expedition_date', '$school_cycle','$folio')";
        // echo $sql;
        $this->Util()->DB()->setQuery($sql);
        $result = $this->Util()->DB()->InsertData();	
        //return $result;
    }
}
