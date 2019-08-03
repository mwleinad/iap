<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Currícula
        </div>
        <div class="actions">
            <a class=" btn {$BUTTON_COLOR}" href="{$WEB_ROOT}/graybox.php?page=new-subject" data-target="#ajax" data-toggle="modal">
                <i class="fa fa-plus"></i>Agregar
            </a>
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">{include file="lists/new/subject.tpl"}</div>
    </div>
</div>

