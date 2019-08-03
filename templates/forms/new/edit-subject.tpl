<form class="form-horizontal" id="editSubjectForm" name="editSubjectForm" method="post" action="{$WEB_ROOT}/edit-subject/id/{$post.subjectId}">
    <input type="hidden" id="subjectId" name="subjectId" value="{$post.subjectId}"/>

    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Tipo:</label>
            <div class="col-md-8">
                <select name="tipo" id="tipo" class="form-control">
                    {foreach from=$major item=item}
                        <option value="{$item.majorId}" {if $post.tipo == $item.majorId} selected="selected"{/if}>{$item.name}</option>
                    {/foreach}
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.name}" />
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-3 control-label">Clave:</label>
            <div class="col-md-8">
                <input type="text" name="frmClave" id="frmClave"  class="form-control"  value="{$post.clave}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">RVOE Presencial:</label>
            <div class="col-md-8">
                <input type="text" name="rvoe" id="rvoe"   class="form-control" value="{$post.rvoe}" />
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
                <input type="text" name="cost" id="cost"  class="form-control" value="{$post.cost}"  />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Numero de Pagos Totales:</label>
            <div class="col-md-8">
                <input type="text" name="payments" id="payments"   class="form-control" value="{$post.payments}" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Texto de Bienvenida:</label>
            <div class="col-md-8">
                <textarea id="welcomeText" name="welcomeText" rows="15" cols="80" style=""  class="form-control">{$post.welcomeText}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Introduccion:</label>
            <div class="col-md-8">
                <textarea id="introduction" name="introduction" rows="15" cols="80" style=""  class="form-control">{$post.introduction}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Intenciones:</label>
            <div class="col-md-8">
                <textarea id="intentions" name="intentions" rows="15" cols="80" style=""  class="form-control">{$post.intentions}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Objetivos:</label>
            <div class="col-md-8">
                <textarea id="objectives" name="objectives" rows="15" cols="80" style=""  class="form-control">{$post.objectives}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Metodologia:</label>
            <div class="col-md-8">
                <textarea id="methodology" name="methodology" rows="15" cols="80" style=""  class="form-control">{$post.methodology}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Politicas:</label>
            <div class="col-md-8">
                <textarea id="politics" name="politics" rows="15" cols="80" style="" aclass="form-control">{$post.politics}</textarea>
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