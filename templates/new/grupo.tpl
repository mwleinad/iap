<div class="card mb-4">
    <div class="card-header bg-primary text-white">
		<i class="fas fa-users"></i> Grupo
    </div>
    <div class="card-body text-center">
		<div class="row">
			{foreach from=$lstGrupo item=item key=key} 
				<div class="col-md-3 d-flex align-items-stretch mb-3">
					<div class="card border border-primary w-100">
						<div class="card-body">
							<a href="{$WEB_ROOT}/graybox.php?page=view-perfil&id={$item.userId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
								{if $item.rutaFoto eq ''}
									<i class="fas fa-user-circle fa-5x"></i>
								{else}
									<img src="{$WEB_ROOT}/alumnos/{$item.rutaFoto}?{$rand}" class="rounded-circle" alt="" style="width: 80px"> 
								{/if}
							</a><br>
							<p class="card-text">{$item.names|upper} {$item.lastNamePaterno|upper} {$item.lastNameMaterno|upper}</p>
							{if $item.situation eq 'Recursador'} 
								<span class="badge badge-danger">Alumno Recursador</span>
							{/if}
						</div>
						<div class="card-footer">
							<a href="{$WEB_ROOT}/graybox.php?page=view-perfil&id={$item.userId}" class="btn btn-outline-primary btn-sm" data-target="#ajax" data-toggle="modal">
								Ver Perfil
							</a>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
    </div>
</div>

<script type="text/javascript">
    tinyMCE.init({
        mode: "textareas",
        theme: "advanced",
        skin: "o2k7"
    });
</script>