$( document ).ready(function() {

    $('#login').click(function() {
        DoLogin();
    });

    $('#username').keypress(function (e) {
        var key = e.which;
        if(key == 13)  // the enter key code
        {
            DoLogin();
        }
    });

    $('#passwd').keypress(function (e) {
        var key = e.which;
        if(key == 13)  // the enter key code
        {
            DoLogin();
        }
    });

});



function DoLogin()
{

    $.ajax({
        url : WEB_ROOT+'/ajax/new/personal.php',
        type: "POST",
        data : $('#frmLogin').serialize(),
        success: function(data)
        {
            var splitResponse = data.split("[#]");
// alert(splitResponse[0])
            if(splitResponse[0] == "fail")
            {
                // if(splitResponse[1] == "data"){
                    // $(".display-hide").show();
                // }
                // else if(splitResponse[1] == "empty")
                // {
                    $(".display-hide").show();
                // }
            }
            else
            {
                location.href = WEB_ROOT;
            }
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

function Recuperacion()
{

    $.ajax({
        url : WEB_ROOT+'/ajax/new/recuperacion.php',
        type: "POST",
        data : $('#emailrecuperacion').serialize(),
        success: function(data)
        {
            console.log(data);

            var splitResponse = data.split("[#]");
            if(splitResponse[0] == "fail")
            {
                ShowStatusPopUp($(splitResponse[1]));
            }
            else
            {
                ShowStatus($(splitResponse[1]));
                $('#tblContent').html(splitResponse[2]);
                CloseFview();
            }

            /*
            var splitResponse = data.split("[#]");

            if(splitResponse[0] == "fail")
            {
                if(splitResponse[1] == "data"){
                    $(".display-hide").show();
                }
                else if(splitResponse[1] == "empty")
                {
                    $(".display-hide").show();
                }
            }
            else
            {
                location.href = WEB_ROOT;
            }
*/
        },
        error: function ()
        {
            alert('Algo salio mal, compruebe su conexion a internet');
        }
    });
}

