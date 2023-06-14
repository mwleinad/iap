<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-money-check-alt"></i> Datos Fiscales
    </div>
    <form class="card-body row form" id="form_actualizar_regimen" action="{$WEB_ROOT}/ajax/new/finanzas.php">
        <input type="hidden" name="opcion" value="actualizar-datos-fiscales">
        <input type="hidden" name="dato_fiscal" value="{$datos_fiscales.id}">
        <div class="form-group col-md-4">
            <label for="regimen">Régimen Fiscal<span class="text-danger">*</span></label>
            <select class="form-control" id="regimen" name="regimen" required>
                <option value="">-- Seleccione un régimen fiscal --</option>
                {foreach from=$regimenes item=item}
                    <option value="{$item.id}" {($datos_fiscales.cfdi_tax_regime_id == $item.id) ? "selected" : ""}>
                        {$item.identifier} - {$item.name}</option>
                {/foreach}
            </select>
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="nombre_empresa">Razón social<span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="nombre_empresa" name="nombre_empresa"
                placeholder="Escriba aquí la razón social..." value="{$datos_fiscales.company_name}" required>
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="nombre_comercial">Nombre Comercial</label>
            <input type="text" class="form-control" id="nombre_comercial" name="nombre_comercial"
                value="{$datos_fiscales.commercial_name}" placeholder="Escriba aquí el nombre comercial...">
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="RFC">RFC<span class="text-danger">*</span></label>
            <input type="text" class="form-control" id="rfc" name="rfc" placeholder="Escriba aquí el RFC..." required value="{$datos_fiscales.rfc}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="telefono">Teléfono</label>
            <input type="text" class="form-control" id="telefono" name="telefono"
                placeholder="Escriba aquí el telefono..." value="{$datos_fiscales.phone}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="correo">Correo Electrónico</label>
            <input type="email" class="form-control" id="correo" name="correo" placeholder="Escriba aquí el correo..." value="{$datos_fiscales.email}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="form-group col-md-4">
            <label for="estado">Estado</label>
            <select class="form-control" id="estado" name="estado">
                <option value="">-- Seleccione el estado --</option>
                {foreach from=$estados item=item}
                    <option value="{$item.cve_ent}" {($item.cve_ent == $datos_fiscales.cve_ent) ? "selected" : ""}>{$item.nom_ent}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="municipio">Municipio</label>
            <div id="municipio-seccion">
                <select class="form-control" id="municipio" name="municipio">
                    <option value="">-- Seleccione el municipio --</option>
                    {foreach from=$municipios item=item}
                        <option value="{$item.cve_mun}" {($item.cve_mun == $datos_fiscales.cve_mun) ? "selected" : ""}>{$item.nom_mun}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-4">
            <label for="localidad">Localidad</label>
            <div id="localidad-seccion">
                <select class="form-control">
                    <option value="">-- Seleccione la localidad --</option>
                    {foreach from=$localidades item=item}
                        <option value="{$item.cve_loc}" {($item.cve_loc == $datos_fiscales.cve_loc) ? "selected" : ""}>{$item.nom_loc}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group col-md-4">
            <label for="calle">Calle</label>
            <input type="text" class="form-control" id="calle" name="calle" placeholder="Escriba aquí la calle..." value="{$datos_fiscales.street}">
        </div>
        <div class="form-group col-md-2">
            <label for="num_int">Num. Int.</label>
            <input type="text" class="form-control" id="num_int" name="num_int" placeholder="Número Interior..." value="{$datos_fiscales.int_number}">
        </div>
        <div class="form-group col-md-2">
            <label for="num_ext">Num. Ext</label>
            <input type="text" class="form-control" id="num_ext" name="num_ext" placeholder="Número Exterior..." value="{$datos_fiscales.ext_number}">
        </div>
        <div class="form-group col-md-2">
            <label for="codigo_postal">Código Postal<span class="text-danger">*</span></label>
            <input type="number" class="form-control" id="codigo_postal" min="0" name="codigo_postal" required
                placeholder="Código Postal..." value="{$datos_fiscales.zip_code}">
        </div>

        <div class="form-group col-md-12 text-center">
            <button class="btn btn-primary" type="submit">Guardar</button>
            <button class="btn btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
    </form>
</div>