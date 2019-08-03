<div class="portlet box {$PORTLET_COLOR}">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i><b>Información</b> {$myModule.name|truncate:65:"..."} &raquo;
        </div>
        <div class="actions">

        </div>
    </div>
    <div class="portlet-body">
	<div id ="modal1" >
	</div>
	<br>
	<!--Es necesario descargar e imprimir el formato de reinscripción y llevarlo al área de control escolar para recabar las firmas correspondientes-->

	
	{**if $id eq 2}
	{else if $id eq 1}
		Tu solicitud está en progreso, en breve se estará adjunto la información que nos solicitaste
	{/if**}
	{if $infoSol.ruta eq ''}
		Para completar este proceso, será necesario que realices el depósito por la cantidad de <b>$ {$infoSol.precio|number_format:2:'.':','} M.N.</b>  al banco <b>Bancomer</b>, Es muy importante que el depósito lo realices con tu referencia bancaria
		<br>
		<br>
		<center><b>Referencia Bancaria: {$infoStudent.referenciaBancaria}</b></center>
		<br>
		<br>
		Una vez realizado el deposito, te pedimos de favor subas tu comprobante de pago en el icono, "Comprobante de pago"
	{else}
		
		{if $infoSol.estatus eq 'completado'}
			<center><b>Gracias, tu proceso de solicitud esta completo, puedes realizar la descarga de tu formato en el botón correspondiente </b></center>
		{else}
			<center><b>Tu Solicitud esta en proceso de ser validada, por el área de servicios escolares</b></center>
		{/if}
	{/if}
		
    </div>
</div>
