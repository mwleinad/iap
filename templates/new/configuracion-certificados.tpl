<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-city"></i>
        </span>
        Datos Generales de los Certificados
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>Configuración
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>
<div class="card mb-4">
    <div class="card-body">
        <form class="form row" action="{$WEB_ROOT}/ajax/new/setting-certificate.php" id="form_settings">
            <div class="col-md-12">
                <h4>Datos del Rector(a)<span class="text-danger">*</span></h4>
            </div>
            <div class="form-group col-md-8">
                <label for="rName">Nombre</label>
                <input type="text" name="rName" id="rName" class="form-control text-uppercase" required value="{$setting['rector']}">
            </div>
            <div class="form-group col-md-4">
                <label for="rGender">Género</label>
                <select id="rGender" name="rGener" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F" {if $setting['genre_rector'] == 2}selected{/if}>Femenino</option>
                </select>
            </div>
            <div class="col-md-12">
                <h4>Datos del Secretario(a) Académico</h4>
            </div>
            <div class="form-group col-md-8">
                <label for="saName">Nombre</label>
                <input type="text" name="saName" id="saName" class="form-control text-uppercase" required value="{$setting['secretary']}">
            </div>
            <div class="form-group col-md-4">
                <label for="saGender">Género</label>
                <select id="saGender" name="saGener" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F" {if $setting['genre_scretary'] == 2}selected{/if}>Femenino</option>
                </select>
            </div>
            <div class="col-md-12">
                <h4>Datos del Jefe(a) del Departamento de Servicios Escolares</h4>
            </div>
            <div class="form-group col-md-8">
                <label for="jdseName">Nombre</label>
                <input type="text" name="jdseName" id="jdseName" class="form-control text-uppercase" required value="{$setting['school_services']}">
            </div>
            <div class="form-group col-md-4">
                <label for="jdseGender">Género</label>
                <select id="jdseGender" name="jdseGener" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F" {if $setting['genre_school'] == 2}selected{/if}>Femenino</option>
                </select>
            </div>

            <div class="col-md-12">
                <h4>Datos del Director(a) de Educación Superior</h4>
            </div>
            <div class="form-group col-md-8">
                <label for="desName">Nombre</label>
                <input type="text" name="desName" id="desName" class="form-control text-uppercase" required value="{$setting['director_education']}">
            </div>
            <div class="form-group col-md-4">
                <label for="desGender">Género</label>
                <select id="desGender" name="desGener" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F" {if $setting['genre_director'] == 2}selected{/if}>Femenino</option>
                </select>
            </div>
            <div class="col-md-12">
                <h4>Datos del Coordinador(a) de Asuntos Jurídicos de Gobierno</h4>
            </div>
            <div class="form-group col-md-8">
                <label for="cajgName">Nombre</label>
                <input type="text" name="cajgName" id="cajgName" class="form-control text-uppercase" required value="{$setting['coordinator']}">
            </div>
            <div class="form-group col-md-4">
                <label for="cajgGender">Género</label>
                <select id="cajgGender" name="cajgGener" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F" {if $setting['genre_coordinator'] == 2}selected{/if}>Femenino</option>
                </select>
            </div>
            <div class="col-md-12">
                <h4>Datos de la Persona que Cotejó</h4>
            </div>
            <div class="form-group col-md-12">
                <label for="cName">Nombre</label>
                <input type="text" name="cName" id="cName" class="form-control text-uppercase" required value="{$setting['comparison']}">
            </div>

            <div class="col-md-12">
                <h4>Datos del Jefe(a) de la Oficina</h4>
            </div>
            <div class="form-group col-md-8">
                <label for="joName">Nombre</label>
                <input type="text" name="joName" id="joName" class="form-control text-uppercase" required value="{$setting['head_office']}">
            </div>
            <div class="form-group col-md-4">
                <label for="joGender">Género</label>
                <select id="joGender" name="joGener" class="form-control">
                    <option value="M">Masculino</option>
                    <option value="F" {if $setting['genre_head'] == 2}selected{/if}>Femenino</option>
                </select>
            </div>
            <div class="form-group col-md-12 text-center"> 
                <button type="submit" class="btn btn-success submitForm">Guardar</button>
            </div>
        </form>
    </div>
</div>