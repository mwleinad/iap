$(document).ready(function() {
    $('#btnAddSubject').click(function() {
        addSubjectDiv();
    });

    $(document).on("click",".spanDelete",function() {
        var $id = $(this).attr('id');
        DeleteSubjectPopUp($id);
    });

    $(document).on("click",".spanViewModule",function() {
        var $id = $(this).attr('id');
        ViewModulePopUp($id);
    });


});


function addSubjectDiv()
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/subject.php',
        type: "POST",
        data : {type: "addSubject"},
        success: function(data)
        {
            showModal("Agregar Currícula", data);
            $('.submitForm').click(function() {
                saveSubject();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });

}

function saveSubject()
{

    $.ajax({
        url : WEB_ROOT+'/ajax/new/subject.php',
        type: "POST",
        data :  $('#addSubjectForm').serialize(),
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

function DeleteSubjectPopUp(id)
{
    var $message = "¿Esta seguro de eliminar esta currícula? Toma en cuenta que podrían perdese muchas asociaciones (materias, maestros, etc)";
    bootbox.confirm($message, function(result) {
        if(result == false)
        {
            return;
        }

        $.ajax({
            url : WEB_ROOT+'/ajax/new/subject.php',
            type: "POST",
            data : {type: "deleteSubject", subjectId: id},
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

function ViewModulePopUp(id)
{

    $.ajax({
        url : WEB_ROOT+'/ajax/new/subject.php',
        type: "POST",
        data : {type: "viewModules", id: id},
        success: function(data)
        {
            showModal("Ver Módulos", data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });

}

function editSubjectPopup(id)
{
    $.ajax({
        url : WEB_ROOT+'/ajax/new/subject.php',
        type: "POST",
        data : {type: "editSubject", id:id},
        success: function(data)
        {
            showModal("Editar Currícula", data);
            $('.submitForm').click(function() {
                EditSubject();
            });
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function EditSubject()
{

    $.ajax({
        url : WEB_ROOT+'/ajax/new/subject.php',
        type: "POST",
        data :  $('#editSubjectForm').serialize(),
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


           // parameters : 'type=saveEditSubject&' + $('editSubjectForm').serialize() + '&viewPage=' + $('viewPage').value,
}



function confirmationDelete(ev) {
    ev.preventDefault();
    var urlToRedirect = ev.currentTarget.getAttribute('href');
    console.log(urlToRedirect);
    Swal.fire({
        title: "¿Estás seguro?",
        text: "Realmente deseas eliminar el módulo, no podrás revertir esta acción",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#58ff85',
        cancelButtonColor: '#ff4545',
        confirmButtonText: 'Confirmar'
      }).then((result) => {
        if (result.isConfirmed) {
            window.location.href=urlToRedirect;
        }
    });
}