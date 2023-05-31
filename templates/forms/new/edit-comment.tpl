<form id="form_respuesta" method="post" action="{$WEB_ROOT}/edit-comment/id/{$comentario.replyId}" class="form">
    <input type="hidden" id="replyId" name="replyId" value="{$comentario.replyId}" />
    <div class="form-group col-md-12">
        <label for="reply">Comentario:</label>
        <textarea name="reply" id="reply" class="form-control" required>{$comentario.content}</textarea>
    </div>
    <div class="form-group col-md-12">
        <label for="path">Subir imagen (solo formato jpg):</label>
        <input type="file" name="path" id="path" class="form-control" accept="image/jpg" />
    </div>
    <div class="col-md-12 text-center">
        <input type="submit" class="btn btn-primary" value="Enviar Comentario" />
    </div>
</form>