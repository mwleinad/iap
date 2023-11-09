function generar(courseId,tipo){
//alert(courseId);
//alert(tipo);

if(tipo=="ESPECIALIDAD"){
tipo=1;
type="genera_especialidad";
}
if(tipo=="MAESTRIA"){
type="genera_maestrias";
tipo=2;
}
//alert(courseId+" y "+tipo);

new Ajax.Request(WEB_ROOT+'/ajax/matricula.php', 
	{
		method:'post',
		parameters: {type: type, courseId: courseId, tipo : tipo},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			//alert(response)
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				ShowStatus(splitResponse[1])
			}
			else
			{
				ShowStatus(splitResponse[1])
				//$('tblContent').innerHTML = splitResponse[2];
				CloseFview();
			}

		},
    onFailure: function(){ alert('Something went wrong...') }
  });




}


function DeleteStudentCurricula(userId,courseId){
//alert(userId)

if(confirm("¿Estás seguro que deseas eliminar este alumno de esta curricula?"))
{
new Ajax.Request(WEB_ROOT+'/ajax/studentCurricula.php', 
	{
		method:'post',
		parameters: {type: "deleteStudentCurricula", courseId: courseId, userId : userId},
        onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			console.log(response);

			var splitResponse = response.split("[#]");
			
			//alert(splitResponse[2])
			if(splitResponse[0] == "fail")
			{
				ShowStatusPopUp(splitResponse[1])
				CloseFview();
				
			}
			else
			{
				ShowStatusPopUp(splitResponse[1])
				//$('tblContent').innerHTML = splitResponse[2];
				CloseFview();
			}
			grayOut(false);
			setInterval('window.location.reload()',3000);

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
 
}}

 function VerGrupo(id){
//alert(id)
 grayOut(true);
	$('fview').show();
		
	new Ajax.Request(WEB_ROOT+'/ajax/studentCurricula.php', 
	{
		method:'post',
		parameters: {type: "Student", id:id},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			FViewOffSet(response);
			Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });
			Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
			Event.observe($('editRole'), "click", EditRole);

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
  
  }

 function VerGrupoInactivo(id){
//alert(id)
 grayOut(true);
	$('fview').show();
		
	new Ajax.Request(WEB_ROOT+'/ajax/studentCurricula.php', 
	{
		method:'post',
		parameters: {type: "StudentInactivo", id:id},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			FViewOffSet(response);
			Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });
			Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
			Event.observe($('editRole'), "click", EditRole);

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
  
  }
  
  

  // GB_myShow = function(caption, url, height, width, is_reload_on_close) {
  // alert("llego");
    // var options = {
      // caption: caption,
      // height: height || 500,
      // width: width || 500,
      // fullscreen: false,
      // overlay_click_close: true,
      // show_loading: true,
      // [COLOR="Red"][B]reload_on_close: is_reload_on_close || false[/B][/COLOR]
    // }
  // var
    // win = new GB_Window(options);
  // return win.show(url);
  // }

 
  