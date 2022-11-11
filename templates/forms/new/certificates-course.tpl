<form action="{$WEB_ROOT}/ajax/certificado-calificaciones.php" method="POST" target="_blank">
    <input type="hidden" id="course" name="course" value="{$info.courseId}" /> 
    <div class="row">
        <div class="form-group col-md-6">
            <label for="date">Fecha de Expidición</label>
            <input type="text" name="date" id="date" class="form-control i-calendar" autocomplete="off" required />
        </div>
        <div class="form-group col-md-6">
            <label for="period">Período</label>
            <input type="text" name="period" id="period" class="form-control text-uppercase" required />
        </div>
        <h3 class="col-md-12">Selecciona al alumno</h3>  
        {foreach from=$students item=item}
            <div class="input-group mb-3 col-md-9 align-items-center form-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                    <input type="checkbox" id="student{$item.userId}" name="student[]" value="{$item.userId}">
                    </div>
                </div>
                <label class="form-control" for="student{$item.userId}">{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}</label>
            </div> 
            <div class="form-group col-md-3">
                <label for="folio">Folio</label>
                <input type="text" name="folio[{$item.userId}]" id="folio" class="form-control text-uppercase" value="{$item.folio}"/>
            </div>
        {/foreach} 
    </div> 
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success">Generar</button>
        </div>
    </div>
</form>

<script>
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    }); 
</script>