<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Plan de Estudios
        </div>
        <div class="actions">
        </div>
    </div>
    <div class="portlet-body">
       
      
			
			
			{if $myModule.rutaPlan ne ''} 
			
			<center>
				
				

				<br>
				<br>
				{if $myModule.rutaPlan ne ''}
				<br>
				<br>
					<a type="button" target='_blank' href='{$WEB_ROOT}/materia/{$myModule.rutaPlan}'  class="btn default blue" style="width:211px">Visualizar</a><br>
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

