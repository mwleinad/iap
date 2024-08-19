$("#posgrado").change(function(){
    if ($(this).val() != "") {
        $.ajax({
            type: "POST",
            url: $(this).data('url'),
            data: { posgrado: $(this).val(), opcion: 'grupos' }
        }).done(function (response) {
            console.log(response); 
            response = JSON.parse(response); 
            $("#grupo").html("<option value=''>--Selecciona un grupo--</option>");
            $.each(response, function(index, value){
                $("#grupo").append("<option value='"+value.courseId+"'>"+value.group+"("+value.initialDate+" - "+value.finalDate+")"+"</option>");
            })
        });
    }else{
        $("#grupo").html("<option value=''>--Selecciona un grupo--</option>");
    } 
});