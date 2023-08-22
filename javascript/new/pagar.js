
function validateExpiration(evt)
{
    let code = (evt.which) ? evt.which : evt.keyCode;
    if(code == 8) {
        return true;
    } else if(code >= 48 && code <= 57) {
        let text = evt.target.value;;
        if(text.length == 2) 
            document.getElementById(evt.target.id).value = text + '/';
        return true;
    } else {
        return false;
    }
}