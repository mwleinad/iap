console.log("jrer");
Event.observe(window, 'load', function() {
	console.log("jrer3");
	Event.observe($('btnAddMajor'), "click", AddMajorDiv);
	console.log("jrer2");

	AddEditMajorListeners = function(e) {
		var el = e.element();
		var del = el.hasClassName('spanDelete');
		var id = el.identify();
		if(del == true)
		{
			DeleteMajorPopup(id);
			return;
		}

		del = el.hasClassName('spanEdit');
		if(del == true)
		{
			EditMajorPopup(id);
		}
	}

	$('tblContent').observe("click", AddEditMajorListeners);																	 

});

function EditMajorPopup(id)
{	
	grayOut(true);
	$('fview').show();
	
	new Ajax.Request(WEB_ROOT+'/ajax/major.php', 
	{
		method:'post',
		parameters: {type: "editMajor", id:id},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			FViewOffSet(response);
			Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });
			Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
			Event.observe($('editMajor'), "click", EditMajor);

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
}

function EditMajor()
{
	new Ajax.Request(WEB_ROOT+'/ajax/major.php', 
	{
		method:'post',
		parameters: $('editMajorForm').serialize(true),
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				ShowStatusPopUp(splitResponse[1])
			}
			else
			{
				ShowStatus(splitResponse[1])
				$('tblContent').innerHTML = splitResponse[2];
				CloseFview();
			}

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
}

function DeleteMajorPopup(id)
{
	var message = "Esta seguro de eliminar esta carrera? Toma en cuenta que podrian perdese muchas asociaciones (Horarios, maestros, etc)";
	if(!confirm(message))
  {
		return;
	}	

	new Ajax.Request(WEB_ROOT+'/ajax/major.php', 
	{
		method:'post',
		parameters: {type: "deleteMajor", id: id},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			
			var splitResponse = response.split("[#]");
			ShowStatus(splitResponse[1])
			$('tblContent').innerHTML = splitResponse[2];			
		},
    onFailure: function(){ alert('Something went wrong...') }
  });

}

function AddMajorDiv()
{	
	grayOut(true);
	$('fview').show();
	
	new Ajax.Request(WEB_ROOT+'/ajax/major.php', 
	{
		method:'post',
		parameters: {type: "addMajor"},
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			FViewOffSet(response);
			Event.observe($('addMajor'), "click", AddMajor);
			Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
			Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
}

function AddMajor()
{
	new Ajax.Request(WEB_ROOT+'/ajax/major.php', 
	{
		method:'post',
		parameters: $('addMajorForm').serialize(true),
    onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				ShowStatusPopUp(splitResponse[1])
			}
			else
			{
				ShowStatus(splitResponse[1])
				$('tblContent').innerHTML = splitResponse[2];
				CloseFview();
			}

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
}
