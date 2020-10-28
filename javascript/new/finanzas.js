function getCalendar(element) 
{
    let courseId = element.value;
    $('#divCalendar').html('<div class="text-center"><h2><i class="fa fa-spinner fa-pulse fa-lg fa-fw"></i> Cargando...</h2></div>');
    /* fetch(WEB_ROOT + '/ajax/finanzas.php?' + new URLSearchParams({type: 'getCalendar', courseId: courseId}), {
        method: 'GET'
    })
    .then(function(response) {
        return response.json();
    })
    .then(function(myJson) {
        console.log(myJson);
        if(myJson.status)
            document.getElementById('divCalendar').innerHTML = myJson.content;
        else
            document.getElementById('divCalendar').innerHTML = "Ocurrió un error, intenta más tarde.";
    }); */
    $.ajax({
        url : WEB_ROOT + '/ajax/new/finanzas.php',
        type: "POST",
        data : {type: "getCalendar", courseId: courseId},
        success: function(data, textStatus, jqXHR)
        {
            var splitResponse = data.split("[#]");
            $('#divCalendar').html(splitResponse[1]);
        },
        error: function (jqXHR, textStatus, errorThrown)
        {
            alert('Algo salio mal, compruebe su conexión a internet');
        }
    });
}