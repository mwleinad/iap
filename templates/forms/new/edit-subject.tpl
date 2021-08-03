<form id="editSubjectForm" name="editSubjectForm" method="post" action="{$WEB_ROOT}/edit-subject/id/{$post.subjectId}">
    <input type="hidden" id="subjectId" name="subjectId" value="{$post.subjectId}"/>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="tipo">Tipo:</label>
            <select name="tipo" id="tipo" class="form-control">
                {foreach from=$major item=item}
                    <option value="{$item.majorId}" {if $post.tipo == $item.majorId} selected="selected"{/if}>{$item.name}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="frmName">Nombre:</label>
            <input type="text" name="frmName" id="frmName" class="form-control" value="{$post.name}" />
        </div>
        <div class="form-group col-md-4">
            <label for="frmClave">Clave:</label>
            <input type="text" name="frmClave" id="frmClave"  class="form-control"  value="{$post.clave}" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="rvoe">RVOE Presencial:</label>
            <input type="text" name="rvoe" id="rvoe" class="form-control" value="{$post.rvoe}" />
        </div>
		 <div class="form-group col-md-4">
            <label for="fechaRvoe">Fecha de RVOE Presencial:</label>
            <input type="text" name="fechaRvoe" id="fechaRvoe" value="{$post.fechaRvoe}" class="form-control i-calendar" />
        </div>
		
		 <div class="form-group col-md-4">
            <label for="rvoeLinea">RVOE en Linea:</label>
            <input type="text" name="rvoeLinea" id="rvoeLinea" class="form-control" value="{$post.rvoeLinea}" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="">Fecha de RVOE en Linea:</label>
            <input type="text" name="fechaRvoeLinea" id="fechaRvoeLinea" value="{$post.fechaRvoeLinea}" class="form-control i-calendar" />
        </div>
        <div class="form-group col-md-6">
            <label for="cost">Costo Mensual:</label>
            <input type="text" name="cost" id="cost" class="form-control" value="{$post.cost}" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6">
            <label for="payments">Numero de Pagos Totales:</label>
            <input type="text" name="payments" id="payments" class="form-control" value="{$post.payments}" />
        </div>
        <div class="form-group col-md-6">
            <label for="totalPeriods">Total de Periodos:</label>
            <input type="text" name="totalPeriods" id="totalPeriods" class="form-control" value="{$post.totalPeriods}" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="welcomeText">Texto de Bienvenida:</label>
            <textarea id="welcomeText" name="welcomeText" rows="15" cols="80" class="form-control">{$post.welcomeText}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="introduction">Introduccion:</label>
            <textarea id="introduction" name="introduction" rows="15" cols="80" class="form-control">{$post.introduction}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="intentions">Intenciones:</label>
            <textarea id="intentions" name="intentions" rows="15" cols="80" class="form-control">{$post.intentions}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="objectives">Objetivos:</label>
            <textarea id="objectives" name="objectives" rows="15" cols="80" class="form-control">{$post.objectives}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="methodology">Metodologia:</label>
            <textarea id="methodology" name="methodology" rows="15" cols="80" class="form-control">{$post.methodology}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="politics">Politicas:</label>
            <textarea id="politics" name="politics" rows="15" cols="80" class="form-control">{$post.politics}</textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success submitForm">Guardar</button>
        </div>
    </div>
</form>

<script type="text/javascript">
    $(function() {
        $('textarea').each(function () {
            new Jodit(this, {
                language: "es",
                toolbarButtonSize: "small",
                autofocus: true,
                toolbarAdaptive: false
            });
        });

        flatpickr('.i-calendar', {
            dateFormat: "d-m-Y"
        });
    });
</script>