<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Sistema de Educaci&oacute;n en Linea | IAP Chiapas</title>
		{*<link href="{$WEB_ROOT}/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />*}
		<link href="{$WEB_ROOT}/assets/global/css/components-md.css" rel="stylesheet" id="style_components" type="text/css" />
		<link href="{$WEB_ROOT}/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" />
		<!-- END THEME GLOBAL STYLES -->

		{if ($page == 'homepage' && $User.type == 'student') || ($page == 'homepage' && $User.type == 'Docente') || $page == 'docente'}
			<link href="{$WEB_ROOT}/assets/pages/css/profile.min.css" rel="stylesheet" type="text/css" />
		{/if}
		{if $page == 'inbox' or $page == 'reply-inbox' or $page == 'view-inbox'}

		<link href="{$WEB_ROOT}/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"  />
		{/if}
		
		<!-- BEGIN THEME LAYOUT STYLES -->
		<link href="{$WEB_ROOT}/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/assets/layouts/layout/css/themes/light2.css" rel="stylesheet" type="text/css" id="style_color" />
		<link href="{$WEB_ROOT}/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
		<!-- <link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css" rel="stylesheet" type="text/css" />
			<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-summernote/summernote.css" rel="stylesheet" type="text/css" />
			<link href="{$WEB_ROOT}/assets/global/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.css" rel="stylesheet" type="text/css" />-->
		<!-- END THEME LAYOUT STYLES -->
		<link rel="shortcut icon" href="{$WEB_ROOT}/images/favicon_iap.ico" />

		<link href="{$WEB_ROOT}/GreyBox/greybox/gb_styles.css" rel="stylesheet" type="text/css" />
		<link href="{$WEB_ROOT}/css/inbox.css" rel="stylesheet" type="text/css"  />
		<link href="{$WEB_ROOT}/css/radiobutton.css" rel="stylesheet" type="text/css"  />
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
		<script type="text/javascript" src="{$WEB_ROOT}/javascript/inbox.js"></script>
		<style>
			.modal-dialog{
				width: 70%;
			}
			i.icon-green {
		color: #32c5d2;
	}
		</style>
		<script src="{$WEB_ROOT}/assets/jquery.multiple.select.js"></script>

	<link href="{$WEB_ROOT}/assets/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css"/>
	{if $page == 'reply-inbox' or 
	$page == 'view-inbox' or
	$page == 'edit-modules-course' or
	$page == 'info-docente' or 
	$page == 'lst-docentes' or 
	$page == 'prog-materia' or 
	$page == 'report-docentes' or 
	$page == 'perfil' or 
	$page == 'materias'}
	<style type="text/css">

	.btn-file {
	position: relative;
	overflow: hidden;
	border: 1px solid #00BCD4;
	color:  #00BCD4;
	}
	.btn-file input[type=file] {
		position: absolute;
		top: 0;
		right: 0;
		min-width: 100%;
		min-height: 100%;
		font-size: 100px;
		text-align: right;
		filter: alpha(opacity=0);
		opacity: 0;
		outline: none;
		background: red;
		cursor: inherit;
		display: block;
	}

	</style>
	{/if}
	{if $page == 'reply-inbox'}<!--
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>-->
	{/if}
	<script>
	$(function() {
			$('#ms').change(function() {
				console.log($(this).val());
			}).multipleSelect({
				width: '100%'
			});
		});
	</script>
		{* New styles *}
		{*<link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
		<link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">*}
        <link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/sweetalert2/dist/sweetalert2.min.css">
		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/fontawesome/css/all.min.css">
		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/iconfonts/mdi/css/materialdesignicons.min.css">
  		<link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/vendor/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="{$WEB_ROOT}/assets/vcz/css/style.css">
        <link rel="shortcut icon" href="{$WEB_ROOT}/images/logos/iconIap.png" />
	</head>
	<body>
		<div class="container-scroller">
			{* Header *}
			{include file="new/header.tpl"}
			<div class="container-fluid page-body-wrapper">
				{* Sidebar *}
				{if $vistaPrevia eq 1}
					{include file="new/sidebar_vp.tpl"}
				{else}
					{if ($User.type ne "Docente" or $page ne 'homepage')}
						{include file="new/sidebar.tpl"}
					{/if}
				{/if}
				<div class="main-panel">
					{* Container *}
					<div class="content-wrapper">
						{include file="new/container.tpl"}
					</div>
					{* Footer *}
					{include file="new/footer.tpl"}
				</div>
			</div>
		</div>

		{* New scripts *}
		<script src="{$WEB_ROOT}/assets/vcz/vendor/js/vendor.bundle.base.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/vendor/js/vendor.bundle.addons.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/js/off-canvas.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/js/misc.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/vendor/fontawesome/js/all.min.js"></script>
		<script src="{$WEB_ROOT}/assets/vcz/js/dashboard.js"></script>
	</body>

</html>
