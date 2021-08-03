<form id="addMajorForm" name="addMajorForm" method="post" enctype="multipart/form-data" action="{$WEB_ROOT}/upload-homework/id/{$actividad.activityId}">
    <input type="hidden" name="modality" id="modality" value="{$actividad.modality}" />
    <input type="hidden" name="courseId" id="courseId" value="{$actividad.courseModuleId}" />
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
    <p class="text-justify">
        Únicamente se puede subir un solo archivo por actividad, por lo que si necesita subir varios archivos le recomendamos los comprima en .rar y los suba por este medio.
    </p>
	<p class="text-justify">Solamente tendrá la opción de volver a subir su actividad en una ocasión</p>
    {if $homework.path ne ''}
        <div class="row">
            <div class="col-md-12">
                <label>
                    <b>Ya has subido esta Tarea.</b>
                    <a href="{$WEB_ROOT}/download.php?file=homework/{$homework.path}&mime={$homework.mime}">Ver Tarea</a>
                </label>
            </div>
        </div>
    {/if}
    <div class="row">
        <div class="form-group col-md-12">
            <label><b>Actividad:</b> {$actividad.modality}</label><br>
            <label><b>Fecha Limite:</b> {$actividad.finalDateNoFormat}</label>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="nombre">Título:</label>
            <input type="text" name="nombre" id="nombre" value="" maxlength="100" class="form-control" />
        </div>
        <div class="form-group col-md-6">
            <label for="path">Tarea:</label>
            <input type="file" name="path" id="path" size="34" />
        </div>
    </div>
	{if $homework.countUpdate eq 1}
		<div class="row">
            <div class="col-md-12">
                <div class="alert alert-danger" role="alert">Solo se permiten dos intentos de subir el archivo</div>
            </div>
        </div>
	{else}
        <div class="row">
            <div class="col-md-12 text-center">
                <button type="submit" class="btn btn-success submitForm">Guardar</button>
            </div>
        </div>
	{/if}
</form>