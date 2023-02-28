function saveCalificacion(){
	
	$("#type").val("saveCalificacion")

	var fd = new FormData(document.getElementById("frmModal"));
	$.ajax({
		url: WEB_ROOT+'/ajax/score-activity-new.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		beforeSend: function(){		
			$("#loader").html(LOADER3);
			$("#btnEnviar").hide();
			// $("#erro_"+reqId).hide(0);
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");

			$("#loader").html("");
			$("#btnEnviar").show();
			if($.trim(splitResp[0]) == "ok"){

				$("#msjdiv").html(splitResp[1]);
			}else if($.trim(splitResp[0]) == "fail"){
				$("#msjdiv").html(splitResp[1]);				
			}else{
				alert('Ocurrio un error');
			}
		},
	})
	
}//saveCalificacion


$(document).on("click",".ajax", function(ev){
	ev.preventDefault(); 
	Swal.fire({
		title: '¿Está seguro de realizar esta acción?',
		text: "No podrá ser revertida",
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		confirmButtonText: '¡Sí, realizar!'
		}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				url:$(this).data("url"),
				type:"POST",
				data:{id:$(this).data('id'),type:$(this).data('option'),student:$(this).data('student')}
			}).done(function(response){
				response = JSON.parse(response);
				Swal.fire(
					'Éxito',
					response.message,
					'success'
				)
				$(response.selector).html(response.contenido);
			}).fail(function(response){
				console.log(response);
			});
		}
	}) 
});