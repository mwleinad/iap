<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Contratos
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
       
      
			
			
			{if $myModule.rutaContrato ne ''} 
			
			<center>
				
				

				<br>
				<br>
				{if $myModule.rutaContrato ne ''}
				Favor de imprimir el presente contrato, en 2 tantos, en ambas caras de la hoja, con su rúbrica y firma al final.
				<br>
				<br>
					<a type="button" target='_blank' href='{$WEB_ROOT}/docentes/contrato/{$myModule.rutaContrato}'  class="btn default blue" style="width:211px">Visualizar</a><br>
					<br>
					<br>
				{/if}
			</center>
			{else}
				<center>
					<font>
					No disponible
					</font>
				</center>
				
			{/if}
			
		
	</div>    
</div>
</div>
<div id='msjErr'>
</div>
<center>

	<button type="button" class="btn default closeModal" onClick="closeModal()">Cancelar</button>

</center>

