$( document ).ready(function() {

    $('#btnAddProfesion').click(function() {
        AddPositionDiv();
    });

    $(document).on("click",".spanDelete",function() {
        var $id = $(this).attr('id');
        DeletePositionPopup($id);
    });

    $(document).on("click",".spanEdit",function() {
        var $id = $(this).attr('id');
        EditPositionPopup($id);
    });
});

function AddPositionDiv()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/profesion.php',
        type: "POST",
        data : {type: "addPosition"},
        success: function(data)
        {
            showModal("Agregar Profesión", data);
            $('.submitForm').click(function() {
                AddPosition();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function AddPosition()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/profesion.php',
        type: "POST",
        data :  $('#addPositionForm').serialize(),
        success: function(data)
        {
            var splitResponse = data.split("[#]");

            if(splitResponse[0] == "fail")
            {
                ShowStatusPopUp($(splitResponse[1]));
            }
            else
            {
                ShowStatus($(splitResponse[1]));
                $('#tblContent').html(splitResponse[2]);
                CloseFview();
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function DeletePositionPopup(id)
{
    var $message = "¿Esta seguro de eliminar esta profesión? Toma en cuenta que podrían perdese muchas asociaciones (Horarios, maestros, etc)";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/profesion.php',
            type: "POST",
            data : {type: "deletePosition", positionId: id},
            success: function(data, textStatus, jqXHR)
            {
                var splitResponse = data.split("[#]");
                ShowStatus(splitResponse[1]);
                $('#tblContent').html(splitResponse[2]);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert('Algo salio mal, compruebe su conexion a internet');
            }
        });

    });
}

function EditPositionPopup(id)
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/profesion.php',
        type: "POST",
        data : {type: "editPosition", id:id},
        success: function(data)
        {
            showModal("Editar Profesion", data);
            $('.submitForm').click(function() {
                EditPosition();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function EditPosition()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/profesion.php',
        type: "POST",
        data :  $('#editPositionForm').serialize(),
        success: function(data)
        {
            var splitResponse = data.split("[#]");

            if(splitResponse[0] == "fail")
            {
                ShowStatusPopUp($(splitResponse[1]));
            }
            else
            {
                ShowStatus($(splitResponse[1]));
                $('#tblContent').html(splitResponse[2]);
                CloseFview();
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}
