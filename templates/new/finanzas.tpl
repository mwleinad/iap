<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>                 
        </span>
        Finanzas
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    {*<div class="card-header bg-primary text-white"></div>*}
    <div class="card-body">
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
            <div id="divCalendar" class="mt-3"></div>
        {else}
            {include file="{$DOC_ROOT}/templates/items/new/calendar-student.tpl"}
        {/if}
    </div>
</div>