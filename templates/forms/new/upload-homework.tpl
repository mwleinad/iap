<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post" enctype="multipart/form-data" action="{$WEB_ROOT}/upload-homework/id/{$actividad.activityId}">
    <input type="hidden" name="modality" id="modality" value="{$actividad.modality}"/>
    <input type="hidden" name="courseId" id="courseId" value="{$actividad.courseModuleId}"/>
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
	<div style="text-align:justify">
	Únicamente se puede subir un solo archivo por actividad, 
	por lo que si necesita subir varios archivos le recomendamos los comprima 
	en .rar y los suba por este medio.
	<br>
	Solamente tendrá la opción de volver a subir su actividad en una ocasión
	</div>
    <div class="form-body">
        <div class="form-group">
            {if $homework.path ne ''}
            <label class="col-md-3 control-label">Ya has subido esta Tarea.</label>
            <div class="col-md-8">
                <a href="{$WEB_ROOT}/download.php?file=homework/{$homework.path}&mime={$homework.mime}">Ver Tarea</a>
            </div>
            {/if}
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Actividad:</label>
            <div class="col-md-8">
                {$actividad.modality}
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Fecha Limite:</label>
            <div class="col-md-8">
                {$actividad.finalDateNoFormat}
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Título:</label>
            <div class="col-md-8">
                <input type="text" name="nombre" id="nombre" value="" maxlength="100" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Tarea:</label>
            <div class="col-md-8">
                <input type="file" name="path" id="path" size="34"/>
            </div>
        </div>
    </div>
	{if $homework.countUpdate eq 1}
		
		<center><font color="red">Solo se permiten dos intentos de subir el archivo</font></center>
	
	{else}
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                    <button type="submit" class="btn green submitForm">Guardar</button>
                </div>
        </div>
    </div>
	{/if}

</form>