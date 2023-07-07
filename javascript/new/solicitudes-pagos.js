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
        { data: "fecha" },
        { data: "tipo" },
        { data: "nombre" },
        { data: "grupo" },
        { data: "alumno" },
        { data: "concepto" },
        {
            data: "estatus",
            // "orderable": false
        },
        {
            data: "acciones",
            "orderable": false,
        }
    ],
    columnDefs: [
        {
            targets: 3, className: 'compact'
        },
        {
            targets: 5, className: 'compact'
        },
        {
            targets: 6, className: 'compact'
        },
        {
            targets: 1,
            render: DataTable.render.datetime('YYYY-MM-DD HH:mm:ss', 'D [de] MMMM YYYY', 'es')
        }
    ],
    order: [[7, 'desc'], [1, 'desc']]
});