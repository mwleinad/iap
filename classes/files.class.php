<?php

class Files extends Main
{
	function CedulaInscripcion($alumn, $course, $data, $major, $curricula)
	{
		$sql = "SELECT 
				*
			FROM
				course
			WHERE
				courseId='" . $course."'";
		
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
		$pdf->SetAuthor('Nicola Asuni');
		$pdf->SetTitle('TCPDF Example 001');
		$pdf->SetSubject('TCPDF Tutorial');
		$pdf->SetKeywords('TCPDF, PDF, example, test, guide');
		
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
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
		
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
		$pdf->SetFont('dejavusans', '', 11, '', true);
		
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
		$html = '
		<table><tr><td align="center"><b>INSTITUTO DE ADMINISTRACION PUBLICA</b></td></tr></table>
		<table><tr><td align="center"><b>DEL ESTADO DE CHIAPAS A.C</b></td></tr></table>
		<table><tr><td align="center">DIRECCION ACADEMICA</td></tr></table>
		<table><tr><td align="center"><br><br></td></tr></table>
		<table><tr><td align="center">'.$major.'</td></tr></table>
		<table><tr><td align="center"><br><b>"'.$curricula.'"</b></td></tr></table>
		<table><tr><td align="center"><b>MODALIDAD:</b>'.$info["modality"].'</td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>
		<table><tr><td align="center">CEDULA DE INSCRIPCION<br></td></tr></table>
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>A) DATOS PERSONALES</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>

		<table><tr><td align="left" width="250"><b>Nombre:</b></td><td style="text-decoration:underline">'.$data->getLastNamePaterno().' '.$data->getLastNameMaterno().' '.$data->getNames().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Sexo:</b></td><td style="text-decoration:underline">'.$data->getSexo().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Fecha de Nacimiento:</b> </td><td style="text-decoration:underline">'.$infoU["birthdate"].'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Estado Civil:</b> </td><td style="text-decoration:underline">'.$data->getMaritalStatus().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Domicilio:</b> </td><td style="text-decoration:underline">'.$data->getStreet().' '.$data->getNumer().' '.$data->getColony().' '.$data->getCity().' '.$data->getState().' '.$data->getCountry().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Tel&eacute;fono:</b> </td><td style="text-decoration:underline">'.$data->getPhone().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Telefono de Emergencia:</b> </td><td style="text-decoration:underline">'.$data->getFax().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Celular:</b> </td><td style="text-decoration:underline">'.$data->getMobile().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Correo Electr&oacute;nico:</b> </td><td style="text-decoration:underline">'.$data->getEmail().'</td></tr></table>

		<table><tr><td align="center"><br><br></td></tr></table>
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>B) DATOS LABORALES</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>

		<table><tr><td align="left" width="250"><b>Ocupacion:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceOcupation().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Lugar de Trabajo:</b> </td><td style="text-decoration:underline">'.$data->getWorkplace().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Domicilio:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceAddress().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Area:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceArea().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Puesto:</b> </td><td style="text-decoration:underline">'.$data->getWorkplacePosition().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Municipio:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceCity().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Tel&eacute;fono de Oficina:</b> </td><td style="text-decoration:underline">'.$data->getWorkplacePhone().'</td></tr></table>
		<table><tr><td align="left"><b>Correo Electronico:</b></td><td style="text-decoration:underline">'.$data->getWorkplaceEmail().'</td></tr></table>

		<table><tr><td align="center"><br><br></td></tr></table>
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>C) ESTUDIOS</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>

		<table><tr><td align="left" width="250"><b>Grado Acad&eacute;mico:</b> </td><td style="text-decoration:underline">'.$data->getAcademicDegree().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Profesion:</b> </td><td style="text-decoration:underline">'.$prof["profesionName"].'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Escuela o Instituci&oacute;n:</b> </td><td style="text-decoration:underline">'.$data->getSchool().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Maestria en:</b> </td><td style="text-decoration:underline">'.$data->getMasters().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Escuela o Institucion:</b> </td><td style="text-decoration:underline">'.$data->getMastersSchool().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Estudios de Bachillerato:</b> </td><td style="text-decoration:underline">'.$data->getHighSchool().'</td></tr></table>

		<table><tr><td align="center"><br></td></tr></table>
		<table><tr><td align="center">Firma del Alumno</td></tr></table>
		<table><tr><td align="center"><br><br></td></tr></table>
		<br>
		<br>
		
		<table><tr><td align="center">______________________________________</td></tr></table>


		';
		
		// Print text using writeHTMLCell()
		$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $html, $border=0, $ln=1, $fill=0, $reseth=true, $align='', $autopadding=true);
		
		// ---------------------------------------------------------
		
		// Close and output PDF document
		// This method has several options, check the source code documentation for more information.
		$pdf->Output(DOC_ROOT."/files/solicitudes/".$alumn."_".$course.".pdf", 'F');
		
		return $alumn."_".$course.".pdf";
	}

	function CedulaPrueba($alumn, $course, $data, $major, $curricula)
	{
		$sql = "SELECT 
				*
			FROM
				course
			WHERE
				courseId='" . $course."'";
		
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
		$pdf->SetAuthor('Nicola Asuni');
		$pdf->SetTitle('TCPDF Example 001');
		$pdf->SetSubject('TCPDF Tutorial');
		$pdf->SetKeywords('TCPDF, PDF, example, test, guide');
		
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
		$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);
		
		//set image scale factor
		$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);
		
		//set some language-dependent strings
		// $pdf->setLanguageArray($l);
		
		// ---------------------------------------------------------
		
		// set default font subsetting mode
		$pdf->setFontSubsetting(true);
		
		// Set font
		// dejavusans is a UTF-8 Unicode font, if you only need to
		// print standard ASCII chars, you can use core fonts like
		// helvetica or times to reduce file size.
		$pdf->SetFont('dejavusans', '', 11, '', true);
		
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
		$html = '
		<table><tr><td align="center"><b>INSTITUTO DE ADMINISTRACION PUBLICA</b></td></tr></table>
		<table><tr><td align="center"><b>DEL ESTADO DE CHIAPAS A.C</b></td></tr></table>
		<table><tr><td align="center">DIRECCION ACADEMICA</td></tr></table>
		<table><tr><td align="center"><br><br></td></tr></table>
		<table><tr><td align="center">'.$major.'</td></tr></table>
		<table><tr><td align="center"><br><b>"'.$curricula.'"</b></td></tr></table>
		<table><tr><td align="center"><b>MODALIDAD:</b>'.$info["modality"].'</td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>
		<table><tr><td align="center">CEDULA DE INSCRIPCION<br></td></tr></table>
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>A) DATOS PERSONALES</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>

		<table><tr><td align="left" width="250"><b>Nombre:</b></td><td style="text-decoration:underline">'.$data->getLastNamePaterno().' '.$data->getLastNameMaterno().' '.$data->getNames().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Sexo:</b></td><td style="text-decoration:underline">'.$data->getSexo().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Fecha de Nacimiento:</b> </td><td style="text-decoration:underline">'.$infoU["birthdate"].'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Estado Civil:</b> </td><td style="text-decoration:underline">'.$data->getMaritalStatus().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Domicilio:</b> </td><td style="text-decoration:underline">'.$data->getStreet().' '.$data->getNumer().' '.$data->getColony().' '.$data->getCity().' '.$data->getState().' '.$data->getCountry().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Tel&eacute;fono:</b> </td><td style="text-decoration:underline">'.$data->getPhone().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Telefono de Emergencia:</b> </td><td style="text-decoration:underline">'.$data->getFax().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Celular:</b> </td><td style="text-decoration:underline">'.$data->getMobile().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Correo Electr&oacute;nico:</b> </td><td style="text-decoration:underline">'.$data->getEmail().'</td></tr></table>

		<table><tr><td align="center"><br><br></td></tr></table>
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>B) DATOS LABORALES</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>

		<table><tr><td align="left" width="250"><b>Ocupacion:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceOcupation().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Lugar de Trabajo:</b> </td><td style="text-decoration:underline">'.$data->getWorkplace().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Domicilio:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceAddress().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Area:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceArea().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Puesto:</b> </td><td style="text-decoration:underline">'.$data->getWorkplacePosition().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Municipio:</b> </td><td style="text-decoration:underline">'.$data->getWorkplaceCity().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Tel&eacute;fono de Oficina:</b> </td><td style="text-decoration:underline">'.$data->getWorkplacePhone().'</td></tr></table>
		<table><tr><td align="left"><b>Correo Electronico:</b></td><td style="text-decoration:underline">'.$data->getWorkplaceEmail().'</td></tr></table>

		<table><tr><td align="center"><br><br></td></tr></table>
		<table><tr><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>C) ESTUDIOS</b></td></tr></table>
		<table><tr><td align="center"><br></td></tr></table>

		<table><tr><td align="left" width="250"><b>Grado Acad&eacute;mico:</b> </td><td style="text-decoration:underline">'.$data->getAcademicDegree().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Profesion:</b> </td><td style="text-decoration:underline">'.$prof["profesionName"].'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Escuela o Instituci&oacute;n:</b> </td><td style="text-decoration:underline">'.$data->getSchool().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Maestria en:</b> </td><td style="text-decoration:underline">'.$data->getMasters().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Escuela o Institucion:</b> </td><td style="text-decoration:underline">'.$data->getMastersSchool().'</td></tr></table>
		<table><tr><td align="left" width="250"><b>Estudios de Bachillerato:</b> </td><td style="text-decoration:underline">'.$data->getHighSchool().'</td></tr></table>

		<table><tr><td align="center"><br></td></tr></table>
		<table><tr><td align="center">Firma del Alumno</td></tr></table>
		<table><tr><td align="center"><br><br></td></tr></table>
		<br>
		<br>
		
		<table><tr><td align="center">______________________________________</td></tr></table>


		';
		
		// Print text using writeHTMLCell()
		$pdf->writeHTMLCell($w=0, $h=0, $x='', $y='', $html, $border=0, $ln=1, $fill=0, $reseth=true, $align='', $autopadding=true);
		
		// ---------------------------------------------------------
		
		// Close and output PDF document
		// This method has several options, check the source code documentation for more information.
		$pdf->Output( $alumn."_".$course.".pdf", 'I');
		
		return $alumn."_".$course.".pdf";
	}
}


?>