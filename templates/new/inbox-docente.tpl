{if $vista == "grupos"}
    <div id="accordion">
        {foreach from=$gradosAcademicos item=item}
            <div class="card">
                <div class="card-header collapsed card-link pointer" data-toggle="collapse" href="#collapse{$item.subjectId}">
                    [{$item.majorName}] {$item.name} {if $item.rvoe != ""} {$item.rvoe} {/if}
                </div>
                <div id="collapse{$item.subjectId}" class="collapse" data-parent="#accordion"> 
                    <div class="col-md-12">
                        <div class="row">
                            {foreach from=$grupos[$item.subjectId] item=grupo key=llaveGrupo}
                                {foreach from=$grupo item=modulos}
                                    <form class="col-md-6 grupo-inbox form" action="{$WEB_ROOT}/ajax/new/docente.php" id="form_alumnos{$modulos.modulo}">
                                        <input type="hidden" name="opcion" value="inboxAlumnos">
                                        <input type="hidden" name="modulo" value="{$modulos.modulo}">
                                        <button type="submit" class="btn btn-block">
                                            <h3>Grupo: {$llaveGrupo}</h3>
                                            <h4>Módulo: {$modulos.nombre}</h4>
                                        </button> 
                                    </form>
                                {/foreach}
                            {/foreach}  
                        </div>
                    </div>
                </div>
            </div>
        {/foreach}
    </div>
{/if}
{if $vista == "alumnos"}
    <div class="col-md-12">
        <div class="row">
        {foreach from=$alumnos item=item}
            <form class="col-md-4 d-flex align-items-stretch mb-3 form">  
                <button class="grupo-inbox d-flex px-0" type="submit">
                    <div class="col-md-4">
                        {if $item.rutaFoto eq ''}
                            <i class="fas fa-user-circle fa-5x"></i>
                        {else}
                            <img src="{$WEB_ROOT}/alumnos/{$item.rutaFoto}?{$rand}" class="rounded-circle img-fluid" alt=""> 
                        {/if} 
                    </div>
                    <div class="col-md-8">
                        <p class="card-text">{$item.names|upper} {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}</p>
                        {if $item.situation eq 'Recursador'} 
                            <span class="badge badge-danger">Alumno Recursador</span>
                        {/if}
                    </div>  
                </button>                
            </form>
        {/foreach}
        </div>
    </div>
{/if}