# Informe — LAB-04: Hardening y configuración segura de PostgreSQL

## Introducción
En esta práctica revisé la configuración de PostgreSQL para identificar puntos que pueden representar riesgos de seguridad. La idea es conocer cómo acepta conexiones qué métodos de autenticación utiliza y qué medidas se pueden aplicar para reducir accesos innecesarios.

## Entorno de trabajo
La práctica se realizó en Windows usando pgAdmin 4 y PostgreSQL 17. Aunque la guía menciona PostgreSQL 16, se registraron los datos de la versión instalada en el equipo.

## 1. Superficie de ataque inicial
El servidor utiliza el puerto 5432, escucha en todas las interfaces (`listen_addresses = '*'`), tiene SSL desactivado (`ssl = off`) y utiliza `scram-sha-256` como método predeterminado para los hashes de nuevas contraseñas. También encontré que el registro de conexiones y desconexiones está desactivado.

## 2. Archivos de configuración
Los archivos encontrados fueron `postgresql.conf`, `pg_hba.conf` y `pg_ident.conf`, ubicados en `C:/Program Files/PostgreSQL/17/data/`. El directorio de datos está en esa misma carpeta. Estos archivos son importantes porque permiten revisar la configuración general, las reglas de autenticación y las asignaciones de usuarios.

## 3. Conexiones actuales

En la revisión inicial de `pg_stat_activity` observé conexiones de `postgres` mediante pgAdmin 4, con la dirección `::1`, que corresponde a la propia computadora. Después de realizar los cambios, revisé la configuración de escucha con PowerShell y comprobé que PostgreSQL acepta conexiones locales mediante `127.0.0.1` y `::1`. Esto permite limitar el acceso directo desde otras interfaces de red.

## 4. Revisión de reglas y roles

Al revisar `pg_hba.conf`, encontré reglas para conexiones locales y para las direcciones `127.0.0.1` y `::1`, además de reglas para replicación. La columna de errores no mostró problemas en las reglas consultadas.

También revisé los roles de PostgreSQL. El usuario `postgres` tiene privilegios de superusuario y puede crear roles y bases de datos. Por otro lado, el rol `analista` no tiene privilegios de superusuario ni puede crear roles o bases de datos, y tiene deshabilitado el inicio de sesión.

No modifiqué los permisos de estos roles, porque primero es necesario determinar qué permisos necesita cada uno.

## 5. Análisis de riesgos
- Escuchar en todas las interfaces puede ampliar la superficie de exposición.
- Tener SSL desactivado no proporciona TLS desde la configuración del servidor para conexiones que lo requieran.
- No registrar conexiones ni desconexiones reduce la información disponible para revisar accesos.
- Una contraseña fuerte no evita que un usuario con permisos excesivos haga cambios indebidos.
- Una regla de autenticación amplia puede permitir intentos desde redes que no se necesitan.
- La exposición real también depende del firewall, la red, los roles y las reglas de `pg_hba.conf`.

## 6. Medidas recomendadas
- Escuchar solo en localhost cuando el uso sea exclusivamente local.
- Limitar las conexiones remotas a direcciones y subredes necesarias.
- Evaluar TLS para conexiones por red.
- Mantener `scram-sha-256` para contraseñas nuevas y usar contraseñas robustas.
- Separar las cuentas de administración, aplicación y consulta.
- Dar a la aplicación solo los permisos que necesita y nunca usar una cuenta `SUPERUSER` para sus operaciones normales.
- Revisar permisos de archivos y directorios desde Windows.
- Habilitar registros según las necesidades de auditoría y administrar su tamaño.
- Revisar periódicamente roles, extensiones, reglas y parámetros.

## 7. Respuestas del informe 

### 1. ¿Cuál era la principal superficie de ataque?

La principal superficie de ataque estaba relacionada con las conexiones que PostgreSQL permite recibir, las interfaces de escucha, el puerto 5432, las reglas de acceso y los usuarios que pueden conectarse a la base de datos.

### 2. ¿Qué configuración representaba el mayor riesgo?

Una configuración que debía revisarse era `listen_addresses = '*'`, porque permite que PostgreSQL escuche en todas las interfaces disponibles. También se observó que SSL estaba desactivado. El riesgo real depende de las reglas de acceso, el firewall y si se permiten conexiones remotas.

### 3. ¿Qué cambio produjo la mayor reducción de exposición?

El cambio más importante fue modificar listen_addresses de '*' a 'localhost'. Con esto, PostgreSQL dejó de escuchar en todas las interfaces y quedó limitado a las conexiones locales. Comprobé el resultado con SHOW listen_addresses; y con el comando netstat de PowerShell.

### 4. ¿Qué diferencia existe entre firewall y `pg_hba.conf`?

El firewall controla qué equipos pueden acceder al puerto de PostgreSQL a través de la red. En cambio, `pg_hba.conf` establece qué conexiones pueden intentar autenticarse según el origen, el usuario, la base de datos y el método de autenticación. Ambos controles deben utilizarse juntos.

### 5. ¿Qué diferencia existe entre autenticación y autorización?

La autenticación comprueba la identidad del usuario que intenta conectarse. La autorización determina qué acciones puede realizar una vez que se ha conectado, según los permisos que tenga asignados.

### 6. ¿Por qué una cuenta de aplicación no debe ser `SUPERUSER`?

Porque tendría privilegios administrativos excesivos. Si alguien consigue acceder a esa cuenta, podría realizar cambios importantes en el servidor y afectar otras bases de datos. Lo correcto es otorgarle únicamente los permisos que necesita para funcionar.

### 7. ¿Por qué cambiar el puerto de PostgreSQL no constituye hardening suficiente?

Porque cambiar el puerto no impide por sí solo que alguien descubra el servicio o intente conectarse. La seguridad también depende del firewall, las reglas de acceso, la autenticación, los permisos y las actualizaciones del servidor.

### 8. ¿Por qué `listen_addresses='*'` puede ser innecesario?

Porque permite que PostgreSQL escuche en todas las interfaces de red. Si la base de datos solo se utiliza desde el mismo equipo, puede ser suficiente escuchar en `localhost`, reduciendo las interfaces disponibles para recibir conexiones. Antes de cambiarlo, se deben comprobar las necesidades de acceso remoto.

### 9. ¿Qué papel tiene el sistema operativo en la seguridad de PostgreSQL?

El sistema operativo protege los archivos de configuración, los datos y los registros mediante permisos de acceso. También contribuye con el firewall, las actualizaciones de seguridad y el control de la cuenta con la que se ejecuta el servicio.

### 10. ¿Qué controles deberían revisarse periódicamente?

Se deben revisar las reglas de `pg_hba.conf`, las interfaces de escucha, el firewall, los roles y sus privilegios, la autenticación, el uso de TLS, las actualizaciones, las extensiones instaladas, los registros, los permisos de archivos y las copias de seguridad.


**## 9. Conclusión**

Esta práctica me ayudó a entender que proteger PostgreSQL no consiste únicamente en utilizar una contraseña segura. También es importante controlar desde dónde se puede conectar un usuario, qué permisos tiene y cómo se registran las conexiones.

Durante la revisión inicial encontré que PostgreSQL escuchaba en todas las interfaces, SSL estaba desactivado y los registros de conexiones y desconexiones estaban apagados. Después limité las conexiones a `localhost` y activé los registros, comprobando que los cambios funcionaran correctamente.

Todavía queda pendiente revisar la configuración de TLS y evaluar si los permisos de los archivos necesitan algún ajuste. En general, estos cambios ayudan a reducir la exposición de la base de datos y a contar con más información para revisar su actividad.