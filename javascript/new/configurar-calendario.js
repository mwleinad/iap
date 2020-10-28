$(function() {
    $(document).on('click', '.btn-delete', function() {
        let id = $(this).data('id');
        DeleteConceptPopUp(id);
    });
});


function DeleteConceptPopUp(id)
{
    let message = "¿Esta seguro de eliminar este concepto?";
    bootbox.confirm(message, function(result) {
        if(result == false)
            return;
        $.ajax({
            url: WEB_ROOT + "/ajax/new/calendar.php",
            type: "POST",
            data: {type: "deleteConcept", conceptId: id},
            success: function(data, textStatus, jqXHR)
            {
                let splitResponse = data.split("[#]");
                if(splitResponse[0] == 'ok')
                    location.reload();
                else
                    alert('Algo salio mal, intente más tarde');
                //$('#tblContent').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexion a internet');
            }
        });
    });
}