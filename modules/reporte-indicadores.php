<?php 
$lstPosgrados = $group->posgrados("major.name IN('MAESTRIA', 'DOCTORADO')");  
$smarty->assign("posgrados", $lstPosgrados);
?>