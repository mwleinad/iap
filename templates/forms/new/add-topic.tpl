<form id="addMajorForm" name="addMajorForm" method="post" action="{$WEB_ROOT}/add-topic/id/{$topicId}/cId/{$cId}">
    <input type="hidden" id="topicId" name="topicId" value="{$topicId}" />
    <input type="hidden" id="userId" name="userId" value="{$userId}" />
    <input type="hidden" id="type" name="type" value="saveAddMajor" />
    <div class="row">
        <div class="form-group col-md-12">
            <label for="subject">Asunto:</label>
            <input type="text" name="subject" id="subject" value="{$name}" class="form-control" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="reply">Descripcion:</label>
            <textarea name="reply" id="reply" class="form-control"></textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <input type="submit" class="btn btn-success submitForm" id="addMajor" name="addMajor" />
            <button type="button" class="btn btn-danger closeModal" onClick="btnClose()">Cancelar</button>
        </div>
    </div>
</form>

<script type="text/javascript">
    var editor = new Jodit('#reply', {
		language: "es",
		toolbarButtonSize: "small",
		autofocus: true,
		toolbarAdaptive: false
	});
</script>