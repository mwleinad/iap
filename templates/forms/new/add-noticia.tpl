<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->

<form class="form-horizontal" id="addNoticia" name="addNoticia" method="post" action="{$WEB_ROOT}/add-noticia/id/{$id}">
    <input type="hidden" id="type" name="type" value="addNoticia"/>
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}"/>
    <input type="hidden" id="courseModuleId" name="courseModuleId" value="{$id}"/>
    <input type="hidden" id="courseModuleId2" name="courseModuleId2" value="{$infos.courseModuleId}"/>
    <input type="hidden" id="announcementId" name="announcementId" value="{$infos.announcementId}"/>

    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Noticia:</label>
            <div class="col-md-8">
                <input type="text" name="title" id="title" value="{$infos.title}" class="form-control" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Descripcion:</label>
            <div class="col-md-8">
                <textarea name="description" id="description" value="" cols="30" class="form-control">{$infos.description}</textarea>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <input type="submit" class="btn {$BUTTON_COLOR} submitForm" id="addMajor" name="addMajor"/>
                    {*
                                        <button type="submit" class="btn {$BUTTON_COLOR} submitForm">Guardar</button>
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
