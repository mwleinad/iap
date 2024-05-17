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
	<div class="card-header text-right">
		<a class="btn btn-primary" href="https://iapchiapas.edu.mx/aviso_privacidad" target="_blank" title="Aviso de Privacidad">
			<i class ="fas fa-user-secret"></i> Aviso de Privacidad
		</a>
	</div>
    <div class="card-body">
		<div class="row">
			<div class="col-md-12 text-center">
				<p class="text-primary"><i>Cuéntanos mas acerca de ti, incluye datos como edad, formación académica y profesional, intereses personales y algunos aspectos que permitan a tus compañeros conocerte.</i></p>
				<p class="text-primary"><i>(Esta información será visible para tu asesor y demás compañeros)</i></p>
			</div>
		</div>
		<form id="frmGral">
			<input type="hidden" name="type" value="onSavePerfil" />
			<div class="row">
				<div class="form-group col-md-12">
					<textarea name="desc" id="desc" class="form-control">{$info.perfil}</textarea>
				</div>
			</div>
		</form>
		<div class="row">
			<div class="form-group col-md-12 text-center">
				<button class="btn btn-outline-primary" type="button" onClick="onSavePerfil()">Guardar</button>
			</div>
		</div>
    </div>
</div>