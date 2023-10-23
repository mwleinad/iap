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
        { data: "credencial_id" },
        { data: "fecha" },
        { data: "alumno" },
        { data: "tipo" },
        { data: "curricula" },
        { data: "grupo" },
        { data: "foto" },
        {
            data: "estatus",
            // "orderable": false
        }, 
    ],
    columnDefs: [
        {
            targets: 2, className: 'compact'
        },
        {
            targets: 3, className: 'compact'
        },
        {
            targets: 4, className: 'compact'
        },
        {
            targets: 1,
            render: DataTable.render.datetime('YYYY-MM-DD HH:mm:ss', 'D [de] MMMM YYYY', 'es')
        }
    ],
    order: [[5, 'desc'], [1, 'desc']]
}); 