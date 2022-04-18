function DownloadQualifications(qualificationId, semester, name)
{
    CloseFview();
    Swal.fire({
        title: 'Boleta de Calificaciones',
        html: '<p>ACEPTO QUE HE RECIBIDO LA BOLETA DE CALIFICACIONES PARCIALES CORRESPONDIENTE AL ' + semester + ' CUATRIMESTRE/SEMESTRE DE EL/LA ' + name + '.</p>',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#58ff85',
        cancelButtonColor: '#ff4545',
        confirmButtonText: 'Confirmar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: WEB_ROOT + '/ajax/new/studentCurricula.php',
                type: "POST",
                data: {
                    type: "downloadedQualifications",
                    qualificationId: qualificationId
                },
                beforeSend: function () {},
                success: function (response) {
                    var splitResponse = response.split("[#]");
                    if(splitResponse[0] == 'ok')
                    {
                        setInterval('window.location.reload()', 2000);
                        window.open(WEB_ROOT + "/ajax/boleta-calificacion.php?id=" + splitResponse[1], "_blank");
                    }
                },
                error: function () {
                    alert('Something went wrong...');
                }
            });
        }
    });
}