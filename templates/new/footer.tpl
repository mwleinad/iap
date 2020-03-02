<!-- BEGIN FOOTER -->
<div class="page-footer">
    <div class="page-footer-inner"> {$smarty.now|date_format:"%Y"} &copy; Instituto de Administraci&oacute;n P&uacute;blica del Estado de Chiapas, A.C.
    </div>
    <div class="scroll-to-top">
        <i class="icon-arrow-up"></i>
    </div>
</div>
<!-- END FOOTER -->

<div class="modal fade" id="ajax" role="basic" aria-hidden="true" onClick="limipiarAjax()">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <img src="../assets/global/img/loading-spinner-grey.gif" alt="" class="loading">
                <span> &nbsp;&nbsp;Loading... </span>
            </div>
        </div>
    </div>
</div>

<div id="fview" style="display:none;">
    <input type="hidden" id="inputs_changed" value="0" />
    <div id="fviewload" style="display:block" align="center">
        <img src="{$WEB_ROOT}/images/new/loading.gif" border="0" />
        <br />
        Cargando...
    </div>
    <div id="fviewcontent" style="display:none"></div>
    <div id="modal">
        <div id="submodal">

        </div>
    </div>
</div>
<div style="position:relative" id="divStatus"></div>