<div id="accordion">
    {foreach from=$uniqueSubjects item=item}
        <div class="card">
            <div class="card-header collapsed card-link pointer" data-toggle="collapse" href="#collapse{$item.subjectId}">
                [{$item.majorName}] {$item.name}
            </div>
            <div id="collapse{$item.subjectId}" class="collapse" data-parent="#accordion">
                <div class="col-md-12 py-4">
                    <table class="table table-bordered table-striped table-sm">
                        <thead>
                            {include file="{$DOC_ROOT}/templates/items/new/courses-header.tpl"}
                        </thead>
                        <tbody>
                            {include file="{$DOC_ROOT}/templates/items/new/courses-base.tpl"}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    {/foreach}
</div>