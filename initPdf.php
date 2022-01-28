<?php 
ini_set("display_errors", "OFF"); 
error_reporting(E_ALL & ~E_STRICT & ~E_DEPRECATED & ~E_NOTICE);

date_default_timezone_set('America/Mexico_City');
header('Content-type: text/html; charset=iso-8859-1');

require 'vendor/autoload.php';
$dotenv = Dotenv\Dotenv::create(__DIR__);
$dotenv->load();

?>
