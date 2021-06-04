<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-school"></i>                 
        </span>
        Currícula
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
        <h3 class="text-center">{$infoCourses.majorName|upper}: {$infoCourses.name|upper} - GRUPO: {$infoCourses.group}</h3>
    {foreach from=$subjects item=subject}
        <div class="card border-secondary mb-2 border border-info">
            <div class="card-header bg-info text-white">
                {$subject.name}
                <span class="badge badge-dark float-right">
                    Cuatrimestre: {$subject.semesterId}
                </span>
            </div>
            <div class="card-body">
                <div class="row mb-2">
                    <div class="col-md-4 text-center">
                        <h5 class="card-title"><b>Fecha Inicio:</b> {$subject.initialDate|date_format:"%d-%m-%Y"}</h5>
                        <h5 class="card-title"><b>Fecha Fin:</b> {$subject.finalDate|date_format:"%d-%m-%Y"}</h5>
                        <p class="card-text">
                            <b>Calificación Parcial:</b> <span class="badge {if $subject.totalScore < 70} badge-danger {else} badge-success {/if} rounded-circle">{$subject.totalScore}</span><br />
                            <b>Calificación Final:</b> 
                            {if  $timestamp < $subject.initialDateStamp}
                                No Disponible {* no iniciada *}
                            {else}
                                {if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}
                                    {* materia finalizada *}
                                    {if $subject.countEval >=1}
                                        <span class="badge {if $subject.calificacionFinal < 7} badge-danger {else} badge-success {/if} rounded">
                                            {$subject.calificacionFinal}
                                        </span>
                                    {else}
                                        Contestar Evaluación
                                    {/if}
                                {elseif $subject.active == "no"}
                                    {* materia finalizada *}
                                    {if $subject.countEval >=1}
                                        <span class="badge {if $subject.calificacionFinal < 7} badge-danger {else} badge-success {/if} rounded">
                                            {$subject.calificacionFinal}
                                        </span>
                                    {else}
                                        Contestar Evaluación
                                    {/if}
                                {elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}
                                    {* materia finalizada *}
                                    {if $subject.countEval >=1}
                                        <span class="badge {if $subject.calificacionFinal < 7} badge-danger {else} badge-success {/if} rounded">
                                            {$subject.calificacionFinal}
                                        </span>
                                    {else}
                                        Contestar Evaluación
                                    {/if}
                                {else}
                                    Contestar Evaluación {* materia activa *}
                                {/if}
                            {/if}
                        </p>
                    </div>
                    <div class="col-md-8 text-center">
                        {if $subject.icon eq ''}
                            <img src="{$WEB_ROOT}/images/logos/Logo_3.png" alt="IAP Chiapas" style="width: 250px !important; height: auto !important; border-radius: 0 !important;" />
                        {else} 
                            <img src="{$WEB_ROOT}/images/new/modulos/{$subject.icon}" alt="IAP Chiapas" style="width: 300px !important; height: auto !important; border-radius: 0 !important;">
                        {/if}<br />
                        {* EVALUACION DOCENTE *}
                        {if $subject.countEval >=1}
                            <span class="badge badge-success my-1 mx-1"><i class="fas fa-check-circle"></i> Evaluación Docente Contestada</span>
                        {else}
                            {if  $timestamp < $subject.initialDateStamp}
                                <span class="badge badge-danger my-1 mx-1"><i class="fas fa-ban"></i> Evaluación Docente No Disponible</span>
                            {else}
                                {if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}
                                    <a href="{$WEB_ROOT}/test-docente/id/{$subject.courseModuleId}" class="btn btn-outline-info btn-sm my-1 mx-1">
                                        <i class="fas fa-spell-check"></i> Evaluación Docente
                                    </a>
                                {elseif $subject.active == "no"}
                                    <a href="{$WEB_ROOT}/test-docente/id/{$subject.courseModuleId}" class="btn btn-outline-info btn-sm my-1 mx-1">
                                        <i class="fas fa-spell-check"></i> Evaluación Docente
                                    </a>
                                {elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}
                                    <a href="{$WEB_ROOT}/test-docente/id/{$subject.courseModuleId}" class="btn btn-outline-info btn-sm my-1 mx-1">
                                        <i class="fas fa-spell-check"></i> Evaluación Docente
                                    </a>
                                {else}
                                    <span class="badge badge-danger my-1 mx-1"><i class="fas fa-ban"></i> Evaluación Docente No Disponible</span>
                                {/if}
                            {/if}
                        {/if}
                        {* ACTIVIDADES *}
                        <a href="javascript:void(0)" onclick="CalificacionesAct({$subject.courseModuleId});" class="btn btn-outline-success btn-sm my-1 mx-1">
                            <i class="fas fa-tasks"></i> Actividades
                        </a>
                        {* INGRESAR AL MODULO *}
                        {if $User.type == "student"}
                            {if  $timestamp < $subject.initialDateStamp}
                                <span class="badge badge-danger my-1 mx-1"><i class="fas fa-ban"></i> Módulo No Iniciado</span>
                            {else}
                                {if $subject.finalDateStamp > 0 AND $timestamp > $subject.finalDateStamp}
                                    <span class="badge badge-success my-1 mx-1"><i class="fas fa-check-circle"></i> Módulo Finalizado</span>
                                {elseif $subject.active == "no"}
                                    <span class="badge badge-success my-1 mx-1"><i class="fas fa-check-circle"></i> Módulo Finalizado</span>
                                {elseif $subject.finalDateStamp <= 0 AND $initialDateStamp < $subject.daysToFinishStamp AND $timestamp > $subject.daysToFinishStamp}
                                    <span class="badge badge-success my-1 mx-1"><i class="fas fa-check-circle"></i> Módulo Finalizado</span>
                                {else}
                                    <a href="{$WEB_ROOT}/view-modules-student/id/{$subject.courseModuleId}" title="Ver Modulo de Curso" class="btn btn-outline-dark btn-sm my-1 mx-1">
                                        <i class="fas fa-sign-in-alt"></i> Ingresar al Módulo
                                    </a>
                                {/if}
                            {/if}
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    {foreachelse}
        
    {/foreach}
    </div>
</div>