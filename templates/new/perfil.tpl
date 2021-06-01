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
    <div class="card-body">
		<form id="frmFoto">
			<input type="hidden" name="userId" class="form-control" value="{$info.userId}" />
			<div class="form-group col-md-12 text-center">
				<div class="profile-userpic">
					<img src="{{$infoStudent.imagen}}?{$rand}" class="img-fluid img-thumbnail rounded-circle" alt="" />
				</div>
				<div class="row d-flex justify-content-center mt-3">
					<span class="btn btn-outline-info btn-file pointer">
						<input type="file" name="archivos" id="archivos" onChange="onChangePicture({$info.userId})" class="btn-file" style="border: 0px solid !important">
						<i class="fas fa-edit fa-lg"></i>
					</span>
				</div>
			</div>
		</form>
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