<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Calendario de actividades</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">
				<a class="btn green" href="javascript:void(0)" onClick="onImprimir({$id})" title='IMPRIMIR'>
					Imprimir
		
			</a>
        </div>
    </div>
    <div class="portlet-body">
        <form id="frmGral">
			<input type="hidden" value={$id} id="courseModuleId" name="courseModuleId">
        </form>
		<div id="calendar" >
									
		
		</div>
    </div>
</div>