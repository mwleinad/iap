<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT . '/libraries.php');

$smarty->assign("DOC_ROOT", DOC_ROOT);
switch($_POST["type"])
{
    case 'deleteConcept':
        $calendar->setCalendarDistributionId($_POST['conceptId']);
        if($calendar->Delete())
        {
            echo "ok[#]";
            /* $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $subject->Enumerate();
            $subjects = $util->EncodeResult($result);
            $smarty->assign("subjects", $subjects);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/new/subject.tpl'); */
        }
        else
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        break;
}
?>