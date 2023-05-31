<form id="form_respuesta" method="post" action="{$WEB_ROOT}/add-comment/id/{$reply.replyId}"
    enctype="multipart/form-data" class="form">
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
    <input type="hidden" id="replyId" name="replyId" value="{$reply.replyId}" />
    <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}" />
    <input type="hidden" id="topicsubId" name="topicsubId" value="{$topicsubId}" />

    <div class="row">
        <div class="form-group col-md-12">
            <label for="reply">Comentario:</label>
            <textarea name="reply" id="replyModal" class="form-control" required></textarea>
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
            <input type="submit" class="btn btn-primary" value="Enviar Comentario" />
        </div>
    </div>
</form>

<script>
    var editor = new Jodit('#replyModal', {
        language: "es",
        toolbarButtonSize: "small",
        autofocus: true,
        toolbarAdaptive: false,
        limitChars: 2500,
        limitHTML: false
    });
</script>