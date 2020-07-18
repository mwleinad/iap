function verComentario(Id)
{
   $("#divCom_"+Id).toggle();
}


function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}


function enviar(){
	
	$("#type").val("enviar")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/prueba.php',
	  	data: $("#frmForo").serialize(true)+'&id='+id+'&activo='+activo+'&type=updateForo',
		beforeSend: function(){			
			$('#divContenforo').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			
			
					$("#divContenforo").html(response);
			

		},
		error:function(){
			alert(msgError);
		}
    });
	
}//activar