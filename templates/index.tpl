<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" 
      type="image/png" 
      href="http://www.iapchiapas.org.mx//images/favicon.png">                
                <title>Sistema de Educación en Línea | IAP-Chiapas</title>
                <meta http-equiv="cache-control" content="no-cache, must-revalidate">
<meta name="description" content=""  />
<meta name="keywords" content=""  />

<link href="{$WEB_ROOT}/css/style.css" rel="stylesheet" type="text/css"  />

<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS.js"></script>
<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS_fx.js"></script>
<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/gb_scripts.js"></script>
<link href="{$WEB_ROOT}/GreyBox/greybox/gb_styles.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="{$WEB_ROOT}/javascript/prototype.js?{$timestamp}"></script>
<script src="{$WEB_ROOT}/javascript/datetimepicker.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/scoluos/src/scriptaculous.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/util.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/functions.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/{$page}.js?{$timestamp}" type="text/javascript"></script>

<link type="text/css" href="{$WEB_ROOT}/cometchat/cometchatcss.php" rel="stylesheet" charset="utf-8">
<script type="text/javascript" src="{$WEB_ROOT}/cometchat/cometchatjs.php" charset="utf-8"></script>
<meta name="google-site-verification" content="f6Gp4p1F2x8QqSyRTrGHSaW_6fzWtg2St5trtIZ4wcI" />
</head>
<body>
{if $page == 'new-payment' || 
	$page == 'view-payments' ||
	$page == 'new-subject' ||
	$page == 'open-subject' ||
	$page == 'edit-course' ||
	$page == 'edit-subject' ||
	$page == 'add-modules-course' ||
	$page == 'add-activity' ||
	$page == 'edit-activity' ||
	$page == 'view-description-activity' ||
	$page == 'add-resource' ||
	$page == 'edit-resource' ||
	$page == 'edit-question' ||
	$page == 'config-teams' ||
	$page == 'score-activity' ||
	$page == 'upload-homework' ||
	$page == 'make-test' ||
	$page == 'student-curricula' ||
	$page == 'ver-sabana-course' ||
	$page == 'add-noticia' ||
	$page == 'add-topic' ||
	$page == 'view-modules-course-student' ||
	$page == 'view-modules-course'}
<div id="container-small">
  <div class="popupheader" style="z-index:1000; background-color:#FFFFFF">
  			<div id="status-no-ajax">
  			{include file="{$DOC_ROOT}/templates/boxes/status_no_ajax.tpl"}
        </div>
				{include file="{$DOC_ROOT}/templates/main-small.tpl"}
  </div>
    {include file="footer-small.tpl"}      
</div>
{else}
{if $page != 'login'}
	                                {include file="top-bar.tpl"}
{/if}

<div id="container">
    <div id="inner-container">
        {include file="header.tpl"}
        {include file="main.tpl"}
    </div>    
    {include file="footer.tpl"}    
</div>
{/if}
</body>
</html>
