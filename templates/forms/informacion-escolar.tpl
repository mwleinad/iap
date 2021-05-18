<form id="frmGral_2">
	<input type="hidden" name="personalId" class="form-control" value="{$info.personalId}" />
	<h3>Licenciatura</h3>
	<div class="row">
		<div class="form-group col-md-12">
			<label for="lic_escuela">Escuela Licenciatura</label>
			<input type="text" id="lic_escuela" name="lic_escuela" value="{$infoBasic.estudios.0.escuela}" class="form-control" {if $cId eq 'si'} disabled {/if} />
		</div>
		<div class="form-group col-md-12">
			<label for="lic_carrera">Nombre de la Licenciatura</label>
			<input type="text" name="lic_carrera" value="{$infoBasic.estudios.0.carrera}" class="form-control" {if $cId eq 'si'} disabled {/if} />
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-md-12">
			<div class="form-check-inline">
				<label class="form-check-label" for="lic_titulo">
					<input type="checkbox" name="lic_titulo" {if $infoBasic.estudios.0.titulo eq 'si'} checked {/if} id="lic_titulo" {if $cId eq 'si'} disabled {/if}> Titulo
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="lic_acta">
					<input type="checkbox" name="lic_acta" {if $infoBasic.estudios.0.actaExamen eq 'si'} checked {/if} id="lic_acta" {if $cId eq 'si'} disabled {/if}> Acta de Examen
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="lic_cedula">
					<input type="checkbox" name="lic_cedula" {if $infoBasic.estudios.0.cedula eq 'si'} checked {/if} id="lic_cedula" {if $cId eq 'si'} disabled {/if}> Cédula
				</label>
			</div>
		</div>
	</div>
	<h3>Maestria</h3>
	<div class="row">
		<div class="form-group col-md-12">
			<label for="master_escuela">Escuela Maestria</label>
			<input type="text" id="master_escuela" name="master_escuela" value="{$infoBasic.estudios.1.escuela}" class="form-control" {if $cId eq 'si'} disabled {/if} />
		</div>
		<div class="form-group col-md-12">
			<label for="master_carrera">Nombre de la Maestria</label>
			<input type="text" id="master_carrera" name="master_carrera" value="{$infoBasic.estudios.1.carrera}" class="form-control" {if $cId eq 'si'} disabled {/if} />
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-md-12">
			<div class="form-check-inline">
				<label class="form-check-label" for="master_titulo">
				<input type="checkbox" name="master_titulo" {if $infoBasic.estudios.1.titulo eq 'si'} checked {/if}  id="master_titulo" {if $cId eq 'si'} disabled {/if}> Titulo
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="master_acta">
					<input type="checkbox" name="master_acta"  {if $infoBasic.estudios.1.actaExamen eq 'si'} checked {/if} id="master_acta" {if $cId eq 'si'} disabled {/if}> Acta de Examen
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="master_cedula">
					<input type="checkbox" name="master_cedula"{if $infoBasic.estudios.1.cedula eq 'si'} checked {/if}  id="master_cedula" {if $cId eq 'si'} disabled {/if}> Cédula
				</label>
			</div>
		</div>
	</div>
	<h3>Doctorado</h3>
	<div class="row">
		<div class="form-group col-md-12">
			<label for="doc_escuela">Escuela Doctorado</label>
			<input type="text" id="doc_escuela" name="doc_escuela" value="{$infoBasic.estudios.2.escuela}" {if $cId eq 'si'} disabled {/if}class="form-control">
		</div>
		<div class="form-group col-md-12">
			<label for="doc_carrera">Nombre del Doctorado</label>
			<input type="text" id="doc_carrera" name="doc_carrera" value="{$infoBasic.estudios.2.carrera}" {if $cId eq 'si'} disabled {/if}class="form-control">
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-md-12">
			<div class="form-check-inline">
				<label class="form-check-label" for="doc_titulo">
					<input type="checkbox" id="doc_titulo" name="doc_titulo" {if $infoBasic.estudios.2.titulo eq 'si'} checked {/if} {if $cId eq 'si'} disabled {/if}> Titulo
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="doc_acta">
					<input type="checkbox" name="doc_acta" {if $infoBasic.estudios.2.actaExamen eq 'si'} checked {/if} {if $cId eq 'si'} disabled {/if} id="doc_acta"> Acta de Examen
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="doc_cedula">
				<input type="checkbox" name="doc_cedula" {if $infoBasic.estudios.2.cedula eq 'si'} checked {/if}  {if $cId eq 'si'} disabled {/if} id="doc_cedula"> Cédula
				</label>
			</div>
		</div>
	</div>
</form>
<div class="row">
	<div class="col-md-12"><div id="msj_2"></div></div>
	<div class="col-md-12">
		{if $cId ne 'si'}
			<button onClick="guardarInformacion(2)" class="btn btn-primary">Guardar</button>
		{else}
			<button onClick="activaEdicion()" class="btn btn-warning">Activar Edicion</button>
		{/if}
		<div class="divControls mt-2" style="display:none">
			<button onClick="guardarInformacion(2)" class="btn btn-primary">Guardar</button>
		</div>
	</div>
</div>