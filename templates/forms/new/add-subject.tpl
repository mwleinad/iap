<form class="form-horizontal" id="addSubjectForm" name="addSubjectForm" method="post" action="{$WEB_ROOT}/new-subject">
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Tipo:</label>
            <div class="col-md-8">
                <select name="tipo" id="tipo" class="form-control">
                    {foreach from=$major item=item}
                        <option value="{$item.majorId}" >{$item.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="frmName" id="frmName" class="form-control" value="" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Clave:</label>
            <div class="col-md-8">
                <input type="text" name="frmClave" id="frmClave" value="" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">RVOE Presencial:</label>
            <div class="col-md-8">
                <input type="text" name="rvoe" id="rvoe" value="{$post.rvoe}"  class="form-control" />
            </div>
        </div>
		 <div class="form-group">
            <label class="col-md-3 control-label">Fecha de RVOE Presencial:</label>
            <div class="col-md-8">
                <input type="text" name="fechaRvoe" id="fechaRvoe"  value="{$post.fechaRvoe}"  class="form-control  date-picker" />
            </div>
        </div>
		
		 <div class="form-group">
            <label class="col-md-3 control-label">RVOE en Linea:</label>
            <div class="col-md-8">
                <input type="text" name="rvoeLinea" id="rvoeLinea"   class="form-control" value="{$post.rvoeLinea}" />
            </div>
        </div>
		 <div class="form-group">
            <label class="col-md-3 control-label">Fecha de RVOE en Linea:</label>
            <div class="col-md-8">
                <input type="text" name="fechaRvoeLinea" id="fechaRvoeLinea"  value="{$post.fechaRvoeLinea}"  class="form-control  date-picker" />
            </div>
        </div>
		
        <div class="form-group">
            <label class="col-md-3 control-label">Costo Mensual:</label>
            <div class="col-md-8">
                <input type="text" name="cost" id="cost" value=""  class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Numero de Pagos Totales:</label>
            <div class="col-md-8">
                <input type="text" name="payments" id="payments" value=""  class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Texto de Bienvenida:</label>
            <div class="col-md-8">
                <textarea id="welcomeText" name="welcomeText" rows="15" cols="80" style=""  class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Introduccion:</label>
            <div class="col-md-8">
                <textarea id="introduction" name="introduction" rows="15" cols="80" style=""  class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Intenciones:</label>
            <div class="col-md-8">
                <textarea id="intentions" name="intentions" rows="15" cols="80" style=""  class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Objetivos:</label>
            <div class="col-md-8">
                <textarea id="objectives" name="objectives" rows="15" cols="80" style=""  class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Metodologia:</label>
            <div class="col-md-8">
                <textarea id="methodology" name="methodology" rows="15" cols="80" style=""  class="form-control"></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Politicas:</label>
            <div class="col-md-8">
                <textarea id="politics" name="politics" rows="15" cols="80" style="" aclass="form-control"></textarea>
            </div>
        </div>


    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn {$BUTTON_COLOR} submitForm">Guardar</button>
            </div>
        </div>
    </div>

</form>

<script type="text/javascript">
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        skin : "o2k7"

    });
</script>
