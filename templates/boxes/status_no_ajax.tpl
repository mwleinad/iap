{if !empty($errors)}
	<div class="row">
		<div class="col-md-12 my-2">
			<div class="alert {if $errors.complete} alert-success {else} alert-danger {/if} alert-dismissible fade show" role="alert">
				<ul>
					{foreach from=$errors.value item="error" key="key"}
						<li>
							{if $errors.complete} <i class="fas fa-check-circle fa-lg"></i> {else} <i class="fas fa-exclamation-circle fa-lg"></i> {/if} {$error}.
							<ol>
								{if $errors.field.$key}
									Campo: <li>{$errors.field.$key}</li>
								{/if}
							</ol>
						</li>
					{/foreach}
				</ul>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
		</div>
	</div>
{/if}