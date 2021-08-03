var editor = null;

$(function() {
	editor = new Jodit('#reply', {
		language: "es",
		toolbarButtonSize: "small",
		autofocus: true,
		toolbarAdaptive: false
	});
});

function verComentario(Id)
{
   $("#divCom_"+Id).toggle();
}


function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}


function updateForo(id,activo){
	
	$("#type").val("updateForo")

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
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