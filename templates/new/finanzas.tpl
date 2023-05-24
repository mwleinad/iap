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

<div class="col-md-12 py-3 card card-img-holder bg-gradient-primary">
    <h3 class="page-title text-white"> Currículas Activas </h3>
</div>
<div id="accordion">
    {foreach from=$activeCourse item=item name=cursos}
        {if count($item.pagos) > 0}
            <div class="card">
                <div class="card-header" id="headingActive{$smarty.foreach.cursos.iteration}">
                    <h5 class="mb-0 d-flex align-items-center flex-wrap justify-content-between">
                        <button class="btn btn-link text-uppercase" data-toggle="collapse"
                            data-target="#collapseActive{$smarty.foreach.cursos.iteration}"
                            aria-expanded="{($smarty.foreach.cursos.first) ? "true" : "false"}"
                            aria-controls="collapseActive{$smarty.foreach.cursos.iteration}">
                            <b>Currícula:</b>[{$item.majorName}] {$item.name}
                        </button>
                        <div>
                            <a href="{$WEB_ROOT}/pdf/calendario-pagos.php?alumno={$User.userId}&curso={$item.courseId}" target="_blank" title="Descargar Calendario">
                                <i class="fa fa-download"></i>
                            </a>
                        </div>
                    </h5>
                </div>

                <div id="collapseActive{$smarty.foreach.cursos.iteration}"
                    class="collapse {($smarty.foreach.cursos.first) ? "show" : ""}"
                    aria-labelledby="headingActive{$smarty.foreach.cursos.iteration}" data-parent="#accordion">
                    <div class="card-body">
                        {for $period = 1 to $item.totalPeriods}
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header bg-dark text-white"><b>{$item.tipoCuatri} {$period}</b></div>
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-sm">
                                                <thead>
                                                    <tr class="text-center">
                                                        <th>Concepto</th>
                                                        <th>Costo</th>
                                                        <th>Fecha Inicial</th>
                                                        <th>Fecha Límite</th>
                                                        <th>Beca</th>
                                                        <th>Estatus</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-center">
                                                    {foreach from=$item.pagos['periodicos'] item=itemp name=forFechas}
                                                        {if $itemp.periodo == $period}
                                                            {$contador[$itemp.concepto_id] = $contador[$itemp.concepto_id] + 1}
                                                            <tr>
                                                                <td>{$itemp.concepto_nombre} {$contador[$itemp.concepto_id]}</td>
                                                                <td>{$itemp.total}</td>
                                                                <td>{$itemp.fecha_cobro}</td>
                                                                <td>{$itemp.fecha_limite}</td> 
                                                                <td>{$itemp.beca}%</td>
                                                                <td>{$itemp.status}</td> 
                                                            </tr>
                                                        {/if}
                                                    {/foreach}
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/for}
                    </div>
                </div>
            </div>
        {/if}
    {foreachelse}
        <div class="card">
            <div class="card-body">
                Sin datos de pago
            </div>
        </div>
    {/foreach}
</div>

{if count($inactiveCourse) > 0}
    <div class="col-md-12 py-3 mt-3 card card-img-holder bg-gradient-danger">
        <h3 class="page-title text-white"> Currículas Inactivas </h3>
    </div>
    <div id="accordionInactive">
        {foreach from=$inactiveCourse item=item name=cursos}
            {if count($item.pagos) > 0}
                <div class="card">
                    <div class="card-header" id="headingActive{$smarty.foreach.cursos.iteration}">
                        <h5 class="mb-0">
                            <button class="btn btn-link text-uppercase" data-toggle="collapse"
                                data-target="#collapseActive{$smarty.foreach.cursos.iteration}"
                                aria-expanded="{($smarty.foreach.cursos.first) ? "true" : "false"}"
                                aria-controls="collapseActive{$smarty.foreach.cursos.iteration}">
                                <b>Currícula:</b>[{$item.majorName}] {$item.name}
                            </button>
                        </h5>
                    </div>

                    <div id="collapseActive{$smarty.foreach.cursos.iteration}"
                        class="collapse {($smarty.foreach.cursos.first) ? "show" : ""}"
                        aria-labelledby="headingActive{$smarty.foreach.cursos.iteration}" data-parent="#accordionInactive">
                        <div class="card-body">
                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                            3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt
                            laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin
                            coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes
                            anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings
                            occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard
                of them accusamus labore sustainable VHS.
            </div>
        </div>
    </div>
    {/if}
    {foreachelse}
    <div class="card">
        <div class="card-body">
            Sin datos de pago
        </div>
    </div>
    {/foreach}
</div>
{/if}

{if count($finishedCourse) > 0}
<div class="col-md-12 py-3 mt-3 card card-img-holder bg-gradient-danger">
    <h3 class="page-title text-white"> Currículas Inactivas </h3>
</div>
<div id="accordionInactive">
    {foreach from=$finishedCourse item=item name=cursos}
    {if count($item.pagos) > 0}
    <div class="card">
        <div class="card-header" id="headingActive{$smarty.foreach.cursos.iteration}">
            <h5 class="mb-0">
                <button class="btn btn-link text-uppercase" data-toggle="collapse"
                    data-target="#collapseActive{$smarty.foreach.cursos.iteration}"
                    aria-expanded="{($smarty.foreach.cursos.first) ? "true" : "false"}"
                    aria-controls="collapseActive{$smarty.foreach.cursos.iteration}">
                    <b>Currícula:</b>[{$item.majorName}] {$item.name}
                </button>
            </h5>
        </div>

        <div id="collapseActive{$smarty.foreach.cursos.iteration}"
            class="collapse {($smarty.foreach.cursos.first) ? "show" : ""}"
            aria-labelledby="headingActive{$smarty.foreach.cursos.iteration}" data-parent="#accordionInactive">
            <div class="card-body">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid.
                3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt
                laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin
                coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes
                anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings
                occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard
                            of them accusamus labore sustainable VHS.
                        </div>
                    </div>
                </div>
            {/if}
        {foreachelse}
            <div class="card">
                <div class="card-body">
                    Sin datos de pago
                </div>
            </div>
        {/foreach}
    </div>
{/if}