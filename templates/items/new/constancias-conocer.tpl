<h3 class="col-md-12">Selecciona al alumno</h3>
{foreach from=$students item=item}
    <div class="input-group mb-3 col-md-3 align-items-center form-group">
        <div class="input-group-prepend">
            <div class="input-group-text">
                <input type="checkbox" id="student{$item.userId}" name="student[]" value="{$item.userId}" class="checkbox">
            </div>
        </div>
        <label class="form-control" for="student{$item.userId}">{$item.lastNamePaterno|upper}
            {$item.lastNameMaterno|upper} {$item.names|upper}</label>
    </div>
    <div class="input-group mb-3 col-md-3 align-items-center form-group">
        <label for="folio" class="w-100">Folio</label>
        <input type="text" name="folio[{$item.userId}]" id="folio{$item.userId}" class="form-control text-uppercase folios"
            value="{$item.folio}" />
        <span class="invalid-feedback"></span>
        {if $item.folio}
            <div class="input-group-prepend">
                <div class="input-group-text">
                    <a href="{$WEB_ROOT}/pdf/constancia.php?courseId={$item.courseId}&studentId={$item.userId}" target="_blank">
                        <i class="fas fa-download"></i>
                    </a>
                </div>
            </div> 
        {/if}
    </div>
{/foreach}