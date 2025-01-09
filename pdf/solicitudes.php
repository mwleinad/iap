<?php
header('Content-type: application/pdf');
include_once('../init.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
require_once(DOC_ROOT . '/tcpdf/config/lang/eng.php');
require_once(DOC_ROOT . '/tcpdf/tcpdf.php');

session_start();

$alumno = $_GET['alumnoId'];
$curso = $_GET['cursoId'];
$tipo = $_GET['tipo'];

$sql = "SELECT *, (SELECT nombre FROM estado WHERE estadoId = user.estado) as estado, (SELECT nombre FROM municipio WHERE estadoId = user.estado AND municipioId = user.ciudadt) as municipio FROM user WHERE userId = '" . $alumno . "'";
$util->DB()->setQuery($sql);
$infoAlumno = $util->DB()->GetRow();

$sql = "SELECT subject.name as subjectName, major.name as majorName FROM subject INNER JOIN major ON major.majorId = subject.tipo WHERE subjectId = '" . $curso . "'";
$util->DB()->setQuery($sql);
$infoPrograma = $util->DB()->GetRow();
$curricula = $infoPrograma['majorName'] . " EN " . str_replace("EN ", "", $infoPrograma['subjectName']);

$grupo = "SIN ASIGNAR";
$infoAlumno['created_at'] = $infoAlumno['created_at'] == "" ? date("Y-m-d") : $infoAlumno['created_at'];
$dia = date("d", strtotime($infoAlumno['created_at']));
$mes = date("m", strtotime($infoAlumno['created_at']));
$anio = date("Y", strtotime($infoAlumno['created_at']));
$meses = ["ENE", "FEB", "MAR", "ABR", "MAY", "JUN", "JUL", "AGO", "SEP", "OCT", "NOV", "DIC"];

if ($tipo == "curso") { //Ya tiene un curso asignado o es de antes del 2025
    $sql = "SELECT * FROM user_subject INNER JOIN course ON course.courseId = user_subject.courseId INNER JOIN subject ON subject.subjectId = course.subjectId WHERE alumnoId = '" . $alumno . "' AND subject.subjectId = '" . $curso . "' AND user_subject.status = 'activo' ORDER BY user_subject.registrationId DESC LIMIT 1";
    $util->DB()->setQuery($sql);
    $infoCurso = $util->DB()->GetRow();
    $grupo = $infoCurso['group'];
    if (isset($grupo['created_at']) && $grupo['created_at'] != "") {
        $dia = date("d", strtotime($grupo['created_at']));
        $mes = date("m", strtotime($grupo['created_at']));
        $anio = date("Y", strtotime($grupo['created_at']));
    }
} else {
    $sql = "SELECT * FROM user_preregistro WHERE user_id = '" . $alumno . "' AND subject_id = '" . $curso . "'";
    $util->DB()->setQuery($sql);
    $preregistro = $util->DB()->GetRow();
    $dia = date("d", strtotime($preregistro['created_at']));
    $mes = date("m", strtotime($preregistro['created_at']));
    $anio = date("Y", strtotime($preregistro['created_at']));
}

$logo = DOC_ROOT . "/images/logos/logo-humanismo.webp";

$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('Instituto de Administración Pública');
$pdf->SetTitle('Cédula de Inscripción');
$pdf->SetSubject('TCPDF Tutorial');
$pdf->SetKeywords('inscripción, IAP, registro');

// set default header data
$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE . ' 001', PDF_HEADER_STRING);

// set header and footer fonts
$pdf->setHeaderFont(array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);
//echo PDF_MARGIN_TOP;
//set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, 10, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, 10);

//set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

//set some language-dependent strings
$pdf->setLanguageArray($l);
// ---------------------------------------------------------

// set default font subsetting mode
$pdf->setFontSubsetting(true);

// Set font
// dejavusans is a UTF-8 Unicode font, if you only need to
// print standard ASCII chars, you can use core fonts like
// helvetica or times to reduce file size.
$pdf->SetFont('dejavusans', '', 10, '', true);

// Add a page
// This method has several options, check the source code documentation for more information.
$pdf->SetPrintHeader(false);
$pdf->SetPrintFooter(false);
$pdf->AddPage();

// $profesion = new Profesion;
// $profesion->setProfesionId($data->getProfesion());
// $prof = $profesion->Info();
//print_r($prof);
// Set some content to print

$nacimiento = new DateTime($infoAlumno["birthdate"]);
$ahora = new DateTime(date("Y-m-d"));
$diferencia = $ahora->diff($nacimiento);

$profesion = new Profesion;
$profesion->setProfesionId($infoAlumno['profesion']);
$prof = $profesion->Info();

$fecha_nacimiento = empty($infoAlumno['birthdate']) ? "" : date('d-m-Y', strtotime($infoAlumno["birthdate"]));
$estadoCivil = $infoAlumno['maritalStatus'];
$html = '
    <table><tr><td><img src="' . $logo . '" width="150px"></td></tr></table>
    <table>
        <tr>
            <td align="center"><b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, A.C</b></td>
        </tr>
    </table>
    <table><tr><td align="center"><b>SECRETARÍA ACADÉMICA</b></td></tr></table>
    <table><tr><td align="center"><b>CÉDULA DE INSCRIPCIÓN</b></td></tr></table>
    <table><tr><td align="center"><br></td></tr></table>
    <table><tr><td align="rigth">TUXTLA GUTIÉRREZ, CHIAPAS, A <u> ' . $dia . ' </u> DE <u> ' . $meses[$mes - 1] . ' </u> DE <u> ' . $anio . ' </u></td></tr></table>
    
    <table style="padding:10px 0 0 0;">
        <tr>
            <td width="30%"><b>PROGRAMA ACADÉMICO:</b></td>
            <td align="center" width="70%" style="border-bottom:1px solid black;"><b> ' . $curricula . ' </b></td>
        </tr>
    </table>
    <table style="padding:10px 0 0 0;">
        <tr>
            <td><b>GRUPO: </b> ' . $grupo . ' </td>
        </tr>
    </table>

    <table><tr><td align="center"><br></td></tr></table> 
    <table><tr><td align="left"><b>DATOS PERSONALES</b></td></tr></table>
    <table><tr><td align="center"><br></td></tr></table> 
    <table>
        <tr> 
            <td align="center" style="border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['lastNamePaterno'], 'UTF-8') . '</td>
            <td align="center" style="border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['lastNameMaterno'], 'UTF-8') . '</td>
            <td align="center" style="border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['names'], 'UTF-8') . '</td>
        </tr> 
        <tr>
            <td align="center">Apellido Paterno</td>
            <td align="center">Apellido Materno</td>
            <td align="center">Nombre(s)</td>
        </tr>
    </table> 
    <table style="padding:10px 0 0 0;">
        <tr> 
            <td width="14%">Sexo:</td>
            <td width="18%">Masculino( ' . ($infoAlumno['sexo'] == "m" ? "X" : "") . ' )</td>
            <td width="18%">Femenino( ' . ($infoAlumno['sexo'] == "f" ? "X" : "") . ' )</td>
            <td width="30%">Fecha de Nacimiento: </td>
            <td width="20%" align="center" style="border-bottom:1px solid black;">' . $fecha_nacimiento . '</td>
        </tr>
    </table> 
    <table style="padding:10px 0 0 0;">
        <tr>
            <td width="100">Estado Civil:</td>
            <td style="border-bottom:1px solid black;" align="center">' . mb_strtoupper($estadoCivil) . '</td>
            <td width="70"> Edad:</td>
            <td width="200" style="border-bottom:1px solid black;" align="center"> ' . $diferencia->y . ' AÑOS</td>
        </tr>
    </table>
    <table style="padding:10px 0 0 0;">
        <tr>
            <td width="30%">Domicilio Particular:</td>
            <td style="border-bottom:1px solid black;" width="70%" align="center">' . mb_strtoupper($infoAlumno['street'], 'UTF-8') . ' ' . mb_strtoupper($infoAlumno['number']) . '</td>
        </tr> 
    </table>
    <table><tr><td align="center"></td></tr></table>
    <table>
        <tr>
            <td align="center" style="border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['colony'],'UTF-8') . '</td>
            <td align="center" style="border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['postalCode']) . '</td>
            <td align="center" style="border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['municipio'],'UTF-8') . '</td>
        </tr>
        <tr>
            <td align="center">Colonia</td>
            <td align="center">C.P.</td>
            <td align="center">Municipio</td>
        </tr>
    </table> 
    <table style="padding:10px 0 0 0;">
        <tr>
            <td align="left" width="15%">Tel&eacute;fono:</td>
            <td width="28%" style="text-align:center; border-bottom:1px solid black;">' . $infoAlumno['phone'] . '</td>
            <td align="center" width="33%">Telefono de Emergencia:</td>
            <td width="24%" style="text-align:center; border-bottom:1px solid black;">' . $infoAlumno['fax'] . '</td>
        </tr>
    </table>
    <table><tr><td align="center"></td></tr></table>
    <table>
        <tr>
            <td align="left" width="15%">Celular:</td>
            <td width="28%" style="text-align:center; border-bottom:1px solid black;">' . $infoAlumno['mobile'] . '</td>
        </tr>
    </table>
    <table><tr><td align="center"></td></tr></table>
    <table>
        <tr>
            <td align="left" width="25%">Correo Electr&oacute;nico: </td>
            <td width="75%" style="text-align:center; border-bottom:1px solid black;">' . $infoAlumno['email'] . '</td>
        </tr>
    </table> 

    <table><tr><td align="center"><br></td></tr></table> 
    <table><tr><td align="left"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.&nbsp;&nbsp; DATOS LABORALES</b></td></tr></table>
    <table><tr><td align="center"><br></td></tr></table>
    <table>
        <tr>
            <td align="left" width="20%">Lugar de Trabajo:</td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['workplace'],'UTF-8') . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Domicilio: </td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['workplaceAddress'], 'UTF-8') . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Área: </td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['workplaceArea'], 'UTF-8') . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Ocupacion: </td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['workplaceOcupation'], 'UTF-8') . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Puesto: </td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['workplacePosition'], 'UTF-8') . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Municipio: </td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . mb_strtoupper($infoAlumno['municipio'], 'UTF-8') . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Tel&eacute;fono de Oficina: </td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . $infoAlumno['workplacePhone'] . '</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="20%">Correo Electronico:</td>
            <td width="80%" style="text-align:center; border-bottom:1px solid black;">' . $infoAlumno['workplaceEmail'] . '</td>
        </tr>
    </table>
    
    <table><tr><td align="center"><br></td></tr></table> 
    <table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>B.&nbsp;&nbsp;ESTUDIOS</b></td></tr></table>
    <table><tr><td align="center"><br></td></tr></table>
    
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="25%">Licenciatura en: </td>
            <td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($prof['profesionName'], 'UTF-8').'</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="25%">Escuela o Instituci&oacute;n: </td>
            <td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($infoAlumno['school'], 'UTF-8').'</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="25%">Maestría en: </td>
            <td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($infoAlumno['masters'], 'UTF-8').'</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="25%">Escuela o Institucion: </td>
            <td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($infoAlumno['mastersSchool'], 'UTF-8').'</td>
        </tr>
    </table>
    <table style="padding:5px 0px 0px 0px;">
        <tr>
            <td align="left" width="25%">Estudios de Bachillerato: </td>
            <td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($infoAlumno['highSchool'], 'UTF-8').'</td>
        </tr>
    </table>

    <table><tr><td align="center"><br></td></tr></table>
    <table><tr><td align="center"></td></tr></table>
    <table><tr><td align="center">______________________________________</td></tr></table>
    <table><tr><td align="center">Firma del Alumno</td></tr></table>


    ';

// Print text using writeHTMLCell()
$pdf->writeHTMLCell($w = 0, $h = 0, $x = '', $y = '', $html, $border = 0, $ln = 1, $fill = 0, $reseth = true, $align = '', $autopadding = true);

// ---------------------------------------------------------

// Close and output PDF document
// This method has several options, check the source code documentation for more information.
$pdf->Output("ficha_registro.pdf", 'I');
