# Actividad 15 — Propuesta de arquitectura de datos protegidos

## 1. Objetivo

Diseñar una propuesta de arquitectura de datos que permita separar la información de los clientes según su finalidad, aplicando medidas de privacidad, seguridad y control de acceso.

## 2. Procedimiento

Se propuso dividir la información en diferentes áreas para evitar que todos los usuarios tengan acceso a todos los datos. También se definieron controles para proteger la información, limitar su uso y establecer reglas para su conservación y eliminación.

### Propuesta de arquitectura

```text
                       BASE DE DATOS
                             |
          ┌──────────────────┼──────────────────┐
          |                  |                  |
          ▼                  ▼                  ▼
      OPERACIÓN          ANALÍTICA          AUDITORÍA
          |                  |                  |
          ▼                  ▼                  ▼
   Datos necesarios    Datos agregados     Registros de
   para atender        para estadísticas   accesos y cambios
   a los clientes
          |                  |                  |
          ▼                  ▼                  ▼
   Acceso limitado     Sin datos           Acceso restringido
   por función         identificables      a personal autorizado
          |
          ▼
   Protección de datos
   personales sensibles
   cuando corresponda
```

### Controles propuestos

1. Control de acceso

Crear roles y permisos diferentes para cada área. El personal de operación solo podrá consultar los datos necesarios para sus actividades, mientras que analítica accederá a estadísticas y auditoría tendrá permisos limitados para revisar los registros.

2. Minimización de datos

Guardar únicamente los datos necesarios para cada finalidad. Por ejemplo, si analítica solo necesita conocer cuántos clientes hay por ciudad, no necesita consultar sus nombres, correos o RFC.

3. Protección de información sensible

Identificar los datos que necesitan mayor protección y aplicar medidas como cifrado, permisos restringidos y almacenamiento seguro. Los datos personales sensibles deben recibir protección adecuada según su naturaleza y la normativa aplicable.

4. Retención

Establecer periodos de conservación para cada tipo de información, considerando su finalidad y las obligaciones legales aplicables. Revisar periódicamente si los datos siguen siendo necesarios.

5. Trazabilidad

Registrar los accesos y las operaciones importantes para saber quién consultó o modificó información y cuándo lo hizo. Los registros también deben tener permisos y plazos de conservación definidos.

6. Eliminación

Cuando los datos dejen de ser necesarios y no exista una obligación que justifique conservarlos, eliminarlos mediante un procedimiento controlado. También se deben considerar las copias de seguridad, exportaciones y otros sistemas donde puedan existir.

7. Atención de solicitudes

Establecer un procedimiento para recibir y atender las solicitudes de acceso, rectificación, cancelación y oposición de los clientes. Se debe verificar la identidad del solicitante y registrar el seguimiento de cada solicitud.

## 3. Resultado

La propuesta separa los datos de operación, las estadísticas de analítica y los registros de auditoría. Cada área cuenta con permisos y finalidades específicas, evitando que todos los empleados puedan consultar la información completa de los clientes.

## 4. Análisis

Separar los datos por finalidad permite reducir el acceso innecesario a información personal. Por ejemplo, el área de analítica puede trabajar con información agregada, mientras que el personal encargado de atender a los clientes consulta solamente los datos que necesita.

También es importante establecer reglas para la conservación, eliminación y revisión de accesos. La arquitectura debe complementarse con políticas administrativas, medidas de seguridad y procedimientos para atender los derechos de los titulares.

## 5. Conclusión

Una arquitectura de datos protegidos ayuda a organizar la información de acuerdo con su finalidad y a reducir los riesgos de acceso o uso indebido. La combinación de permisos, minimización, trazabilidad, retención y eliminación permite aplicar los principios de privacidad desde el diseño del sistema.