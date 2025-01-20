<div class="card mb-4">
	<div class="card-header bg-primary text-white">
		<i class="fas fa-info-circle"></i> Información del Alumno
	</div>
	<div class="card-body text-center">
		{if $infoStudent8.imagen eq ''}
			<i class="fas fa-user-circle fa-5x"></i>
		{else}
			<div class="col-md-6 mx-auto">
				{{$infoStudent8.imagen}}
			</div>
		{/if}
		<h5 class="card-title">{$infoStudent8.names|upper} {$infoStudent8.lastNamePaterno|upper}
			{$infoStudent8.lastNameMaterno|upper}</h5>
		<ul class="nav nav-tabs">
			<li class="nav-item">
				<a class="nav-link active" data-toggle="tab" href="#profile">Perfil</a>
			</li>
			{if $userPerfil eq 'Administrador' || $userPerfil eq 'Docente'}
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#information">Información</a>
				</li>
			{/if}
		</ul>

		<div class="tab-content">
			<div class="tab-pane container active" id="profile">
				<div class="row my-5 text-left">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">Datos generales</div>
							<div class="card-body">
								<p class="card-text"><b>Nombre completo: </b> {$infoStudent8.names} {$infoStudent8.lastNamePaterno} {$infoStudent8.lastNameMaterno}</p>
								<p class="card-text"><b>Sexo: </b> {if $infoStudent8.sexo eq "m"} Masculino {else} Femenino {/if}</p>
								<p class="card-text"><b>Principales habilidades o destrezas: </b> {$infoStudent8.habilidades}</p>
								<p class="card-text"><b>Principales aspiraciones y proyectos de vida: </b> {$infoStudent8.aspiraciones}</p>
								<p class="card-text"><b>Aficiones, gustos y pasatiempos: </b> {$infoStudent8.aficiones}</p>
								<p class="card-text"><b>Expectativas del programa (Qué espera obtener o aportar): </b> {$infoStudent8.expectativas}</p>
								<p class="card-text"><b>Comentarios adicionales: </b> {$infoStudent8.comentarios}</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">Estudios</div>
							<div class="card-body">
								<p class="card-text"><b>Grado académico: </b> {$infoStudent8.academicDegree}</p>
								<p class="card-text"><b>Profesión: </b> {$infoStudent8.profesionName}</p>
								<p class="card-text"><b>¿Ha recibido algún reconocimiento o distinción?: </b> {if $infoStudent8.reconocimiento eq 1} Si {else} No {/if}</p>
								<p class="card-text"><b>Tipo de reconocimiento o distinción: </b> {$infoStudent8.tipoReconocimiento}</p>
								<p class="card-text"><b>Instituto que lo emitió: </b> {$infoStudent8.institutoReconocimiento}</p>
								<p class="card-text"><b>Lugar donde fue emitido: </b> {$infoStudent8.lugarReconocimiento}</p>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">Datos laborales</div>
							<div class="card-body">
								<p class="card-text"><b>Lugar de trabajo: </b> {$infoStudent8.workplace}</p>
								<p class="card-text"><b>Puesto: </b> {$infoStudent8.workplacePosition}</p>
								<p class="card-text"><b>Actividades que desempeña: </b> {$infoStudent8.actividades}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			{if $userPerfil eq 'Administrador' || $userPerfil eq 'Docente'}
				<div class="tab-pane container fade" id="information">
					<div class="table-responsive">
						<table class="table table-sm table-bordered table-striped">
							<tr>
								<td>
									<b>Fecha De Nacimiento:</b> {$infoStudent8.birthdate}
								</td>
								<td>
									<b>Email:</b> {$infoStudent8.email}
								</td>
								<td>
									<b>Celular:</b> {$infoStudent8.phone}
								</td>
							</tr>
						</table>
						<hr><span class="badge badge-dark">Datos Laborales</span>
						<hr>
						<table class="table table-sm table-bordered table-striped">
							<tr>
								<td>
									<b>Ocupacion:</b> {$infoStudent8.workplaceOcupation}
								</td>
								<td>
									<b>Lugar de Trabajo:</b> {$infoStudent8.workplace}
								</td>
								<td>
									<b>Domicilio:</b> {$infoStudent8.workplaceAddress}
								</td>
							</tr>
							<tr>
								<td>
									<b>Pais:</b> {$infoStudent8.paisTrabajo}
								</td>
								<td>
									<b>Estado:</b> {$infoStudent8.estadoTrabajo}
								</td>
								<td>
									<b>Municipio:</b> {$infoStudent8.municipioTrabajo}
								</td>
							</tr>
							<tr>
								<td>
									<b>Area:</b> {$infoStudent8.workplaceArea}
								</td>
								<td>
									<b>Telefono de Oficina:</b> {$infoStudent8.workplacePhone}
								</td>
								<td>
									<b>Correo oficial:</b> {$infoStudent8.workplaceEmail}
								</td>
							</tr>
						</table>
						<hr><span class="badge badge-dark">Estudios</span>
						<hr>
						<table class="table table-sm table-bordered table-striped">
							<tr>
								<td>
									<b>Grado Academico:</b> {$infoStudent8.academicDegree}
								</td>
								<td>
									<b>Profesion:</b> {$infoStudent8.profesionName}
								</td>
								<td>
									<b>Escuela o Institución Universitaria:</b> {$infoStudent8.school}
								</td>
							</tr>
							<tr>
								<td>
									<b>Maestría en:</b> {$infoStudent8.masters}
								</td>
								<td>
									<b>Escuela o Institución Maestría:</b> {$infoStudent8.mastersSchool}
								</td>
								<td>
									<b>Escuela o Institución Bachillerato:</b> {$infoStudent8.highSchool}
								</td>
							</tr>
						</table>
					</div>
				</div>
			{/if}
		</div>
	</div>
	<div class="card-footer">
		<div id="load"></div>
		<div id="msj5"></div>
	</div>
</div>