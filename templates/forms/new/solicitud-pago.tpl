<div class="card">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-cogs"></i> {($edicion) ? "Edición" : "Subida "} de archivo
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <form class="form row" action="{$WEB_ROOT}/ajax/new/finanzas.php" id="form_pago_modal" method="POST">
                    <input type="hidden" name="opcion" value="{$opcion}">
                    <input type="hidden" name="pago" value="{$pago}">
                    <div class="col-md-12 mb-3">
                        <label>Archivo<span class="text-danger">*</span>(<small>PDF</small>)</label>
                        <input type="file" class="form-control" id="archivo" name="archivo">
                    </div>
                    <div class="col-md-12 text-center">
                        <button class="btn btn-success" type="submit">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>