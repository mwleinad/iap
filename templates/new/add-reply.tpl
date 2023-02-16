<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-bullhorn"></i> Tópico {$topic.nombre}
        <div class="col-md-12 text-right">
            <a href="{$WEB_ROOT}/forumsub-modules-student/id/{$id}/topicId/{$topic.topicId}" class="btn btn-outline-light btn-sm">
                <i class="fas fa-arrow-circle-left"></i> Regresar
            </a>
            <a href="javascript:void(0)" onClick="updateForo()" class="btn btn-outline-light btn-sm">
                <i class="fas fa-sync-alt"></i> Actualizar
            </a>
        </div>
    </div>
    <div class="card-body">
        <div id="tblContent">
            {include file="boxes/status_no_ajax.tpl"}
            <form id="frmForo">
                <input type="hidden" name="topicsubId" value="{$topicsubId}" />
                <input type="hidden" name="positionId" value="{$positionId}" />
                <input type="hidden" name="id" value="{$id}" />
            </form>
            <div id="divContenforo"> 
                {include file="{$DOC_ROOT}/templates/lists/new/topic-replies.tpl"}
            </div>
            <br>
            <br> 
            {include file="{$DOC_ROOT}/templates/forms/new/add-reply.tpl"}
        </div>
    </div>
</div>
<input type="hidden" id="viewPage" name="viewPage" value="{$arrPage.currentPage}" />