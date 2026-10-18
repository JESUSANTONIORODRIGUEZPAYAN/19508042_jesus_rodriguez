11. Actividad 5 — Verificar el estado de TLS en PostgreSQL

11.1 Verificar la conexión actual

Preguntas
¿La conexión actual utiliza TLS?
No, la conexión actual no utiliza TLS, porque la columna ssl de pg_stat_ssl devolvió false.

¿Qué versión de TLS se está utilizando?
No se está utilizando ninguna versión de TLS en la conexión actual, porque SSL está deshabilitado en el servidor.

¿Qué algoritmo de cifrado aparece?

No aparece un algoritmo de cifrado TLS activo para esta sesión, porque la conexión no utiliza TLS.

¿Qué diferencia existe entre una conexión protegida con TLS y una conexión sin TLS?
Una conexión protegida con TLS cifra los datos que viajan entre el cliente y el servidor. Sin TLS, la comunicación no cuenta con esa protección criptográfica y puede quedar expuesta a la observación del tráfico de red. 


- ssl = off: SSL/TLS está deshabilitado en el servidor.

- ssl_min_protocol_version = TLSv1.2: versión mínima configurada.

- port = 5432: puerto de PostgreSQL.

- listen_addresses = *: escucha en todas las interfaces de red disponibles.