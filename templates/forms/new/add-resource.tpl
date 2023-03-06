<form id="addMajorForm" name="addMajorForm" method="post" action="{$WEB_ROOT}/add-resource/id/{$id}" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
	<input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
	<input type="hidden" id="cId" name="cId" value="{$cId}" />
    <div class="row">
        <div class="form-group col-md-8">
            <label for="name">Nombre:</label>
            <input type="text" name="name" id="name" class="form-control" />
        </div> 
        <div class="form-group col-4">
            <label for="semena">Semana de utilización</label>
            <input type="number" class="form-control" id="semana" name="semana"  />
        </div> 
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="description">Descripcion:</label>
            <textarea name="description" id="description" class="form-control" rows="20"></textarea>
        </div>
    </div> 
    <div class="row">
        <div class="form-group col-md-12">
            <label for="path">Archivo:</label>
            <input type="file" name="path" id="path" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <input type="submit" class="btn btn-success submitForm" id="addMajor" name="addMajor" />
            <button type="button" class="btn btn-danger closeModal" data-dismiss="modal">Cancelar</button>
        </div>
    </div>
</form>