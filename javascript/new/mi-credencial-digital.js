
// /*
//     Tomar una fotografía y guardarla en un archivo v3
//     @date 2018-10-22
//     @author parzibyte
//     @web parzibyte.me/blog
// */
const tieneSoporteUserMedia = () =>
    !!(navigator.getUserMedia || (navigator.mozGetUserMedia || navigator.mediaDevices.getUserMedia) || navigator.webkitGetUserMedia || navigator.msGetUserMedia)
const _getUserMedia = (...arguments) =>
    (navigator.getUserMedia || (navigator.mozGetUserMedia || navigator.mediaDevices.getUserMedia) || navigator.webkitGetUserMedia || navigator.msGetUserMedia).apply(navigator, arguments);

// Declaramos elementos del DOM
const $video = document.querySelector("#video"),
    $sectionVideo = document.querySelector("#section-video"),
    $seccionFoto = document.querySelector("#seccion-foto"),
    $seccionSubmit = document.querySelector("#seccion-submit"),
    $canvas = document.querySelector("#canvas"),
    $canvasCredencial = document.querySelector("#canvas-credencial"),
    $credencialFrontal = document.querySelector("#credencial-frontal"),
    $estado = document.querySelector("#estado"),
    $boton = document.querySelector("#boton"),
    $nuevaFoto = document.querySelector("#nueva-foto"),
    $enviarFoto = document.querySelector("#enviar-foto"),
    $listaDeDispositivos = document.querySelector("#listaDeDispositivos");
const limpiarSelect = () => {
    for (let x = $listaDeDispositivos.options.length - 1; x >= 0; x--)
        $listaDeDispositivos.remove(x);
};
const obtenerDispositivos = () => navigator
    .mediaDevices
    .enumerateDevices();

// La función que es llamada después de que ya se dieron los permisos
// Lo que hace es llenar el select con los dispositivos obtenidos
const llenarSelectConDispositivosDisponibles = () => {

    limpiarSelect();
    obtenerDispositivos()
        .then(dispositivos => {
            const dispositivosDeVideo = [];
            dispositivos.forEach(dispositivo => {
                const tipo = dispositivo.kind;
                if (tipo === "videoinput") {
                    dispositivosDeVideo.push(dispositivo);
                }
            });

            // Vemos si encontramos algún dispositivo, y en caso de que si, entonces llamamos a la función
            if (dispositivosDeVideo.length > 1) {
                // Llenar el select
                dispositivosDeVideo.forEach(dispositivo => {
                    const option = document.createElement('option');
                    option.value = dispositivo.deviceId;
                    option.text = dispositivo.label;
                    $listaDeDispositivos.parentElement.classList.remove('d-none');
                    $listaDeDispositivos.appendChild(option);
                });
            }
        });
}

function drawImageProp(ctx, source, iw, ih, x, y, w, h, offsetX, offsetY) {
    if (arguments.length === 2) {
        x = y = 0;
        w = ctx.canvas.width;
        h = ctx.canvas.height;
    }
    // default offset is center
    offsetX = typeof offsetX === "number" ? offsetX : 0.5;
    offsetY = typeof offsetY === "number" ? offsetY : 0.5;

    // keep bounds [0.0, 1.0]
    if (offsetX < 0) offsetX = 0;
    if (offsetY < 0) offsetY = 0;
    if (offsetX > 1) offsetX = 1;
    if (offsetY > 1) offsetY = 1;

    var iw = iw,
        ih = ih,
        r = Math.min(w / iw, h / ih),
        nw = iw * r,   // new prop. width
        nh = ih * r,   // new prop. height  
        cx, cy, cw, ch, ar = 1;
    console.log(nw);
    console.log(nh);
    // decide which gap to fill
    if (nw < w) ar = w / nw;
    if (nh < h) ar = h / nh;
    nw *= ar;
    nh *= ar;

    // calc source rectangle
    cw = iw / (nw / w);
    ch = ih / (nh / h);

    cx = (iw - cw) * offsetX;
    cy = (ih - ch) * offsetY;

    // make sure source rectangle is valid
    if (cx < 0) cx = 0;
    if (cy < 0) cy = 0;
    if (cw > iw) cw = iw;
    if (ch > ih) ch = ih;
    ctx.drawImage(source, cx, cy, cw, ch, x, y, w, h);
};
(function () {
    if (!$nuevaFoto) {
        return false;
    }
    $nuevaFoto.addEventListener('click', function () {
        $seccionSubmit.classList.add('d-none');
        $seccionFoto.classList.remove('d-none');
        $canvas.classList.add('d-none');
        document.getElementById("video").classList.remove('d-none');
    });

    $enviarFoto.addEventListener('click', function () {
        let foto = $canvas.toDataURL();
        fetch(window.location, {
            method: "POST",
            body: encodeURIComponent(foto),
            headers: {
                "Content-type": "application/x-www-form-urlencoded",
            }
        }).then(resultado => {
            console.log(resultado);
            return resultado.text()
        }).then(rutaFoto => {
            // console.log("La foto fue enviada correctamente");
            $estado.innerHTML = `Foto guardada con éxito, espera validación del Departamento de Servicios Escolares.`;
            $seccionFoto.classList.add('d-none');
            $seccionSubmit.classList.add('d-none');
            setTimeout(() => {
                location.reload();
            }, 5000);
        });
    });
    // Comenzamos viendo si tiene soporte, si no, nos detenemos
    if (!tieneSoporteUserMedia()) {
        alert("Lo siento. Tu navegador no soporta esta característica");
        $estado.innerHTML = "Parece que tu navegador no soporta esta característica. Intenta actualizarlo.";
        return;
    }

    let newHeight = (900 / 720) * $video.offsetWidth;
    console.log(newHeight);
    $sectionVideo.style.height = newHeight + "px";
    //Aquí guardaremos el stream globalmente
    let stream;

    let useMedia = document.getElementById("use-media");
    if (useMedia !== null) {
        obtenerDispositivos()
            .then(dispositivos => {
                // Vamos a filtrarlos y guardar aquí los de vídeo
                const dispositivosDeVideo = [];

                // Recorrer y filtrar
                dispositivos.forEach(function (dispositivo) {
                    const tipo = dispositivo.kind;
                    if (tipo === "videoinput") {
                        dispositivosDeVideo.push(dispositivo);
                    }
                });

                // Vemos si encontramos algún dispositivo, y en caso de que si, entonces llamamos a la función
                // y le pasamos el id de dispositivo
                if (dispositivosDeVideo.length > 0) {
                    // Mostrar stream con el ID del primer dispositivo, luego el usuario puede cambiar
                    mostrarStream(dispositivosDeVideo[0].deviceId);
                }
            });

        const mostrarStream = idDeDispositivo => {
            _getUserMedia({
                video: {
                    // Justo aquí indicamos cuál dispositivo usar
                    width: 1920,
                    deviceId: idDeDispositivo,
                }
            },
                (streamObtenido) => {
                    // Aquí ya tenemos permisos, ahora sí llenamos el select,
                    // pues si no, no nos daría el nombre de los dispositivos
                    llenarSelectConDispositivosDisponibles();

                    // Escuchar cuando seleccionen otra opción y entonces llamar a esta función
                    $listaDeDispositivos.onchange = () => {
                        // Detener el stream
                        if (stream) {
                            stream.getTracks().forEach(function (track) {
                                track.stop();
                            });
                        }
                        // Mostrar el nuevo stream con el dispositivo seleccionado
                        mostrarStream($listaDeDispositivos.value);
                    }

                    // Simple asignación
                    stream = streamObtenido;

                    // Mandamos el stream de la cámara al elemento de vídeo
                    $video.srcObject = stream;
                    $video.play();

                    //Escuchar el click del botón para tomar la foto
                    //Escuchar el click del botón para tomar la foto
                    $boton.addEventListener("click", function () {

                        //Pausar reproducción
                        $video.pause();
                        $estado.innerHTML = "Tomando foto. Por favor, espera...";
                        //Obtener contexto del canvas y dibujar sobre él
                        let contexto = $canvas.getContext("2d");
                        let contexto2 = $canvasCredencial.getContext("2d");
                        $canvas.width = 720;
                        $canvas.height = 900;
                        $canvasCredencial.width = $canvasCredencial.offsetWidth;
                        $canvasCredencial.height = $canvasCredencial.offsetHeight;
                        drawImageProp(contexto, $video, $video.videoWidth, $video.videoHeight, 0, 0, $canvas.width, $canvas.height);
                        drawImageProp(contexto2, $canvas, $canvas.width, $canvas.height, 0, 0, $canvasCredencial.width, $canvasCredencial.height, 0, 50);
                        $video.classList.add('d-none');
                        $canvas.classList.remove('d-none');
                        $canvasCredencial.classList.remove('d-none');
                        $estado.innerHTML = "Foto tomada";
                        $seccionFoto.classList.add('d-none');
                        $seccionSubmit.classList.remove('d-none');
                        // //Reanudar reproducción
                        $video.play();
                    });
                }, (error) => {
                    console.log("Permiso denegado o error: ", error);
                    $estado.innerHTML = "No se puede acceder a la cámara, o no diste permiso.";
                });
        }
    }
})();

if (document.getElementById('credencial')) {
    $.getScript(WEB_ROOT + "/javascript/new/qrcode.js", function () {
        const codigoQRDiv = document.getElementById('codigo-qr');
        let token = codigoQRDiv.dataset.token;
        const codigoQR = new QRious({
            element: codigoQRDiv,
            value: token,
            size: 256
        });
    });
}
