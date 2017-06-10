<?php

include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

session_start();

switch($_POST["type"])
{
    case 'deleteResource':
        $resource->setResourceId($_POST['resourceId']);
        $info = $resource->Info();

        $resource->Delete();
        echo "ok[#]";
        $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
        echo "[#]";

        $resource->setCourseModuleId($info['courseModuleId']);
        $resources = $resource->Enumerate();
        $smarty->assign('resources', $resources);

        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->display(DOC_ROOT.'/templates/lists/new/resources.tpl');

        break;


}

?>
