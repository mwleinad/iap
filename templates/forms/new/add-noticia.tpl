<form id="addNoticia" name="addNoticia" method="post" action="{$WEB_ROOT}/add-noticia/id/{$id}">
    <input type="hidden" id="type" name="type" value="addNoticia" />
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
    <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
    <input type="hidden" id="courseModuleId" name="courseModuleId" value="{$id}" />
    <input type="hidden" id="courseModuleId2" name="courseModuleId2" value="{$infos.courseModuleId}" />
    <input type="hidden" id="announcementId" name="announcementId" value="{$infos.announcementId}" />
    <div class="row">
        <div class="form-group col-md-12">
            <label for="title">Noticia:</label>
            <input type="text" name="title" id="title" value="{$infos.title}" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="description">Descripcion:</label>
            <textarea name="description" id="description" cols="30" class="form-control">{$infos.description}</textarea>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <input type="submit" class="btn btn-success input-loading submitForm" data-id="input-loading" data-form="addNoticia" id="addMajor" name="addMajor" />
            <button type="button" class="btn btn-danger closeModal">Cancelar</button>
        </div>
        <div id="input-loading" class="col-md-12 text-center"></div>
    </div>
</form>
<script>
    var editor = new Jodit('#description', {
        language: "es",
        toolbarButtonSize: "small",
        autofocus: true,
        toolbarAdaptive: false
    });
</script>