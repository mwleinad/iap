<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-reply"></i> Inbox
    </div>
    <div class="card-body">
        <div id="tblContent" class="row">
			{* ASIDE *}
			<div class="col-md-2">
				<div class="list-group">
					<a href="javascript:;" class="list-group-item list-group-item-action inbox active" id="linkEntrada" data-title="Inbox" onClick="cargaInbox('entrada','{$courseMId}')">
						<small><i class="fas fa-inbox"></i> Recibidos</small>
					</a>
					<a href="javascript:;" class="list-group-item list-group-item-action send" id="linkEnviado" onClick="cargaInbox('enviados','{$courseMId}')" data-title="Sent">
						<small><i class="fas fa-paper-plane"></i> Enviados</small>
					</a>
					<a href="javascript:;" class="list-group-item list-group-item-action draft" id="linkBorrador" onClick="cargaInbox('borrador','{$courseMId}')" data-title="Draft">
						<small><i class="fas fa-file-signature"></i> Borradores</small>
					</a>
					{*<a href="javascript:;" class="list-group-item list-group-item-action trash" id="linkEliminado" onClick="cargaInbox('eliminados','{$courseMId}')" data-title="Trash">
						<small><i class="fas fa-trash-alt"></i> Eliminados</small>
					</a>*}
				</div>
			</div>
			{* CONTENT *}
			<div class="col-md-10">
				{* SEARCH *}
				<div class="col-md-12 mb-4">
					{if $page ne 'reply-inbox' and $page ne 'view-inbox'}
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
					{/if}
				</div>
				{* INBOX *}
				<div class="col-md-12">
					<div class="inbox-loading"></div>
					<div class="inbox-content" id="contentInbox">{include file="{$DOC_ROOT}/templates/lists/reply-inbox.tpl"}</div>
				</div>
			</div>
		</div>
    </div>
</div>