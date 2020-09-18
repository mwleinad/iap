function onBuscar()
{
	 $.ajax({
        url : WEB_ROOT + '/ajax/new/studentCurricula.php',
        type: "POST",
       	data: $("#frmFlt1").serialize(true)+'&type=onBuscarCalendario',
		beforeSend: function(){			 
			// $('#load_'+Id).html(LOADER3);
		},
        success: function(data)
        {
			console.log(data)
			$('#tblContent').html(data);
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}