<form class="form-horizontal" id="editPositionForm" name="editPositionForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditPosition"/>
    <input type="hidden" id="positionId" name="positionId" value="{$post.profesionId}"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.profesionName}">
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn green submitForm">Guardar</button>
                <button type="button" class="btn default closeModal">Cancelar</button>
            </div>
        </div>
    </div>
</form>