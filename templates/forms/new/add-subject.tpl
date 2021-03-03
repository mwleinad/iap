<form id="addSubjectForm" name="addSubjectForm" method="POST" action="{$WEB_ROOT}/new-subject">
    <div class="row">
        <div class="form-group col-md-4">
            <label for="tipo">Tipo:</label>
            <select name="tipo" id="tipo" class="form-control">
                {foreach from=$major item=item}
                    <option value="{$item.majorId}">{$item.name}</option>
                {/foreach}
            </select>
        </div>
        <div class="form-group col-md-4">
            <label for="frmName">Nombre:</label>
            <input type="text" name="frmName" id="frmName" class="form-control" value="" />
        </div>
        <div class="form-group col-md-4">
            <label for="frmClave">Clave:</label>
            <input type="text" name="frmClave" id="frmClave" value="" class="form-control" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-4">
            <label for="rvoe">RVOE Presencial:</label>
            <input type="text" name="rvoe" id="rvoe" value="{$post.rvoe}" class="form-control" />
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
        <div class="form-group col-md-4">
            <label for="fechaRvoeLinea">Fecha de RVOE en Linea:</label>
            <input type="text" name="fechaRvoeLinea" id="fechaRvoeLinea" value="{$post.fechaRvoeLinea}"  class="form-control i-calendar" />
        </div>
        <div class="form-group col-md-4">
            <label for="cost">Costo Mensual:</label>
            <input type="text" name="cost" id="cost" value="" class="form-control" />
        </div>
        <div class="form-group col-md-4">
            <label for="payments">Numero de Pagos Totales:</label>
            <input type="text" name="payments" id="payments" value="" class="form-control" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="welcomeText">Texto de Bienvenida:</label>
            <textarea id="welcomeText" name="welcomeText" rows="15" cols="80" style="" class="form-control"></textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="introduction">Introduccion:</label>
            <textarea id="introduction" name="introduction" rows="15" cols="80" class="form-control"></textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="intentions">Intenciones:</label>
            <textarea id="intentions" name="intentions" rows="15" cols="80" class="form-control"></textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="objectives">Objetivos:</label>
            <textarea id="objectives" name="objectives" rows="15" cols="80" class="form-control"></textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="methodology">Metodologia:</label>
            <textarea id="methodology" name="methodology" rows="15" cols="80" class="form-control"></textarea>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <label for="politics">Politicas:</label>
            <textarea id="politics" name="politics" rows="15" cols="80" class="form-control"></textarea>
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
