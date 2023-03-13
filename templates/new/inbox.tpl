<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="far fa-envelope"></i> Inbox
    </div>
    <div class="card-body">
        <div id="tblContent" class="row">
			{* ASIDE *}
			<div class="col-md-2">
				<div class="list-group">
					{if $userType eq 'student' && $countCourses >= 1}
						<a data-target="#ajax" class="list-group-item list-group-item-action inbox" data-toggle="modal" href="{$WEB_ROOT}/graybox.php?page=nuevo-inbox" data-title="Compose"> 
							<i class="icon-edit"></i> Nuevo
						</a>
					{/if} 
					{if $userType eq 'Docente'}
						<form action="{$WEB_ROOT}/ajax/new/docente.php" class="form" id="form_inbox">
							<input type="hidden" value="crear-inbox" name="opcion">
							<button class="list-group-item list-group-item-action" type="submit">
								<i class="fas fa-plus"></i> <i class="fas fa-paper-plane"></i> Nuevo	
							</button>
						</form>
					{/if}
					<a href="javascript:;" class="list-group-item list-group-item-action inbox active" id="linkEntrada" data-title="Inbox" onClick="cargaInbox('entrada','{$courseMId}')">
						<small><i class="fas fa-inbox"></i> Recibidos</small>
					</a>
					<a href="javascript:;" class="list-group-item list-group-item-action send" id="linkEnviado" onClick="cargaInbox('enviados','{$courseMId}')" data-title="Sent">
						<small><i class="fas fa-paper-plane"></i> Enviados</small>
					</a>
					<a href="javascript:;" class="list-group-item list-group-item-action draft" id="linkBorrador" onClick="cargaInbox('borrador','{$courseMId}')" data-title="Draft">
						<small><i class="fas fa-file-signature"></i> Borradores</small>
					</a>
					<a href="javascript:;" class="list-group-item list-group-item-action trash" id="linkEliminado" onClick="cargaInbox('eliminados','{$courseMId}')" data-title="Trash">
						<small><i class="fas fa-trash-alt"></i> Eliminados</small>
					</a>
				</div>
			</div>
			{* CONTENT *}
			<div class="col-md-10">
				{* SEARCH *}
				<div class="col-md-12 mb-4">
					<form action="#" class="form-search">
						<div class="form-row d-flex justify-content-center">
							<div class="col-auto">
								<input class="form-control" type="text" placeholder="Buscar Correo">
							</div>
							<div class="col-auto">
								<button class="btn btn-info" type="button">Buscar</button>
							</div>
						</div>
					</form>
				</div>
				{* INBOX *}
				<div class="col-md-12">
					<div class="inbox-loading"></div>
					<div class="inbox-content table-responsive" id="contentInbox">
						{include file="{$DOC_ROOT}/templates/lists/inbox.tpl"}
					</div> 
				</div>
			</div>
		</div>
    </div>
</div>