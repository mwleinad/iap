var DOC_ROOT = "../";
var DOC_ROOT_TRUE = "../";
var DOC_ROOT_SECTION = "../../";


var LOADER3 = "<div align='center'><img src='"+WEB_ROOT+"/images/cargando.gif'><br>Cargando...</div>";

// var WEB_ROOT ="http://"+document.location.hostname+"/iap";

// var WEB_ROOT = "http://www.iapchiapasenlinea.mx";

$( document ).ready(function() {

    $(document).on("click",".closeModal",function() {
        bootbox.hideAll();
    });

    $(document).on("focus", ".date-picker", function () {
        $( ".date-picker" ).datepicker( {
            format: 'dd-mm-yyyy',
            autoclose: true
        } );
    });

});
function showModal(title, data)
{
    bootbox.dialog({
        message: data,
        title: title,
        buttons: {},
        size: 'large'
    });
}

function growl(message, type)
{
    $.bootstrapGrowl(message,
        {
            type: type,
            delay: 5000,
            allow_dismiss: true,
        }
    );
}

function ShowStatusPopUp(html)
{
//    var $div = $(html);
    //var $error = $div.find(".errorStatusBox").html();
    var $error = html;
    growl($error, "danger");
}

function ShowStatus(html)
{
//    var $div = $(html);
//    var $error = $div.find(".successStatusBox").html();
    var $error = html;
    growl($error, "success");
}

function CloseFview()
{
    bootbox.hideAll();
}