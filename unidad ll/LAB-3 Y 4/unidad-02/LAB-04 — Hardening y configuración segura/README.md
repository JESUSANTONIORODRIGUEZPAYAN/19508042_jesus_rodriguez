# LAB-04 — Hardening y configuración segura de PostgreSQL

## Objetivo
Revisar la configuración de PostgreSQL, identificar riesgos y proponer medidas para reducir accesos innecesarios. Las consultas se realizaron en pgAdmin.

## Entorno
- Sistema operativo: Windows.
- Versión instalada: PostgreSQL 17 (la guía menciona PostgreSQL 16).
- Herramienta: pgAdmin 4.
- Puerto: 5432.
- Base de datos observada en conexiones: `mineria 3-1` y `postgres`.

## Superficie de ataque inicial
Los resultados registrados fueron:

| Parámetro | Resultado | Interpretación |
|---|---|---|
| `port` | `5432` | Puerto predeterminado de PostgreSQL. |
| `listen_addresses` | `*` | El servidor escucha en todas las interfaces disponibles. El acceso real también depende de `pg_hba.conf`, el firewall y la red. |
| `ssl` | `off` | SSL/TLS está desactivado en el servidor. |
| `password_encryption` | `scram-sha-256` | Es el método predeterminado para generar hashes de contraseñas nuevas. |
| `log_connections` | `off` | No se registran conexiones mediante esta opción. |
| `log_disconnections` | `off` | No se registran desconexiones mediante esta opción. |

Rutas encontradas:
- `postgresql.conf`: `C:/Program Files/PostgreSQL/17/data/postgresql.conf`
- `pg_hba.conf`: `C:/Program Files/PostgreSQL/17/data/pg_hba.conf`
- `pg_ident.conf`: `C:/Program Files/PostgreSQL/17/data/pg_ident.conf`
- Directorio de datos: `C:/Program Files/PostgreSQL/17/data`
- Directorio de logs: `log` (ruta relativa; depende de la configuración del servidor).

En `pg_stat_activity` se observaron conexiones de `postgres` desde `pgAdmin 4` con dirección `::1`, que corresponde a loopback IPv6. Esto indica que esas conexiones visibles son locales.

## Hallazgos iniciales
1. `listen_addresses = '*'` aumenta las interfaces en las que el servidor acepta intentos de conexión.
2. `ssl = off` indica que el servidor no ofrece TLS a través de su configuración actual.
3. El registro de conexiones y desconexiones está desactivado.
4. `scram-sha-256` es una buena configuración predeterminada para hashes nuevos, pero no sustituye los controles de acceso, permisos, firewall o TLS.
5. Aún falta revisar las reglas reales de `pg_hba.conf`, los roles, las extensiones, los tiempos de espera y los permisos del sistema operativo.

## Cambios realizados

Después de revisar la configuración inicial, realicé dos cambios principales:

1. **Limitar las conexiones:** cambié `listen_addresses` de `'*'` a `'localhost'` en `postgresql.conf`. Después reinicié el servicio de PostgreSQL y comprobé que ahora escucha en `127.0.0.1` y `::1`.
2. **Activar los registros:** habilité `log_connections` y `log_disconnections` para registrar las conexiones y desconexiones. Después comprobé que ambos parámetros aparecieran en `on`.

También revisé los roles, las reglas de `pg_hba.conf`, la configuración de TLS y los permisos de los archivos. No modifiqué los roles ni los permisos del sistema operativo.

La configuración SSL/TLS continúa desactivada (`ssl = off`), por lo que queda pendiente revisar y configurar este apartado si el laboratorio lo requiere.

## Verificación

Para comprobar los cambios, ejecuté consultas en pgAdmin y utilicé PowerShell para revisar las conexiones del puerto 5432.

Los resultados finales confirmaron lo siguiente:

- `listen_addresses`: `localhost`.
- `log_connections`: `on`.
- `log_disconnections`: `on`.
- `password_encryption`: `scram-sha-256`.
- `port`: `5432`.
- `ssl`: `off`.

Las reglas de `pg_hba.conf` revisadas no mostraron errores. También comprobé que PostgreSQL continuara funcionando después de reiniciar el servicio.

## Conclusiones

Esta práctica me permitió identificar aspectos de la configuración de PostgreSQL que podían mejorarse. El cambio más importante fue limitar las conexiones a `localhost`, ya que la configuración inicial permitía escuchar en todas las interfaces de red. También activé los registros de conexiones y desconexiones para tener más información sobre la actividad del servidor.

Aunque estos cambios mejoran el control de acceso y la revisión de actividad, todavía queda pendiente evaluar la configuración de TLS. La seguridad de PostgreSQL también depende de los permisos de los usuarios, las reglas de acceso, el firewall, la protección de los archivos y las actualizaciones periódicas.
