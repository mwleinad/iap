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
            <i class="fa fa-bullhorm"></i>Alumnos
        </div>


        <div class="actions">
            {include file="boxes/status_no_ajax.tpl"}
            {include file="forms/search-student.tpl"}
            <table>
                <tr>
                    <td>
                        <a href="javascript:;" class="btn green" id="btnAddPersonal">
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
            </table>
        </div>
    </div>
    <div class="portlet-body">
        <div id="tblContent">{include file="lists/student.tpl"}</div>
    </div>
            <br />
            {if $studentsCount}
                <div id="pagination" class="lnkPages">
                    {include file="footer-pages-links.tpl"}
                </div>
            {/if}


        <div id="loader2" > </div>
</div>