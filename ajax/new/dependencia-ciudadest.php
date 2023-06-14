<?php
include_once('../../init.php');
include_once('../../config.php');
include(DOC_ROOT . "/classes/class.mysql.php");
include(DOC_ROOT . "/classes/class.combos.php");
include_once(DOC_ROOT . '/libraries.php');
$ciudades = new selects();
$ciudades->code = $_POST["estadoId"];
$tam = $_POST["tam"];
$ciudades = $ciudades->cargarCiudades();
if ($_POST['type'] == "ciudadesFiscales") {
    $ciudades = $util->municipios($_POST['estadoId']);
    if (count($ciudades)) {
        echo '<select id="municipio" name="municipio" class="form-control">
        <option value="">-- Seleccione el municipio --</option>';
        foreach ($ciudades as $item) {
            echo '<option value=' . $item['cve_mun'] . '>' . $item['nom_mun'] . '</option>';
        }
        echo '</select>';
    } else {
        echo '<select id="municipio" name="municipio" class="form-control">
                <option value="">-- Seleccione el municipio --</option>
            </select>';
    }
}elseif ($_POST['type'] == "localidadesFiscales") { 
    $localidades = $util->localidades($_POST['estadoId'], $_POST['municipioId']);
    if (count($localidades)) {
        echo '<select id="localidad" name="localidad" class="form-control">
        <option value="">-- Seleccione la localidad --</option>';
        foreach ($localidades as $item) {
            echo '<option value=' . $item['cve_loc'] . '>' . $item['nom_loc'] . '</option>';
        }
        echo '</select>';
    } else {
        echo '<select id="localidad" name="localidad" class="form-control">
                <option value="">-- Seleccione la localidad --</option>
            </select>';
    }
}
else {
    if ($tam == 1)
        echo "<select id='ciudadt' name='ciudadt' class=\"form-control\"><option value='0'>Elige tu Ciudad</option>";
    else
        echo "<select id='ciudadt' name='ciudadt' class=\"form-control\"><option value='0'>Elige tu Ciudad</option>";
    foreach ($ciudades as $key => $value) {
        echo "<option value=\"$key\">" . acento($value) . "</option>";
    }
    echo "</select>";
}
function acento($string)
{
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
