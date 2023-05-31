$(".cobros").on("click", function() {
    let idcobro = $(this).data("cobros");
    let seccionCobro = $(idcobro);
    if (seccionCobro.hasClass('d-none')) {
        seccionCobro.removeClass('d-none');
        $(this).html('<i class="fa fa-minus"></i>');
    } else {
        seccionCobro.addClass('d-none');
        $(this).html('<i class="fa fa-plus"></i>');
    }
});