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

    $(document).on("submit", ".form", function (ev) {
        ev.preventDefault();
        var form = $(this);
        var data = new FormData(document.getElementById(form.attr('id')));
        var btnSubmit = form.find("button[type='submit']");
        $.ajax({
            type: "POST",
            url: form.attr('action'),
            data: data,
            processData: false,  // tell jQuery not to process the data
            contentType: false,   // tell jQuery not to set contentType
            beforeSend: function () {
                btnSubmit.prop('disabled',true);
                form.find(".is-invalid").removeClass('is-invalid');
                form.find(".invalid-feedback").remove();
            }
        })
        .done(function (response) {
            btnSubmit.prop('disabled',false);
            console.log(response)
            response = JSON.parse(response);
            actionPostAjax(form, response);
        })
        .fail(function(response){
            btnSubmit.prop('disabled',false)
            console.log(response);
            if (response.status == 422) {
                response = JSON.parse(response.responseText);
                console.log(response);
                actionPostAjax(form, response);
                $.each(response.errors,function(index, value){
                    form.find("input[name="+index+"]").addClass('is-invalid');
                    form.find("input[name="+index+"]").parent().append(`<span class="invalid-feedback">${value}</span>`); 
                });
            } 
        });
    });

    // $(document).on("click","[data-target]", function(){
    //     if($(this).data('target') == "#ajax"){
    //         var ancho = $(this).data("width");
    //         if(typeof ancho !== 'undefined' ){
    //             $(".modal-dialog").css({"width":ancho});
    //         }
    //     }
    // })

    $("body").on('keyup', '.onlynumber', function(){
        var valor = numero($(this).val());
        $(this).val(valor);
    }); 
});

function numero(v){     
    v=v.replace(/([^0-9]+)/g,'');
    return v;  
} 

function actionPostAjax(form, response){
    if (response.growl) {
        growl(response.message,response.type);
    }
    if (response.modal_close) {
        $("#ajax").modal('hide');
    }
    if (response.html) {
        if (response.modal) {
            $("#ajax .modal-body").html(response.html);
        }else{
            $(document).find(response.selector).html(response.html);
        }
    }
    if (response.location) {
        window.location.href = response.location;
    }
}
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