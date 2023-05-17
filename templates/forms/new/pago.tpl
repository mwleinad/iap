<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Edición de pago
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form class="form row" action="{$WEB_ROOT}/ajax/new/conceptos.php" id="form_pago_modal" method="POST">
                    <input type="hidden" name="opcion" value="{$opcion}">
                    {if $opcion eq "actualizar-pago"}
                        <input type="hidden" name="pago" value="{$pago.pago_id}">
                    {else}
                        <div class="col-md-4 mb-3">
                            <label>Concepto</label>
                            <select class="form-control" id="concepto" name="concepto">
                                <option value="">--Seleccione un concepto--</option>
                                {foreach from=$conceptos.otros item=item}
                                    <option value="{$item.concepto_course_id}">{$item.concepto_nombre}</option>
                                {/foreach}
                            <select>
                        </div> 
                    {/if}
                    <div class="col-md-4 mb-3" id="seccion-costo">
                        <label for="costo">Costo</label>
                        <input type="text" class="form-control" name="costo" id="costo" value="{($edicion) ? $pago.subtotal : ""}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3 d-none" id="seccion-descuento">
                        <label for="descuento">Descuento</label>
                        <input class="form-control" id="descuento_total" readonly value="{($edicion) ? $pago.subtotal*($pago.beca/100) : ""}">
                    </div>
                    <div class="col-md-4 mb-3 d-none" id="seccion-total">
                        <label for="total">Total</label>
                        <input class="form-control" id="total" readonly value="{($edicion) ? $pago.total : ""}">
                    </div>
                    <div class="col-md-4 mb-3" id="seccion-fecha-cobro">
                        <label for="fecha_cobro">Fecha de cobro</label>
                        <input type="text" class="form-control i-calendar" name="fecha_cobro" id="fecha_cobro"
                            value="{($edicion) ? $pago.fecha_cobro : ""}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3" id="seccion-fecha-cobro">
                        <label for="fecha_limite">Fecha Límite</label>
                        <input type="text" class="form-control i-calendar" name="fecha_limite" id="fecha_limite"
                            value="{($edicion) ? $pago.fecha_limite : ""}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="fecha_pago">Fecha de pago</label>
                        <input type="text" class="form-control i-calendar" name="fecha_pago" id="fecha_pago"
                            value="{($edicion) ? $pago.fecha_pago : ""}">
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label>Periodo</label>
                        <input class="form-control" id="periodo" name="periodo" type="number" min="0" max="10" value="{($edicion) ? $pago.periodo : 0}">
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="descuento">¿Aplica Beca?</label>
                        <select class="form-control" id="descuento" name="descuento">
                            <option value="1">Sí</option>
                            <option value="0" {($edicion && $pago.descuento == 0) ? "selected" : ""}>No</option>
                        </select>
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-4 mb-3" id="seccion-beca">
                        <label for="beca">% de Beca</label>
                        <input type="number" min="0" max="100" class="form-control" name="beca" id="beca"
                            value="{($edicion) ? $pago.beca : 0}">
                        <span class="invalid-feedback"></span>
                    </div>
                    {if $edicion} 
                        <div class="col-md-4 mb-3">
                            <label for="estatus">Estatus del pago</label>
                            <select class="form-control" id="estatus" name="estatus">
                                <option value="1">Pendiente</option>
                                <option value="2" {($edicion && $pago.status == 2) ? "selected" : ""}>Pagado</option>
                                <option value="3" {($edicion && $pago.status == 3) ? "selected" : ""}>Prórroga</option>
                            </select>
                            <span class="invalid-feedback"></span>
                        </div>
                        <div class="col-md-4 mb-3 d-none" id="seccion-tolerancia">
                            <label for="tolerancia">Tolerancia(días)</label>
                            <input type="number" min="0" class="form-control" name="tolerancia" id="tolerancia"
                                value="{($edicion) ? $pago.tolerancia : ""}">
                            <span class="invalid-feedback"></span>
                        </div>
                    {/if}
                    <div class="col-md-12 text-center mb-3">
                        <button class="btn btn-success" type="submit">Guardar</button>
                        <a href="{$WEB_ROOT}/ajax/new/conceptos.php" data-data='"opcion":"pagos","curso":{($edicion) ? $pago.course_id : $curso},"alumno":{($edicion) ? $pago.alumno_id : $alumno}'
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
    descuento($("#descuento").val());
    estatus($("#estatus").val());

    $("#descuento").on("change", function() {
        descuento($(this).val());       
    });
    $("#estatus").on("change", function() {
        estatus($(this).val());
    });
    $("#beca,#costo").on("change keyup", function(){
        let subtotal = $("#costo").val();
        let descuento = subtotal * ($("#beca").val() / 100);
        let total = subtotal - descuento;
        $("#descuento_total").val(descuento);
        $("#total").val(total);
    });
    function descuento(descuento){
        if (descuento == 0) {
            $("#seccion-beca, #seccion-descuento, #seccion-total").addClass("d-none");
            $("#seccion-costo label").text("Costo");
            $("#beca").val(0);
        } else {
            $("#seccion-beca, #seccion-descuento, #seccion-total").removeClass("d-none");
            $("#seccion-costo label").text("Subtotal");
        }
    } 
    function estatus(estatus){
        console.log(estatus);
        if (estatus == 3) {
            $("#seccion-tolerancia").removeClass("d-none");
        } else {
            $("#seccion-tolerancia").addClass("d-none");
            $("#tolerancia").val(0);
        }
    }

    {if !$edicion} 
        var data = {$conceptos.otros|json_encode};
        $("#concepto").on("change", function(){
            if($(this).val() != ""){
                let index = $("#concepto :selected").index() - 1;
                let subtotal = data[index].total;
                let descuento = data[index].descuento;
                $("#costo").val(subtotal);
                $("#desceunto_total").val(0);
                $("#total")
            }
        }); 
    {/if}
</script>