function guardarInformacion(Id){
	


	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/info-docente.php',
	  	data: $("#frmGral_"+Id).serialize(true)+'&Id='+Id+'&type='+Id,
		beforeSend: function(){			
			
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					$("#msj_"+Id).html(splitResp[1]);
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#msj_"+Id).html(splitResp[1]);
			}
		}
    });
	
}//guardarInformacion


function loadFecha(Id){
	
	
		
	 // $.datepicker.setDefaults( $.datepicker.regional['es'] );
		$('#fecha'+Id).datepicker({
		 dateFormat: 'yy-mm-dd',
		 changeMonth: true,
		changeYear: true,
		  
		}).focus();
		
}



function loadTR(Id){
	$('#tr_'+Id).toggle();
}


function enviarArchivo(Id){

	var fd = new FormData(document.getElementById("frmDoc_"+Id));
	fd.append('cId','admin');
	// +'&cId=admin',
	$.ajax({
		url : WEB_ROOT+'/ajax/new/personal.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_'+Id).val(Math.round(Progress));
					$('#porcentaje_'+Id).html(Math.round(Progress)+'%');
					
					
				},false);
			return XHR;
		},
		beforeSend: function(){		
			// $("#loader").html(LOADER);
			// $("#erro_"+reqId).hide(0);
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");
			$("#loader").html("");
			if($.trim(splitResp[0]) == "ok"){
				$("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				// closeModal()
			}else if($.trim(splitResp[0]) == "fail"){
				$("#txtErrMsg").show();
	
			}else{
				alert(msgFail);
			}
		},
	})
}




function descargarAutoPdf(Id){
	url=WEB_ROOT+"/ajax/formato-automovil.php?"+$('#frmfiltro').serialize(true)+'&Id='+Id;
	open(url,"Constancia de Estudios","toolbal=0,width=800,resizable=1");
}

function onDelete(Id){
	
	var resp = confirm("Esta seguro de eliminar al Docente?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/personal.php',
	  	data: $("#frmGral").serialize(true)+'&Id='+Id+'&type=onDelete',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					$("#msj").html(splitResp[1]);
					$("#container").html(splitResp[2]);
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#msj").html(splitResp[1]);
			}
		}
    });
	
}


// onDeleteDoc

function onDeleteDoc(Id,personaId){
	
	var resp = confirm("Esta seguro de eliminar el Documento?");
	
	if(!resp)
		return;
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/info-docente.php',
	  	data: $("#frmGral").serialize(true)+'&Id='+Id+'&type=onDelete&personalId='+personaId+'&cId=admin',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			var splitResp = response.split("[#]");

			if($.trim(splitResp[0]) == "ok"){
					$("#msj").html(splitResp[1]);
					$("#contenido").html(splitResp[2]);
				}
			else if($.trim(splitResp[0]) == "fail"){
				$("#msj").html(splitResp[1]);
			}
		}
    });
	
}





function onBuscar(Id){
	
	
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/personal.php',
	  	data: $("#frmFlt").serialize(true)+'&Id='+Id+'&type=onBuscar',
		beforeSend: function(){			
			// $('#tblContent').html(LOADER3);
		},
	  	success: function(response) {	
		
			console.log(response)
			// var splitResp = response.split("[#]");

			
				$("#container").html(response);
				// $("#container").html(splitResp[2]);
			
		}
    });
	
}



function onSave(){
	
	
	
	$.ajax({
	  	type: "POST",
	  	url: WEB_ROOT+'/ajax/new/personal.php',
	  	data: $("#frmGral").serialize(true)+'&type=onSave',
		beforeSend: function(){			
			$('#msj_1').html(LOADER3);
		},
	  	success: function(response) {	

			console.log(response)
			var splitResp = response.split("[#]");
			$('#msj_1').html('');
			if($.trim(splitResp[0]) == "ok"){
					btnClose();
					$("#msj").html(splitResp[1]);
					$("#container").html(splitResp[2]);
				}
			else if($.trim(splitResp[0]) == "fail"){
				ShowStatusPopUp(splitResp[1]);
				
			}
		}
    });
	
}


function closeModal(){
	
	$("#ajax").hide();
	$("#ajax").modal("hide");
	
}

function activaEdicion(){
	
	
	$('.yellow').hide()
	$('#frmGral_1').find('input, textarea, button, select').removeAttr('disabled');
	$('#frmGral_2').find('input, textarea, button, select').removeAttr('disabled');
	$('#frmGral_3').find('input, textarea, button, select').removeAttr('disabled');
	$('#frmGral_4').find('input, textarea, button, select').removeAttr('disabled');
	$('#frmGral_5').find('input, textarea, button, select').removeAttr('disabled');
	$('.divControls').show()
}





function pdfDatos(Id){
	url=WEB_ROOT+"/ajax/docx.php?"+$('#frmfiltro').serialize(true)+'&Id='+Id;
	open(url,"Constancia de Estudios","toolbal=0,width=800,resizable=0");
}



function pdfCarta(Id){
	url=WEB_ROOT+"/ajax/carta-pago.php?"+$('#frmfiltro').serialize(true)+'&Id='+Id;
	open(url,"Constancia de Estudios","toolbal=0,width=800,resizable=1");
}



function onChangePicture(Id){

	var fd = new FormData(document.getElementById("frmFoto"));
	fd.append('type','onChangePicture');
	fd.append('personalId',Id);
	// +'&cId=admin',
	$.ajax({
		url : WEB_ROOT+'/ajax/new/personal.php',
		data: fd,
		processData: false,
		contentType: false,
		type: 'POST',
		xhr: function(){
				var XHR = $.ajaxSettings.xhr();
				XHR.upload.addEventListener('progress',function(e){
					console.log(e)
					var Progress = ((e.loaded / e.total)*100);
					Progress = (Progress);
					console.log(Progress)
					$('#progress_'+Id).val(Math.round(Progress));
					$('#porcentaje_'+Id).html(Math.round(Progress)+'%');
					
					
				},false);
			return XHR;
		},
		beforeSend: function(){		
			// $("#loader").html(LOADER);
			// $("#erro_"+reqId).hide(0);
		},
		success: function(response){
			
			console.log(response);
			var splitResp = response.split("[#]");
			$("#loader").html("");
			if($.trim(splitResp[0]) == "ok"){
				$("#msj").html(splitResp[1]);
				$("#contenido").html(splitResp[2]);
				// closeModal()
				location.reload();
			}else if($.trim(splitResp[0]) == "fail"){
				$("#txtErrMsg").show();
	
			}else{
				alert(msgFail);
			}
		},
	})
}


function onVerPass(){
	
	$("#pass1").toggle();
	$("#pass2").toggle();
	
}