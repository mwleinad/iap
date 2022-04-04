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
$total_certificate = $group->CertificateIndicator(1);

// Deserción
$group->setCourseId($_GET['id']);
$total_desertion = $group->DesertionIndicator();

// Recursamiento
$group->setCourseId($_GET['id']);
$total_recursion = $group->RecursionIndicator();

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
                    <p><b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS</b></p>
                </center><br>
                <h5>" . $courseInfo['majorName'] . "  " . $courseInfo['name'] . "</h5>
                <h5><b>Grupo:</b> " . $courseInfo['group'] . "</h5>
                <h5><b>Periodo:</b> " . $courseInfo['initialDate'] ." - " . $courseInfo['finalDate'] . "</h5>
		        <table align='center' width='100%' border='1' class='txtTicket'>
                    <thead>
                        <tr>
                            <th colspan='2' style='text-align: center'><b>Indicador de Titulación</b></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style='text-align: center'>Alumnos Totales: " . $total_certificate['total'] . "</td>
                            <td style='text-align: center'>Alumnos Titulados: " . $total_certificate['certificates'] . "</td>
                        </tr>
                        <tr>
                            <td colspan='2' style='text-align: center;'>Porcentaje de Titulación: " . number_format(($total_certificate['certificates'] * 100) / $total_certificate['total'], 2) . "%</td>
                        </tr>
                    </tbody>
			    </table>

                <br><br><br>
		        <table align='center' width='100%' border='1' class='txtTicket'>
                    <thead>
                        <tr>
                            <th colspan='2' style='text-align: center'><b>Indicador de Deserción y Eficiencia Terminal</b></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style='text-align: center'>Alumnos Iniciales: " . $total_desertion['total'] . "</td>
                            <td style='text-align: center'>Alumnos Desertores: " . $total_desertion['desertion'] . "</td>
                        </tr>
                        <tr>
                            <td style='text-align: center' colspan='2'>Porcentaje de Deserción: " . number_format(($total_desertion['desertion'] * 100) / $total_desertion['total'], 2) . "%</td>
                        </tr>
                        <tr>
                            <td style='text-align: center' colspan='2'>Porcentaje de Eficiencia Terminal: " . number_format((100 - ($total_desertion['desertion'] * 100) / $total_desertion['total']), 2) . "%</td>
                        </tr>
                    </tbody>
			    </table>

                <br><br><br>
		        <table align='center' width='100%' border='1' class='txtTicket'>
                    <thead>
                        <tr>
                            <th colspan='2' style='text-align: center'><b>Indicador de Recursamiento</b></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td style='text-align: center'>Alumnos Activos: " . $total_recursion['total'] . "</td>
                            <td style='text-align: center'>Alumnos Recursadores: " . $total_recursion['recursion'] . "</td>
                        </tr>
                        <tr>
                            <td colspan='2' style='text-align: center;'>Porcentaje de Recursión: " . number_format(($total_recursion['recursion'] * 100) / $total_recursion['total'], 2) . "%</td>
                        </tr>
                    </tbody>
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
