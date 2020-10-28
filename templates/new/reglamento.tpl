<div class="portlet box red">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-balance-scale fa-5x"></i> Reglamento General de Posgrado
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">
            <div class="row">
                {if $accepted}
                    <div class="col-md-12 text-center" style="margin: 20px 0;">
                        <a href="{$WEB_ROOT}/recursos/pdf/RGP.pdf" target="_blank" class="btn red" download>
                            <i class="fa fa-file-pdf-o fa-2x"></i> Descargar Reglamento
                        </a>
                    </div>
                    <div class="col-md-8 col-md-offset-2">
                        <embed src="{$WEB_ROOT}/recursos/pdf/RGP.pdf" type="application/pdf" width="100%" height="800px" />
                    </div>
                {else}
                    <div class="col-md-8 col-md-offset-2 text-center">
                        <p class="text-justify">
                            Manifiesto por este medio, haber recibido de parte de la Dirección Académica del Instituto de Administración Pública del Estado de Chiapas, el documento titulado:
                        </p>
                        <br /><br />
                        <h4><b>REGLAMENTO GENERAL DE POSGRADO</b></h4>
                        <br /><br />
                        <p class="text-justify">
                            El cual tendrá observancia durante todo mi proceso como estudiante en los programas del Instituto, y cuyo contenido me permite conocer mis derechos y obligaciones académicas, y a la vez cumplir con mis deberes.
                        </p>  
                        <br /><br />
                        <p>{$nombre}</p>
                    </div> 
                    <div class="col-md-12 text-center">                
                        <form action="{$WEB_ROOT}/reglamento" method="POST">
                            <input type="hidden" name="accepted" value="1" />
                            <button type="submit" class="btn green">
                                Acepto
                            </button>
                        </form>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>