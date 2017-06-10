Event.observe(window, 'load', function() {
		
	AddEditStudentListeners = function(e) {
		var el = e.element();
		var del = el.hasClassName('spanDelete');
		var id = el.identify();
		if(del == true)
		{
			DeleteStudentPopup(id);
			return;
		}
		
		del = el.hasClassName('spanEdit');
		if(del == true)
		{
			EditStudentPopup(id);
		}
			
	}
	$('tblContent').observe("click", AddEditStudentListeners);																	 
});


function AddStudentDiv(id)
{
	grayOut(true);
	if(id == 0)
	{
		$('fview').hide();
		grayOut(false);
		return;
	}
	$('fview').show();
	
	new Ajax.Request(WEB_ROOT+'/ajax/student.php', 
	{
		method:'post',
		parameters: {type: "addStudent"},
   		onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			FViewOffSet(response);
			Event.observe($('semesterId'), "change", LoadGrupos);
			Event.observe($('majorId'), "change", LoadGrupos);
			Event.observe($('addStudent'), "click", AddStudent);
			Event.observe($('fviewclose'), "click", function(){ AddStudentDiv(0); });
		},
    onFailure: function(){ alert('Something went wrong...') }
  });
}

function LoadGrupos(){
	
	var idSemester = document.getElementById("semesterId").value;
	var idMajor = document.getElementById("majorId").value;
	
	new Ajax.Request(WEB_ROOT+'/ajax/student.php', 
	{
		method:'post',
		parameters: {type: "LoadGroups", semesterId : idSemester, majorId : idMajor},
   		onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				
			}
			else
			{
				$('grupos').innerHTML = splitResponse[1];				
			}
		},
    onFailure: function(){ alert('Something went wrong...') }
  });
	
}

function AddStudent()
{
	new Ajax.Request(WEB_ROOT+'/ajax/student.php', 
	{
		method:'post',
		parameters: $('addStudentForm').serialize(true),
		onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			
			var splitResponse = response.split("[#]");
			if(splitResponse[0] == "fail")
			{
				ShowStatusPopUp(splitResponse[1])
			}
			else
			{
				ShowStatusPopUp(splitResponse[1])
				$('tblContent').innerHTML = splitResponse[2];
				AddStudentDiv(0);
				//reload event listeners here
			}

		},
    onFailure: function(){ alert('Something went wrong...') }
  });
}


function EditStudentPopup(id)
{
	grayOut(true);
	$('fview').show();
	if(id == 0)
	{
		$('fview').hide();
		grayOut(false);
		return;
	}
	
	new Ajax.Request(WEB_ROOT+'/ajax/ficha.php', 
	{
		method:'post',
		parameters: {type: "editFicha", id:id},
		onSuccess: function(transport){
			var response = transport.responseText || "no response text";
			FViewOffSet(response);			
			Event.observe($('editFicha'), "click", EditStudent);
			Event.observe($('btnCancel'), "click", function(){ CancelFview(); });
			Event.observe($('closePopUpDiv'), "click", function(){ CancelFview(); });			
		},
    onFailure: function(){ alert('Something went wrong...') }
  });
  
}

function EditStudent()
{	
	new Ajax.Request(WEB_ROOT+'/ajax/ficha.php', 
	{
		method:'post',
		parameters: $('editFichaForm').serialize(true),
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

function DeleteStudentPopup(id)
{
	
	var message = "Esta seguro de eliminar este registro?";
	if(!confirm(message))
  	{
		return;
	}	
	
	new Ajax.Request(WEB_ROOT+'/ajax/ficha.php',{
			method:'post',
			parameters: {type: "deleteStudent", id: id},
			onSuccess: function(transport){
				var response = transport.responseText || "no response text";
				var splitResponse = response.split("[#]");
				ShowStatus(splitResponse[1])
				$('tblContent').innerHTML = splitResponse[2];
				
			},
		onFailure: function(){ alert('Something went wrong...') }
	  });
	
}

function DoSearch(){
	
	var txtName = document.getElementById('name').value;
	var txtApPaterno = document.getElementById('apPaterno').value;
	var txtApMaterno = document.getElementById('apMaterno').value;
	var txtFolio = document.getElementById('folio').value;
	var txtStatus = document.getElementById('status').value;
		
	new Ajax.Request(WEB_ROOT+'/ajax/ficha.php',{
			method:'post',
			parameters: {type: "searchStudent", name: txtName, folio: txtFolio, apPaterno:txtApPaterno, apMaterno:txtApMaterno, status:txtStatus},
			onSuccess: function(transport){
				var response = transport.responseText || "no response text";
				
				var splitResponse = response.split("[#]");
				
				$('tblContent').innerHTML = splitResponse[1];
				$('pagination').innerHTML = '';
				
			},
		onFailure: function(){ alert('Something went wrong...') }
	  });
}

function ChangeStatus(idUser){
	
	var txtStatus = document.getElementById('usrStatus_'+idUser).value;
	
	new Ajax.Request(WEB_ROOT+'/ajax/ficha.php',{
			method:'post',
			parameters: {type: "changeStatus", status: txtStatus, userId: idUser},
			onSuccess: function(transport){
				var response = transport.responseText || "no response text";
			
				var splitResponse = response.split("[#]");
				
				ShowStatus(splitResponse[1]);
								
			},
		onFailure: function(){ alert('Something went wrong...') }
	  });
	
}

function DoAccepted(idUser){
	
	var checked = document.getElementById('accepted_'+idUser).checked;
	
	if(checked)
		val = 1;
	else
		val = 0;
	
	new Ajax.Request(WEB_ROOT+'/ajax/ficha.php',{
			method:'post',
			parameters: {type: "doAccepted", checked: val, userId: idUser},
			onSuccess: function(transport){
				var response = transport.responseText || "no response text";
			
				var splitResponse = response.split("[#]");
				
				ShowStatus(splitResponse[1]);
								
			},
		onFailure: function(){ alert('Something went wrong...') }
	  });
	
}

function activateFichas(){
	
	var activar = document.getElementById("activar").value;
	
		new Ajax.Request(WEB_ROOT+'/ajax/ficha.php',{
			method:'post',
			parameters: {type: "activateFichas", activate: activar},
			onSuccess: function(transport){
				var response = transport.responseText || "no response text";
			
				var splitResponse = response.split("[#]");
				
				ShowStatusPopUp(splitResponse[1]);
				AddStudentDiv(0);
				
			},
		onFailure: function(){ alert('Something went wrong...') }
	  });
	
}