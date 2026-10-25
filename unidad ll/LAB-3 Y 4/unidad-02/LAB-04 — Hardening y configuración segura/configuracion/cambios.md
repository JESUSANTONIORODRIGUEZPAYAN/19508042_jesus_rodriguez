# Cambios realizados en PostgreSQL

## Cambio 1. Limitar las conexiones de PostgreSQL

Al principio, PostgreSQL estaba configurado para escuchar en todas las interfaces de red, porque tenía el valor `listen_addresses = '*'`.

Como estoy trabajando con la base de datos desde mi propia computadora, cambié ese valor a `localhost` en el archivo `postgresql.conf`. Después guardé el archivo y reinicié el servicio de PostgreSQL.

Para comprobar que el cambio funcionó, ejecuté `SHOW listen_addresses;` en pgAdmin y obtuve el resultado `localhost`. También revisé el puerto con PowerShell y comprobé que PostgreSQL escucha en `127.0.0.1:5432` y `[::1]:5432`.

Con esto limité las conexiones a mi computadora y reduje la posibilidad de que otros equipos intenten conectarse directamente. También revisé las reglas de `pg_hba.conf` y no encontré errores.

**Estado:** cambio realizado y verificado.

## Revisión de los roles y permisos

Después revisé los roles de PostgreSQL. Encontré que `postgres` tiene permisos de administrador, por lo que puede crear roles y bases de datos. Estos permisos son normales para una cuenta administrativa, pero es importante utilizarla con cuidado.

También revisé el rol `analista` y encontré que no tiene permisos de superusuario ni puede crear roles o bases de datos. Además, tiene deshabilitado el inicio de sesión.

Por ahora no cambié estos permisos, porque primero quiero asegurarme de cuáles necesita cada cuenta. La idea es evitar dar permisos que realmente no sean necesarios.

## Cambio 2. Activar los registros de conexiones

Al revisar la configuración, encontré que PostgreSQL ya tenía habilitado el sistema para guardar los registros en archivos, dentro de la carpeta `log`.

Sin embargo, los parámetros `log_connections` y `log_disconnections` estaban desactivados. Decidí activarlos para tener más información sobre las conexiones y desconexiones que se realizan en la base de datos.

Después de guardar los cambios y reiniciar el servicio, ejecuté consultas en pgAdmin para comprobar los resultados. Ambos parámetros aparecieron en `on`, así que confirmé que el cambio se aplicó correctamente.

Estos registros pueden servir para revisar la actividad de la base de datos y detectar conexiones que necesiten investigarse. También es importante proteger los archivos de registro y evitar que ocupen demasiado espacio.

**Estado:** cambio realizado y verificado.

## Revisión de TLS

También revisé la configuración de SSL/TLS y encontré que el parámetro `ssl` está en `off`. Aunque PostgreSQL tiene configurados los nombres `server.crt` y `server.key`, comprobé desde PowerShell que esos archivos no se encuentran en la carpeta de datos que revisé.

Por eso, no activé TLS todavía. Primero sería necesario comprobar o generar un certificado y una clave privada válidos, y después verificar que PostgreSQL pueda utilizarlos.

Como actualmente limité las conexiones a `localhost`, reduje la exposición de la base de datos. Aun así, dejo anotado que TLS sigue pendiente de revisar y configurar si el laboratorio lo requiere.

**Estado:** pendiente de configuración y verificación.

## Revisión de los permisos de los archivos

Con PowerShell revisé los permisos de `postgresql.conf`, `pg_hba.conf` y la carpeta de datos de PostgreSQL.

Encontré que mi usuario de Windows, los administradores, SYSTEM y `NETWORK SERVICE` tienen permisos sobre estos archivos o carpetas. También comprobé que el servicio `postgresql-x64-17` se ejecuta con la cuenta `NT AUTHORITY\NetworkService` y que está funcionando correctamente.

No modifiqué los permisos del sistema operativo porque primero necesito saber cuáles requiere el servicio para funcionar sin problemas. De todas formas, considero importante revisar que solo las cuentas necesarias puedan modificar los archivos de configuración y los datos de PostgreSQL.

Estado: revisión realizada; los permisos todavía no se han modificado.

## Verificación final

Para terminar, ejecuté una consulta en pgAdmin para revisar los parámetros principales de la configuración.

Los resultados confirmaron que `listen_addresses` está en `localhost`, que `log_connections` y `log_disconnections` están en `on`, y que `password_encryption` utiliza `scram-sha-256`.

El puerto continúa en `5432`, que es el predeterminado de PostgreSQL. No lo cambié porque hacerlo por sí solo no mejora de manera importante la seguridad.

El único parámetro que sigue pendiente de revisar es `ssl`, que continúa en `off`. También queda pendiente terminar de evaluar los permisos de los archivos de configuración.

En general, los cambios principales que realicé fueron limitar las conexiones a mi computadora y activar los registros de conexiones y desconexiones. Ambos cambios fueron comprobados con consultas en pgAdmin y comandos de PowerShell.