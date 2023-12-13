<form action="{$WEB_ROOT}/ajax/new/cconstancia.php" method="POST" target="_blank" id="form_constancia">
    <input type="hidden" id="course" name="course" value="{$info.courseId}" /> 
    <div class="row">
        <div class="form-group col-md-6">
            <label for="date">Fecha de Expidición</label>
            <input type="text" name="date" id="date" class="form-control i-calendar" autocomplete="off" />
        </div>
        <div class="form-group col-md-6">
            <label for="period">Período</label>
            <input type="text" name="period" id="period" class="form-control text-uppercase" />
        </div>
        <div class="form-group col-md-6">
            <label for="folio">Folio</label>
            <input type="text" name="folio" id="folio" class="form-control text-uppercase" />
        </div>
        <div class="form-group col-md-6">
            <label for="rvoe">RVOE</label>
            <input type="text" name="rvoe" value="{($info.modality == "online") ? $info.rvoeLinea : $info.rvoe}" id="rvoe" class="form-control text-uppercase" />
        </div>
        <h3 class="col-md-12">Selecciona al alumno</h3>  
        {foreach from=$students item=item}
            <div class="input-group mb-3 col-md-4 align-items-center form-group">
                <div class="input-group-prepend">
                    <div class="input-group-text">
                    <input type="checkbox" id="student{$item.userId}" name="student[]" value="{$item.userId}" class="checkbox">
                    </div>
                </div>
                <label class="form-control" for="student{$item.userId}">{$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper} {$item.names|upper}</label>
            </div>  
        {/foreach} 
    </div> 
    <div class="row">
        <div class="form-group col-md-12 text-center">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
            <button type="submit" class="btn btn-success" id="procesar">Generar</button>
        </div>
    </div>
    <div id="alerta"></div>
</form>

<script> 
    $("body").on("click");
    $("body").on("click","#procesar", function(ev){
        ev.preventDefault();
        $(".is-invalid").removeClass(".is-invalid");
        $("#alerta").removeClass("alert alert-danger").text("");
        var procesar = true;
        if($(".checkbox").is(":checked")){
            $('.checkbox:checked').each(
                function() {
                    if($("#folio"+$(this).val()).val() == ""){
                        $("#folio"+$(this).val()).addClass("is-invalid");
                        $("#folio"+$(this).val()).parent().find(".invalid-feedback").text("Campo requerido");
                        procesar = false;
                    }
                }
            );
            if (procesar) {
                $("#form_constancia").submit();
            }
        }else{
            $("#alerta").addClass("alert alert-danger").text("Debe seleccionar por lo menos un alumno.");
        }
    });
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    }); 
</script>