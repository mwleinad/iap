<?php
include_once('../../init.php');
include_once('../../config.php');
include_once(DOC_ROOT.'/libraries.php');

$specialities = $util->EncodeResult($speciality->Enumerate());
$semesters = $util->EncodeResult($semester->Enumerate());

if($_POST['type'] == 'addSubject' || $_POST['type'] == 'editSubject')
{
    if(count($specialities) == 0)
    {
        $optSpecialsIds[] = 0;
        $optSpecialsOut[] = '---No existen especialidades---';
        $optSpecialsSel = 0;
    }
    else
    {
        $optSpecialsIds[] = 0;
        $optSpecialsOut[] = 'Seleccione';
        $optSpecialsSel = 0;
        foreach($specialities as $item)
        {
            $optSpecialsIds[] = $item['specialityId'];
            $optSpecialsOut[] = $item['name'];
        }
    }
    if(count($semesters) == 0)
    {
        $optSemesterIds[] = 0;
        $optSemesterOut[] = '---No existen semestres---';
        $optSemesterSel = 0;
    }
    else
    {
        $optSemesterIds[] = 0;
        $optSemesterOut[] = 'Seleccione';
        $optSemesterSel = 0;
        foreach($semesters as $item)
        {
            $optSemesterIds[] = $item['semesterId'];
            $optSemesterOut[] = $item['name'];
        }
    }
    $smarty->assign('optSpecialsIds', $optSpecialsIds);
    $smarty->assign('optSpecialsOut', $optSpecialsOut);
    $smarty->assign('optSpecialsSel', $optSpecialsSel);
    $smarty->assign('optSemesterIds', $optSemesterIds);
    $smarty->assign('optSemesterOut', $optSemesterOut);
    $smarty->assign('optSemesterSel', $optSemesterSel);
}

$smarty->assign("DOC_ROOT", DOC_ROOT);

switch($_POST["type"])
{
    case 'addSubject':

        $smarty->display(DOC_ROOT.'/templates/forms/new/add-subject.tpl');

        break;

    case 'saveAddSubject':

        $subject->setTipo($_POST['tipo']);
        $subject->setClave(strtoupper($_POST['frmClave']));
        $subject->setName(strtoupper($_POST['frmName']));
        $subject->setSpecialityId($_POST['frmSpeciality']);
        $subject->setSemesterId($_POST['frmSemester']);
        $subject->setCredits($_POST['frmCreditos']);
        $subject->setGroupQty($_POST['frmTotalGrupos']);
        $subject->setStudentLimit($_POST['frmEstudiantesLimite']);

        if($subject->Save())
        {
            echo 'Ok|';
            $smarty->display(DOC_ROOT . '/templates/boxes/status.tpl');
            echo '|';
            $smarty->assign('specialities', $specialities);
            $smarty->assign('semesters', $semesters);

            // -------------------------------------------------------------------------------------------------
            $arrPage = array();		// ---- arreglo donde guarda los resultados de la paginacion...para usarse en footer-pages-links.tpl
            $viewPage = 1;			// ---- por default se toma la primera pagina, por si aun no esta definidala en la variable GET
            $rowsPerPage = 15;		//<<--- se podria tomar este valor de una variable o constante global, o especificarla para un caso particular
            $pageVar = 'viewPage';	// ---- el nombre de la variable en GET que trae la pagina a mostrar, en este caso se usa viewPage para pasar la pagina a visualizar
            if(isset($_POST["$pageVar"]))
                $viewPage = $_POST["$pageVar"];	//si ya esta definida la variable POST['viewPage'] tomar el valor de esta
            //$smarty->assign('subjects', $util->EncodeResult($subject->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/subject', $arrPage)));
            $smarty->assign('subjects', $util->EncodeResult($subject->Enumerate()));
            $smarty->assign('arrPage', $arrPage);

            $smarty->display(DOC_ROOT . '/templates/lists/new/subject.tpl');
        }
        else
        {
            echo 'Fail|';
            $smarty->display(DOC_ROOT . '/templates/boxes/status_on_popup.tpl');
        }

        break;

    case 'editSubject':

        //establecemos el valor de subjectId de la clase
        $subject->setSubjectId($_POST['id']);
        //asignamos a la variable 'post' de smarty la informacion del puesto
        $smarty->assign('post', $subject->Info());
        //asignamos el valor de la lista que estara seleccionada por defaul para el campo especialidad
        $smarty->assign('optSpecialsSel', $subject->getSpecialityId());
        //asignamos el valor de la lista que estara seleccionada por defaul para el campo semestre
        $smarty->assign('optSemesterSel', $subject->getSemesterId());
        //visualizamos la pantalla de edicion de datos
        $smarty->display(DOC_ROOT.'/templates/forms/new/edit-subject.tpl');

        break;

    case 'saveEditSubject':

        $subject->setSubjectId($_POST['subjectId']);
        $subject->setTipo($_POST['tipo']);
        $subject->setSpecialityId($_POST['frmSpeciality']);
        $subject->setSemesterId($_POST['frmSemester']);
        $subject->setClave(strtoupper($_POST['frmClave']));
        $subject->setName(strtoupper($_POST['frmName']));
        $subject->setCredits($_POST['frmCreditos']);
        $subject->setGroupQty($_POST['frmTotalGrupos']);
        $subject->setStudentLimit($_POST['frmEstudiantesLimite']);

        if($subject->Update())
        {
            echo 'Ok|';
            $smarty->display(DOC_ROOT . '/templates/boxes/status.tpl');
            echo '|';
            $smarty->assign('specialities', $specialities);
            $smarty->assign('semesters', $semesters);

            // -------------------------------------------------------------------------------------------------
            $arrPage = array();		// ---- arreglo donde guarda los resultados de la paginacion...para usarse en footer-pages-links.tpl
            $viewPage = 1;			// ---- por default se toma la primera pagina, por si aun no esta definidala en la variable GET
            $rowsPerPage = 15;		//<<--- se podria tomar este valor de una variable o constante global, o especificarla para un caso particular
            $pageVar = 'viewPage';	// ---- el nombre de la variable en GET que trae la pagina a mostrar, en este caso se usa viewPage para pasar la pagina a visualizar
            if(isset($_POST["$pageVar"]))
                $viewPage = $_POST["$pageVar"];	//si ya esta definida la variable GET['viewPage'] tomar el valor de esta
            //$smarty->assign('subjects', $util->EncodeResult($subject->EnumerateByPage($viewPage, $rowsPerPage, $pageVar, WEB_ROOT.'/subject', $arrPage)));
            $smarty->assign('subjects', $util->EncodeResult($subject->Enumerate()));
            $smarty->assign('arrPage', $arrPage);

            $smarty->display(DOC_ROOT . '/templates/lists/new/subject.tpl');
        }
        else
        {
            echo 'Fail|';
            $smarty->display(DOC_ROOT . '/templates/boxes/status_on_popup.tpl');
        }

        break;

    case 'deleteSubject':

        $subject->setSubjectId($_POST['subjectId']);

        if($subject->Delete())
        {
            echo "ok[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status.tpl');
            echo "[#]";
            $result = $subject->Enumerate();
            $subjects = $util->EncodeResult($result);
            $smarty->assign("subjects", $subjects);
            $smarty->assign("DOC_ROOT", DOC_ROOT);
            $smarty->display(DOC_ROOT.'/templates/lists/new/subject.tpl');
        }
        else
        {
            echo "fail[#]";
            $smarty->display(DOC_ROOT.'/templates/boxes/status_on_popup.tpl');
        }

        break;

    case 'viewModules':

        $subjects = $module->EnumerateById($_POST['id']);

        $smarty->assign("id", $_POST['id']);
        $smarty->assign("subjects", $subjects);  
        $smarty->assign("urlBack", WEB_ROOT."/subject");
        $smarty->display(DOC_ROOT . '/templates/boxes/new/view-modules-popup.tpl');

        break;
}
?>