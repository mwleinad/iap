<?php
include_once('../init.php');
include_once('../config.php');
include(DOC_ROOT."/classes/class.mysql.php");
include(DOC_ROOT."/classes/class.combos.php");

session_start();

$ciudades = new selects();
$ciudades->code = $_POST["estadoId"];
$tam=$_POST["tam"];
$ciudades = $ciudades->cargarCiudades();
if($tam==1)
echo"<select id='ciudadt' name='ciudadt' class='form-control'><option value='0'>Elige tu Ciudad</option>";
else
echo"<select id='ciudadt' name='ciudadt' class='form-control'><option value='0'>Elige tu Ciudad</option>";
foreach($ciudades as $key=>$value)
{
		echo "<option value=\"$key\">".acento($value)."</option>";
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