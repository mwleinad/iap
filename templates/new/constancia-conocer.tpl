<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-file-signature"></i> Generar Constancia
    </div>
    <div class="card-body">
        <form action="{$WEB_ROOT}/ajax/new/constancia-conocer.php" method="POST" id="form_constancia">
            <input type="hidden" id="course" name="course" value="{$curso}" />
            <div class="row" id="alumnos">
                {include file="{$DOC_ROOT}/templates/items/new/constancias-conocer.tpl"} 
            </div>
            <div class="row">
                <div class="form-group col-md-12 text-center">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-success" id="procesar">Generar</button>
                </div>
            </div>
            <div id="alerta"></div>
        </form>
    </div>
</div>

<script>
    $("body").on("click", "#procesar", function(ev) {
        ev.preventDefault();
        $(".is-invalid").removeClass(".is-invalid");
        $("#alerta").removeClass("alert alert-danger").text("");
        var procesar = true;
        if ($(".checkbox").is(":checked")) {
            $('.checkbox:checked').each(
                function() {
                    if ($("#folio" + $(this).val()).val() == "") {
                        $("#folio" + $(this).val()).focus();
                        $("#folio" + $(this).val()).addClass("is-invalid");
                        $("#folio" + $(this).val()).parent().find(".invalid-feedback").text(
                            "Campo requerido");
                        procesar = false;
                    }
                }
            );
            if (procesar) {
                $("#form_constancia").addClass('form').submit();
            }
        } else {
            $("#alerta").addClass("alert alert-danger").text("Debe seleccionar por lo menos un alumno.");
        }
    });
    flatpickr('.i-calendar', {
        dateFormat: "Y-m-d"
    });
</script>