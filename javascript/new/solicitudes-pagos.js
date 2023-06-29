$("#datatable").DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: {
        url: $("#datatable").data('url'),
        dataType: "json",
        type: "POST",
        data: {
            _token: $("meta[name='csrf-token'] ").attr('content')
        }
    },
    language: {
        url: "https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
    },
    columns: [
        { data: "pago_id" },
        { data: "curricula" },
        { data: "grupo" },
        { data: "alumno" },
        { data: "concepto" },
        { data: "estatus" },
        {
            data: "btn",
            "orderable": false
        }
    ]
});