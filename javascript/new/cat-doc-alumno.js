function onSave()
{	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT + '/ajax/new/studentCurricula.php',
	    data: $("#frmGral").serialize(true) + '&type=onSaveDocumento',
		beforeSend: function() {			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok")
            {
                btnClose();
                $("#msj").html(splitResp[1]);
                $("#contenido").html(splitResp[2]);
			}
			else if(splitResp[0] == "fail"){
				$("#msj").html(splitResp[1]);
			}
		}
    });
	
}

function closeModal()
{	
	$("#ajax").hide();
	$("#ajax").modal("hide");	
}


function onDelete(Id)
{
	Swal.fire({
        title: '¿Estas seguro que deseas eliminar el documento?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#58ff85',
        cancelButtonColor: '#ff4545',
        confirmButtonText: 'Confirmar'
      }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url : WEB_ROOT+'/ajax/new/studentCurricula.php',
                type: "POST",
                data: $("#frmGral").serialize(true) + '&Id=' + Id + '&type=onDeleteDocumento',
                beforeSend: function(){	},
                success: function(response)
                {
                    console.log(response)
					var splitResp = response.split("[#]");
					if($.trim(splitResp[0]) == "ok")
					{
						$("#msj").html(splitResp[1]);
						$("#contenido").html(splitResp[2]);
					}
					else if($.trim(splitResp[0]) == "fail")
						$("#msj").html(splitResp[1]);
                },
                error: function (){ alert('Something went wrong...'); }
            });
        }
    });
}


function cancelarSolicitud()
{	
	$("#ajax").hide();
	$("#ajax").modal("hide");	
}