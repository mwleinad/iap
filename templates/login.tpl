<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" 
      type="image/png" 
      href="http://www.iapchiapas.org.mx//images/favicon.png">                
                <title>Sistema de Educaci&oacute;n en L&iacute;nea del IAP-Chiapas</title>
<meta name="description" content=""  />
<meta name="keywords" content=""  />

<link href="{$WEB_ROOT}/css/style.css" rel="stylesheet" type="text/css"  />

<script type="text/javascript" src="{$WEB_ROOT}/javascript/prototype.js"></script>
<script src="{$WEB_ROOT}/javascript/scoluos/src/scriptaculous.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/util.js" type="text/javascript"></script>
{include file="{$DOC_ROOT}/templates/config.tpl"}
<script src="{$WEB_ROOT}/javascript/functions.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/{$page}.js" type="text/javascript"></script>

</head>
<body>

    <div id="wrap">
        <div class="msg-warning" id="msgWarning" style="display:none">
            <img src="images/icons/22/messagebox_warning.png" alt=""/>
            <p>Por favor, ingrese su nombre de Usuario y/o Contrase&ntilde;a.</p>
        </div>   
        <div class="msg-error" id="msgError" style="display:none">
            <img src="images/icons/22/remove.png" alt=""/>
            <p>Nombre de Usuario y/o Contrase&ntilde;a incorrectos  y/o Usuario No Activo.</p>
        </div>
        
        <div class="block">
            <form id="frmLogin" action="" method="post">
            <input type="hidden" name="type" value="doLogin" />
            <div class="left"></div>
            <div class="right" style="font-size:14px">
                <div class="div-row">
                	<div style="padding-left:40px"><b style="color:#246e0f">Usuario o Matricula:</b></div>
                	<input type="text" id="username" name="username" value="" />
                </div>
                <div class="div-row">
                	 <div style="padding-left:40px; padding-top:5px"><b style="color:#246e0f">Contrase&ntilde;a:</b></div>
                     <input type="password" id="passwd" name="passwd" value="" />
                </div>
                <div class="rm-row">
                    
                </div>
                <div class="send-row" style="padding-top:15px;">
                    <button id="login" value="Entrar" type="button" onclick="DoLogin()" name="login"></button>
                    <div style="position:absolute; left:100px;"><a href="register" style="color:#246e0f; text-decoration:underline">Registrarme</a></div><br/><br/>
                    <div style="position:absolute; left:100px;"><a href="recuperacion" style="color:#246e0f; text-decoration:underline">Recuperar contrase&ntilde;a</a></div>
				</div>
            </div>
            </form>
        </div>
    </div>
</body>
</html>

