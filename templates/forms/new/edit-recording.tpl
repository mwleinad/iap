<form id="editRecordingForm" name="editRecordingForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditRecording" />
    <input type="hidden" id="recordingId" name="recordingId" value="{$post.recordingId}" />
    <div class="row">
        <div class="form-group col-md-6">
            <label for="embed">Grabación ID:</label>
            <input type="text" name="embed" id="embed" class="form-control" value="{$post.embed}" />
        </div>
        <div class="form-group col-md-6">
            <label for="title">Título:</label>
            <input type="text" name="title" id="title" class="form-control" value="{$post.title}" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-success submitForm">Guardar</button>
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
    </div>
</form>