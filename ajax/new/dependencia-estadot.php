<?php
include_once('../../init.php');
include_once('../../config.php');
include(DOC_ROOT."/classes/class.mysql.php");
include(DOC_ROOT."/classes/class.combos.php");
include_once(DOC_ROOT.'/libraries.php');
$estados = new selects();
$estados->code = $_POST["paisId"];
$tam=$_POST["tam"];
//print_r($_POST["paisId"]);
//$estados = $estados->cargarEstados();
$student->setCountry($_POST['paisId']);
$estados=$student->EnumerateEstados();

//print_r($estados);

//print_r($estados);
if($tam==1)
    echo"<select id='estadot' name='estadot' onChange='ciudad_dependenciat();' class=\"form-control\"><option value='0'>Elige tu Estado</option>";
else
    echo"<select id='estadot' name='estadot' onChange='ciudad_dependenciat();' class=\"form-control\"><option value='0'>Elige tu Estado</option>";

//echo "<option value='0' >Selecciona tu Estado</option>";


foreach($estados as $fila)
{
    echo "<option value='".$fila['estadoId']."'>".acento($fila['nombre'])."</option>";
}
echo "</select>";

function acento($string){
//$string = utf8_decode($string);
    $string = str_replace("�", "N;", $string);
    $string = str_replace("�", "&oacute;", $string);
    $string = str_replace("�", "&uacute;", $string);
    $string = str_replace("�", "&iacute;", $string);
    $string = str_replace("�", "&uuml;", $string);
    $string = str_replace("�", "'", $string);
    $string = str_replace("�", "n", $string);
    $string = str_replace("�", "&aacute;", $string);
    $string = str_replace("�", "&aacute;", $string);
    $string = str_replace("�", "&eacute;", $string);
    $string = str_replace("�", "&iacute;", $string);
    $string = str_replace("�", "&oacute;", $string);
    $string = str_replace("�", "&uacute;", $string);
    $string = str_replace("�", "&aacute;", $string);
    $string = str_replace("�", "&eacute;", $string);
    $string = str_replace("�", "&eacute;", $string);
    $string = str_replace("�", "&iacute;", $string);
    $string = str_replace("�", "&oacute;", $string);
    $string = str_replace("�", "&uacute;", $string);
    $string = str_replace("�", "A", $string);
    $string = str_replace("�", "E", $string);
    $string = str_replace("�", "I", $string);
    $string = str_replace("�", "O", $string);
    $string = str_replace("�", "U", $string);
    return $string;
}
?>


