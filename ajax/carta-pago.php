<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT.'/libraries.php');
use Dompdf\Adapter\CPDF;
use Dompdf\Dompdf;
use Dompdf\Exception;

session_start();
if($_SESSION['User']['perfil'] != 'Docente' && $_SESSION['User']['perfil'] != 'Administrador')
	exit;

	
$personal->setPersonalId($_GET['Id']);
$infoPerso = $personal->InfoBasica();
$info = $personal->Info();
//var_dump($infoPerso['infoBanco'][0]); exit;
	
if(date('m') <= 9){
	$m = explode('0',date('m'));
	$mes  = $m[1];
}
else
	$mes  = date('m');
	
$mes = $util->ConvertirMes($mes);
	
$html .="<html>
	        <head>
	            <title>Carta de Pago</title>
				<style>
					body {
						font-family: calibri, sans-serif;
						font-size: 9pt;
					}
					html {
						margin: 0.98in 1.18in;
					}
				</style>
	        </head>
	        <body>
				<p style='text-align: right;'>
					Tuxtla Gutiérrez, Chiapas.<br>
					" . date('d') . " de " . $mes . " 2021.
				</p>
				<br><br><br><br><br>
				<p>
					<b>LIC. GUILMAR EUCARIO SARMIENTO ZENTENO</b><br>
					<b>SECRETARIO ADMINISTRATIVO DEL  IAP CHIAPAS.</b><br>
					<b>PRESENTE.</b>
				</p>
				<br><br>
				<p>Derivado del Contrato de Prestación de Servicios Profesionales Independientes que tengo celebrado con ese Instituto, solicito de la manera más atenta, que los pagos sean efectuados por medio de transferencia o depósito bancario a la cuenta  cuyos datos describo a continuación:</p>
				<br>
				<p><b>Titular:</b> " . $info['name'] . " " . $info['lastname_paterno'] . " " . $info['lastname_materno'] . "</p>
				<p><b>No. De cuenta:</b> " . $infoPerso['infoBanco'][0]['numCuenta'] . "</p>
				<p><b>Banco:</b> " . $infoPerso['infoBanco'][0]['nombreBanco'] . "</p>
				<p><b>Cable Interbancaria:</b> " . $infoPerso['infoBanco'][0]['claveInterbancaria'] . "</p>
				<p><b>Correo electrónico:</b> " . $infoPerso['infoBanco'][0]['correo'] . "</p>
				<p><b>Número de celular:</b> " . $info['celular'] . "</p>
				<br>
				<p>Así mismo, le informo que la cuenta antes referida, es la que utilizó en todas mis operaciones fiscales.</p>
				<br>
				<p>Sin más por el momento y no habiendo otro asunto en lo particular que tratar, hago propicia la ocasión para enviarle un cordial saludo.</p>
				<br><br><br><br>
				<p style='text-align: center;'>
					<b>ATENTAMENTE:</b><br><br><br>
				" 	. $info['name'] . " " . $info['lastname_paterno'] . " " . $info['lastname_materno'] . "
				</p>
	        </body>
	    </html>";
		
// Instanciamos un objeto de la clase DOMPDF.
$mipdf = new DOMPDF();
$mipdf ->set_paper("A4", "portrait");
$mipdf ->load_html($html);
$mipdf ->render();
$mipdf ->stream('CartaDePago.pdf', array('Attachment' => 0));
?>