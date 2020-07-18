# Proyecto LMS
- Clonar proyecto (app es el nombre del folder que queremos crear, podemos usar el que queramos)
  - git clone https://github.com/mwleinad/iap.git lms
  - Si estas usando wamp lo mas facil es abrir una terminal, ir a C:/wamp/www/ y ejecutar el comando de arriba
  - Esto creara un folder en c:/wamp/www/lms
- Importar la base de datos. 
  - Crear una nueva base de datos (generalmente con phpmyadmin) llamada lms (o cualquier otro nombre)
  - Importar el archivo lms.sql
- Modificar el archivo .envexample
    - Cambiar el nombre a .env
    - Cambiar los valores que apliquen a nuestro proyecto (Si estamos usando wamp existe la posibilidad de no cambiar nada)
- En la carpeta lms corre "composer install"
  - Eso instalara las dependencias que necesitamos
  - Si no tienes composer lo puedes instalar en https://getcomposer.org/doc/00-intro.md#installation-windows
- Permisos
  - En localhost (wamp) no es necesario cambiar permisos pero en el servidor real es posible que haya que dar permisos a algunas carpetas, ejecutar lo siguiente
    - chmod 777 templates_c 
    - chmod 777 ajax/templates_c
    - chmod 777 ajax/new/templates_c
  
#PHP y APACHE  
- Version PHP 7.2
- Apache, Activar modulo mod_rewrite

TODO folders
    
  
  
