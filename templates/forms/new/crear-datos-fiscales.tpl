<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-money-check-alt"></i> Datos Fiscales
    </div>
    <form class="card-body row form" id="form_guardar_regimen" action="{$WEB_ROOT}/ajax/new/finanzas.php">
        <input type="hidden" name="opcion" value="guardar-datos-fiscales">
        <div class="form-group col-md-4">
            <label for="regimen">Régimen Fiscal<span class="text-danger">*</span></label>
            <select class="form-control" id="regimen" name="regimen" required>
                <option value="">-- Seleccione un régimen fiscal --</option>
                {foreach from=$regimenes item=item}
                    <option value="{$item.id}">{$item.identifier} - {$item.name}</option>
                {/foreach}
            </select>
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="nombre_empresa">Razón social<span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="nombre_empresa" name="nombre_empresa"
                placeholder="Escriba aquí la razón social..." required>
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="nombre_comercial">Nombre Comercial</label>
            <input type="text" class="form-control" id="nombre_comercial" name="nombre_comercial"
                placeholder="Escriba aquí el nombre comercial...">
            <span class="invalid-feedback"></span>
        </div> 
        <div class="form-group col-md-4">
            <label for="RFC">RFC<span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="rfc" name="rfc" placeholder="Escriba aquí el RFC..." required>
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="telefono">Teléfono</label>
            <input type="text" class="form-control" id="telefono" name="telefono"
                placeholder="Escriba aquí el telefono...">
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="correo">Correo Electrónico</label>
            <input type="email" class="form-control" id="correo" name="correo" placeholder="Escriba aquí el correo...">
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="estado">Estado</label>
            <select class="form-control" id="estado" name="estado">
                <option value="">-- Seleccione el estado --</option>
                {foreach from=$estados item=item}
                    <option value="{$item.cve_ent}">{$item.nom_ent}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="municipio">Municipio</label>
            <div id="municipio-seccion">
                <select class="form-control">
                    <option value="">-- Seleccione el municipio --</option>
                </select>
            </div>
        </div>
        <div class="form-group col-md-4">
            <label for="localidad">Localidad</label>
            <div id="localidad-seccion">
                <select class="form-control">
                    <option value="">-- Seleccione la localidad --</option>
                </select>
            </div>
        </div>
        <div class="form-group col-md-4">
            <label for="calle">Calle</label>
            <input type="text" class="form-control" id="calle" name="calle" placeholder="Escriba aquí la calle...">
        </div>
        <div class="form-group col-md-2">
            <label for="num_int">Num. Int.</label>
            <input type="text" class="form-control" id="num_int" name="num_int" placeholder="Número Interior...">
        </div>
        <div class="form-group col-md-2">
            <label for="num_ext">Num. Ext</label>
            <input type="text" class="form-control" id="num_ext" name="num_ext" placeholder="Número Exterior...">
        </div>
        <div class="form-group col-md-2">
            <label for="codigo_postal">Código Postal<span class="text-danger">*</span></label>
            <input type="number" class="form-control" id="codigo_postal" min="0" name="codigo_postal" required placeholder="Código Postal...">
        </div>

        <div class="form-group col-md-12 text-center">
            <button class="btn btn-primary" type="submit">Guardar</button>
            <button class="btn btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
    </form>
</div>