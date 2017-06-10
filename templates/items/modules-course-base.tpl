{foreach from=$subjects item=subject}
    <tr>
        <td align="center" class="id">{$subject.courseModuleId}</td>
        <td align="center">{$subject.clave}</td>
        <td align="center">{$subject.semesterId}</td>
        <td align="left">{$subject.name}</td>
        <td align="left">{$subject.initialDate|date_format:"%d-%m-%Y"}</td>
        <td align="left">{$subject.finalDate|date_format:"%d-%m-%Y"}</td>
        <td align="left">{$subject.daysToFinish}</td>
        <td align="left">{$subject.active}</td>
        {if $User.type == "student"}
			    <td>{$subject.totalScore} <br/>
				<a href="#" onclick="CalificacionesAct({$subject.courseModuleId});"> Actividades</a>
                <br/>
                 <a href="#" onclick="CalificacionesExa({$subject.courseModuleId});"> Examenes</a></td>			
			{/if}
				
        <td align="center">
        {if $User.type == "student"}
	        {if  $timestamp < $subject.initialDateStamp}
          	No Iniciado
          {else}
          	{if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}  
            	Finalizado
            {elseif $subject.active == "no"}  
            	Finalizado
          	{elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}  
            	Finalizado
	        	{else}
                <br />
							<a href="{$WEB_ROOT}/view-modules-student/id/{$subject.courseModuleId}" title="Ver Modulo de Curso"  style="color:#000" target="_top" ><i class="fa fa-sign-in fa-2x" aria-hidden="true"></i>
                            </a>
          	{/if}		
          {/if}
        {else}
        <a href="{$WEB_ROOT}/edit-modules-course/id/{$subject.courseModuleId}" title="Ver Modulos de Curso"  style="color:#000" target="_top" ><img src="{$WEB_ROOT}/images/arrow.png" title="Configurar Modulo" /></a>
        {/if}
        </td>
		
   
		
    </tr>
	<tr>
		<td id="td_{$subject.courseModuleId}" colspan="10">
			
		</td>
	</tr>
{foreachelse}
	<tr>
    	<td colspan="12" align="center">No se encontr&oacute; ning&uacute;n registro.</td>
	</tr>
{/foreach}
