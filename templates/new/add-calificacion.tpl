<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Acta de Calificaciones
        </div>
        <div class="actions">
		
        </div>
    </div>
	
    <div class="portlet-body" style='text-align:justify'>
	Favor de colocar las calificaciones en una escala de 0 a 10 sin puntos decimales. En el caso de que usted considere puntos decimales la escala es:
	<br>
	<br>
	<li> De .1 a .5 la calificiación baja
	<li> De .6 a .9 la calificiación sube
	<br>
	<br>
	Unicamente podra asignar en una sola ocasión estas calificaciones, si desea hacer modificaciones le pedimos de favor enviar un correo
	a tutor@iapchiapas.org.mx para habilitarle la edición. 
	<br>
	<br>
	Le pedimos de favor descargar este formato, firmalo y subirlo escaneado en esta misma sección.
	<br>
	<br>
	
	{if $info.majorName eq 'MAESTRIA'}
		<b>La calificación mínima aprobatoria es 7, toda calificación no aprobatoria se asignará con 6</b>
		<br>
		<br>
	{/if}
	
	{if $info.majorName eq 'DOCTORADO'}
		<b>La calificación mínima aprobatoria es 8, toda calificación no aprobatoria se asignará con 7</b>
		<br>
		<br>
	{/if}
	
        <div id="tblContentActa">
            {include file="{$DOC_ROOT}/templates/lists/add-calificacion.tpl"}
        </div>
    </div>
</div>
