<!-- TinyMCE -->
<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>


<form class="form-horizontal" id="addNoticia" name="addNoticia" method="post" action="{$WEB_ROOT}/add-comment/id/{$reply.replyId}" enctype="multipart/form-data">
    <input type="hidden" id="type" name="type" value="saveAddMajor"/>
    <input type="hidden" id="replyId" name="replyId" value="{$reply.replyId}"/>
    <input type="hidden" id="moduleId" name="moduleId" value="{$moduleId}"/>
    <input type="hidden" id="topicsubId" name="topicsubId" value="{$topicsubId}"/>

    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Comentario:</label>
            <div class="col-md-8">
                <textarea name="reply" id="reply" class="form-control"></textarea>
            </div>
        </div>

        <!--
   {if $anexoforo}
    file="{$WEB_ROOT}/anexoforo/{$anexoforo.path}&mime={$anexoforo.mime}"
  {/if}
  -->

        <div class="form-group">
            <label class="col-md-3 control-label">Subir imagen (solo formato jpg):</label>
            <div class="col-md-8">
                <input type="file" name="path" id="path" class="form-control" />
            </div>
        </div>

        <div class="form-actions">
            <div class="row">
                <div class="col-md-offset-3 col-md-9">
                    <input type="submit" class="btn {$BUTTON_COLOR} submitForm" id="addMajor" name="addMajor" value="Enviar Comentario"/>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7",
        plugins : "paste",
        theme_advanced_buttons3_add : "pastetext,pasteword,selectall",
        paste_auto_cleanup_on_paste : true,
        paste_preprocess : function(pl, o) {
            // Content string containing the HTML from the clipboard
            o.content = "-: CLEANED :-\n" + o.content;
        },
        paste_postprocess : function(pl, o) {
            // Content DOM node containing the DOM structure of the clipboard
            o.node.innerHTML = o.node.innerHTML + "\n-: CLEANED :-";
        }


    });
</script>