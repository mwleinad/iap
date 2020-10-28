<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');

use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
if($_SESSION["User"]["type"] != "Docente" && $_SESSION["User"]["type"] != "Administrador" && $_SESSION['User']['type'] != "")
    exit;

$userId = intval($_GET['u']);
$student->setUserId($userId);
$accepted = $student->hasAcceptedRegulation();
$info = $student->GetInfo();

if($accepted)
{
    $infoAccepted = $student->getAcceptedRegulation();
    $array_fecha = explode('-', $infoAccepted['date']);
    $fecha = $util->GetMonthByKey(intval($array_fecha[1])) . ' ' . $array_fecha[2] . ', de ' . $array_fecha[0];
	$html .= "
            <html>
                <head>
                    <title>ACUSE DE RECIBO DEL REGLAMENTO GENERAL DE POSGRADO</title>
                    <style type='text/css'>
                        table.tb-border {
                            border-collapse: collapse;
                        }
                        table.tb-border, table.tb-border th, table.tb-border td {
                            border: 1px solid black;
                        }
                        table.cell-padding td {
                            padding: 8px 5px;
                        }
                        .bg-gray {
                            background-color: #b2b2b2;
                        }
                        @page {
                            margin-top: 10px;
                            margin-bottom: 55px;
                            margin-left: 10px;
                            margin-right: 10px;
                        }            
                        footer {
                            position: fixed; 
                            bottom: -35px; 
                            left: 0px; 
                            right: 0px;
                            height: 80px;
                        }
                        body {
                            font-size: 11pt;
                        }
                        table {
                            page-break-inside: avoid !important;
                        }
                    </style>
                </head>
                <body>";
	$html .= '      <table style="width:100%;">
                        <tr>
                            <td style="text-align:left;padding-left:25px;">
                                <img src="' . DOC_ROOT . '/images/logo_correo.jpg" width="200px" >
                            </td>
                            <td style="text-align:right;padding-left:200px;">
                                <img src="' . DOC_ROOT . '/images/header_acuse.png" width="350px" >
                            </td>
                        </tr>
                    </table>';
    $html .= '      <table style="width:100%;" class="cell-padding">
                        <tr>
                            <td style="text-align: center; padding: 0 75px;">
                                <p style="text-align: right;">
                                    <br /><br />
                                    Tuxtla Gutiérrez, Chiapas.<br />
                                    ' . $fecha . '
                                    <br /><br /><br /><br /><br /><br />
                                </p>
                                <h4><b>ACUSE DE RECIBIDO DEL REGLAMENTO GENERAL DE POSGRADO</b></h4>
                                <br /><br /><br />
                                <p style="text-align: justify;">
                                    Manifiesto por este medio, haber recibido de parte de la Dirección Académica del Instituto de Administración Pública del Estado de Chiapas, el documento titulado:
                                </p>
                                <br /><br /><br />
                                <h4><b>REGLAMENTO GENERAL DE POSGRADO</b></h4>
                                <br /><br /><br />
                                <p style="text-align: justify;">
                                    El cual tendrá observancia durante todo mi proceso como estudiante en los programas del Instituto, y cuyo contenido me permite conocer mis derechos y obligaciones académicas, y a la vez cumplir con mis deberes.
                                </p>
                                <br /><br /><br />
                                <p>
                                    ' . $info['names'] . ' ' . $info['lastNamePaterno'] . ' ' . $info['lastNamePaterno'] . '<br />
                                    Nombre Estudiante
                                </p>
                            </td>
                        </tr>
                    </table><br>';
    $html .= '  </body>
            </html>';

	$mipdf = new DOMPDF();
	$mipdf->setPaper("A4", "portrait");
	$mipdf->loadHtml($html);
	$mipdf->render();
	$mipdf->stream('AcuseRGP.pdf',array('Attachment' => 0));
}
else
    echo "<h3>El alumno no ha aceptado el reglamento</h3>";