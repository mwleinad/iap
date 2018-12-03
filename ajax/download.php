<?php
	include_once('../initPdf.php');
	include_once('../config.php');
	include_once(DOC_ROOT.'/libraries.php');

	// use Dompdf\Adapter\CPDF;
	// use Dompdf\Dompdf;
	// use Dompdf\Exception;

	// echo "<pre>"; print_r($_POST);
	// exit;
	session_start();

	$Files=array('file1.ext','file2.ext','file3.ext');
	RARFiles('asdf.rar',$Files);
	

 
$zip = new ZipArchive();
 
$filename = 'test.zip';
 
if($zip->open($filename,ZIPARCHIVE::CREATE)===true) {
        $zip->addFile('a.txt');
        $zip->addFile('b.txt');
        $zip->close();
        echo 'Creado '.$filename;
}
else {
        echo 'Error creando '.$filename;
}
 
?>
?>
