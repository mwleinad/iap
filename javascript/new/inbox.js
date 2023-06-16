$(".list-group-item").on("click", function(){
	$(".list-group-item").removeClass("active");
	$(this).addClass("active"); 
});
function cargaInbox(tipo, modulo){  
	console.log("Hola mundo");
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/student.php',
	  	data: $("#editStudentForm").serialize(true)+'&type=cargaInbox&tipo='+tipo+'&courseMId='+modulo,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			$("#contentInbox").html(response);				
		},
		error:function(){
			alert(msgError);
		}
    }); 	
}//cargaInbox 

function deleteInbox(Id,courseId){ 
	var resp = confirm("Seguro de  elimina el mensaje?"); 
	if(!resp)
		return;  
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
	  	data: $("#frmFiltro").serialize(true)+'&Id='+Id+'&type=deleteInbox',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			cargaInbox('entrada');
			
		},
		error:function(){
			alert(msgError);
		}
    });
	
}//deleteInbox

function accionesEliminar(){
	
	var resp = confirm("Seguro de  elimina los mensajes?");
	
	if(!resp)
		return;

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
	  	data: $("#frmGral").serialize(true)+'&type=accionesEliminar',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			cargaInbox('entrada');
			
		},
		error:function(){
			alert(msgError);
		}
    });
	
}



function accionesFavoritos(){
	
	// var resp = confirm("Seguro de  elimina los mensajes?");
	
	// if(!resp)
		// return;

	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/foro.php',
	  	data: $("#frmGral").serialize(true)+'&type=accionesFavoritos',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");
			cargaInbox('entrada');
			
		},
		error:function(){
			alert(msgError);
		}
    });
	
}

function verMateria(Id){
	
	$("#td_"+Id).toggle()
}
