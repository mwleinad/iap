<script type="text/javascript" charset="utf-8">
    $(document).observe('dom:loaded', function() {ldelim}
        {foreach from=$students item=item key=key}
        new FancyZoom('foto-{$item.userId}', {ldelim}width:400, height:300{rdelim});
        {/foreach}
        {rdelim});
</script>
</head>
<body>

<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bullhorm"></i>Solicitudes
        </div>


        
            {include file="boxes/status_no_ajax.tpl"}
           <div class="accions">
           <!-- <table>
                <tr>
                    <td>
						<a class="btn green" href="{$WEB_ROOT}/graybox.php?page=add-alumno-admin&id={$item.userId}" data-target="#ajax" data-toggle="modal" data-width="1000px">
                            <i class="fa fa-plus"></i> Agregar
                        </a>
                    </td>
                    <td>
                        <form method="post" name="frmReport" id="frmReport" action="">
                            <input type="hidden" name="accion" value="export" />
                            <input type="image" src="images/excel.gif"  title="Exportar alumnos a Excel" alt="Exportar alumnos a Excel">
                        </form>
                    </td>
                </tr>
            </table>-->
			</div>
      
    </div>
	
	 
    <div class="portlet-body" > 
	<form id="frmBuscar">
	<div style="display:-webkit-inline-box">

	<input type="hidden" name="id" id="id" value="{$id}">
	Nombre:
	<input type="text" name="nombre" id="nombre" class="form-control" style="width:150px">
	Apellido Paterno:
	<input type="text" name="apellidoP" id="apellidoP" class="form-control" style="width:150px">
	Apellido Materno:
	<input type="text" name="apellidoM" id="apellidoM" class="form-control" style="width:150px">
	
	

	 </div>
	 </form>
	   <button type="submit" class="btn green submitForm" onClick="buscarCertificacion()">Buscar</button>
        <div id="tblContent">{include file="lists/usuarios-sol.tpl"}</div>

    </div>
        
            


        <div id="loader2" > </div>
</div>
