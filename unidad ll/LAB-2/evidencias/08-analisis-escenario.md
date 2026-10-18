 Actividad 8 — Análisis de un escenario de seguridad

Pregunta 1. ¿Cuáles son los principales riesgos?

Los principales riesgos son que las contraseñas y los RFC puedan ser vistos si alguien obtiene acceso a la base de datos. También existe el riesgo de que la información sea interceptada por una conexión que no valide correctamente al servidor, que las claves criptográficas sean robadas al estar en archivos SQL y que los respaldos puedan ser consultados si alguien los obtiene.

Pregunta 2. ¿Qué mecanismo utilizarías para cada elemento?

- **Nombre:** control de acceso y permisos para que solo usuarios autorizados puedan consultarlo.
- **Correo electrónico:** control de acceso y cifrado cuando sea necesario protegerlo adicionalmente.
- **Contraseña:** hash con salt utilizando bcrypt, sin guardarla en texto claro.
- **RFC:** cifrado de datos para protegerlo dentro de la base de datos.
- **Información financiera:** cifrado de datos y permisos restringidos para los usuarios autorizados.
- **Claves criptográficas:** almacenamiento seguro en un gestor de secretos o de claves, evitando incluirlas directamente en archivos SQL.

Además, utilizaría TLS con validación correcta del certificado y del nombre del servidor para proteger las conexiones, y cifraría los respaldos para evitar que puedan leerse si se filtran.

Pregunta 3. ¿Cuál de los problemas consideras más crítico y por qué?

Considero que almacenar las contraseñas en texto claro es uno de los problemas más críticos, porque si alguien obtiene acceso a la base de datos podría conocerlas directamente. Además, algunas personas utilizan la misma contraseña en diferentes servicios, por lo que el problema podría afectar otras cuentas. Por eso se deben almacenar mediante un hash seguro con salt.

Pregunta 4. ¿Tener correctamente configurados los usuarios y permisos elimina estos riesgos?

No. Tener usuarios y permisos correctamente configurados ayuda a limitar quién puede acceder a la información, pero no elimina todos los riesgos. Si alguien obtiene acceso a la base de datos, encuentra un archivo SQL con claves o consigue un respaldo sin protección, todavía podría acceder a información sensible. Por eso también se necesitan mecanismos como hash de contraseñas, cifrado de datos, TLS con validación del servidor y protección de respaldos y claves criptográficas.


