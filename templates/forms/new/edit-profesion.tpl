<form id="editPositionForm" name="editPositionForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditPosition" />
    <input type="hidden" id="positionId" name="positionId" value="{$post.profesionId}" />
    <div class="row">
        <div class="form-group col-md-12">
            <label for="frmName">Nombre:</label>
            <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.profesionName}">
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-success submitForm">Guardar</button>
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>