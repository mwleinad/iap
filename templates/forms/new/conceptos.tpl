<div class="card">
    <div class="card-header bg-primary text-white">
        <h4>
            <i class="fas fa-money-check-alt"></i> {($edicion) ? "Edición de " : "Creación de "}Concepto
        </h4>
    </div>
    <form class="form row card-body" id="form_concepto_modal" action="{$WEB_ROOT}/ajax/new/conceptos.php" method="POST">
        <input type="hidden" name="opcion" value="{$opcion}">
        {if $edicion}
            <input type="hidden" name="conceptoId" value="{$concepto.concepto_id}">
        {/if}
        <div class="col-md-3 mb-3">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" name="nombre" id="nombre"
                value="{($edicion) ? $concepto.nombre : ""}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="input-group mb-3 col-md-3">
            <label for="costo" class="w-100">Costo</label>
            <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">$</span>
            </div>
            <input type="text" class="form-control money" name="costo" id="costo" placeholder="0.00" aria-label="costo"
                aria-describedby="basic-addon1" value="{($edicion) ? $concepto.total : ""}">
        </div>
        <div class="col-md-3 mb-3">
            <label for="beca">Aplica Beca</label>
            <select class="form-control" id="beca" name="beca">
                <option value="1">Sí</option>
                <option value="0" {($edicion && $concepto.descuento == 0) ? "selected" : ""}>No</option>
            </select>
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-3 mb-3">
            <label for="clave_sat">Clave SAT</label>
            <input type="text" class="form-control" name="clave_sat" id="clave_sat"
                value="{($edicion) ? $concepto.clave_sat : ""}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-3 mb-3">
            <label for="unidad_sat">Clave Unidad SAT</label>
            <input class="form-control" name="unidad_sat" id="unidad_sat"
                value="{($edicion) ? $concepto.unidad_sat : ""}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-3 mb-3">
            <label for="nombre_unidad_sat">Nombre Unidad SAT</label>
            <input class="form-control" name="nombre_unidad_sat" id="nombre_unidad_sat"
                value="{($edicion) ? $concepto.nombre_unidad_sat : ""}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-3 mb-3">
            <label class="cobros">Número de Cobros</label>
            <input type="number" class="form-control" min="0" step="1" name="cobros" id="cobros"
                value="{($edicion) ? $concepto.cobros : 0}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-3 mb-3 d-none" id="seccion_periodicidad">
            <label class="periodicidad">Periodicidad(en días)</label>
            <input type="number" class="form-control" min="0" step="1" name="periodicidad" id="periodicidad"
                value="{($edicion) ? $concepto.periodicidad : 0}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-3 mb-3 d-none" id="seccion_tolerancia">
            <label class="tolerancia">Tolerancia(en días)</label>
            <input type="number" class="form-control" min="0" step="1" name="tolerancia" id="tolerancia"
                value="{($edicion) ? $concepto.tolerancia : 0}">
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-12 mb-3 text-center">
            <button type="submit" class="btn btn-success">{($edicion) ? "Actualizar" : "Guardar"}</button>
            <button class="btn btn-danger" type="button" data-dismiss="modal">Cerrar</button>
        </div>
    </form>
</div>
<script>
    opcion($("#cobros").val());
    $("#cobros").on("change", function() {
        opcion($(this).val());
    });

    function opcion(valor) {
        if (valor > 0) {
            $("#seccion_periodicidad, #seccion_tolerancia, #seccion_inicio").removeClass("d-none");
        }
        if (valor == 0) {
            $("#seccion_periodicidad, #seccion_inicio, #seccion_tolerancia").addClass("d-none");
            $("#periodicidad").val(0);
        }
    }
</script>