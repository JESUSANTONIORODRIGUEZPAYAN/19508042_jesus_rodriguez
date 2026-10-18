Actividad 10 — Política mínima de protección de claves

Objetivo

Establecer reglas básicas para proteger las claves criptográficas y evitar que personas no autorizadas puedan acceder a ellas.

Reglas para la gestión de claves

1. **Generación:** Las claves criptográficas deben generarse utilizando herramientas seguras que produzcan claves difíciles de adivinar.

2. **Almacenamiento:** Las claves deben guardarse en un lugar seguro, separado del código fuente y de los archivos SQL del proyecto.

3. **Acceso:** Solo las personas que realmente necesiten utilizar las claves podrán acceder a ellas. No deben compartirse con usuarios no autorizados.

4. **Rotación:** Las claves deben cambiarse periódicamente o cuando exista sospecha de que alguien pudo haberlas obtenido.

5. **Respaldo:** Las copias de seguridad de las claves deben almacenarse cifradas y en un lugar protegido, para evitar su pérdida o robo.

6. **Revocación:** Si una clave deja de utilizarse o se considera comprometida, debe deshabilitarse o revocarse lo antes posible y sustituirse cuando sea necesario.

7. **Exposición accidental:** Si una clave se publica por error en GitLab o se comparte con personas no autorizadas, debe considerarse comprometida, revocarse o reemplazarse y revisarse el alcance de la exposición.

8. **Eliminación:** Cuando una clave ya no sea necesaria, debe eliminarse de forma segura de los lugares donde esté almacenada, incluidas las copias controladas y los respaldos cuando corresponda.

