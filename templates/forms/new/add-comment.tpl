<form id="addNoticia" name="addNoticia" method="post" action="{$WEB_ROOT}/add-comment/id/{$reply.replyId}" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
    <input type="hidden" id="replyId" name="replyId" value="{$reply.replyId}" />
    <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}" />
    <input type="hidden" id="topicsubId" name="topicsubId" value="{$topicsubId}" />

    <div class="row">
        <div class="form-group col-md-12">
            <label for="reply">Comentario:</label>
            <textarea name="reply" id="reply" class="form-control"></textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="path">Subir imagen (solo formato jpg):</label>
            <input type="file" name="path" id="path" class="form-control" accept="image/jpg" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <input type="submit" class="btn btn-primary submitForm" id="addMajor" name="addMajor" value="Enviar Comentario" />
        </div>
    </div>
</form>