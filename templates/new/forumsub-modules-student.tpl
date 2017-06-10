<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Foro {$asunto}
        </div>
        <div class="actions">
            {if $positionId != 0}
                <a href="{$WEB_ROOT}/edit-modules-course/id/{$id}">Regresar</a>
            {else}
                <a href="{$WEB_ROOT}/forum-modules-student/id/{$id}">Regresar</a>
            {/if}
            {if ($asunto== "Foro de Discusion") && ($User.type == "student")}
            {else} |
                <a href="{$WEB_ROOT}/graybox.php?page=add-topic&id={$topicId}&cId={$id}" data-target="#ajax" data-toggle="modal">
                    <span class="btnAdd" id="btnAddSubject">Agregar</span>
                </a>
            {/if}

        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent" class="content-in">
            {include file="boxes/status_no_ajax.tpl"}
            <div id="tblContent">{include file="lists/topicsub.tpl"}</div>
            <br />
            {if $coursesCount}
                <div id="pagination" class="lnkPages">
                    {include file="footer-pages-links.tpl"}
                </div>
            {/if}
        </div>
    </div>
</div>
<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />


