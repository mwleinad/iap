<style>
    ol li {
        font-size: 1rem;
    }

    .warning {
        padding: 20px;
        background-color: #ffe29a;
        display: block;
        border-radius: 10px;
        font-size: 1rem;
        font-weight: 600;
    }

    .resalte {
        color: #006e00;
    }

    #video {
        object-fit: cover;
    }

    .img-credencial {
        border: 2px solid #bdb7b7;
        border-radius: 10px;
    }

    #canvas {
        width: 100%;
    }

    #canvas-credencial {
        border-radius: 13% 13%;
        position: absolute;
        right: 8%;
        top: 21.8%;
        background: #ff000047;
        height: 47.5%;
        width: 26.4%;
        z-index: 100;
    }

    #nombre {
        position: absolute;
        top: 25%;
        left: 4%;
        width: 40%;
        height: 28%;
        display: flex;
        align-items: center;
        justify-content: center;
        word-wrap: break-word;
        font-size: 1rem;
        text-align: center;
        font-weight: 600;
        padding: 0 20px;
    }

    #usuario {
        position: absolute;
        top: 60%;
        left: 4%;
        font-size: 1rem;
        font-weight: 600;
    }

    #usuario span {
        font-size: .8rem;
    }

    #curricula {
        position: absolute;
        bottom: 10%;
        left: 4%;
        width: 55%;
        height: 20%;
        padding: 0% 4%;
        font-size: .8rem;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 600;
        color: #fff;
    }

    #vigencia {
        position: absolute;
        right: 10%;
        bottom: 14%;
        text-align: center;
        font-size: .8rem;
        font-weight: 400;
    }

    #vigencia span {
        font-weight: 600;
    }
</style>
<div class="page-header">
    <h1 class="page-title">
        <span class="page-title-icon bg-gradient-primary text-white mr-2">
            <i class="mdi mdi-cash"></i>
        </span>
        Credencial Digital
    </h1>
    <nav aria-label="breadcrumb">
        <ul class="breadcrumb">
            <li class="breadcrumb-item active" aria-current="page">
                <span></span>IAP Chiapas
                <i class="mdi mdi-alert-circle-outline icon-sm text-primary align-middle"></i>
            </li>
        </ul>
    </nav>
</div>
<section class="row">
    <div class="col-12 my-4">
        <div class="row row-cols-1 row-cols-md-2">
            {if empty($credential) || $credential.status == 2}
                <!--Credencial rechazada o sin foto-->
                {if $credential}
                    <div class="alert alert-danger alert-dismissible fade show w-100" role="alert">
                        <strong>La foto de tu credencial ha sido rechazada.</strong>
                        <div>{$credential.content}</div>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                {/if}
                <div id="use-media"></div>
                <div class="col col-md-4 col-lg-5 col-xxl-4 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4>Indicaciones</h4>
                            <ol class="">
                                <li>
                                    Toma tu fotografía al instante, con la cámara de tu laptop o accediendo con tu
                                    celular.<br>
                                    <strong>No se permitirá que cargues archivos desde tu galería</strong>
                                </li>
                                <li>
                                    El fondo de la fotografía debe ser de un color uniforme, preferentemente blanco o de
                                    color claro, sin logotipos o gráfico alguno.
                                </li>
                                <li>
                                    Procurar vestimenta formal, de un solo color preferentemente, sin logotipos o anuncios
                                </li>
                                <li>
                                    Procura que la iluminación sea la adecuada para que su rostro pueda ser visible.
                                </li>
                                <li>
                                    La toma debe ser totalmente de frente, enfocando únicamente tu rostro y hombros. No
                                    tomar fotografías de cuerpo completo, tampoco en paisajes, ni a contra luz.
                                </li>
                                <li>
                                    En el caso de utilizar lentes y/o piercing deberán retirarlos al momento de tomar la
                                    fotografía.
                                </li>
                                <li>
                                    No usar gorras ni sombreros u otro aditamento
                                </li>
                                <li>
                                    <span class="resalte"><strong>En el caso de las mujeres:</strong></span> cabello
                                    recogido o suelto, sin tapar el rostro y orejas, y si es necesario acompañado de un
                                    maquillaje discreto y aretes muy pequeños.
                                </li>
                                <li>
                                    <span class="resalte"><strong>Hombres:</strong></span> sin barba y sin bigote, o en su
                                    caso recortados, que se vea la línea de la boca. Si tiene cabello largo deberá sujetarlo
                                    para mejor visibilidad del rostro y la frente despejada.
                                </li>
                            </ol>
                            <span class="warning">
                                Una vez realizado los pasos de fotografía, deberás esperar el proceso de validación de tus
                                datos y fotografía por la dirección Académica. Es importante considerar que si la fotografía
                                no cubre los requisitos será rechazada y deberás tomarla nuevamente hasta que sea validada.
                            </span>
                        </div>
                    </div>
                </div>
                <div class="col col-md-8 col-lg-7 mb-4">
                    <div class="card h-100">
                        <div class="card-body row">
                            <div class="d-none">
                                <h1>Selecciona un dispositivo</h1>
                                <select name="listaDeDispositivos" id="listaDeDispositivos"></select>
                            </div>
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-12 col-md-8 col-lg-8 col-xl-7 col-xxl-6 mx-auto">
                                        <div id="section-video" class=" d-flex">
                                            <video muted="muted" id="video" class="w-100"></video>
                                            <canvas id="canvas" class="d-none"></canvas>
                                        </div>
                                        <p id="estado" class="col-12 text-center"></p>
                                        <div style="width: 100%;" class="text-center my-3" id="seccion-foto">
                                            <button type="button" class="btn btn-success" id="boton">
                                                Tomar foto
                                            </button>
                                        </div>
                                        <div style="width: 100%;" class="text-center my-3 d-none" id="seccion-submit">
                                            <button type="button" class="btn btn-success" id="nueva-foto">
                                                Volver a tomar la foto
                                            </button>
                                            <button type="button" class="btn btn-success" id="enviar-foto">
                                                Enviar foto
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-8 col-lg-8 col-xl-8 col-xxl-6 mx-auto">
                                        <h3 class="text-center w-100">Parte Frontal</h3>
                                        <div id="section-credencial" class="position-relative">
                                            <img src="{$WEB_ROOT}/images/credencial/frontal.png"
                                                class="img-fluid img-credencial" id="credencial-frontal">
                                            <canvas id="canvas-credencial"></canvas>
                                            <div id="nombre">{$User.nombreCompleto}</div>
                                            <div id="usuario"><span>No. Usuario:</span> {$User.numControl}</div>
                                            <div id="curricula">{$curso}</div>
                                            <div id="vigencia"><span>Vigencia:</span><br>31 de diciembre {date('Y')}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            {elseif $credential.status == 0}
                <!--Credencial en espera de validación-->
                <div class="col col-md-8 mx-auto mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="warning text-justify">
                                <p>
                                    Actualmente, tu fotografía se encuentra en proceso de validación, y recibirás una
                                    notificación en un periodo de 24 a 48 horas en días hábiles. En caso de no recibirla
                                    puedes
                                    llamar al área de Servicios Escolares o apoyarte con tu representante de grupo.
                                </p>
                                <p>
                                    Cuando tu información sea validada podrás visualizar tu "Credencial Digital" en esta
                                    sección, y podrás descargarla en un archivo PDF para su impresión, o en PNG para su
                                    portabilidad en dispositivos.
                                </p>
                                <p>
                                    En caso de requerir una credencial impresa en plástico, puedes solicitarla al Área de
                                    Servicios Escolares para recibir indicaciones. Se te informa que este tipo de credencial
                                    tiene un costo que deberás cubrir antes de iniciar el proceso, y posteriormente
                                    recogerla en las oficinas del Instituto.
                                </p>
                                <p>
                                    La credencial impresa podrás tenerla en un tiempo de 5 a 10 días hábiles una vez
                                    cubiertos los requisitos, misma que será entregada en las oficinas de servicios
                                    escolares, de lunes a viernes, en horario de 8:00 am a 4:00, previa notificación vía
                                    correo institucional.
                                </p>
                            </div>
                            <div class="text-center">
                                <a class="btn btn-success mt-3" href="{$WEB_ROOT}">Aceptar</a>
                            </div>
                        </div>
                    </div>
                </div>
            {else}
                <!--Credencial validada-->
                <div id="credencial"></div>
                <div class="col-md-6 mx-auto">
                    <h3 class="w-100 text-center">Parte Frontal</h3>
                    <div class="w-100 p-0 credencial_previo position-relative">
                        <img src="https://www.googleapis.com/drive/v3/files/{$credential.files['credential']['googleId']}?alt=media&key=AIzaSyDPUxMMPT7P29XC9NTBKlMuR_34xWwt3UE"
                            class="img-fluid">
                    </div>
                </div>
                {if $credential.download == 0}
                    <div class="col-md-6 mx-auto" id="back_credential">
                        <h3 class="w-100 text-center">Parte Trasera</h3>
                        <div class="w-100 credencial_previo">
                            <img src="{$WEB_ROOT}/images/credencial/atras.png" class="img-fluid">
                            <img id="codigo-qr"
                                src="https://www.googleapis.com/drive/v3/files/{$credential.files['token']['qr']['googleId']}?alt=media&key=AIzaSyDPUxMMPT7P29XC9NTBKlMuR_34xWwt3UE"></img>
                        </div>
                    </div> 
                    <form class="col-md-12 text-center mt-4 form" data-alert="true"
                        data-mensaje="Solo podrás descargar una vez la credencial, para posteriores descargas deberás comunicarte con Servicios Escolares"
                        method="post" id="form_descarga" action="{$WEB_ROOT}/ajax/new/credenciales.php" method="POST">
                        <input type="hidden" name="opcion" value="descarga">
                        <input type="hidden" name="credencial" value="{$credential.id}">
                        <button class="btn btn-primary" type="submit">Descargar</button>
                    </form>
                {/if}
            {/if}
        </div>
    </div>
</section>