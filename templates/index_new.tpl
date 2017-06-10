<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
	<meta charset="utf-8" />
	<title>Sistema de Educaci&oacute;n en Linea | IAP Chiapas</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN THEME GLOBAL STYLES -->
	<link href="{$WEB_ROOT}/assets/global/css/components-md.css" rel="stylesheet" id="style_components" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
	<!-- END THEME GLOBAL STYLES -->

	{if ($page == 'homepage' && $User.type == 'student') || $page == 'docente'}
		<link href="{$WEB_ROOT}/assets/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
	{/if}

	<!-- BEGIN THEME LAYOUT STYLES -->
	<link href="{$WEB_ROOT}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/layouts/layout/css/themes/light2.css" rel="stylesheet" type="text/css" id="style_color" />
	<link href="{$WEB_ROOT}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
	<link href="{$WEB_ROOT}/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
	<!-- END THEME LAYOUT STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />

	<link href="{$WEB_ROOT}/GreyBox/greybox/gb_styles.css" rel="stylesheet" type="text/css" />

{*
	<link href="{$WEB_ROOT}/css/style_new.css" rel="stylesheet" type="text/css"  />
*}
	<script type="text/javascript" src="{$WEB_ROOT}/tinymce/tiny_mce.js"></script>
	<script type="text/javascript">
		var GB_ROOT_DIR = "{$WEB_ROOT}/GreyBox/greybox/";
	</script>
	<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS.js"></script>
	<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS_fx.js"></script>
	<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/gb_scripts.js"></script>

	<style>
		.modal-dialog{
			width: 70%;
		}
	</style>


{*
	<script type="text/javascript" src="{$WEB_ROOT}/javascript/prototype.js?{$timestamp}"></script>
	<script src="{$WEB_ROOT}/javascript/datetimepicker.js?{$timestamp}" type="text/javascript"></script>
	<script src="{$WEB_ROOT}/javascript/scoluos/src/scriptaculous.js?{$timestamp}" type="text/javascript"></script>
	<script src="{$WEB_ROOT}/javascript/util.js?{$timestamp}" type="text/javascript"></script>
	<script src="{$WEB_ROOT}/javascript/config.js?{$timestamp}" type="text/javascript"></script>
	<script src="{$WEB_ROOT}/javascript/functions.js?{$timestamp}" type="text/javascript"></script>
	<script src="{$WEB_ROOT}/javascript/{$page}.js?{$timestamp}" type="text/javascript"></script>

	<link type="text/css" href="{$WEB_ROOT}/cometchat/cometchatcss.php" rel="stylesheet" charset="utf-8">
	<script type="text/javascript" src="{$WEB_ROOT}/cometchat/cometchatjs.php" charset="utf-8"></script>
*}

</head>
<!-- END HEAD -->

<body class="page-header-fixed page-sidebar-closed-hide-logo {if $User.type == "student"} page-sidebar-closed {/if} page-content-white page-md {if $page == 'homepage' && $User.type == 'student'} page-container-bg-solid {/if}">
<div class="page-wrapper">
	{include file="new/header.tpl"}
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			{include file="new/sidebar.tpl"}
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		
		<div class="page-content-wrapper">
			{include file="new/container.tpl"}
		</div>
		<div id="frmModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
						</div>
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->
	{include file="new/footer.tpl"}
</div>
<!--[if lt IE 9]>
<script src="{$WEB_ROOT}/assets/global/plugins/respond.min.js"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="{$WEB_ROOT}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<script>
	//$j = jQuery.noConflict();
	//$.noConflict(true);
</script>

<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="{$WEB_ROOT}/assets/global/scripts/app.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="{$WEB_ROOT}/assets/layouts/layout/scripts/layout.js" type="text/javascript"></script>

<script src="{$WEB_ROOT}/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/config.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/new/functions.js?{$timestamp}" type="text/javascript"></script>

<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/bootstrap-growl/jquery.bootstrap-growl.min.js" type="text/javascript"></script>

<script src="{$WEB_ROOT}/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
<script src="{$WEB_ROOT}/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>

<script src="{$WEB_ROOT}/javascript/new/{$page}.js?{$timestamp}" type="text/javascript"></script>

<script src="{$WEB_ROOT}/assets/pages/scripts/profile.min.js" type="text/javascript"></script>
{*
<script src="../assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="../assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
*}
<!-- END THEME LAYOUT SCRIPTS -->


</body>
{*
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

<script type="text/javascript">
		var GB_ROOT_DIR = "{$WEB_ROOT}/GreyBox/greybox/";
</script>
<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS.js"></script>
<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/AJS_fx.js"></script>
<script type="text/javascript" src="{$WEB_ROOT}/GreyBox/greybox/gb_scripts.js"></script>
<link href="{$WEB_ROOT}/GreyBox/greybox/gb_styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="{$WEB_ROOT}/javascript/prototype.js?{$timestamp}"></script>
<script src="{$WEB_ROOT}/javascript/datetimepicker.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/scoluos/src/scriptaculous.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/util.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/config.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/functions.js?{$timestamp}" type="text/javascript"></script>
<script src="{$WEB_ROOT}/javascript/{$page}.js?{$timestamp}" type="text/javascript"></script>

<link type="text/css" href="{$WEB_ROOT}/cometchat/cometchatcss.php" rel="stylesheet" charset="utf-8">
<script type="text/javascript" src="{$WEB_ROOT}/cometchat/cometchatjs.php" charset="utf-8"></script>

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
*}
</html>

