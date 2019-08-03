<!-- TinyMCE
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
<!-- /TinyMCE -->

<form class="form-horizontal" id="addMajorForm" name="addMajorForm" method="post" action="{$WEB_ROOT}/unsubscribe">

    <input type="hidden" id="type" name="type" value="saveMotivo"/>
    <div class="form-body">


        <div class="form-group">
            <label class="col-md-3 control-label">Motivo:</label>
            <div class="col-md-8">
                <textarea name="motivo" id="motivo" class="form-control"></textarea>
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <input type="submit" class="btn {$BUTTON_COLOR} submitForm" id="addMajor" name="addMajor"/>
                    <button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>
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
