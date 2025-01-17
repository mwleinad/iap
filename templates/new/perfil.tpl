<div class="page-header">
	<h3 class="page-title">
		<span class="page-title-icon bg-gradient-primary text-white mr-2">
			<i class="mdi mdi-account"></i>
		</span>
		Perfil
	</h3>
	<nav aria-label="breadcrumb">
		<ul class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">
				<span></span>IAP Chiapas
				<i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
			</li>
		</ul>
	</nav>
</div>

<div class="card mb-4">
	<div class="card-header text-right header_main">
		<a class="btn btn-primary d-inline" href="https://iapchiapas.edu.mx/aviso_privacidad" target="_blank"
			title="Aviso de Privacidad">
			<i class="fas fa-user-secret"></i> Aviso de Privacidad
		</a>
	</div>
	<div class="card-body pt-0">
		<div class="row">
			<div class="col-md-12 text-center alert alert-primary">
				Para mejorar la interacción y colaboración dentro de nuestra comunidad académica, te invitamos a
				actualizar los datos de tu perfil. Es importante que esta información esté actualizada para que tanto
				tus compañeros como los profesores puedan conocerte mejor y comunicarse contigo de manera más efectiva.
				(Esta información será visible para tus compañeros y profesores)
			</div>
		</div>
		<form class="form col-md-12" id="form_perfil" action="{$WEB_ROOT}/ajax/new/student.php">
			<input type="hidden" name="opcion" value="updatePerfil">
			<input type="hidden" name="id" value="{$dataStudent.userId}">
			<div class="row">
				<div class="form-group col-md-6">
					<label for="names">Nombre:</label>
					<input type="text" name="names" id="names" class="form-control" value="{$dataStudent.names}"
						placeholder="Escribe tu nombre..." />
				</div>
				<div class="form-group col-md-6">
					<label for="lastNamePaterno">Apellido Paterno:</label>
					<input type="text" name="lastNamePaterno" id="lastNamePaterno" class="form-control"
						value="{$dataStudent.lastNamePaterno}" placeholder="Escribe tu primer apellido..." />
				</div>
				<div class="form-group col-md-6">
					<label for="lastNameMaterno">Apellido Materno:</label>
					<input type="text" name="lastNameMaterno" id="lastNameMaterno" class="form-control"
						value="{$dataStudent.lastNameMaterno}" placeholder="Escribe tu segundo apellido..." />
				</div>
				<div class="form-group col-md-6">
					<label for="sexo">Sexo:</label>
					<select name="sexo" id="sexo" class="form-control">
						<option value="m" {if $dataStudent.sexo == "m"}selected{/if}>Masculino</option>
						<option value="f" {if $dataStudent.sexo == "f"}selected{/if}>Femenino</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="habilidades">Principales habilidades o destrezas</label>
					<textarea class="form-control" id="habilidades" rows="6" name="habilidades"
						placeholder="Escribe aquí tus habilidades o destrezas...">{$dataStudent.habilidades}</textarea>
				</div>
				<div class="form-group col-md-6">
					<label for="aspiraciones">Principales aspiraciones y proyectos de vida</label>
					<textarea class="form-control" id="aspiraciones" rows="6" name="aspiraciones"
						placeholder="Escribe aquí tus aspiraciones...">{$dataStudent.aspiraciones}</textarea>
				</div>
				<div class="form-group col-md-6">
					<label for="aficiones">Aficiones, gustos o pasatiempos</label>
					<textarea class="form-control" id="aficiones" rows="6" name="aficiones"
						placeholder="Escribe aquí tus aficiones, gustos o pasatiempos...">{$dataStudent.aficiones}</textarea>
				</div>
			</div>
			<span class="badge badge-dark"><i class="fas fa-briefcase"></i> Datos Laborales</span>
			<hr />
			<div class="row">
				<div class="form-group col-md-6">
					<label for="workplace">Lugar de trabajo:</label>
					<input type="text" name="workplace" id="workplace" class="form-control"
						value="{$dataStudent.workplace}" />
				</div>
				<div class="form-group col-md-6">
					<label for="workplacePosition">Puesto:</label>
					<input type="text" name="workplacePosition" id="workplacePosition" class="form-control"
						value="{$dataStudent.workplacePosition}" placeholder="Escribe aquí tu puesto..." />
				</div>
				<div class="form-group col-md-12">
					<label for="actividades">Actividades que desempeña</label>
					<textarea name="actividades" id="actividades" class="form-control" rows="6"
						placeholder="Escribe aquí las actividades que desempeñas...">{$dataStudent.actividades}</textarea>
				</div>
			</div>
			<span class="badge badge-dark"><i class="fas fa-graduation-cap"></i> Estudios</span>
			<hr />
			<div class="row">
				<div class="form-group col-md-6">
					<label for="academicDegree">Grado Académico:</label>
					<select name="academicDegree" id="academicDegree" class="form-control">
						<option value="UNIVERSITARIO" {if $dataStudent.academicDegree == "UNIVERSITARIO"}
							selected="selected" {/if}>UNIVERSITARIO</option>
						<option value="LICENCIATURA" {if $dataStudent.academicDegree == "LICENCIATURA"}
							selected="selected" {/if}>LICENCIATURA</option>
						<option value="MAESTRIA" {if $dataStudent.academicDegree == "MAESTRIA"} selected="selected"
							{/if}>
							MAESTRIA</option>
						<option value="DOCTORADO" {if $dataStudent.academicDegree == "DOCTORADO"} selected="selected"
							{/if}>
							DOCTORADO</option>
						<option value="OTROS" {if $dataStudent.academicDegree == "OTROS"} selected="selected" {/if}>
							OTROS
						</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="profesion">Profesión:</label>
					<select name="profesion" id="profesion" class="form-control">
						{foreach from=$prof item=item}
							<option value="{$item.profesionId}" {if $dataStudent.profesion == $item.profesionId}
								selected="selected" {/if}>{$item.profesionName}</option>
						{/foreach}
					</select>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="school">Escuela o Institución Universitaria:</label>
					<input type="text" name="school" id="school" class="form-control" value="{$dataStudent.school}"
						placeholder="Escribe aquí la escuela universitaria..." />
				</div>
				<div class="form-group col-md-6">
					<label for="masters">Maestría en:</label>
					<input type="text" name="masters" id="masters" class="form-control" value="{$dataStudent.masters}"
						placeholder="Escribe aquí tu maestría..." />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="mastersSchool">Escuela o Institución Maestría:</label>
					<input type="text" name="mastersSchool" id="mastersSchool" class="form-control"
						value="{$dataStudent.mastersSchool}" placeholder="Escribe aquí la escuela de la maestría..." />
				</div>
				<div class="form-group col-md-6">
					<label for="highSchool">Escuela o Institución Bachillerato:</label>
					<input type="text" name="highSchool" id="highSchool" class="form-control"
						value="{$dataStudent.highSchool}" />
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label>¿Has recibido algún reconocimiento o distinción?</label>
					<select class="form-control" id="reconocimiento" name="reconocimiento">
						<option value="1">Sí</option>
						<option value="0">No</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="tipoReconocimiento">¿De qué tipo?</label>
					<input type="text" name="tipoReconocimiento" id="tipoReconocimiento" class="form-control"
						placeholder="Curso, Taller, Diplomado, etc." value="{$dataStudent.tipoReconocimiento}" />
				</div>
				<div class="form-group col-md-6">
					<label for="institutoReconocimiento">Instituto que lo emitió</label>
					<input type="text" name="institutoReconocimiento" id="institutoReconocimiento" class="form-control"
						placeholder="Ubicación del instituto..." value="{$dataStudent.institutoReconocimiento}" />
				</div>
				<div class="form-group col-md-6">
					<label for="lugarReconocimiento">Lugar donde fue emitido</label>
					<input type="text" name="lugarReconocimiento" id="lugarReconocimiento" class="form-control"
						placeholder="Nombre del instituto..." value="{$dataStudent.lugarReconocimiento}" />
				</div>
				<div class="form-group col-md-12">
					<label>¿Cuáles son tus expectativas del programa y qué esperas obtener o aportar?</label>
					<textarea name="expectativas" id="expectativas" class="form-control" rows="6"
						placeholder="Escribe aquí las expectativas...">{$dataStudent.expectativas}</textarea>
				</div>
				<div class="form-group col-md-12">
					<label>¿Algo más que desees compartir?</label>
					<textarea name="comentarios" id="comentarios" class="form-control" rows="8"
						placeholder="Escribe aquí tus comentarios adicionales...">{$dataStudent.comentarios}</textarea>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-md-4 mx-auto">
					<button class="btn btn-outline-primary btn-block" type="submit">Actualizar</button>
				</div>
			</div>
		</form>

	</div>
</div>