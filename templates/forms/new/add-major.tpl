{*<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <div class="form-row">
        <div class="form-group">
            <label for="name">Nombre:</label>
            <input type="text" name="name" id="name" class="form-control" placeholder="Nombre">
        </div>
    </div>
    <div class="form-row">
        <div class="form-group">
            <label for="description">Descripcion:</label>
            <textarea class="form-control" name="description" id="description" cols="50" rows="6"></textarea>
        </div>
    </div>
    <div class="form-group row text-center">
        <button type="button" class="btn green submitForm">Guardar</button>
        <button type="button" class="btn default closeModal">Cancelar</button>
    </div>
</form>*}

<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" placeholder="Nombre">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Descripcion:</label>
            <div class="col-md-8">
                <textarea class="form-control" name="description" id="description" cols="50" rows="6"></textarea>
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