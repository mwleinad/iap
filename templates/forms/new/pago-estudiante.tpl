<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> Solicitud de pago
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form class="form row" action="{$WEB_ROOT}/ajax/new/finanzas.php" id="form_pago_modal" method="POST">
                    <input type="hidden" name="alumno" value="{$alumno}">
                    <input type="hidden" name="curso" value="{$curso}">
                    <input type="hidden" name="opcion" value="guardar-pago">
                    <div class="col-md-12 mb-3">
                        <label>Concepto</label>
                        <select class="form-control" id="concepto" name="concepto">
                            <option value="">--Seleccione un concepto--</option>
                            {foreach from=$conceptos.otros item=item}
                                <option value="{$item.concepto_course_id}">{$item.concepto_nombre}</option>
                            {/foreach}
                        </select>
                        <span class="invalid-feedback"></span>
                    </div>
                    <div class="col-md-12 text-center">
                        <button class="btn btn-primary" type="submit">Solicitar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>