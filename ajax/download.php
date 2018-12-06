<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	session_start();
	
	$zip = new ZipArchive();
	$lst = $student->GettDocumentos($_GET['userId']);
	$filename = "documentos_".$_GET['userId'].".zip";
	if($zip->open($filename,ZIPARCHIVE::CREATE)===true){
		
		foreach($lst as $key=>$aux){
			if(file_exists(DOC_ROOT."/alumnos/repositorio/".$aux["ruta"])){
				 $zip->addFile(DOC_ROOT."/alumnos/repositorio/".$aux["ruta"]);
			}
		}
		$zip->close();
		echo "creado ".$filename;
		if(file_exists(DOC_ROOT."/ajax/".$filename)){
			$enlace = DOC_ROOT."/ajax/".$filename;
			header ("Content-Disposition: attachment; filename=".$filename."");
			header ("Content-Type: application/octet-stream");
			header ("Content-Length: ".filesize($enlace));
			readfile($enlace);
		}
		
	}else{
		
		
	}
	

 
?>

