<?php

//echo $_SERVER["DOCUMENT_ROOT"];
// define("DOC_ROOT", "/home/iapchiap/public_html/");
define("DOC_ROOT", $_SERVER['DOCUMENT_ROOT'].'/iap');
//define("WEB_ROOT", "http://187.143.245.7/iapenlinea");
//define("WEB_ROOT", "http://192.168.100.200/iapenlinea");
//define("WEB_ROOT", "http://desarrollot.no-ip.biz/iapenlinea");
//define("WEB_ROOT", "http://192.168.1.200/iapenlinea");

// define('WEB_ROOT', "http://www.iapchiapasenlinea.mx");
define('WEB_ROOT', 'http://'.$_SERVER['HTTP_HOST'].'/iap' );

//define("WEB_ROOT", "http://127.0.0.1/enlinea_new");

define("SQL_HOST", "localhost");

define("SQL_DATABASE", "iapchiap_cbta");
define("SQL_USER", "root");
define("SQL_PASSWORD", "");

define("ITEMS_PER_PAGE", "20");
define("MIN_YEAR", 2009);
define("MAX_YEAR", 2015);

define("DAYS_NOTIFICATION", 15);

?>