{if $access == 1}
<form id="addMajorForm" name="addMajorForm" method="post">
	<input type="hidden" name="modality" id="modality" value="{$actividad.modality}" />
	<input type="hidden" id="type" name="type" value="saveAddMajor" />
	<div class="row">
		<div class="col-md-12 text-center display-4 mb-3">
			Tiempo Restante: <span id="countdownJobs" class="bg-primary px-1 py-1 text-white rounded">{$timeLeft}</span>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-md-12">
			<p>No cerrar esta pagina, de lo contrario tendras que volver a empezar.</p>
		</div>
	</div>
	{* CUERPO EXAMEN *}
	<div class="row mb-3">
		<div class="col-md-12">
			<ol id="sort-box" class="sorts">
				{foreach from=$myTest item=subject}
					<li>
						<p><b>{$subject.question}</b> <span class="badge badge-info"><b>Valor: {$subject.ponderation}%</b></span></p>
						<div class="text-left">
							{if $subject.opcionA}
								<input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionA" />{$subject.opcionA}
							{/if}
							{if $subject.opcionB}
								<div style="clear:both"></div>
								<input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionB" />{$subject.opcionB}
							{/if}
							{if $subject.opcionC}
								<div style="clear:both"></div>
								<input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionC" />{$subject.opcionC}
							{/if}
							{if $subject.opcionD}
								<div style="clear:both"></div>
								<input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionD" />{$subject.opcionD}
							{/if}
							{if $subject.opcionE}
								<div style="clear:both"></div>
								<input style="width:50px" type="radio" name="anwer[{$subject.testId}]" id="anwer[{$subject.testId}]" value="opcionE" />{$subject.opcionE}<br />
							{/if}
						</div>
					</li>
				{/foreach}
			</ol>
		</div>
	</div> 
	<div class="row">
		<div class="col-md-12">
			<div style="float:left"><span class="reqField">*</span> Campo requerido</div>
		</div>
		<div class="col-md-12 text-center mt-2">
			<input type="submit" class="btn btn-success submitForm" id="addMajor" name="addMajor" value="Enviar" onClick="return confirmSubmit(event)" />
		</div>
	</div>  
</form>
{else}
	<div class="row">
		<div class="col-md-12 text-center">
			<p>Has agotado tus oportunidades para hacer este examen. Tu calificacion fue de: <b>{$score}%</b></p>
			<a href="{$WEB_ROOT}/view-modules-student/id/{$actividad.courseModuleId}" class="btn btn-primary">
				<i class="fas fa-undo"></i> Regresar al Módulo
			</a>
		</div>
	</div>
{/if}

<script language="javascript">
	function countdown(remain, count, not, messages) {
		var notifier = document.getElementById(count);
		var countdown = document.getElementById(count)
		var timer = setInterval( function () {
			countdown.innerHTML = Math.floor(remain / 60) + ":" + (remain % 60 < 10 ? "0" : "") + remain %60;
			if (messages[remain]) { notifier.innerHTML = messages[remain]; }
			if (--remain < 0 ) { 
				//clearInterval(timer); 
				$('#addMajorForm').submit();
			}
		}, 1000);
	}

	function confirmSubmit(event)
	{
		event.preventDefault();
		Swal.fire({
			title: '¿Estas seguro que deseas enviar tu examen?',
			text: '¿Respondiste todas las preguntas?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Si, Estoy Seguro',
			cancelButtonText: 'No, Cancelar'
		}).then((result) => {
			if(result.value) 
				$('#addMajorForm').submit();
			else
				return false;
		});
	}

	countdown({$timeLeft}, "countdownJobs", "countdownJobs",
	{ 
		60: "60 Segundos Restantes",
		30: "30 Segundos Restantes",
		0: "El Tiempo Terminó"
	});
</script>