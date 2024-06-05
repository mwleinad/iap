<?php
include_once('../initPdf.php');
include_once('../config.php');
include_once(DOC_ROOT . '/libraries.php');
setlocale(LC_TIME, 'es_ES.UTF-8');

use Dompdf\Dompdf;
use Dompdf\Options;


session_start();
$where = "studentId = {$_GET['studentId']} AND courseId = {$_GET['courseId']}";
$constanciaAlumno = $constancias->getConstanciaConocer($where);
$imagen = file_get_contents(DOC_ROOT . "/images/logo_correo.jpg");
$logo_IAP = 'data:image/jpg;base64,' . base64_encode($imagen);
$imagen = file_get_contents(DOC_ROOT . "/images/logoconocer.png");
$logo_RED = 'data:image/jpg;base64,' . base64_encode($imagen);
$imagen = file_get_contents(DOC_ROOT . "/images/firma_conocer.png");
$firma = 'data:image/jpg;base64,' . base64_encode($imagen);
$anio = date('Y', strtotime($constanciaAlumno['updated_at']));
$fecha_espanol = strftime("%d de %B de %Y", strtotime($constanciaAlumno['updated_at']));
$fecha_sello = strftime("%d %b %Y", strtotime($constanciaAlumno['updated_at']));
$dia = date('d', strtotime($constanciaAlumno['updated_at']));
$mes = strftime('%B', strtotime($constanciaAlumno['updated_at']));
$student->setUserId($constanciaAlumno['studentId']);
$alumno = $student->InfoStudent();
$course->setCourseId($constanciaAlumno['courseId']);
$curso = $course->Info();
$util->apocope = true;  
$html = '<html>
            <head> 
                <style type="text/css">
                    .page_break { page-break-before: always; }
                </style>
            </head>
            <body style="boder:1px solid;">
                <table style="width:100%">
                    <tr>
                        <td><img src="' . $logo_IAP . '" style="width:220px;"></td>
                        <td style="text-align:right;"><img src="' . $logo_RED . '" style="width:180px;"></td>
                    </tr> 
                </table>
                <table style="width:100%">
                    <tr>
                        <td></td>
                        <td style="text-align:right;">
                            <div style="padding-top:50px; padding-right:20px; font-family:verdana; font-size:14px;">
                                Tuxtla Gutiérrez, Chiapas; a ' . $fecha_espanol . '<br>
                                Constancia No. IAP/DCYECL/<span style="color:red;">' . $constanciaAlumno['folio'] . '</span>/' . $anio . '
                            </div>
                        </td>
                    </tr>
                </table>

                <table style="width:100%">
                    <tr>
                        <td style="font-family:verdana">
                            <div style="padding-left:40px; padding-right:25px; font-size:16px;">
                                <p style="font-size:15px;"><strong>A QUIEN CORRESPONDA:</strong></p>
                                <p style="text-align:justify;">
                                    La que suscribe <strong>Dra. Erika Aguilar Farrera, Directora</strong> de la <strong>Entidad de Certificación y Evaluación ECE213-15;</strong> por medio del presente:
                                </p>
                                <p style="text-align:center;letter-spacing: 4px; font-size:18px;">
                                    <strong>HACE CONSTAR</strong>
                                </p>
                                <p style="text-align:justify; padding-bottom:20px;">
                                    Que la <strong>C. ' . mb_strtoupper($alumno['names']) . ' ' . mb_strtoupper($alumno['lastNamePaterno']) . ' ' . mb_strtoupper($alumno['lastNameMaterno']) . '</strong>, fue evaluada por esta Entirdad en el estándar <strong>"' . $curso['name'] . '"</strong> con resultados de <strong>"Competente"</strong>
                                </p> 
                                <p style="text-align:justify; padding-bottom:20px;">
                                    Cabe señalar que la emisión del Certificado de dicha competencia, es posterior al proceso de revisión que el <strong>Comité de dictamen</strong> de esta entidad lleva a cabo, de acuerdo a la normatividad de CONOCER. Esto con el fin de garantizar la transparencia en los procesos de evaluación, por lo anterior, la presente tiene una vigencia de 90 días a partir de la fecha emitida.
                                </p>
                                <p style="text-align:justify; padding-bottom:20px;">
                                    El proceso realizado por esta entidad, es exclusivamente para validar, calificar y aprobar la competencia laboral de acuerdo al estándar presentado, tal y como lo establece las normas del programa del Consejo de Normalización de Certificación y Competencias Laborales CONOCER.
                                </p>
                                <p style="text-align:justify;">
                                    A petición de la parte interesada, se extiende la presente en la Ciudad de Tuxtla Gutiérrez, Chiapas; a los <span style="text-transform: lowercase;">'.$util->toWords($dia).'</span> días del mes de <span style="text-transform: lowercase;">'.$mes.'</span> del presente año.
                                </p>                    
                                <p style="padding-top:140px; position:relative;">
                                    <strong>Dra. Erika Aguilar Farrera</strong>
                                    <img src="'.$firma.'" style="width:420px; position:absolute; top:-10; left:0;">
                                    <span style="position:absolute; top:35; left:255px; color:red; font-size:15px">'.mb_strtoupper($fecha_sello).'</span>
                                </p>
                                C.c.p- Archivo
                            </div>
                        </td>
                    </tr>
                </table>
            </body>
        </html>';
$dompdf = new Dompdf();
//transform: rotate(10deg); transform-origin: 50%;
# Definimos el tamaño y orientación del papel que queremos.
# O por defecto cogerá el que está en el fichero de configuración.
$dompdf->set_paper("legal", "portrait");
# Cargamos el contenido HTML.
$dompdf->load_html($html);
# Renderizamos el documento PDF.
$dompdf->render();
# Enviamos el fichero PDF al navegador.
$nameStudent = str_replace(" ", "_", $nameStudent);
$dompdf->stream("Constancia_{$nameStudent}.pdf", array('Attachment' => 0));
