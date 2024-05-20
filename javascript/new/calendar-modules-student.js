function deleteActividad(Id){
	
	var resp = confirm("Esta seguro de eliminar la actividad?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/module.php',
	  	data: $("#frmGral").serialize(true)+'&Id='+Id+'&type=deleteActividad',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					location.reload();
				}
			else if($.trim(splitResp[0]) == "fail"){
				alert(response);
			}
		}
    });
	
}

function verRetro(Id)
{
	let content = $("#divRetro_"+Id).html();
	Swal.fire({
		icon: "info",
		title: "Retroalimentación",
		html: content
	});
}

function cancelarSolicitud(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}

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

$("body").on("change", "#path", function(){
	var tam = this.files[0].size;
	console.log(tam);
	if(tam >= 41943040){
		growl("El archivo no debe pesar más de 40MB, verifique de nuevo, por favor.", "danger");
		$(this).val("");
	}
});