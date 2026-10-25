# Baseline de seguridad de PostgreSQL

## 1. Objetivo

El objetivo de esta actividad fue revisar cómo estaba configurado PostgreSQL antes de hacer cambios, para conocer su estado de seguridad e identificar qué cosas se pueden mejorar.

## 2. Entorno de trabajo

- Sistema operativo: Windows.
- Base de datos: PostgreSQL 17.
- Herramienta utilizada: pgAdmin 4.
- Puerto utilizado: 5432.

## 3. Configuración inicial

Durante la revisión ejecuté varias consultas para conocer la configuración de PostgreSQL. Estos fueron los resultados que obtuve:

| Parámetro | Resultado | ¿Qué significa? |
|---|---|---|
| `port` | 5432 | Es el puerto que utiliza PostgreSQL para las conexiones. |
| `listen_addresses` | `*` | PostgreSQL está configurado para escuchar en todas las interfaces disponibles. |
| `ssl` | `off` | SSL está desactivado. |
| `password_encryption` | `scram-sha-256` | Se utiliza un método de protección para las contraseñas nuevas. |
| `log_connections` | `off` | No está activado el registro de las conexiones nuevas. |
| `log_disconnections` | `off` | No está activado el registro de las desconexiones. |

## 4. Archivos de configuración

También revisé dónde se encuentran los archivos principales de configuración de PostgreSQL. Las rutas que obtuve fueron las siguientes:

- `postgresql.conf`: `C:/Program Files/PostgreSQL/17/data/postgresql.conf`
- `pg_hba.conf`: `C:/Program Files/PostgreSQL/17/data/pg_hba.conf`
- `pg_ident.conf`: `C:/Program Files/PostgreSQL/17/data/pg_ident.conf`

El directorio donde se guardan los datos es `C:/Program Files/PostgreSQL/17/data` y el directorio de registros aparece como `log`.

## 5. Revisión de las reglas de acceso

Consulté las reglas de `pg_hba.conf` para saber qué conexiones estaban permitidas.

Encontré reglas para conexiones locales y para las direcciones `127.0.0.1` y `::1`, que corresponden a la propia computadora. También encontré reglas para conexiones de replicación.

En los resultados, la columna de errores no mostró ningún problema. Con las reglas que revisé, no encontré una regla que permitiera conexiones TCP desde otras direcciones IP.

## 6. Revisión de los usuarios

Después revisé los roles que existen en PostgreSQL y sus permisos.

Encontré que el usuario `postgres` tiene privilegios de superusuario y puede crear roles y bases de datos.

También encontré el rol `analista`, pero este no tiene permisos de superusuario ni puede crear roles o bases de datos. Además, tiene desactivada la opción de iniciar sesión, por lo que no puede conectarse directamente con ese rol en su estado actual.

## 7. Problemas que encontré

Al revisar la configuración, identifiqué algunos puntos que se pueden mejorar:

- PostgreSQL estaba configurado para escuchar en todas las interfaces de red, por lo que era importante limitar las conexiones a las que realmente necesito.
- SSL estaba desactivado, así que es necesario revisar si hace falta proteger las conexiones mediante cifrado.
- No estaba activado el registro de conexiones ni de desconexiones.
- El rol `analista` no podía iniciar sesión directamente porque tenía desactivada esa opción.
- Las reglas de `pg_hba.conf` que revisé permitían conexiones locales y desde las direcciones de la propia computadora (`127.0.0.1` y `::1`). No encontré reglas TCP que permitieran conexiones desde otras direcciones IP.

Aunque PostgreSQL estaba configurado para escuchar en todas las interfaces, eso no significa que estuviera expuesto directamente a Internet. El acceso también depende de las reglas de `pg_hba.conf`, la configuración de red y el firewall.

## 8. Conclusión

Con esta revisión pude conocer cómo estaba configurado PostgreSQL antes de realizar cambios. También identifiqué algunos aspectos que necesitan revisarse para mejorar su seguridad. Voy a utilizar estos resultados como referencia para compararlos con los cambios que se realicen después.

