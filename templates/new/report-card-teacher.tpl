<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Acta de Calificaciones</b>
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
        {include file="boxes/status_no_ajax.tpl"}
		Programa Academico
		<select name="maestria" id="maestria" class="form-control">
			<option></option>
		</select>
		Modulo
		<select name="materia" id="materia" class="form-control">
			<option></option>
		</select>
		<br>
		<br>
		<div id="divContenido">
		{include file="{$DOC_ROOT}/templates/lists/new/report-card-teacher.tpl"}
		</div>
   </div>
</div>