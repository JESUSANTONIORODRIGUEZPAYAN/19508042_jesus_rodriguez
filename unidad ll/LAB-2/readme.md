# LAB-02: Cifrado de credenciales y protección de datos

## 1. Introducción

En esta práctica trabajé con diferentes mecanismos de seguridad en PostgreSQL para aprender a proteger contraseñas, datos sensibles y conexiones a una base de datos. También revisé la importancia de manejar correctamente las claves criptográficas y evitar que información confidencial se publique en un repositorio.

## 2. Protección de credenciales

Aprendí que existen diferencias entre almacenar una contraseña en texto claro, utilizar un hash y cifrar información.

- **Texto claro:** la contraseña se guarda directamente y cualquier persona que pueda consultar el registro puede leerla.
- **Hash:** transforma la contraseña en un resultado que no está diseñado para recuperarse a su forma original. Para las contraseñas se recomienda utilizar un algoritmo adecuado, como bcrypt, con salt.
- **Cifrado:** transforma la información para que pueda recuperarse utilizando la clave correspondiente.

En la práctica creé tablas para comparar el almacenamiento de contraseñas en texto claro y mediante hash. También utilicé `crypt()` y `gen_salt('bf')` para generar hashes y comprobar contraseñas correctas e incorrectas.

## 3. Protección de datos sensibles

Trabajé con el ejemplo de un RFC almacenado en una tabla de PostgreSQL. Utilicé funciones de cifrado y descifrado para comprender cómo proteger información sensible.

El RFC necesita protección porque puede utilizarse para identificar a una persona. El cifrado ayuda a evitar que el dato se lea directamente si alguien obtiene acceso al contenido almacenado, siempre que la clave se mantenga segura.

También aprendí que es importante limitar el acceso a estos datos mediante usuarios y permisos de la base de datos.

## 4. TLS

TLS permite proteger la información que viaja entre un cliente y un servidor, evitando que terceros puedan leerla fácilmente durante la transmisión.

En PostgreSQL revisé la configuración mediante los comandos `SHOW ssl`, `SHOW ssl_min_protocol_version`, `SHOW port` y `SHOW listen_addresses`. También consulté `pg_stat_ssl` para comprobar si mi conexión utilizaba TLS.

Los resultados obtenidos fueron:

- `ssl = off`: SSL/TLS estaba deshabilitado en el servidor.
- `ssl_min_protocol_version = TLSv1.2`: la versión mínima configurada era TLS 1.2.
- `port = 5432`: PostgreSQL utilizaba el puerto 5432.
- `listen_addresses = *`: el servidor estaba configurado para escuchar en todas las interfaces de red disponibles.
- `pg_stat_ssl` mostró `ssl = false`: mi conexión actual no utilizaba TLS.

Con estos resultados comprendí que tener TLS 1.2 configurado como versión mínima no significa que esté activo. Para proteger las conexiones es necesario habilitarlo y configurarlo correctamente.

## 5. Gestión de claves

Las claves criptográficas deben mantenerse protegidas y separadas del código fuente. Si se guardan dentro de archivos SQL y estos se publican en GitLab, otras personas podrían obtenerlas y utilizarlas para descifrar información.

Por eso es recomendable utilizar un gestor de secretos o de claves, limitar el acceso, realizar respaldos protegidos y cambiar las claves cuando exista una sospecha de exposición.

También es importante revisar los archivos antes de realizar un commit para evitar publicar contraseñas, tokens o claves reales.

## 6. Resultados

Durante el laboratorio obtuve los siguientes resultados:

- Comprobé que una contraseña almacenada en texto claro puede leerse directamente.
- Generé hashes con bcrypt y observé que dos hashes de una misma contraseña pueden ser diferentes debido al uso de salt.
- Comprobé una contraseña correcta y otra incorrecta mediante la comparación del hash.
- Trabajé con el ejemplo de cifrado y descifrado de un RFC.
- Revisé la configuración de TLS y comprobé que la conexión actual no estaba cifrada mediante TLS.
- Analicé los riesgos de guardar claves en archivos SQL y de almacenar respaldos sin protección.
- Elaboré recomendaciones para la gestión de claves criptográficas y la revisión de secretos antes de publicar archivos en GitLab.

## 7. Problemas encontrados

Durante la práctica tuve que revisar diferentes configuraciones de PostgreSQL y ejecutar consultas para comprobar los resultados.

Uno de los aspectos más importantes fue interpretar correctamente los resultados de TLS. Aunque apareció `TLSv1.2` como versión mínima configurada, también obtuve `ssl = off` y `ssl = false`, por lo que entendí que la conexión actual no utilizaba TLS.

Esto me ayudó a distinguir entre una configuración establecida y una protección que realmente está activa.

## 8. Conclusiones

Con este laboratorio aprendí que proteger una base de datos no consiste solamente en crear usuarios y asignar permisos. También es necesario proteger las contraseñas mediante hashes, cifrar los datos sensibles, asegurar las conexiones y mantener las claves criptográficas fuera de los archivos públicos.

En un entorno productivo utilizaría contraseñas almacenadas con algoritmos seguros, TLS con validación del certificado y del nombre del servidor, permisos limitados, claves administradas de forma segura y respaldos cifrados. Además, revisaría los archivos antes de publicarlos y tendría un procedimiento para responder ante una exposición accidental.

9. Preguntas de reflexión

1. ¿Por qué una contraseña no debe almacenarse como texto claro?

Porque cualquier persona que obtenga acceso a la base de datos podría leerla directamente. Si se utiliza la misma contraseña en otros servicios, también podrían verse afectadas esas cuentas.

2. ¿Por qué un hash no es equivalente a un cifrado?

Porque un hash está diseñado para ser una transformación de un solo sentido y no necesita una clave para recuperar la contraseña original. En cambio, el cifrado permite recuperar la información utilizando la clave adecuada.

3. ¿Por qué el cifrado de una columna no sustituye al control de acceso?

Porque el cifrado protege el contenido, pero no decide quién tiene permiso para consultar o modificar los registros. Los permisos siguen siendo necesarios para limitar el acceso a la información.

4. ¿Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?

Porque TLS protege la comunicación entre el cliente y el servidor, mientras que los permisos de PostgreSQL determinan qué operaciones puede realizar cada usuario. Ambos mecanismos cumplen funciones diferentes.

5. ¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?

Podría perder la capacidad de recuperar los datos cifrados. Por eso es importante mantener respaldos seguros de las claves y establecer procedimientos para recuperarlas cuando sea necesario.

6. ¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?

Una persona podría copiarla y utilizarla para acceder a información protegida. La clave debe considerarse comprometida, revocarse o reemplazarse y se debe revisar si hubo accesos no autorizados.

7. ¿Por qué un repositorio privado no debe considerarse un almacén de secretos?

Porque otras personas con acceso al repositorio podrían ver las claves y, además, el repositorio puede compartirse por error o sufrir una filtración. Es más seguro utilizar un gestor de secretos.

8. ¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?

La protección en reposo protege los datos guardados en una base de datos o en un archivo. La protección en tránsito protege los datos mientras viajan por una conexión entre equipos, por ejemplo, mediante TLS.

9. ¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?

Porque si una clave se pierde, se roba o se publica, la información protegida puede quedar inaccesible o expuesta, incluso cuando se utiliza un algoritmo criptográfico seguro.

10. ¿Qué mecanismo adicional implementarías en una organización para proteger los respaldos de las bases de datos?

Implementaría el cifrado de los respaldos, restringiría el acceso a las personas autorizadas y mantendría copias en una ubicación separada y segura. También realizaría pruebas periódicas de restauración para comprobar que los respaldos funcionan.