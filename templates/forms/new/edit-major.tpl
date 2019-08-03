<form class="form-horizontal" id="editMajorForm" name="editMajorForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditMajor"/>
    <input type="hidden" id="majorId" name="majorId" value="{$post.majorId}"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" placeholder="Nombre"  value="{$post.name}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Descripcion:</label>
            <div class="col-md-8">
                <textarea class="form-control" name="description" id="description" cols="50" rows="6">{$post.description}</textarea>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn {$BUTTON_COLOR} submitForm">Guardar</button>
                <button type="button" class="btn default closeModal">Cancelar</button>
            </div>
        </div>
    </div>
</form>