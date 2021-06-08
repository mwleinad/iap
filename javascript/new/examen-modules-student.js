function DoTest(id)
{
    Swal.fire({
        title: '¿Esta seguro de que desea presentar este examen?',
        text: 'El tiempo empezara a correr despues de aceptar',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#7ed264',
        cancelButtonColor: '#ff4545',
        confirmButtonText: 'Confirmar'
      }).then((result) => {
        if (result.isConfirmed) {
            window.location = WEB_ROOT+"/make-test/id/"+id;
        }
    });
}