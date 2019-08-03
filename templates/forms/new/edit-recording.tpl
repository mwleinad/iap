<form class="form-horizontal" id="editRecordingForm" name="editRecordingForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditRecording"/>
    <input type="hidden" id="recordingId" name="recordingId" value="{$post.recordingId}"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Grabación ID:</label>
            <div class="col-md-8">
                <input type="text" name="embed" id="embed" class="form-control" value="{$post.embed}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Título:</label>
            <div class="col-md-8">
                <input type="text" name="title" id="title" class="form-control" value="{$post.title}">
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