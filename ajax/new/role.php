<?php

include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

switch($_POST["type"])
{
    case "addRole":

        $modules = $role->EnumerateModules();

        $smarty->assign('modules',$modules);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->display(DOC_ROOT.'/templates/forms/new/add-role.tpl');

        break;

    case "editRole":

        $role->setRoleId($_POST['id']);
        $info = $role->Info();

        $modules = $role->EnumerateModules();

        foreach($modules as $key => $val){
            $role->setModuleId($val['moduleId']);
            if(!$role->IsModuleSelected())
                $modules2[$key] = $val;
        }

        $roleModules = $role->EnumerateModulesByRole();

        $smarty->assign("roleModules",$roleModules);
        $smarty->assign("modules",$modules2);
        $smarty->assign("info", $info);
        $smarty->assign("DOC_ROOT", DOC_ROOT);
        $smarty->display(DOC_ROOT.'/templates/forms/new/edit-role.tpl');

        break;

    case "saveAddRole":

        $role->setClave($_POST['clave']);
        $role->setName($_POST['name']);
        $role->setDescription($_POST['description']);
        $role->setModulesId($_POST['list_modules']);

        if(!$role->Save())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $role->Enumerate();
            $roles = $util->EncodeResult($result);
            $smarty->assign("roles", $roles);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/role.tpl');
        }

        break;

    case "saveEditRole":

        $role->setRoleId($_POST['id']);
        $role->setClave($_POST['clave']);
        $role->setName($_POST['name']);
        $role->setDescription($_POST['description']);
        $role->setModulesId($_POST['list_modules']);

        if(!$role->Update())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $role->Enumerate();
            $roles = $util->EncodeResult($result);
            $smarty->assign("roles", $roles);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/role.tpl');
        }

        break;

    case 'deleteRole':

        $role->setRoleId($_POST['id']);

        if(!$role->Delete())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $role->Enumerate();
            $roles = $util->EncodeResult($result);
            $smarty->assign("roles", $roles);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/role.tpl');
        }

        break;
		
		
	case "ActivarRolePopup":
		
	$role->setRoleId($_POST['id']);

        if(!$role->activar())
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
        }
        else
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $role->Enumerate();
            $roles = $util->EncodeResult($result);
            $smarty->assign("roles", $roles);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/role.tpl');
        }

        break;
	break;
}

?>
