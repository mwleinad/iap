<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-dollar fa-5x"></i> Finanzas
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
            {if $totalCourses > 1}
                <div class="row">
                    <div class="col-md-12">
                        <form>
                            <label for="course">Seleccionar Currícula:</label>
                            <select class="form-control" id="course" name="course" onchange="getCalendar(this)">
                                <option value="0">-- Seleccionar --</option>
                                {foreach from=$activeCourses item=item}
                                    {if $item.totalPeriods > 0}
                                        <option value="{$item.courseId}">[{$item.majorName}] {$item.name} - GRUPO: {$item.group}</option>
                                    {/if}
                                {/foreach}
                            <select>
                        </form>
                    </div>
                </div>
                <div id="divCalendar"></div>
            {else}
                {include file="{$DOC_ROOT}/templates/items/new/calendar-student.tpl"}
            {/if}
        </div>
    </div>
</div>