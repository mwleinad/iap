<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-graduation-cap"></i> Acta de Calificaciones
    </div>
    <div class="card-body text-justify">
		<p>Favor de colocar las calificaciones en una escala de 0 a 10 sin puntos decimales. En el caso de que usted considere puntos decimales la escala es:</p>
		<ul>
			<li> De .1 a .5 la calificación baja</li>
			<li> De .6 a .9 la calificación sube</li>
		</ul>
		<p>Unicamente podra asignar en una sola ocasión estas calificaciones, si desea hacer modificaciones le pedimos de favor enviar un correo a tutor@iapchiapas.org.mx para habilitarle la edición.</p> 
		<p>Le pedimos de favor descargar este formato, firmalo y subirlo escaneado en esta misma sección.</p>
		{if $info.majorName eq 'MAESTRIA'}
			<p><b>La calificación mínima aprobatoria es 7, toda calificación no aprobatoria se asignará con 6</b></p>
		{/if}
		{if $info.majorName eq 'DOCTORADO'}
			<p><b>La calificación mínima aprobatoria es 8, toda calificación no aprobatoria se asignará con 7</b></p>
		{/if}
        <div id="tblContentActa" class="table-responsive">
            {include file="{$DOC_ROOT}/templates/lists/add-calificacion.tpl"}
        </div>
    </div>
</div>