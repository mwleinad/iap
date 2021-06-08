<p>{$item.resumen}</p>
{if $timestamp > $item.initialDateTimestamp && $timestamp < $item.finalDateTimestamp}
    <span class="badge badge-success">Esta actividad se encuentra disponible</span>
{/if}
{if $timestamp > $item.finalDateTimestamp}
    <span class="badge badge-danger">El tiempo de esta actividad ha terminado</span>
{/if}
{if $timestamp < $item.initialDateTimestamp}
    <span class="badge badge-warning">Esta actividad aun no ha iniciado</span>
{/if}
<p><small>
    <b>Fecha Inicial:</b> {$item.initialDate|date_format:"%d-%m-%Y"} {$item.horaInicial}<br />
    <b>Fecha Final:  </b> {$item.finalDate|date_format:"%d-%m-%Y %H:%M:%S"}<br />
    <b>Modalidad: </b> {$item.modality}
</small></p>
{if $item.requerida.activityId}
    <p><small>
        {if $item.activityType == "Tarea"}
            <b>Tarea Requerida:</b> Para realizar esta Actividad necesitas terminar la Actividad {$item.numreq}
        {/if}
        {if $item.activityType == "Examen"}
            <b>Tarea Requerida:</b> Para realizar este Examen necesitas terminar la Actividad {$item.numreq}
        {/if}
    </small></p>
{/if}
{if $timestamp > $item.initialDateTimestamp && $timestamp < $item.finalDateTimestamp && $item.available}
    {if $item.activityType == "Lectura"}
        Ninguno.
    {/if}
    {if $item.activityType == "Tarea"}
        {if $vistaPrevia==0}
            {if $item.homework.path eq ''}
                <a href="{$WEB_ROOT}/graybox.php?page=upload-homework&id={$item.activityId}" title="Subir Tarea" data-target="#ajax" data-toggle="modal" class="btn btn-xs btn-primary">
                    <i class="fas fa-file-upload"></i> Subir Actividad al Sistema de Tareas
                </a>
            {/if}
        {else}
            Subir Tarea al Sistema de Tareas.
        {/if}
    {/if}
    {if $item.activityType == "Examen"}
        {if $vistaPrevia==0}
            <a id="presentarExamen" style="display: none" class=" btn btn-outline-warning sbold" href="{$WEB_ROOT}/graybox.php?page=make-test&id={$item.activityId}" data-target="#ajax" data-toggle="modal">
                <i class="fas fa-spell-check"></i> Presentar examen
            </a>
            <a class="pointer btn btn-outline-info btn-xs mb-3" onclick="DoTest({$item.activityId})">
                <i class="fas fa-spell-check"></i> Presentar Examen.
            </a>
        {else} 
            Presentar Examen.
        {/if}
    {/if}
    {if $item.activityType == "Foro"}
        Participación en foro.
    {/if}
    {if $item.activityType == "Otro"}
        Ninguno.
    {/if}
{/if}
{* ARCHIVO ADJUNTO *}
{if $item.retroFile ne ""}
    <br />
    <b>Archivo Adjunto Disponible:</b>
    <a href='{$WEB_ROOT}/file_retro/{$item.retroFile}' target="_blank" class="bb" style="background: #73b760; color:white">Descargar</a>
{/if}


{*if $item.activityId eq $tareaId}
    {if $exito eq "si"}
        
        <div class="alert alert-warning alert-dismissable">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong></strong> La actividad se subió correctamente al sistema de tareas
        </div>
    {/if}
{/if*}