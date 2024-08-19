<?php
$subject->setSubjectId(57);
$grupos = $subject->grupos();
$smarty->assign("grupos", $grupos); 