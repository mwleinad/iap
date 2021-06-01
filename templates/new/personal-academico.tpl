<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-account-multiple"></i>                 
        </span>
        Personal Académico
    </h3>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>

<div class="card mb-4">
    {*<div class="card-header bg-primary text-white"></div>*}
    <div class="card-body">
		<div class="row text-center">
			{foreach from=$docente item=item key=key}
				<div class="col-md-3 d-flex align-items-stretch mb-3">
					<div class="card border border-primary w-100">
						<div class="card-body">
							{if $item.foto eq ''}
								<i class="fas fa-user-circle fa-5x"></i>
							{else}
								<img src="{$item.foto}" class="rounded-circle" alt="" style="width: 80px"> 
							{/if}<br>
							<p class="card-text mt-2">{$item.name|capitalize} {$item.lastname_paterno|capitalize} {$item.lastname_materno|capitalize}</p>
						</div>
						<div class="card-footer">
							<p><small><i class="far fa-envelope"></i> {if $item.correo eq ''} Sin Información {else} {$item.correo|lower} {/if}</small></p>
							<p><small><i class="fas fa-user-tag"></i> {if $item.perfil eq ''} Sin Información {else} {$item.perfil|capitalize} {/if}</small></p>
							<p><small>{$item.description|capitalize}</small></p>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
    </div>
</div>