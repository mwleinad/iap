

function printBoleta(q){
	url=WEB_ROOT+"/ajax/report-card-pdf.php?"+$('#frmfiltro').serialize(true)+'&q='+q;
	open(url,"Constancia de Estudios","toolbal=0,width=800,resizable=1");
}





function onAceptar(){

	$("#type").val("onAceptar")
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/view-solicitud.php',
	  	data: $("#frmGral").serialize(true)+'&type=onAceptar',
		beforeSend: function(){			
			$("#load").html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			location.reload();
			$("#container").html(response);
				

		},
		error:function(){
			alert(msgError);
		}
    });
	
}
