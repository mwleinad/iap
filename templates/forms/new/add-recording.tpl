<form id="addRecordingForm" name="addRecordingForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddRecording" />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="embed">Grabación ID:</label>
            <input type="text" name="embed" id="embed" class="form-control" placeholder="Grabación ID" />
        </div>
        <div class="form-group col-md-6">
            <label for="title">Título:</label>
            <input type="text" name="title" id="title" class="form-control" placeholder="Título" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-success submitForm">Guardar</button>
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>