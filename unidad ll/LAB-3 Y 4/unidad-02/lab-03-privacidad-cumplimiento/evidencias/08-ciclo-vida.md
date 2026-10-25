12. Actividad 6 — Derechos ARCO y la base de datos

12.1 Derecho de acceso

Pregunta
¿Qué información adicional debería proporcionar la organización además del resultado de esta consulta?

Además de mostrar los datos personales registrados, la organización debería informar para qué utiliza esos datos, cómo los obtuvo, con quién los comparte cuando corresponda y cuánto tiempo los conserva. También debe explicar cómo el titular puede ejercer sus derechos, según la información y las obligaciones aplicables.

13. Actividad 7 — Derecho de rectificación

Pregunta 1. ¿Cómo podría comprobarse que el cambio fue autorizado?

Se puede verificar que exista una solicitud del cliente y que haya sido validada por el área responsable antes de modificar el registro.

Pregunta 2. ¿Debería registrarse quién realizó el cambio?

Sí, porque es importante saber qué usuario realizó la modificación y cuándo se hizo.

Pregunta 3. ¿Por qué la trazabilidad será importante?

Porque permite revisar los cambios realizados, identificar quién los hizo y detectar posibles errores o modificaciones no autorizadas.


## Evidencia 08. Derecho de cancelación y ciclo de vida de los datos

## 1. Objetivo

Analizar qué sucede con los datos personales cuando se autoriza una solicitud de cancelación e identificar los lugares donde puede existir información relacionada con un cliente.

## 2. Procedimiento

Revisé los posibles lugares donde la empresa puede conservar información, como la tabla principal de clientes, los respaldos, las réplicas, los reportes, las exportaciones y los sistemas externos.

Después, elaboré un mapa sencillo para representar los lugares que deben revisarse cuando se procesa una solicitud de cancelación.

## 3. Resultado

El mapa del ciclo de vida 

```text
clientes
   |
   |-- respaldos
   |-- réplicas
   |-- reportes
   |-- exportaciones
   |-- sistemas externos
   |-- registros de auditoría
   |-- copias utilizadas para analítica
```


## 4. Análisis

### ¿Existen otras tablas relacionadas?

Sí, podrían existir tablas relacionadas con los clientes que también contengan información personal.

### ¿Existen respaldos?

La organización debe revisar si existen copias de seguridad que contengan los datos del titular.

### ¿Existen réplicas?

Debe comprobar si hay réplicas de la base de datos donde también se encuentre la información.

### ¿Existen registros de auditoría?

Debe revisar si existen registros que contengan datos personales y cuáles son las reglas aplicables para conservarlos.

### ¿Existen copias para analítica, reportes o exportaciones?

Sí, podrían existir copias de información utilizadas para generar estadísticas, elaborar reportes o trabajar fuera de la base de datos principal.

### ¿Existen sistemas externos?

También debe comprobar si los datos fueron compartidos con otros sistemas o proveedores.

### ¿Por qué eliminar un registro de una tabla no necesariamente significa que toda la información relacionada con esa persona haya desaparecido de la organización?

Porque la información puede continuar almacenada en respaldos, réplicas, reportes, archivos exportados y sistemas externos. Por eso, se necesita revisar el ciclo de vida completo de los datos y definir cómo se atenderá la cancelación en cada lugar, considerando las obligaciones de conservación que correspondan.

## 5. Conclusión

Con esta actividad comprendí que cancelar los datos de un cliente requiere revisar más que la tabla principal es importante identificar las copias y los sistemas donde se conserva la información además de establecer procedimientos para atender correctamente las solicitudes de cancelación.