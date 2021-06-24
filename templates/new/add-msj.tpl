<html>
    <head>
        <script src="{$WEB_ROOT}/assets/jquery.multiple.select.js"></script>
        <link rel="stylesheet" type="text/css" href="{$WEB_ROOT}/assets/multiple-select.css" />
        <script>
            $(function() {
                $('#ms').change(function() {
                    console.log($(this).val());
                }).multipleSelect({
                    width: '100%'
                });
            });
        </script>
    </head>
    <body>
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <i class="fas fa-save"></i> Nuevo Mensaje
            </div>
            <div class="card-body">
                <div id="tblContent">
                    <form class="form-horizontal" id="frmGral" name="frmGral" method="post" >
                        <input type="hidden" id="auxTpl" name="auxTpl" value="{$auxTpl}" />
                        <input type="hidden" id="id" name="id" value="{$id}" />
                        <div class="row">
                            <div class="col-md-12">
                                <label for="ms">Docentes:</label>
                                {if $infoMsj}
                                    <ul>
                                        {foreach from=$lsd item=subject}
                                            <li>
                                                <small>{$subject.name|upper} {$subject.lastname_materno|upper} {$subject.lastname_paterno|upper}</small>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {else}
                                    <select name="profesores[]" class="form-control" id="ms" multiple="multiple">
                                        {foreach from=$personals item=subject}
                                            <option value="{$subject.personalId}">
                                                {$subject.lastname_paterno} {$subject.lastname_materno} {$subject.name}
                                            </option>
                                        {/foreach}
                                    </select>
                                {/if}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <label for="titulo">Titulo:</label>
                                {if $infoMsj}
                                    <p>{$infoMsj.titulo}</p>
                                {else}
                                    <input type="text" name="titulo" id="titulo" value="" maxlength="30" class="form-control" />
                                {/if}
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="description">Mensaje:</label>
                            {if $infoMsj}
                                <p>{$infoMsj.mensaje}</p>
                            {else}
                                <textarea name="description" id="description"></textarea>
                            {/if}
                        </div>
                        <div class="row">
                            {if $infoMsj}
                                {if $infoMsj.ruta ne ''}
                                    <div class="col-md-12 text-center">
                                        <a href="{$WEB_ROOT}/docentes/msj/{$infoMsj.ruta}" class="btn btn-primary submitForm" target="_blank">
                                            Ver Archivo
                                        </a>
                                    </div>
                                {/if}
                            {else}			
                                <div class="col-md-12">
                                    <label for="path">Subir Archivo:</label>
                                    <input type="file" name="path" id="path" class="form-control" />
                                </div>
                            {/if}
                        </div>
                    </form>
                    {if !$infoMsj}
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <button type="button" class="btn btn-primary submitForm" id="addMajor" name="addMajor" onClick="onEnviaMsj()" >
                                    Guardar
                                </button>
                                <button type="button" class="btn btn-danger closeModal" onClick="btnClose()">
                                    Cancelar
                                </button>
                            </div>
                        </div>
                    {/if}
                </div>
            </div>
        </div>

        <script>
            var editor = new Jodit('#description', {
                language: "es",
                toolbarButtonSize: "small",
                autofocus: true,
                toolbarAdaptive: false
            });
            $('.modal').removeAttr('tabindex');
        </script>
    </body>
</html>