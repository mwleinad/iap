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
        background: #0088ff4f;
        width: 55%;
        height: 20%;
        padding: 0% 4%;
        font-size: .8rem;
        text-align: center;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 600;
    }

    #vigencia {
        position: absolute;
        right: 8%;
        bottom: 13%;
        text-align: center;
        font-size: .8rem;
        font-weight: 400;
    }

    #vigencia span {
        font-weight: 600;
    }

    @media (max-width: 720px) {
        #video {
            min-height: 380px;
        }

        #nombre,
        #vigencia,
        #curricula {
            font-size: .4rem;
        }

        #usuario {
            font-size: .6rem;
        }

        #usuario span {
            font-size: .4rem;
        }
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
            {if empty($credential)}
                <div id="use-media"></div>
                <div class="col col-md-4 col-lg-5 mb-4">
                    <div class="card h-100">
                        <div class="card-body">
                            <ol class="">
                                <li>Toma tu fotografía al instante, no se permitirá que cargues archivos desde tu
                                    galería de fotos.
                                </li>
                                <li>Debes usar camisa o playera blanca.</li>
                                <li>El fondo de la fotografía debe ser de un color uniforme(puede ser color gris o
                                    colores claros),
                                    en
                                    una pared lisa sin logotipos.</li>
                                <li>Procura que la iluminación sea la adecuada para que su rostro pueda ser visible.
                                </li>
                                <li>La toma debe ser totalmente de frente, enfocando únicamente su rostro y hombros(no
                                    tomar fotos
                                    de
                                    cuerpo completo).</li>
                                <li>En el caso de utilizar lentes y/o pierciengs se deben retirar para la fotografía.
                                </li>
                                <li>No usar gorras ni sombreros.</li>
                                <li><span class="resalte"><strong>Mujeres:</strong></span> cabello recogido o suelto, sin
                                    tapar el rostro acompañado
                                    de un
                                    maquillaje
                                    discreto y aretes pequeños.</li>
                                <li><span class="resalte"><strong>Hombres:</strong></span> barba, sin bigote, con la frente
                                    despejada, si tiene
                                    cabello largo
                                    debera sujetarlo para mejor visibilidad del rostro.</li>
                            </ol>
                            <span class="warning">
                                Una vez realizado los pasos de fotografía, deberás esperar el proceso de validación de tus
                                datos por el Departamento de Servicios Escolares. Recuerda que si la fotografía no cubre los
                                requisitos será rechazada y deberás tomarla nuevamente hasta que sea validada.
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
                                    <div class="col-12 col-md-8 col-lg-8 col-xl-6 mx-auto d-flex" id="section-video">
                                        <video muted="muted" id="video" class="w-100"></video>
                                        <canvas id="canvas" class="d-none"></canvas>
                                    </div>
                                    <div class="col-12 col-md-8 col-lg-8 col-xl-6 mx-auto">
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
                                        <h3 class="text-center w-100">Parte de Atrás</h3>
                                        <img src="{$WEB_ROOT}/images/credencial/atras.png" class="img-fluid img-credencial">
                                    </div>
                                </div>
                            </div>
                            <p id="estado" class="col-12"></p>
                            <div style="width: 100%;" class="text-center my-3">
                                <button class="btn btn-success" id="boton">Tomar Fotografía</button>
                            </div>
                        </div>
                    </div>
                </div>
            {else}
                {if $credential.status == 0}
                    <div class="col col-md-6 mx-auto mb-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <span class="warning text-justify">
                                    Actualmente, tu foto se encuentra en proceso de validación por el Departamento de Servicios
                                    Escolares,
                                    cuando tu información sea validada, se activará en la parte inferior de tu currícula activa
                                    el botón "Mi Credencial Digital". La credencial digital podrás descargarla en un archivo
                                    PDF, sin embargo la versión impresa de tu credencial podrás solicitarlo desde el módulo
                                    finanzas para realizar el pago correspondiente y comenzar con el proceso de impresión de
                                    aproximadamente 15 días hábiles, por lo que te será notificado a tu correo institucional
                                    cuando ya esté lista para recogerla en la ventanilla de servicios escolares de Lunes a
                                    Viernes de 8:00 am a 16:00 pm.
                                </span>
                            </div>
                        </div>
                    </div>
                {else}

                {/if}
            {/if}
        </div>
</section>