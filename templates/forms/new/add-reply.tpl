<div class="col-md-12 mt-4">
    <form id="addNoticia" name="addNoticia" method="post" action="{$WEB_ROOT}/add-reply/id/{$moduleId}/topicsubId/{$topicsubId}" enctype="multipart/form-data">
        <input type="hidden" id="type" name="type" value="saveAddMajor" />
        <input type="hidden" id="topicsubId" name="topicsubId" value="{$topicsubId}" />
        <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}" />
        <div class="row">
            <div class="form-group col-md-12">
                <label for="reply">Aportación:</label>
                <textarea name="reply" id="reply" class="form-control"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label for="path">Subir Archivo:</label>
                <input type="file" name="path" id="path" class="form-control" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <input type="submit" class="btn btn-primary submitForm" id="addMajor" name="addMajor" value="Enviar Aportación"/>
            </div>
        </div>
    </form>
</div>