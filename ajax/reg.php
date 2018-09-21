<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	use Dompdf\Adapter\CPDF;
	use Dompdf\Dompdf;
	use Dompdf\Exception;

	session_start();
	
	// echo "<pre>"; print_r($_GET);
	// exit;
	if($_SESSION["User"]["type"]=="student"){
		if($_SESSION["User"]["userId"]<>$_GET['id'])
			exit;
		
	}
	
	// $verResultado = true;
	$student->setUserId($_GET['id']);
	$info = $student->GetInfo();
	
	$firma = $student->extraeFirma($_GET["id"],1,'course',$_GET['courseId']);
	
	$fj = explode(' ',$firma["fecha"]);
	
	$infoCertificacion = $student->infoCertificacion($_GET["courseId"]);
	
	// echo "<pre>"; print_r($info );
	// exit;
	
	if($info["rutaFoto"]=="")
		$foto = "<img src='".DOC_ROOT."/alumnos/no_foto.JPG' style='width:90%; '>";
	else
		$foto = "<img src='".DOC_ROOT."/alumnos/".$info["rutaFoto"]."' style ='width:90;'  >";
	
	// $test->setActivityId($_GET["cId"]);
	// $myTest = $test->Enumerate($verResultado,$_GET['id']);
	
	// $resEstadoisticas = $test->estadisticas($_GET["cId"],$_GET['id']);
	
	// $firma = $student->extraeFirma($_GET['id'],2);
	// echo "<pre>"; print_r($firma );
	// exit;
	
	$html .= "
	<html>
	<head>
	<title>FICHA DE REGISTRO DE CANDIDATO</title>
	<style type='text/css'>
	.txtTicket{
			text-align:justify;
			font-size:10px;
			 font-family: sans-serif;
			text-transform: uppercase;
			/*font:bold 12px 'Trebuchet MS';*/ 
			
		}table {
			border: 0px solid black;
			border-collapse: collapse;
	}
	
	
    @page { margin: 180px 30px; }
    #header { position: fixed; left: 0px; top: -180px; right: 0px; height: 40px;  text-align: center; }
    #footer { position: fixed; left: 0px; bottom: -210px; right: 0px; height: 150px; text-align:center; font-size:9}
    #footer .page:after { content: counter(page, upper-decimal); }
  
	</style>
	</head>
	<body>

	<div id='header'>
		<table style='width:100%; border: 0px solid !important'  >
	<tr>
		<td style='text-align:left; '>
			<img src='".DOC_ROOT."/images/logo_correo.jpg' style ='width:150;'>
		</td>
		<td style='text-align:right; '>
			<img src='".DOC_ROOT."/images/logoconocer.png'  style ='width:120;'>
		</td>
	</tr>
	<tr>
		<td colspan=2><center>Ficha de registro del Candidato </center></td>
	</tr>
	</table >
	  </div>
	    <div id='footer'>
		<p class='page'>
		Instituto de Administración Pública del Estado de Chiapas, A.C.<br>
		Libramiento Norte Poniente No. 2718, Fracc Ladera de la Loma, C.P. 29026<br>
		Tuxtla Gutiérrez, Chiapas; Teléfonos: (961) 12 515 08, 12 515 09, 12 51510, ext 107<br>
		www.iapchiapas.org.mx, redconocer@iapchiapas.org.mx <br></p>
	  </div>	
<br>
	  <div id='content' style='top:-70px ; height:300px; position: relative !important'>
	  
			<table class='txtTicket table' style='width:100%' border=1>
				<tr>
					<td>Estandar de Competencia:</td>
					<td>".$infoCertificacion["certificacion"]."</td>
					<td  style='background:#c4e9b9'>Fecha:</td>
					<td>".$fj[0]."</td>
				</tr>
			</table>
			
			<table class='txtTicket' border=1>
				<tr>
					<td colspan='2'>Datos Personales:</td>
				</tr>
				<tr>
					<td colspan='2'>
						El Consejo Nacional de Normalización y Certificación de Competencias Laborales (CONOCER) solicita al candidato la autorización para la publicación de los datos personales a fin de dar cumplimiento a
						lo dispuesto en el capitulo séptimo de las Reglas Generales y criterios para la integración del Sistema Nacional de Competencias, referente al 'Registro Nacional de Personas Con Competencias
						Certificadas' (RENAP)1 por medio del cual las personas con competencias certificadas, pueden voluntariamente dar a conocer sus datos personales, para facilitar su localización, en caso de que
						organizaciones sindicales, empresas, sector académico, sector social o público, o alguna otra institución pública o privada, requieran personal con competencias certificadas en determinada función
						individual; 
					</td>
				</tr>
				<tr>
					<td style='width:30%'>
						
						<center><strong>".$info["autorizo"]."</strong></center>
						 doy mi consentimiento al CONOCER para
						que, en términos del artículo 212 de la Ley
						Federal de Transparencia y Acceso a la
						Información Pública Gubernamental, difunda,
						distribuya y publique la información contenida
						en el documento que se inscribe, para los
						propósitos del RENAP. Lo anterior, sin
						perjuicio de que estoy enterado de que en
						términos del artículo 22, fracción III3 de la
						misma Ley, no es necesario mi consentimiento
						respecto de información que se transmita entre
						sujetos obligados o entre dependencias y
						entidades, cuando los datos respectivos se
						utilicen para el ejercicio de facultades propias
						de los mismos.
						<br>
						<br>
						<br>
						<center><b>".$info["names"]." ".$info["lastNamePaterno"]." ".$info["lastNameMaterno"]."<br>
						".$info["firma"]."</b></center>
					</td>
					<td>
								<table style='width:100%'>
									
									
									<tr>
										<td rowspan='4'>
											<center>".$foto."</center>
										</td>
										<td style='background:#c4e9b9' colspan='2'>Nombre Completo:</td><td colspan='3'>".$info["names"]." ".$info["lastNamePaterno"]." ".$info["lastNameMaterno"]."</td>
									</tr>
									<tr>
										<td style='background:#c4e9b9' colspan='2'>Lugar de Nacimiento:</td><td colspan='3'>".$info["cityBorn"].", ".$info["nombreEstado"]."</td>
									</tr>
									<tr>
										<td style='background:#c4e9b9' colspan='2'>Nacionalidad:</td><td colspan='3'>".$info["nacionality"]."</td>
									</tr>
									<tr>
										<td style='background:#c4e9b9' colspan='2'>CURP:</td><td colspan='3'>".$info["curp"]."</td>
									</tr>		
									<tr>		
										<td style='background:#c4e9b9' colspan='2'>Género:</td><td>".$info["sexo"]."</td><td>Fecha De Nacimiento</td><td>".$info["birthdate"]."</td>
									</tr>	
									<tr>	
										<td colspan='6' style='background:#c4e9b9'>Domicilio Particular</td>
									</tr>	
									<tr>	
										<td>".$info["street"]."</td>
										<td>".$info["number"]."</td>
										<td>".$info["postalCode"]."</td>
										<td colspan='4'>".$info["colony"]."</td>
									</tr>
									<tr>	
										<td style='background:#c4e9b9'>Calle</td>
										<td style='background:#c4e9b9'>Numero</td>
										<td style='background:#c4e9b9'>CP</td>
										<td style='background:#c4e9b9' colspan='4'>Colonia</td>
									</tr>
									<tr>	
										<td >".$info["ciudad2"]."</td>
										<td>".$info["nombreEstado"]."</td>
										<td colspan='2'>".$info["email"]."</td>
										<td >".$info["mobile"]."</td>
										<td >".$info["phone"]."</td>
									</tr>
									<tr>	
										<td style='background:#c4e9b9' >Ciudad</td>
										<td style='background:#c4e9b9' >Entidad</td>
										<td style='background:#c4e9b9' colspan='2'>Email</td>
										<td style='background:#c4e9b9' >Telefono</td>
										<td style='background:#c4e9b9'  >Tel. Celular</td>
									</tr>

								</table>		
					</td>
				</tr>
				<tr>
					<td colspan='2'>
					Los datos personales recabados serán protegidos y serán incorporados y tratados en el Sistema de datos personales RENAP con fundamento en las reglas generales y criterios para integración y operación
					del Sistema Nacional de Competencias y cuya finalidad es integrar una base de datos con información sobre las personas que han obtenido uno o más Certificados de Competencia, con base en Estándares
					de Competencia inscritos en el Registro Nacional de Estándares de Competencia, el cual fue registrado en el Listado de sistemas de Datos Personales ante el Instituto Federal de Acceso a la información
					Pública (www.ifai.org.mx) y podrán ser trasmitidos a sujetos obligados o dependencias y entidades con la finalidad del uso en facultades propias de las mismas. Además de otras trasmisiones previstas en
					Ley. La Unidad Administrativa responsable del Sistema es el Consejo Nacional de Normalización y Certificación de Competencias Laborales y la dirección donde el usuario podrá ejercer los derechos de
					acceso y corrección ante la misma es Av. Barranca del Muerto 275 Col. San José Insurgentes CP. 03900, México D.F. Lo anterior se informa en cumplimiento del Decimoséptimo de los lineamientos de
					protección de Datos Personales, publicados en el Diario Oficial de la Federación el 30 de septiembre de 2005. El CONOCER deberá informar al Instituto, dentro de los primeros diez días hábiles de enero y
					julio de cada año, lo siguiente: a) Los sistemas de datos personales, b) Cualquier modificación o cancelación de dichos sistemas+-c) Cualquier transmisión de sistemas de datos personales de conformidad
					a los dispuesto por los Lineamientos Vigésimo quinto y Vigésimo sexto de los Lineamientos de protección de Datos Personales. 
					</td>
				</tr>
			</table>
			<div style='page-break-after:always;'></div>
			<br>
			<table class='txtTicket' border=1 width='100%'>
				<tr>
					<td style='background:#c4e9b9'>¿Sabes Leer y Escribir? </td>
					<td colspan='2'>".$info["lee"]."</td>
					<td style='background:#c4e9b9' colspan='3'>¿Cuenta con estudios? </td>
					<td>".$info["estudios"]."</td>
					<td style='background:#c4e9b9' style='background:#c4e9b9' colspan='4'>Cuales:</td>
					<td colspan='2'>".$info["d_estudios"]."</td>
				</tr>
				<tr>
					<td style='background:#c4e9b9'>¿Tiene algun tipo de discapacidad?</td>
					<td colspan='2'>".$info["discapacidad"]."</td>
					<td colspan='3'></td>
					<td></td>
					<td colspan='4'></td>
					<td colspan='2'></td>
				</tr>
				<tr>
					<td style='background:#c4e9b9' >Cual:</td>
					<td style='background:#c4e9b9' >Motriz</td>
					<td>"; if($info['motriz'])$html.="si";else$html.="no";$html.="</td>
					<td style='background:#c4e9b9' >Visual</td>
					<td>"; if($info['visual'])$html .="si";else$html.="no"; $html .="</td>
					<td style='background:#c4e9b9' >Auditiva</td>
					<td>"; if($info['auditiva'])$html .="si";else$html.="no"; $html .="</td>
					<td style='background:#c4e9b9' >Lenguaje</td>
					<td>"; if($info['lenguaje'])$html .="si"; else$html.="no";$html .="</td>
					<td style='background:#c4e9b9' >Intelectual</td>
					<td>"; if($info['intelectual'])$html .="si";else$html.="no"; $html .="</td>
					<td style='background:#c4e9b9' >Otras</td>
					<td>"; if($info['otras'])$html .="si";else$html.="no"; $html .="</td>
				</tr>
				<tr>
					<td style='background:#c4e9b9'>¿Que Idiomas o lenguas habla?</td>
					<td colspan='2'>".$info["idiomas"]."</td>
					<td colspan='3'></td>
					<td></td>
					<td colspan='4'></td>
					<td colspan='2'></td>
				</tr>
				<tr>
					<td style='background:#c4e9b9'>¿Trabaja actualmente? </td>
					<td colspan='2'>".$info["trabaja"]."</td>
					<td style='background:#c4e9b9' colspan='3'>Puesto de trabajo:</td>
					<td>".$info["workplacePosition"]."</td>
					<td colspan='4'></td>
					<td colspan='2'></td>
				</tr>
				<tr>
					<td style='background:#c4e9b9'>Experiencia laboral</td>
					<td colspan='2'>".$info["experienciaLaboral"]."</td>
					<td colspan='3'></td>
					<td></td>
					<td colspan='4'></td>
					<td colspan='2'></td>
				</tr>
				<tr>
					<td style='background:#c4e9b9'>observaciones</td>
					<td colspan='2'></td>
					<td colspan='3'></td>
					<td></td>
					<td colspan='4'></td>
					<td colspan='2'></td>
				</tr>
				<tr>
					<td style='background:#c4e9b9'>¿Cuenta con alguna Certificacion? </td>
					<td colspan='2'>".$info["certificacion"]."</td>
					<td style='background:#c4e9b9' colspan='3'>cuales:</td>
					<td>".$info["certificaciones"]."</td>
					<td colspan='4'></td>
					<td colspan='2'></td>
				</tr>
				<tr>
					<td colspan=13>
						DECLARO BAJO PROTESTA DE DECIR VERDAD QUE LOS DATOS ASENTADOS EN ESTE DOCUMENTO SON CORRECTOS Y VERDADEROS. 
					</td>
				</tr>
			</table>
	  </div>
	  
	
";
	
	
	$html .= '<div id="content">';


	
	$html .= "	
	
	</table> 
	</div>
	</body>
	</html>

	";
	// echo $html;
	// exit;
	# Instanciamos un objeto de la clase DOMPDF.
	$mipdf = new DOMPDF();
	 
	# Definimos el tamaño y orientación del papel que queremos.
	# O por defecto cogerá el que está en el fichero de configuración.
	// $mipdf ->set_paper("A4", "portrait");
	$mipdf ->set_paper("A4", "landscape");
	 
	# Cargamos el contenido HTML.
	$mipdf ->load_html($html);
	 
	# Renderizamos el documento PDF.
	$mipdf ->render();
	 
	# Enviamos el fichero PDF al navegador.
	$mipdf ->stream('acuse.pdf',array('Attachment' => 0));
			


?>
