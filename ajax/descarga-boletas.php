<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
$user->allow_access(37);
// Información del Curso
$course->setCourseId($_GET['id']);
$courseInfo = $course->Info();
// Titulacion
$group->setCourseId($_GET['id']);
$theGroup = $group->DefaultGroup();

$tbody = '';
foreach($theGroup as $item)
{
    $child = "<tr>";
    $student->setUserId($item['userId']);
    $downloaded = $student->DownloadedQualifications($_GET['id'], $courseInfo['totalPeriods']); 
    foreach($downloaded as $key => $value)
    {
        $color = $value['downloaded'] == '' ? '#fe6f5e' : ($value['downloaded'] == 0 ? '#ffd60a' : '#c0ff89');
        $child .= "<td style='text-align: center; width: 25%; background-color: " . $color . "'>
                    " . $key . "<br>
                    " . $value['downloaded_at'] . "
                </td>";
    }
    $child .= "</tr>";
    $tbody .= "<tr>
                <td>" . mb_strtoupper($item['names']) . " " . mb_strtoupper($item['lastNamePaterno']) . " " . mb_strtoupper($item['lastNameMaterno']) . "</td>
                <td>
                    <table style='width: 100%'>
                        <tbody>" . $child . "</tbody>
                    </table>
                </td>
            </tr>";
}
/* $student->setUserId(3237);
$downloaded = $student->DownloadedQualifications($_GET['id'], $courseInfo['totalPeriods']);
echo "<pre>";
print_r($downloaded);
exit; 
*/
$html .="<html>
	        <head>
	            <title>Boleta de Calificaciones</title>
	            <style type='text/css'>
                    body {
                        font-family: sans-serif;
                    }
	                .txtTicket {
			            font-size: 9pt;
			            font-family: sans-serif;
			            /*font:bold 12px 'Trebuchet MS';*/ 
		            }
		            table,td {
		                border: 1px solid black;
		                border-collapse: collapse;
	                }
		            table,td {
		                border: 1px solid black;
		                border-collapse: collapse;
	                }
	                .line {
		                border-bottom: 1px solid; border-left: 0px; border-right: 0px;	
	                }
                    .text-center {
                        text-align: center;
                    }
                    .img-header {
                        width: 790px;
                        position: fixed;
                        top: -40px;
                        left: -50px;
                        right: 0px;
                    }
                    .img-footer {
                        width: 790px;
                        position: fixed;
                        bottom: 20px;
                        left: -50px;
                        right: 0px;
                    }
                    .text-danger {
                        color: red;
                    }
		        </style>
	        </head>
	        <body>
		        <img src='" . DOC_ROOT . "/images/new/docs/doc_header.png' class='img-header'>
                <br><br><br><br><br><br><br>
		        <center>
                    <p>
                        <b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS</b><br>
                        <b>Reporte de Descarga de Boletas</b>
                    </p>
                </center>
                <h5>
                    " . $courseInfo['majorName'] . "  " . $courseInfo['name'] . "<br>
                    <b>Grupo:</b> " . $courseInfo['group'] . "<br>
                    <b>Periodo:</b> " . $courseInfo['initialDate'] ." - " . $courseInfo['finalDate'] . "
                </h5>
		        <table align='center' width='100%' border='1' class='txtTicket'>
                    <thead>
                        <tr>
                            <th style='text-align: center'>Alumno</th>
                            <th style='text-align: center'>Semestre/Cuatrimestre</th>
                        </tr>
                    </thead>
                    <tbody>" . $tbody . "</tbody>
			    </table>
                <img src='" . DOC_ROOT . "/images/new/docs/doc_footer.png' class='img-footer'>
	        </body>
	    </html>";
	/* echo $html;
	exit; */
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	$mipdf ->set_paper("A4", "portrait");
	# Cargamos el contenido HTML.
	$mipdf ->load_html($html);
	# Renderizamos el documento PDF.
	$mipdf ->render();
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('BoletaCalificaciones.pdf', array('Attachment' => 0));
?>
