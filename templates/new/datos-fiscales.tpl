<div class="page-header">
    <h3 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-home"></i>
        </span>
        Datos Fiscales
    </h3>
    <form class="text-right form" id="form-fiscal" action="{$WEB_ROOT}/ajax/new/finanzas.php">
        <input type="hidden" name="opcion" value="crear-datos-fiscales">
        <button class="btn btn-primary" data-target="#ajax" data-toggle="modal">Añadir otro regimen</button>
    </form>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-checkbox-marked-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>
<section>
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="row">
                {foreach from=$datos_fiscales item=item}
                    <div class="col-md-6 mx-auto">
                        <div class="card text-center mb-3">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <b>Razón Social:</b>{$item.company_name}
                                </h5>
                                <h5>
                                    <b>Nombre Comercial:</b>{$item.commercial_name}
                                </h5>
                                <label class="w-100"><b>RFC:</b>{$item.rfc}</label>
                                <label
                                    class="w-100"><b>Teléfono:</b>{(empty($item.phone)) ? "Sin número" : $item.phone}</label>
                                <label
                                    class="w-100"><b>Correo:</b>{(empty($item.email)) ? "Sin correo" : $item.email}</label>
                                <label class="w-100">
                                    <b>
                                        Dirección: {$item.street} {$item.localidad}
                                        {(!empty($item.ext_number)) ? "Num.Ext {$item.ext_number} " :
                                        ""}{(!empty($item.int_number)) ? "Num.Int {$item.int_number} " : ""}
                                        C.P:{$item.zip_code}.{$item.municipio}, {$item.estado}
                                    </b>
                                </label>
                                <form class="d-inline form" action="{$WEB_ROOT}/ajax/new/finanzas.php"
                                    id="form_edicion_{$item.id}">
                                    <input type="hidden" name="opcion" value="editar-datos-fiscales">
                                    <input type="hidden" name="dato_fiscal" value="{$item.id}">
                                    <button type="submit" class="btn btn-info" data-target="#ajax" data-toggle="modal">
                                        Editar <i class="fa fa-edit"></i>
                                    </button>
                                </form>
                                <form class="d-inline form">
                                    <button type="submit" class="btn btn-danger">
                                        Eliminar <i class="fa fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                {foreachelse}
                    <form class="form card col-12" id="form-fiscal" action="{$WEB_ROOT}/ajax/new/finanzas.php">
                        <div class="card-body text-center">
                            <input type="hidden" name="opcion" value="crear-datos-fiscales">
                            <h3>No cuenta con datos fiscales.</h3>
                            <button type="submit" class="btn btn-primary" data-target="#ajax" data-toggle="modal">
                                Agregar
                            </button>
                        </div>
                    </form>
                {/foreach}
            </div>
        </div>
    </div>
</section>