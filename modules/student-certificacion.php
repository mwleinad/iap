<?php
	$optPeriodosIds[] = 0;
	$optPeriodosOut[] = '-Elija un periodo-';
	$optPeriodosSel = 0;
	$optPeriodosInd = 0;
	$indice = 0;
	$periodos = $periodo->Enumerate();
	foreach($periodos as $periodo)
	{
		$indice++;
		$optPeriodosIds[] = $periodo['periodoId'];
		$optPeriodosOut[] = $periodo['identifier'] . ' | ' . ($periodo['active'] == 'yes' ? 'activo' : 'inactivo');
		if($periodo['active'] == 'yes')
		{
			$optPeriodosSel = $periodo['periodoId'];
			$optPeriodosInd = $indice;
		}
	}	
	$smarty->assign('optPeriodosIds', $optPeriodosIds);
	$smarty->assign('optPeriodosOut', $optPeriodosOut);
	$smarty->assign('optPeriodosSel', $optPeriodosSel);
	
	$optGruposIds[] = 0;
	$optGruposOut[] = '-Elija un grupo-';
	$optGruposSel = 0;
	$groups = $group->Enumerate();
	foreach($groups as $group)
	{
		if($group['periodoId'] == $optPeriodosIds[$optPeriodosInd])
		{
			$optGruposIds[] = $group['groupId'];
			$optGruposOut[] = $group['clave'];
		}
	}
	$smarty->assign('optGruposIds', $optGruposIds);
	$smarty->assign('optGruposOut', $optGruposOut);
	$smarty->assign('optGruposSel', $optGruposSel);
	
	$optSemestersIds[] = 0;
	$optSemestersOut[] = '-Elije un semestre-';
	$optSemestersSel[] = 0;
	$semesters = $semester->Enumerate();
	foreach($semesters as $semester)
	{
		$optSemestersIds[] = $semester['semesterId'];
		$optSemestersOut[] = $semester['name'];
	}
	$smarty->assign('optSemestersIds', $optSemestersIds);
	$smarty->assign('optSemestersOut', $optSemestersOut);
	$smarty->assign('optSemestersSel', $optSemestersSel);	
?>