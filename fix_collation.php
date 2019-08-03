<?php

include_once('init.php');
include_once('config.php');
include_once(DOC_ROOT.'/libraries.php');

$db->setQuery('show tables from lms;');
$result = $db->GetResult();

foreach($result as $row) {
    $table = $row['Tables_in_lms'];
    $db->setQuery('ALTER TABLE `'.$table.'` ENGINE=InnoDB;');
    $db->ExecuteQuery();

    $db->setQuery('ALTER TABLE `'.$table.'` CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;');
    $db->ExecuteQuery();
}