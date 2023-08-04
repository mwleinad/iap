<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        <i class="fas fa-credit-card"></i> {if $validated_data == 'Ok'} Pago en Línea {else} Datos del Tarjetahabiente {/if}
    </div>
    <div class="card-body">
        <div class="row mb-5">
            <div class="col-md-12">
                <div class="progressbar-wrapper">
                    <ul class="progressbar d-flex justify-content-between">
                        <li {if $validated_data ne 'Ok'} class="active" {/if}>Datos del Tarjetahabiente</li>
                        <li {if $validated_data eq 'Ok'} class="active" {/if}>Pagar</li>
                    </ul>
                </div>
            </div>
        </div>
        {if $validated_data eq 'Ok'}
            <div class="row d-flex justify-content-center mb-4">
                <div class="col-md-6">
                    <ul class="list-group">
                        <li class="list-group-item active text-center"><b>Concepto:</b> {$concepto.nombre}</li>
                        <li class="list-group-item text-center"><b>Subtotal:</b> ${$pago.subtotal|number_format:2:".":","}</li>
                        <li class="list-group-item text-center"><b>Descuento:</b> ${$pago.subtotal * ($pago.beca / 100)|number_format:2:".":","}</li>
                        <li class="list-group-item text-center"><b>Abonos:</b> ${$abonos|number_format:2:".":","}</li>
                        <li class="list-group-item text-center"><b>Total:</b> ${($pago.total - $abonos)|number_format:2:".":","}</li>
                    </ul>
                </div>
            </div>
            <form method="POST" action="{$WEB_ROOT}/pagar/id/{$pago.pago_id}/datos/Ok">
                <input type="hidden" name="option" value="pay">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="name">Nombre:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="i-name"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" id="name" class="form-control" placeholder="Nombre" aria-describedby="i-name" required required maxlength="60" {if is_array($cardholder)} value="{$cardholder['name']}" {/if}>
                        </div>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="last_name">Primer Apellido:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="i-last_name"><i class="fas fa-user"></i></span>
                            </div>
                            <input type="text" id="last_name" class="form-control" placeholder="Primer Apellido" aria-describedby="i-last_name" required required maxlength="60" {if is_array($cardholder)} value="{$cardholder['last_name']}" {/if}>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-8">
                        <label for="card_number">Número de Tarjeta:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="i-card_number"><i class="fas fa-credit-card"></i></span>
                            </div>
                            <input type="text" id="card_number" class="form-control" placeholder="Número de Tarjeta" aria-describedby="i-card_number" required maxlength="16">
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="type">Tipo de Tarjeta:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="type"><i class="far fa-credit-card"></i></label>
                            </div>
                            <select class="custom-select" id="type" name="type" required>
                                <option selected value="">-- Seleccionar --</option>
                                <option value="DB">Débito</option>
                                <option value="CR">Crédito</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-8">
                        <label for="expiration">Fecha de Expiración:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="i-expiration"><i class="fas fa-calendar-alt"></i></span>
                            </div>
                            <input type="text" id="expiration" class="form-control" placeholder="MM/AAAA" aria-describedby="i-expiration" pattern="(((0[123456789]|10|11|12)/(([1][9][0-9][0-9])|([2][0-9][0-9][0-9]))))" maxlength="7" onkeypress="return validateExpiration(event);" required>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="security">Código de Seguridad:</label>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="i-security"><i class="fas fa-lock"></i></span>
                            </div>
                            <input type="text" id="security" class="form-control" placeholder="CVV" aria-describedby="i-security" required maxlength="3">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button class="btn btn-primary">
                            Realizar Pago
                        </button>
                    </div>
                </div>
            </form>
        {else}
            <form method="POST" action="{$WEB_ROOT}/pagar/id/{$pago.pago_id}">
                <input type="hidden" name="option" value="cardholder">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="name">Nombre:</label>
                        <input type="text" id="name" name="name" class="form-control" placeholder="Nombre" required maxlength="60" {if is_array($cardholder)} value="{$cardholder['name']}" {/if}>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="last_name">Apellido:</label>
                        <input type="text" id="last_name" name="last_name" class="form-control" placeholder="Primer Apellido" required maxlength="60" {if is_array($cardholder)} value="{$cardholder['last_name']}" {/if}>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="street">Calle:</label>
                        <input type="text" id="street" name="street" class="form-control" placeholder="Calle" required maxlength="60" {if is_array($cardholder)} value="{$cardholder['street']}" {/if}>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-5">
                        <label for="city">Ciudad:</label>
                        <input type="text" id="city" name="city" class="form-control" placeholder="Ciudad" required maxlength="50" {if is_array($cardholder)} value="{$cardholder['city']}" {/if}>
                    </div>
                    <div class="form-group col-md-5">
                        <label for="state">Estado:</label>
                        <select id="state" class="form-control" name="state">
                            {foreach key=key item=value from=$states}
                                <option value="{$key}" {if is_array($cardholder)} {if $cardholder['state_code'] eq $key} selected {/if} {/if}>
                                    {$value}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="postal_code">Código Postal:</label>
                        <input type="text" id="postal_code" name="postal_code" class="form-control" placeholder="Código Postal" required maxlength="50" {if is_array($cardholder)} value="{$cardholder['postal_code']}" {/if}>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="email">Correo:</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="Correo" required maxlength="255" {if is_array($cardholder)} value="{$cardholder['email']}" {/if}>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="mobile">Celular:</label>
                        <input type="text" id="mobile" name="mobile" class="form-control" placeholder="Celular" required maxlength="25" {if is_array($cardholder)} value="{$cardholder['mobile']}" {/if}>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">
                        <button class="btn btn-primary">
                            Guardar Datos
                        </button>
                    </div>
                </div>
            </form>
        {/if}
    </div>
</div>