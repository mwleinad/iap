<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>
        </div>
       
    </div>
    <div class="portlet-body">
	
	<center>
	<div class="profile-userpic">
		<img src="{{$infoStudent8.imagen}}" class="img-responsive" style=" 
			width: 19%;
			height: 19%;
			-webkit-border-radius: 10%!important;
			-moz-border-radius: 10%!important;
			border-radius: 10%!important;"> 
	</div>
	</center>
	<br>
	<br>
	<br>
	<b><center><font style="font-size:11px">{$infoStudent8.names|upper} {$infoStudent8.lastNamePaterno|upper}  {$infoStudent8.lastNameMaterno|upper}</font></center></b>
	<br>
	
	<div class="tabbable portlet-tabs">
		<ul class="nav nav-tabs">
			<li class="active">	
				<a href="#portlet_tabp_1" data-toggle="tab">Perfil</a>
			</li>
			{if $userPerfil eq 'Administrador' || $userPerfil eq 'Docente'}
			<li >	
				<a href="#portlet_tabp_5" data-toggle="tab">Información</a>
			</li>
			{/if}
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="portlet_tabp_1">
				<center>{$infoStudent8.perfil}</center>
			</div>
			{if $userPerfil eq 'Administrador' || $userPerfil eq 'Docente'}
			<div class="tab-pane" id="portlet_tabp_5">
				<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
						<tr>
							<td ><b>Fecha De Nacimiento:</b>
								{$infoStudent8.birthdate}</td>
							<td><b>Email:</b>
								{$infoStudent8.email}
							<td><b>Celular</b>
								{$infoStudent8.phone}
						</tr>
				</table>
				<b>	Datos Laborales</b>
				<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
						<tr>
							<td ><b>Ocupacion:</b>
								{$infoStudent8.workplaceOcupation}</td>
							<td><b>Lugar de Trabajo:</b>
								{$infoStudent8.workplace}
							<td><b>Domicilio</b>
								{$infoStudent8.workplaceAddress}
						</tr>
						<tr>
							<td ><b>Pais:</b>
								{$infoStudent8.paisTrabajo}</td>
							<td><b>Estado:</b>
								{$infoStudent8.estadoTrabajo}
							<td><b>Municipio</b>
								{$infoStudent8.municipioTrabajo}
						</tr>
						<tr>
							<td ><b>Area:</b>
								{$infoStudent8.workplaceArea}</td>
							<td><b>Telefono de Oficina:</b>
								{$infoStudent8.workplacePhone}
							<td><b>Correo oficial</b>
								{$infoStudent8.workplaceEmail}
						</tr>
				</table>
				<b>Estudios</b>
				<table width="100%" class="tblGral table table-bordered table-striped table-condensed flip-content">
						<tr>
							<td ><b>Grado Academico:</b>
								{$infoStudent8.academicDegree}</td>
							<td><b>Profesion:</b>
								{$infoStudent8.profesionName}
							<td><b>Escuela o Institución Universitaria</b>
								{$infoStudent8.school}
						</tr>
						<tr>
							<td ><b>Maestría en:</b>
								{$infoStudent8.masters}</td>
							<td><b>Escuela o Institución Maestría:</b>
								{$infoStudent8.mastersSchool}
							<td><b>Escuela o Institución Bachillerato</b>
								{$infoStudent8.highSchool}
						</tr>
						
				</table>
			</div>
			{/if}

		</div>
	</div>

	
		
	<div id="load"></div>
		<div id="msj5"></div>
	
    </div>
</div>