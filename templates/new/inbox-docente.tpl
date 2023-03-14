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
                                    <form class="col-md-6 grupo-inbox form d-flex align-items-stretch mb-3"
                                        action="{$WEB_ROOT}/ajax/new/docente.php" id="form_alumnos{$modulos.modulo}">
                                        <input type="hidden" name="opcion" value="inboxAlumnos">
                                        <input type="hidden" name="modulo" value="{$modulos.modulo}">
                                        <button type="submit" class="btn btn-block">
                                            <h3>Grupo: {$llaveGrupo}</h3>
                                            <h4>Fecha Inicial: {$modulos.initialDate}</h4>
                                            <h4>Fecha Final: {$modulos.finalDate}</h4>
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
                <form class="col-md-4 d-flex align-items-stretch mb-3 form" id="form_alumno{$item.userId}"
                    action="{$WEB_ROOT}/ajax/new/docente.php" method="POST">
                    <input type="hidden" name="modulo" value="{$modulo}">
                    <input type="hidden" name="alumno" value="{$item.userId}">
                    <input type="hidden" name="opcion" value="vistaInbox">
                    <button class="grupo-inbox d-flex px-0 align-items-center" type="submit">
                        <div class="col-md-4">
                            {if $item.rutaFoto eq ''}
                                <i class="fas fa-user-circle fa-5x"></i>
                            {else}
                                <img src="{$WEB_ROOT}/alumnos/{$item.rutaFoto}?{$rand}" class="rounded-circle img-fluid" alt="">
                            {/if}
                        </div>
                        <div class="col-md-8">
                            <p class="card-text">{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}
                            </p>
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
{if $vista == "inbox"}
    <div class="col-md-12 text-center mb-4">
        <a class="btn btn-outline-primary submitForm" href="javascript:;"
            onClick="SaveMsj('{$infoC.courseModuleId}','activo','{$chatId}')" data-title="Trash">
            <i class="fas fa-share"></i> Enviar
        </a>
        <a class="btn btn-outline-info" href="javascript:;"
            onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">
            <i class="fas fa-minus-circle"></i> Descartar
        </a>
        {*<a class="btn btn-outline-danger" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">
            <i class="fas fa-trash-alt"></i> Borrar
        </a>*}
    </div>
    <div class="col-md-12 mb-3">
        <div class="table-responsive">
            <table class="table">
                <tr>
                    <td>De:</td>
                    <td><b>{$de}</b></td>
                </tr>
                <tr>
                    <td>Para:</td>
                    <td><b>{$para}</b></td>
                </tr>
                <tr>
                    <td>Asunto:</td>
                    <td>
                        <input type="text" name="subject2" id="subject2"
                            class="border border-top-0 border-left-0 border-right-0 border-info form-control" value=""
                            placeholder="" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-md-12 mb-4">
        <form id="frmGral" name="frmGral" method="POST">
            <input type="hidden" name="subject1" id="subject1" value="{$subject}" />
            <input type="hidden" name="chatId" id="chatId" value="{$infoC.chatId}" />
            <input type="hidden" name="yoId" id="yoId" value="{$infoC.yoId}" />
            <textarea name="mensaje" id="mensaje"
                class="form-control">{if $chatId ne 0}<br><br><br><br><br><hr>{$dataEnviado}{/if}</textarea>
            <br>
            <span class="btn btn-outline-dark btn-file pointer">
                <i class="fas fa-plus-circle fa-lg"></i>
                <input type="file" name="archivos" id="archivos" class="btn-file" onChange="verArchivo()">
                Agregar Archivo
            </span>
            <div id="divFileAdjunto" style="display:none">Archivo Adjunto...</div>
        </form>
    </div>
    <div class="col-md-12 text-center">
        <a class="btn btn-outline-primary submitForm btn-loading" href="javascript:;"
            onClick="SaveMsj('{$infoC.courseModuleId}','activo','{$chatId}')" data-title="Trash">
            <i class="fas fa-share"></i> Enviar
        </a>
        <a class="btn btn-outline-info" href="javascript:;"
            onClick="SaveMsj('{$infoC.courseModuleId}','borrador','{$chatId}')" data-title="Trash">
            <i class="fas fa-minus-circle"></i> Descartar
        </a>
        {*<a class="btn btn-outline-danger" href="javascript:;" onClick="SaveMsj('{$infoC.courseModuleId}','borrar','{$chatId}')" data-title="Trash">
            <i class="fas fa-trash-alt"></i> Borrar
        </a>*}
    </div>
    <script>
        var editor = null;
        $(function() {
            editor = new Jodit('#mensaje', {
                language: "es",
                toolbarButtonSize: "small",
                autofocus: true,
                toolbarAdaptive: false
            });
        });

        function SaveMsj(courseMId, status, chatId) {


            $('#mensaje').html(editor.value);
            //$("#type").val("saveReply")

            if (status == 'borrar') {
                var resp = confirm("Seguro de  eliminar el mensaje?");

                if (!resp)
                    return;


                if (chatId == 0) {
                    // window.location.href = WEB_ROOT+"/docente/id/"+courseMId;
                    window.location.href = WEB_ROOT + "/inbox";
                } else {
                    window.location.href = WEB_ROOT + "/inbox";
                }

                return;
            }

            var fd = new FormData(document.getElementById("frmGral"));
            fd.append('courseMId', courseMId);
            fd.append('status', status);
            fd.append('chatId', chatId);
            fd.append('asunto1', $('#subject1').val());
            fd.append('asunto2', $('#subject2').val());
            fd.append('opcion', 'enviarMensaje');

            $.ajax({
                type: "POST",
                url: "{$WEB_ROOT}/ajax/new/docente.php",
                data: fd,
                processData: false,  // tell jQuery not to process the data
                contentType: false,   // tell jQuery not to set contentType 
            })
            .done(function (response) { 
                try {
                    response = JSON.parse(response);
                    actionPostAjax2(response); 
                } catch (error) {
                    console.log(error);
                    growl("Ocurrió un error, intente de nuevo.","danger"); 
                } 
            })
            .fail(function(response){ 
                console.log(response);
            });
        }
        function actionPostAjax2(response){
            if (response.growl) {
                growl(response.message,response.type);
            } 
            if (response.location) {
                var duracion = response.duracion ? response.duracion : 2000;
                setTimeout(() => {
                    window.location.href = response.location;
                }, duracion); 
            } 
        } 
    </script>
{/if}