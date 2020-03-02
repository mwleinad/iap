<form class="form-horizontal" id="addRecordingForm" name="addRecordingForm" method="post">
    <input type="hidden" id="type" name="type" value="saveAddRecording"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Grabación ID:</label>
            <div class="col-md-8">
                <input type="text" name="embed" id="embed" class="form-control" placeholder="Grabación ID">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Título:</label>
            <div class="col-md-8">
                <input type="text" name="title" id="title" class="form-control" placeholder="Título">
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