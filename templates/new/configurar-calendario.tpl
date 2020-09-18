<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i> Configurar Calendario
        </div>
        <div class="actions">
            <a class=" btn green" href="{$WEB_ROOT}/graybox.php?page=calendar-form&id={$courseId}" data-target="#ajax" data-toggle="modal">
                <i class="fa fa-plus"></i> Agregar
            </a>
        </div>
    </div>
    <div class="portlet-body">
		{if $msj == 'si'}
		    <div class="alert alert-info alert-dismissable">
			    <button type="button" class="close" data-dismiss="alert">&times;</button>
			    Los datos se guardaron correctamente
			</div>
		{/if}
        <div class="row">
            <div class="col-md-12">
                <h4><b>Curricula:</b> [{$info.majorName}] {$info.name}</h4>
                {if $info.totalPeriods > 0}
                    <h4><b>Total {$info.tipoCuatri}: </b> {$info.totalPeriods}</h4>
                {/if}
            </div>
            {for $period = 1 to $info.totalPeriods}
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">{$info.tipoCuatri} {$period}</div>
                        <div class="panel-body">
                        
                        </div>
                    </div>
                </div>
            {/for}
        </div>
    </div>
</div>
