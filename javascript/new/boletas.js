function DownloadQualifications(qualificationId, semester)
{
    CloseFview();
    Swal.fire({
        title: 'Boleta de Calificaciones',
        html: '<p>Acepto que he recibido la boleta de calificaciones parciales correspondiente al ' + semester + ' cuatrimestre/semestre de el/la programa académico.</p>',
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