function ToogleStatusDiv()
{
//alert($('redireccion').value);

if($('redireccion')!= undefined){
	if($('redireccion').value == 1)
window.location=WEB_ROOT;}
	
	$('centeredDiv').toggle();
	grayOut(false);	
}

function ToogleStatusDivOnPopup()
{
	$('centeredDivOnPopup').toggle();
}

function CancelFview(){
	grayOut(false);
	$('fview').hide();	
}

function CloseFview(){
	$('fview').hide();	
}

function notificando(){

	new Ajax.Request(WEB_ROOT+'/ajax/notificar.php', 
	{
		method:'post',
		parameters: {type: "notificar2"},
		onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			var splitResponse = response.split("[#]");
		//alert(response);
			if(splitResponse[0] == "ok")
			{
				ShowStatus(splitResponse[1])
			}
			

		},
	onFailure: function(){ alert('Something went wrong...') }
  });



}



//setInterval('notificando()',10000);