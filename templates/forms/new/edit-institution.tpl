<form class="form-horizontal" id="editInstitutionForm" name="editInstitutionForm" method="post">
    <input type="hidden" id="type" name="type" value="saveEditInstitution"/>
    <input type="hidden" id="institutionId" name="institutionId" value="{$post.institutionId}"/>
    <input type="hidden" id="fax" name="fax" value="{$post.fax}"/>
    <div class="form-body">
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" value="{$post.name}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre Completo:</label>
            <div class="col-md-8">
                <input type="text" name="name_long" id="name_long" class="form-control" value="{$post.name_long}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Clave de C.T.:</label>
            <div class="col-md-8">
                <input type="text" name="identifier" id="identifier" class="form-control" value="{$post.identifier}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Ubicación:</label>
            <div class="col-md-8">
                <input type="text" name="ubication" id="ubication" class="form-control" value="{$post.ubication}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Dirección:</label>
            <div class="col-md-8">
                <input type="text" name="ubication_long" id="ubication_long" class="form-control" value="{$post.ubication_long}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Teléfono:</label>
            <div class="col-md-8">
                <input type="text" name="phone" id="phone" class="form-control" placeholder="999-99-9-99-99"  value="{$post.phone}" maxlength="14">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Jefe de Oficina::</label>
            <div class="col-md-8">
                <input type="text" name="jefeOficina" id="jefeOficina" class="form-control" value="{$post.jefeOficina}" maxlength="255">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Presidente:</label>
            <div class="col-md-8">
                <input type="text" name="presidente" id="presidente" class="form-control" value="{$post.presidente}" maxlength="255">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Responsable de Serv. Escolares::</label>
            <div class="col-md-8">
                <input type="text" name="respServiciosEscolares" id="respServiciosEscolares" class="form-control" value="{$post.respServiciosEscolares}" maxlength="255">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Director(a) Académico::</label>
            <div class="col-md-8">
                <input type="text" name="directorAcademico" id="directorAcademico" class="form-control" value="{$post.directorAcademico}" maxlength="255" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Jefe de Servicios Escolares:</label>
            <div class="col-md-8">
                <input type="text" name="jefeServiciosEscolares" id="jefeServiciosEscolares" class="form-control" value="{$post.jefeServiciosEscolares}" maxlength="255">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-3 control-label">Nombre:</label>
            <div class="col-md-8">
                <input type="text" name="name" id="name" class="form-control" placeholder="Nombre"  value="{$post.name}">
            </div>
        </div>

    </div>
    <div class="form-actions">
        <div class="row">
            <div class="col-md-offset-3 col-md-9">
                <button type="button" class="btn {$BUTTON_COLOR} submitForm">Guardar</button>
                <button type="button" class="btn default closeModal">Cancelar</button>
            </div>
        </div>
    </div>
</form>