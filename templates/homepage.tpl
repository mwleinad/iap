 <ul id="sort-box" class="sorts">
	<li>
		<div class="content-header">
			<div class="content-header-left">
				<img src="{$WEB_ROOT}/images/icons/22/display.png" alt="" />
				<h2>Inicio</h2>
			</div>
		</div>
		<div class="content-in" id="dashboard">
			<div id="content-dashboard-pro-photo">
				{if $User.type == "student"} 
							{$infoStudent.foto}
				{/if}
			</div>
			<div id="content-dashboard-pro-info">
				<h2>Bienvenido(a) {$User.username}</h2>
				<p class="left">
					El <b>Instituto de Administración Pública del Estado de Chiapas, A. C.</b><br />te da la mas cordial bienvenida a nuestro Sistema de Educación en Línea
				</p>
				<p class="right">
					El <b>IAP Chiapas</b> coadyuva desde hace 39 años en el fortalecimiento de la gestión pública de los tres órdenes de gobierno, así como con la realización de investigación, consultoría y difusión del desarrollo de las ciencias administrativas, en beneficio de la sociedad
				</p>
			</div>
		</div>
	</li>
	{if $User.type == "student"} 
		<li>
			<div class="content-header">
				<div class="content-header-left">
					<img src="{$WEB_ROOT}/images/icons/22/display.png" alt="" />
					<h2>Curricula Activa</h2>
				</div>                 
			</div>
			<div class="content-in" id="dashboard">
				{include file="{$DOC_ROOT}/templates/lists/student-curricula-activa.tpl"}
			</div>
		</li>
		<li>
			<div class="content-header">
				<div class="content-header-left">
					<img src="{$WEB_ROOT}/images/icons/22/display.png" alt="" />
					<h2>Curricula Inactiva (Falta de pago, baja, etc)</h2> 
				</div>                 
			</div>
			<div class="content-in" id="dashboard">
				{include file="{$DOC_ROOT}/templates/lists/student-curricula-inactiva.tpl"}
			</div>
		</li>
  <li>
    <div class="content-header">
        <div class="content-header-left">
          <img src="{$WEB_ROOT}/images/icons/22/display.png" alt="" />
            <h2>Curricula Finalizada</h2> 
        </div>                 
    </div>
    <div class="content-in" id="dashboard">
          {include file="{$DOC_ROOT}/templates/lists/student-curricula-finalizada.tpl"}
         
        </div>
 </li>
{/if}


 <li>
    <div class="content-header">
        <div class="content-header-left">
<a href="#" style="float:right;" onclick="Effect.toggle('notificaciones', 'appear'); return false;">Ocultar/Mostrar</a> 
 <img src="{$WEB_ROOT}/images/icons/22/kontact_news.png" alt="" />
          
		 <h2>Notificaciones</h2>
        </div>

    </div>
	
	
    <div class="content-in" id="tblNot">         
              {include file="{$DOC_ROOT}/templates/lists/notificacionesadmin.tpl"}
    </div>
   </li>  

   <input type="hidden" value="0" id="recarga" name="recarga">
<li>
    <div class="content-header">
        <div class="content-header-left">
          <img src="{$WEB_ROOT}/images/icons/22/kontact_news.png" alt="" />
            <h2>Noticias {if $User.positionId == "1"} | &raquo; <a style="color:#000000" href="{$WEB_ROOT}/add-noticia/id/0" onclick="return parent.GB_show('Agregar Noticia', this.href,650,700) ">Agregar Noticia</a> {/if}</h2>
        </div>

    </div>
    <div class="content-in">         
          {include file="{$DOC_ROOT}/templates/lists/module-announcements.tpl"}
    </div>
   </li>
   

   
   
 </ul>

