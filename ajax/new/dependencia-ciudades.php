<?php
include_once('../../init.php');
include_once('../../config.php');
include(DOC_ROOT."/classes/class.mysql.php");
include(DOC_ROOT."/classes/class.combos.php");
$ciudades = new selects();
$ciudades->code = $_POST["estadoId"];
$tam=$_POST["tam"];
$ciudades = $ciudades->cargarCiudades();
if($tam==1)
    echo"<select id='ciudad' name='ciudad' class=\"form-control\"><option value='0'>Elige tu Ciudad</option>";
else
    echo"<select id='ciudad' name='ciudad' class=\"form-control\"><option value='0'>Elige tu Ciudad</option>";
foreach($ciudades as $key=>$value)
{
    echo "<option value=\"$key\">".acento($value)."</option>";
}
echo "</select>";



function acento($string){
//$string = utf8_decode($string);
    $string = str_replace("Ñ", "N;", $string);
    $string = str_replace("ò", "&oacute;", $string);
    $string = str_replace("ù", "&uacute;", $string);
    $string = str_replace("ì", "&iacute;", $string);
    $string = str_replace("ü", "&uuml;", $string);
    $string = str_replace("’", "'", $string);
    $string = str_replace("ñ", "n", $string);
    $string = str_replace("á", "&aacute;", $string);
    $string = str_replace("à", "&aacute;", $string);
    $string = str_replace("é", "&eacute;", $string);
    $string = str_replace("í", "&iacute;", $string);
    $string = str_replace("ó", "&oacute;", $string);
    $string = str_replace("ú", "&uacute;", $string);
    $string = str_replace("á", "&aacute;", $string);
    $string = str_replace("è", "&eacute;", $string);
    $string = str_replace("é", "&eacute;", $string);
    $string = str_replace("í", "&iacute;", $string);
    $string = str_replace("ó", "&oacute;", $string);
    $string = str_replace("ú", "&uacute;", $string);
    $string = str_replace("Á", "A", $string);
    $string = str_replace("É", "E", $string);
    $string = str_replace("Í", "I", $string);
    $string = str_replace("Ó", "O", $string);
    $string = str_replace("Ú", "U", $string);
    return $string;
}

?>