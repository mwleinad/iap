<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Generación de cobro
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form class="form row" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="form_pago_modal" method="POST" data-alerta="true">
                    <input type="hidden" name="opcion" value="{$opcion}">
                    <input type="hidden" name="pago" value="{$pago.pago_id}">
                    <div class="form-group col-md-4">
                        <label>Monto pagado</label>
                        <input type="number" class="form-control" id="monto" name="monto" max="{$pago.total}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Monto a pagar</label>
                        <input type="number" class="form-control" id="monto_pagado" readonly value="{$pago.total}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Monto restante</label>
                        <input type="number" class="form-control" id="monto_restante" readonly value="{$pago.total}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Fecha de pago</label>
                        <input type="text" class="form-control i-calendar" id="fecha_pago" readonly value="{date('Y-m-d')}" name="fecha_pago">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-12 text-center mb-3">
                        <button class="btn btn-success" type="submit">{($edicion) ? "Actualizar" : "Guardar"}</button>
                        <a href="{$WEB_ROOT}/ajax/new/conceptos.php"
                            data-data='"opcion":"pagos","curso":{$pago.course_id},"alumno":{$pago.alumno_id}'
                            class="btn btn-danger ajax_sin_form">Regresar</a>
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
    $("#monto").on("change keyup", function() {
        let monto = $("#monto").val();
        let total = $("#monto_pagado").val();
        let restante = total - monto; 
        $("#monto_restante").val(restante);
    });
</script>