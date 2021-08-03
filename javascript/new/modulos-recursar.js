function CalificacionesAct(id){
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/studentCurricula.php',
	  	data: "type=calificaciones&id="+id,
		beforeSend: function(){			
			// $("#td_"+id).html(LOADER3);
		},
	  	success: function(response) {	
            Swal.fire({
                title: 'Calificaciones',
                width: 1200,
                html: response
            });
		},
		error:function(){
			alert(msgError);
		}
    });
}