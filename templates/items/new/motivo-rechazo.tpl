<div class="card">
    <div class='modal-title text-center mt-3'>
        <h1>Motivo del rechazo de la credencial</h1>
    </div>

    <form class="modal-body form" action="{$WEB_ROOT}/ajax/new/credenciales.php" method="POST" id="form_rechazo">
        <input type="hidden" name="opcion" value="rechazar">
        <input type="hidden" name="credencial" value="{$credencial}">
        <div class="col-md-6 mb-3 mx-auto">
            <textarea class="form-control" rows="10" id="rechazo" name="rechazo" placeholder="Introduzca aquí el motivo..."></textarea>
            <span class="invalid-feedback"></span>
        </div>
        <div class="col-md-12 text-center">
            <button class="btn btn-success" type="submit">Rechazar foto</button>
            <button class="btn btn-danger" type="button" data-dismiss="modal">Cancelar</button>
        </div>
    </form>
</div>