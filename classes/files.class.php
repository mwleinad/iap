<?php

class Files extends Main
{
	function CedulaInscripcion($alumn, $course, $data, $cursoInfo)
	{
		$sql = "SELECT * FROM course WHERE courseId='" . $course."'"; 
		$this->Util()->DB()->setQuery($sql);
		$info = $this->Util()->DB()->GetRow();
		
		$sql = "SELECT * FROM user WHERE userId = '".$alumn."'";
		$this->Util()->DB()->setQuery($sql);
		$infoU = $this->Util()->DB()->GetRow();
		//echo $data->getNames();
		require_once(DOC_ROOT.'/tcpdf/config/lang/spa.php');
		require_once(DOC_ROOT.'/tcpdf/tcpdf.php');
		// return;
		// create new PDF document
		$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
		
		// set document information
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('Instituto de Administración Pública');
		$pdf->SetTitle('Cédula de Inscripción');
		$pdf->SetSubject('TCPDF Tutorial');
		$pdf->SetKeywords('inscripción, IAP, registro');
		
		// set default header data
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, PDF_HEADER_TITLE.' 001', PDF_HEADER_STRING);
		
		// set header and footer fonts
		$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
		$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));
		
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
		
		$profesion = new Profesion;
		$profesion->setProfesionId($data->getProfesion());
		$prof = $profesion->Info();
		//print_r($prof);
		// Set some content to print
		$logo = DOC_ROOT."/images/logo_correo.jpg";
		$dia = date("d");
		$mes = date("m");
		$anio = date("Y");
		$meses = ["ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC"];

		$nacimiento = new DateTime($infoU["birthdate"]);
		$ahora = new DateTime(date("Y-m-d"));
		$diferencia = $ahora->diff($nacimiento);

		// $estado = $data->InfoEstado($data->getState());
		$municipio = $data->InfoMunicipio($data->getCity());
		
		$html = '
		<table><tr><td><img src="'.$logo.'" width="150px"></td></tr></table>
		<table>
			<tr>
				<td align="center"><b>INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS, A.C</b></td>
			</tr>
		</table>
		<table><tr><td align="center"><b>SECRETARÍA ACADÉMICA</b></td></tr></table>
		<table><tr><td align="center"><b>CÉDULA DE INSCRIPCIÓN</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>
		<table><tr><td align="rigth">TUXTLA GUTIÉRREZ, CHIAPAS, A <u> '.$dia.' </u> DE <u> '.$meses[$mes-1].' </u> DE <u> '.$anio.' </u></td></tr></table>
		
		<table style="padding:10px 0 0 0;">
			<tr>
				<td width="30%"><b>PROGRAMA ACADÉMICO:</b></td>
				<td align="center" width="70%" style="border-bottom:1px solid black;"><b>"'.mb_strtoupper($cursoInfo['majorName'], 'UTF-8')." EN ".mb_strtoupper($cursoInfo['name'], 'UTF-8').'"</b></td>
			</tr>
		</table>
		<table style="padding:10px 0 0 0;">
			<tr>
				<td><b>GRUPO: </b>'.$cursoInfo["group"].'</td>
			</tr>
		</table>

		<table><tr><td align="center"><br></td></tr></table> 
		<table><tr><td align="left"><b>DATOS PERSONALES</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table> 
		<table>
			<tr> 
				<td align="center" style="border-bottom:1px solid black;">'.mb_strtoupper($data->getLastNamePaterno(),'UTF-8').'</td>
				<td align="center" style="border-bottom:1px solid black;">'.mb_strtoupper($data->getLastNameMaterno(),'UTF-8').'</td>
				<td align="center" style="border-bottom:1px solid black;">'.mb_strtoupper($data->getNames(),'UTF-8').'</td>
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
				<td width="18%">Masculino( '.($data->getSexo() == "m" ? "X" : "").' )</td>
				<td width="18%">Femenino( '.($data->getSexo() == "f" ? "X" : "").' )</td>
				<td width="30%">Fecha de Nacimiento: </td>
				<td width="20%" align="center" style="border-bottom:1px solid black;">'.$infoU["birthdate"].'</td>
			</tr>
		</table> 
		<table style="padding:10px 0 0 0;">
			<tr>
				<td width="100">Estado Civil:</td>
				<td style="border-bottom:1px solid black;" align="center">'.mb_strtoupper($data->getMaritalStatus()).'</td>
				<td width="70"> Edad:</td>
				<td width="200" style="border-bottom:1px solid black;" align="center">'.$diferencia->format("%y").' AÑOS</td>
			</tr>
		</table>
		<table style="padding:10px 0 0 0;">
			<tr>
				<td width="30%">Domicilio Particular:</td>
				<td style="border-bottom:1px solid black;" width="70%" align="center">'.mb_strtoupper($data->getStreet().' '.$data->getNumer(),'UTF-8').'</td>
			</tr> 
		</table>
		<table><tr><td align="center"></td></tr></table>
		<table>
			<tr>
				<td align="center" style="border-bottom:1px solid black;">'.mb_strtoupper($data->getColony(),'UTF-8').'</td>
				<td align="center" style="border-bottom:1px solid black;">'.mb_strtoupper($data->getPostalCode()).'</td>
				<td align="center" style="border-bottom:1px solid black;">'.mb_strtoupper($municipio['nombre'],'UTF-8').'</td>
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
				<td width="28%" style="text-align:center; border-bottom:1px solid black;">'.$data->getPhone().'</td>
				<td align="center" width="33%">Telefono de Emergencia:</td>
				<td width="24%" style="text-align:center; border-bottom:1px solid black;">'.$data->getFax().'</td>
			</tr>
		</table>
		<table><tr><td align="center"></td></tr></table>
		<table>
			<tr>
				<td align="left" width="15%">Celular:</td>
				<td width="28%" style="text-align:center; border-bottom:1px solid black;">'.$data->getMobile().'</td>
			</tr>
		</table>
		<table><tr><td align="center"></td></tr></table>
		<table>
			<tr>
				<td align="left" width="25%">Correo Electr&oacute;nico: </td>
				<td width="75%" style="text-align:center; border-bottom:1px solid black;">'.$data->getEmail().'</td>
			</tr>
		</table> 

		<table><tr><td align="center"><br></td></tr></table> 
		<table><tr><td align="left"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A.&nbsp;&nbsp; DATOS LABORALES</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>
		<table>
			<tr>
				<td align="left" width="20%">Lugar de Trabajo:</td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getWorkplace(),'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Domicilio: </td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getWorkplaceAddress(),'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Área: </td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getWorkplaceArea(),'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Ocupacion: </td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getWorkplaceOcupation(),'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Puesto: </td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getWorkplacePosition(),'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Municipio: </td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getWorkplaceCity(),'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Tel&eacute;fono de Oficina: </td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.$data->getWorkplacePhone().'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="20%">Correo Electronico:</td>
				<td width="80%" style="text-align:center; border-bottom:1px solid black;">'.$data->getWorkplaceEmail().'</td>
			</tr>
		</table>
		
		<table><tr><td align="center"><br></td></tr></table> 
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>B.&nbsp;&nbsp;ESTUDIOS</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>
		
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="25%">Licenciatura en: </td>
				<td width="75%" style="text-align:center; border-bottom:1px solid black;">'.$prof["profesionName"].'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="25%">Escuela o Instituci&oacute;n: </td>
				<td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getSchool(), 'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="25%">Maestría en: </td>
				<td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getMasters(), 'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="25%">Escuela o Institucion: </td>
				<td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getMastersSchool(), 'UTF-8').'</td>
			</tr>
		</table>
		<table style="padding:5px 0px 0px 0px;">
			<tr>
				<td align="left" width="25%">Estudios de Bachillerato: </td>
				<td width="75%" style="text-align:center; border-bottom:1px solid black;">'.mb_strtoupper($data->getHighSchool(), 'UTF-8').'</td>
			</tr>
		</table>

		<table><tr><td align="center"><br></td></tr></table>
		<table><tr><td align="center"></td></tr></table>
		<table><tr><td align="center">______________________________________</td></tr></table>
		<table><tr><td align="center">Firma del Alumno</td></tr></table>


		';
		
		// Print text using writeHTMLCell()
		$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $html, $border=0, $ln=1, $fill=0, $reseth=true, $align='', $autopadding=true);
		
		// ---------------------------------------------------------
		
		// Close and output PDF document
		// This method has several options, check the source code documentation for more information.
		$pdf->Output(DOC_ROOT."/files/solicitudes/".$alumn."_".$course.".pdf", 'I'); 
	} 
}


?>