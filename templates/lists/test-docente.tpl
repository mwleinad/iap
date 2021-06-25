<table class="table table-bordered table-striped table-condensed flip-content table-sm">
    <tbody>
		{foreach from=$lstPreguntas item=item}
			<tr class="text-center">
				<td><b>{$item.nombre}</b></td>
			</tr>
			<tr>	
				<td>
					<table class="table table-bordered table-striped table-condensed flip-content table-sm">
						{foreach from=$item.preguntas item=itemPregunta}
							<tr>
								<td>{$itemPregunta.incr+1}</td>
								<td>{$itemPregunta.pregunta}</td>
								<td class="text-right">
									{foreach from=$itemPregunta.opciones item=item2 key=key}  
										<input type="radio" name="check_{$itemPregunta.preguntaId}" id="check_{$itemPregunta.preguntaId}" value="{$item2}" class="option-input checkbox" /> {$item2}
									{/foreach}
								</td>
							</tr>
						{/foreach}
					</table>
				</td>
			</tr>
		{/foreach}
	</tbody>
</table>

<div class="form-group col-md-12 mt-3">
	<label>Comentario:</label>
	<textarea name="comentario" class="form-control"></textarea>
</div>