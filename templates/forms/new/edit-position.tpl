<form id="editPositionForm" name="editPositionForm" method="post">
    <input type="hidden" id="positionId" name="positionId" value="{$post.positionId}" />
    <input type="hidden" id="type" name="type" value="saveEditPosition" />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="frmClave">Clave:</label>
            <input type="text" name="frmClave" id="frmClave" class="form-control" value="{$post.clave}" />
        </div>
        <div class="form-group col-md-6">
            <label for="frmName">Nombre:</label>
            <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.name}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="frmDescription">Descripcion:</label>
            <textarea class="form-control" name="frmDescription" id="frmDescription" cols="50" rows="6">{$post.description}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-success submitForm">Guardar</button>
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>
