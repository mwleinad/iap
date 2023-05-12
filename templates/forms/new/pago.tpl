<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Edición de pago
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form class="form row" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="form_pago_modal" method="POST">
                    <input type="hidden" name="opcion" value="actualizar-pago">
                    <input type="hidden" name="pago" value="{$pago.pago_id}">
                    <div class="col-md-4 mb-3">
                        <label for="costo">Costo</label>
                        <input type="text" class="form-control" name="costo" id="costo" value="{$pago.total}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="fecha_cobro">Fecha de cobro</label>
                        <input type="text" class="form-control i-calendar" name="fecha_cobro" id="fecha_cobro" value="{$pago.fecha_cobro}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="fecha_limite">Fecha Límite</label>
                        <input type="text" class="form-control i-calendar" name="fecha_limite" id="fecha_limite" value="{$pago.fecha_limite}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="fecha_pago">Fecha de pago</label>
                        <input type="text" class="form-control i-calendar" name="fecha_pago" id="fecha_pago" value="{$pago.fecha_pago}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="descuento">¿Aplica Beca?</label>
                        <select class="form-control" id="descuento" name="descuento">
                            <option value="1">Sí</option>
                            <option value="0" {($pago.descuento == 0) ? "selected" : ""}>No</option>
                        </select>
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="beca">% de Beca</label>
                        <input type="number" min="0" max="100" class="form-control" name="beca" id="beca" value="{$pago.beca}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="estatus">Estatus del pago</label>
                        <select class="form-control" id="estatus" name="estatus">
                            <option value="1">Pendiente</option>
                            <option value="2" {($pago.descuento == 2) ? "selected" : ""}>Pagado</option>
                            <option value="3" {($pago.descuento == 3) ? "selected" : ""}>Prórroga</option>
                        </select>
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3 d-none" id="seccion-tolerancia">
                        <label for="tolerancia">Tolerancia(días)</label>
                        <input type="number" min="0" class="form-control" name="tolerancia" id="tolerancia" value="{$pago.tolerancia}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-12 text-center mb-3">
                        <button class="btn btn-success" type="submit">Guardar</button>
                        <a href="{$WEB_ROOT}/ajax/new/conceptos.php" data-data='"opcion":"pagos","pago":{$pago.pago_id}' class="btn btn-danger ajax_sin_form">Regresar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
    $("#estatus").on("trigger", "change");
    $("#estatus").on("change", function(){
        if($(this).val() == 3){
            $("#seccion-tolerancia").removeClass("d-none");
        }else{
            $("#seccion-tolerancia").addClass("d-none");
        }
    });
</script>