<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-comments-o"></i>
        </div>

    </div>
    <div class="portlet-body">
        <div id="tblContent">
		<div class="row-fluid inbox">
					<div class="span2">
						<ul class="inbox-nav margin-bottom-10">
						{if $userType eq 'student'}
							{if $countCourses >= 1}
							
							<li class="compose-btn">
							
								<a data-target="#ajax" data-toggle="modal" href="{$WEB_ROOT}/graybox.php?page=nuevo-inbox" data-title="Compose" class="btn {$BUTTON_COLOR}">
								<i class="icon-edit"></i>Nuevo
								</a>
							</li>
							{/if}
						{/if}
							<li class="inbox active" id="linkEntrada">
								<a href="javascript:;" class="btn" data-title="Inbox" onClick="cargaInbox('entrada','{$courseMId}')">Entrada</a>
								<b></b>
							</li>
							<li class="sent" id="linkEnviado"><a class="btn" href="javascript:;"  onClick="cargaInbox('enviados','{$courseMId}')" data-title="Sent">Enviados</a><b></b></li>
							<li class="draft" id="linkBorrador"><a class="btn" href="javascript:;" onClick="cargaInbox('borrador','{$courseMId}')" data-title="Draft">Borrador</a><b></b></li>
							<li class="trash" id="linkEliminado"><a class="btn" href="javascript:;" onClick="cargaInbox('eliminados','{$courseMId}')" data-title="Trash">Eliminados</a><b></b></li>
						</ul>
					</div>
					<div class="span10">
						<div class="inbox-header">
							<h1 class="pull-left">Inbox</h1>
							<form action="#" class="form-search pull-right">
								<div class="input-append">
									<input class="form-control" style="float:left" type="text" placeholder="Buscar Correo">
									<button class="btn {$BUTTON_COLOR}" type="button">Buscar</button>
								</div>
							</form>
						</div>
						<br>
						<div class="inbox-loading"></div>
						
						<form id="frmGral" onsubmit="return false;">
						<div class="inbox-content" id="contentInbox">
							{include file="{$DOC_ROOT}/templates/lists/inbox.tpl"}
						</div>
						  </form>
					</div>
				</div>
		
		</div>
    </div>
</div>