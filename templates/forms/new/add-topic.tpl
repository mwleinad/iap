<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->

<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post" action="{$WEB_ROOT}/add-topic/id/{$topicId}/cId/{$cId}">
    <input type="hidden" id="topicId" name="topicId" value="{$topicId}"/>
    <input type="hidden" id="userId" name="userId" value="{$userId}"/>
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Asunto:</label>
            <div class="col-md-8">
                <input type="text" name="subject" id="subject" value="{$name}" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Descripcion:</label>
            <div class="col-md-8">
                <textarea name="reply" id="reply" class="form-control"></textarea>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <input type="submit" class="btn green submitForm" id="addMajor" name="addMajor"/>
                    {*
                                        <button type="submit" class="btn green submitForm">Guardar</button>
                    *}
                    <button type="button" class="btn default closeModal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>
