8. Actividad 2 — Cifrado de información sensible

8.2 Recuperar el dato

Preguntas
¿Qué diferencia existe entre crypt() y pgp_sym_encrypt()?
el crypt se usa para generar y verificar hashes de contrasenas mientras que el pgp cifra informacion de utilizando una clave para poder recuperarla despues 

¿Cuál de los dos mecanismos permite recuperar el dato original?
pgp_sym_encrypt() permite recuperar el dato original utilizando pgp_sym_decrypt() y la clave correcta.

¿Qué ocurre si se utiliza una clave incorrecta?
La operación de descifrado falla y PostgreSQL muestra un error, porque no se puede recuperar correctamente la información con esa clave.

¿Qué problema de seguridad representa colocar la clave directamente en una consulta?
La clave podría quedar expuesta en el historial de consultas registros del sistema o capturas de pantalla  en aplicaciones reales se deben utilizar mecanismos seguros para administrar las claves.



