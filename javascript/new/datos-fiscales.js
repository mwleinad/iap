$("body").on("change", "#estado", function () {
    ciudad_dependencia($(this).val());
});
$("body").on("change", "#municipio", function () {
    localidad_dependencia($("#estado").val(), $(this).val());
});

function ciudad_dependencia(valor) {
    let estado = valor;
    $.ajax({
        url: WEB_ROOT + '/ajax/new/dependencia-ciudadest.php',
        type: "POST",
        data: { type: "ciudadesFiscales", estadoId: estado },
    }).done(function (response) {
        $('#municipio-seccion').html(response);
        $("#localidad-seccion").html("<select class=form-control><option value=''>-- Seleccione la localidad --</option></select>");
    });
}

function localidad_dependencia(valor, valor2) {
    let estado = valor;
    let municipio = valor2;
    $.ajax({
        url: WEB_ROOT + '/ajax/new/dependencia-ciudadest.php',
        type: "POST",
        data: { type: "localidadesFiscales", estadoId: estado, municipioId: municipio },
    }).done(function (response) {
        console.log(response);
        $('#localidad-seccion').html(response);
    });
}