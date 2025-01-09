<?php

$message[1]["subject"] = "Estas oficialmente pre-inscrito al Programa de Alta Dirección del Instituto de Administración Pública del Estado de Chiapas";
$message[1]["body"] = "
	¡Bienvenido/a a nuestro programa de estudios! 

	Estamos muy contentos de tenerte como estudiante en nuestro programa y esperamos que esta experiencia sea enriquecedora y satisfactoria para ti. Queremos que sepas que estamos comprometidos a brindarte el mejor servicio y apoyo para que puedas alcanzar tus metas académicas.

	En este programa tendrás acceso a recursos y herramientas que te ayudarán a desarrollar tus habilidades y conocimientos, así como a una comunidad de compañeros y profesores dispuestos a ayudarte en todo lo que necesites. No dudes en comunicarte con nosotros si tienes preguntas o inquietudes sobre el programa.

	El(la) |major| de tu elección es:
	<b>|course|</b>
	
	Tus datos para ingresar al sistema son los siguientes
	https://app.iapchiapas.edu.mx/

	<b>Usuario:</b> |email|
	<b>Contrase&ntilde;a del Sistema:</b>	|password|
	
	Tu solicitud de pre-inscripción está siendo revisada por nuestro personal, por lo que en breve recibirás un correo con la confirmación de tu inscripción, esto te dará acceso total a la currícula elegida

	¡Te deseamos éxito en tu camino de aprendizaje!
	
	Nota:
	Ingresa al Sistema de Educación en Línea para completar tus datos y generar la cédula de inscripción.
	
	Para mejor la experiencia de navegación en nuestro Sistema de Educación en Línea, te recomendamos utilizar el navegador Chrome así como también consultar el manual del alumno que se encuentra disponible en el siguiente enlace:
	<a href='https://iapchiapas.edu.mx/manual_alumno.pdf'>www.iapchiapas.edu.mx/manual_alumno.pdf</a>

	";

$message[2]["subject"] = "Pago autorizado";
$message[2]["body"] = "
	El Instituto de Administración Pública del Estado de Chiapas, A. C., agradece tu pago y te informa que este ha sido autorizado. El acceso a:

	El(la) |major| <b>|course|</b>
	Se encuentra activo por lo que ya puedes acceder a la curr�cula que hayas elegido.
	";


$message[3]["subject"] = "Estas oficialmente inscrito al módulo | Instituto de Administración Pública del Estado de Chiapas";
$message[3]["body"] = "
	Bienvenido al Instituto de Administración Pública del Estado de Chiapas. Estamos muy agradecidos que nos hayas elegido.
	
	El módulo de tu elección es:
	<b>|module|</b>
	
	Tu datos para ingresar al sistema son los siguientes
	<b>Usuario:</b> |email|
	<b>Contrase&ntilde;a del Sistema:</b>	|password|

	Nota:
	
	Para mejor la experiencia de navegación en nuestro Sistema de Educación en Línea, te recomendamos utilizar el navegador Chrome así como también consultar el manual del alumno que se encuentra disponible en el siguiente enlace:
	<a href='https://iapchiapas.edu.mx/manual_alumno.pdf'>www.iapchiapas.edu.mx/manual_alumno.pdf</a>";


$message[4]["subject"] = "Boleta de Calificaciones Disponible | Instituto de Administración Pública del Estado de Chiapas";
$message[4]["body"] = "
	Te informamos que la Boleta de Calificaciones del |semester|: |period| de el(la) |course| ya se encuentra disponible para su descarga desde la <a href='https://app.iapchiapas.edu.mx/'>Plataforma de Educación en Línea</a>.
	Nota:
	Para mejor la experiencia de navegación en nuestro Sistema de Educación en Línea, te recomendamos utilizar el navegador Chrome así como también consultar el manual del alumno que se encuentra disponible en el siguiente enlace:
	<a href='https://iapchiapas.edu.mx/manual_alumno.pdf'>www.iapchiapas.edu.mx/manual_alumno.pdf</a>";



$message[5]["subject"] = "Actualización de Datos | Instituto de Administración Pública del Estado de Chiapas";
$message[5]["body"] = "
	Tus datos han sido actualizados en el Sistema de Educación en Línea. 
	
	El(la) |major| de tu elección es:
	<b>|course|</b>
	
	Tu datos para ingresar al sistema son los siguientes
	<b>Usuario:</b> |email|
	<b>Contrase&ntilde;a del Sistema:</b>	|password|

	Nota:
	Por favor descarga la cédula de inscripción en el siguiente enlace https://app.iapchiapas.edu.mx/pdf/solicitudes.php?alumnoId=|alumno|&cursoId=|courseId| , misma que tendrás que presentar en las oficinas del IAP-Chiapas, ubicadas en Libramiento Norte Poniente No 2718. Fraccionamiento Ladera de la Loma. Tgz, Chiapas.
	
	Para mejor la experiencia de navegación en nuestro Sistema de Educación en Línea, te recomendamos utilizar el navegador Chrome así como también consultar el manual del alumno que se encuentra disponible en el siguiente enlace:
	<a href='https://iapchiapas.edu.mx/manual_alumno.pdf'>www.iapchiapas.edu.mx/manual_alumno.pdf</a>

	";

$message[6]["subject"] = "Comprobante de Pago | Instituto de Administración Pública del Estado de Chiapas";
$message[6]["body"] = "Pago aprobado
						El pago con su tarjeta fue procesado exitosamente.
						Detalles de la transacción:
							<b>* Monto total:</b> $|monto|
							<b>* No. de referencia:</b> |referencia|
							<b>* Método de pago:</b> |metodo|
							<b>* Fecha y hora:</b> |fecha|
						Si tiene alguna duda, puede comunicarse al Departamento de Finanzas y Contabilidad al teléfono 961 125 1508 Ext. 116 de lunes a viernes de 8:00 am a 4:00 pm";

$message[7]["subject"] = "Pago Declinado | Instituto de Administración Pública del Estado de Chiapas";
$message[7]["body"] = "<b>Pago NO realizado</b>
						El pago con su tarjeta no fue procesado.
						El pago que intentó realizar con la referencia |referencia| por el monto $|monto| no pudo ser procesado. No se ha realizado ningún cargo a su tarjeta en relación con este intento de pago.
						Para resolver esta situación y proceder con su pago, le sugerimos seguir los siguientes pasos:
							<b>* Verifique que los detalles de su tarjeta sean correctos, incluidos el número de tarjeta, la fecha de vencimiento y el código de seguridad CVV.</b>
							<b>* Revisar que el monto a pagar se encuentre disponible en su tarjeta.</b>
							<b>* Comunicarse al banco emisor de la tarjeta para obtener asistencia adicional.</b>
							<b>* Si el problema persiste, le sugerimos intentar realizar su pago con otra tarjeta.</b>
						Si tiene alguna duda, puede comunicarse al Departamento de Finanzas y Contabilidad al teléfono 961 125 1508 Ext. 116 de lunes a viernes de 8:00 am a 4:00 pm";


$message[8]["subject"] = "Credencial Digital Aprobada | Instituto de Administración Pública del Estado de Chiapas";
$message[8]["body"]	= "Te informamos que la foto de tu credencial digital ha sido aprobada, puedes revisar en la opción \"Mi credencial digital\" de tu currícula activa.";

$message[9]["subject"] = "Credencial Digital Rechazada | Instituto de Administración Pública del Estado de Chiapas";
$message[9]["body"]	= "Te informamos que la foto de tu credencial digital ha sido rechazada debido a los siguientes motivos: <br>
|motivos|
<br>
Favor de realizar de nueva cuenta el proceso para generar tu credencial digital.";

$message[10]['subject'] = "Actualización de documentación | Instituto de Administración Pública del Estado de Chiapas";
$message[10]['body'] = "El docente |docente| ha actualizado el siguiente documento: \"|documento|\"";

$message[11]['subject'] = "Constancia de Evaluación| Instituto de Administración Pública del Estado de Chiapas";
$message[11]['body'] = "Estimado usuario,

Se encuentra disponible para su descarga la constancia digital de la evaluación del estándar: |major|.

Para descargarlo, deberá ingresar a nuestro Sistema de educación:

https://app.iapchiapas.edu.mx 
Usuario: |usuario|
Contraseña: |password|

Posterior a ello, deberás dar click sobre el botón 'Constancia' ubicado en el estándar dentro de su perfil inicial.";


$message[12]['subject'] = "Solicitud de credencial digital | Instituto de Administración Pública del Estado de Chiapas";
$message[12]['body'] = "Estimado administrador,

El alumno |alumno| ha generado una solicitud para su Credencial Digital. Puedes revisarla en la siguiente ruta: 
https://app.iapchiapas.edu.mx/credenciales";

$message[13]['subject'] = "Mensaje de bienvenida | Instituto de Administración Pública del Estado de Chiapas";
$message[13]['body'] = "Bienvenido al Instituto de Administración Pública del Estado de Chiapas. Estamos muy agradecidos que nos hayas elegido.
	
	Estamos emocionados de tenerte como parte de nuestra comunidad educativa. Tu registro ha sido exitoso, y pronto uno de nuestros representantes se pondrá en contacto contigo para proporcionarte más detalles y ayudarte a aprovechar al máximo esta experiencia de aprendizaje.

	Mientras tanto, te invitamos a explorar nuestra plataforma y descubrir todo lo que tenemos para ofrecer. Si tienes alguna pregunta, no dudes en contactarnos en contacto@iapchiapas.edu.mx o a través de nuestro whatsapp 961 172 4971.

	¡Gracias por elegirnos para tu desarrollo educativo!

	Tu datos para ingresar al sistema son los siguientes
	<b>Liga de Acceso:</b> https://app.iapchiapas.edu.mx/
	<b>Usuario:</b> |usuario|
	<b>Contrase&ntilde;a del Sistema:</b> |contrasena|

	Atentamente, el Instituto de Administración Pública del Estado de Chiapas";

$message[14]['subject'] = "Nuevo Registro de Alumno | Instituto de Administración Pública del Estado de Chiapas";
$message[14]['body'] = "Hola |academico|, 
	Te informamos que un nuevo alumno, |alumno|, se ha registrado recientemente en nuestra plataforma. Es necesario que lo contactes a la brevedad para brindarle más información y orientarlo sobre los próximos pasos en su proceso educativo.

	Detalles del alumno: 
	Nombre: |alumno|
	Correo electrónico: |correo|
	Teléfono: |telefono|
	Currícula en la que está interesado: |curso|
	Fecha de registro: |fecha|

	Gracias por tu atención y esfuerzo para garantizar una experiencia positiva para nuestros alumnos.

	Atentamente, el Instituto de Administración Pública del Estado de Chiapas";

