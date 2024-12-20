$.fn.selectpicker.Constructor.BootstrapVersion = '4';
$('.selectpicker').selectpicker();
$('.selectpicker.alumnos').on('changed.bs.select', function (e, clickedIndex, isSelected, previousValue) {
    let alumno = $(this).val();
    $.ajax({
        type: "POST",
        url: $(this).data('url'),
        data: { alumno: alumno, type: 'cursos' }
    }).done(function (response) {
        console.log(response);
        let json = JSON.parse(response);
        $("#curricula").html("<option value=''>--Selecciona la currícula--</option>");
        $.each(json, function (index, value) {
            let badge;
            let status;
            const date = new Date();
            if (value.status == "activo") {
                badge = 'success';
                status = "Activo";
                if (Date.parse(value.finalDate) < date) {
                    badge = 'info';
                    status = "Finalizado";
                }
            } else {
                status = "Inactivo";
                badge = 'danger';
            }
            if (value.situation == "Ordinario") {
                $("#curricula").append(`<option data-content="<span class='badge badge-${badge}'>${status}</span> ${value.majorName} ${value.name} - ${value.group}" value="${value.courseId}">${value.majorName} ${value.name} - ${value.group}</option>`);
                $(".selectpicker.curricula").selectpicker('refresh');
            }
        });
    }).fail(function (response) {
        console.log(response);
    });
});

$("body").on("change", "#opcion", function(){
    console.log($(this).val());
    if ($(this).val() == "cuenta-alumno") {
        $("#reporte-1").removeClass("d-none");
        $("#reporte-2, #reporte-3").addClass("d-none");
    }
    if ($(this).val() == "cuenta-grupo") {
        $("#reporte-2").removeClass("d-none");
        $("#reporte-1, #reporte-3").addClass("d-none");
    }
    if ($(this).val() == "cuenta-fechas") {
        $("#reporte-3").removeClass("d-none");
        $("#reporte-1, #reporte-2").addClass("d-none");
    }
});