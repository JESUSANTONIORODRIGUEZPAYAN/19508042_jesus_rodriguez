
## 9. Actividad 3 — Separación por finalidad
¿Por qué esta información puede ser más apropiada para analítica que entregar directamente la tabla completa de clientes?

Porque permite conocer la cantidad de clientes por ciudad y por rango de edad sin compartir información personal como nombres, correos, teléfonos o RFC. Así, el área de analítica puede obtener estadísticas y se reduce la exposición de los datos de los clientes.

## 10. Actividad 4 — Control de acceso relacionado con la finalidad

1. ¿Qué información puede consultar el rol?

Puede consultar la información que contiene la vista de analítica, en este caso la ciudad y el rango de edad.

2. ¿Puede consultar directamente clientes?

No, porque no le otorgamos el permiso SELECT sobre la tabla original.

3. ¿Puede obtener nombre, correo y RFC?

No mediante los permisos que configuramos, porque esos datos no están incluidos en la vista y el rol no tiene acceso directo a la tabla original.

4. ¿Qué principio de privacidad estás aplicando?

La minimización de datos y la limitación de la finalidad, porque el rol recibe únicamente la información necesaria para realizar análisis.

5. ¿Qué principio de seguridad estás aplicando?

El principio de mínimo privilegio, porque cada rol recibe únicamente los permisos necesarios para realizar sus funciones.


# Evidencia 05. Análisis de una finalidad secundaria

## 1. Objetivo

 la empresa puede utilizar los datos de sus clientes para enviar promociones personalizadas y determinar qué información y permisos serían necesarios.

## 2. Procedimiento

Revisé la propuesta de utilizar la edad, ciudad y comportamiento de compra de los clientes para enviar promociones personalizadas después analicé qué información sería necesaria qué aspectos debería revisar la empresa antes de hacerlo y qué controles podrían aplicarse para proteger los datos.

## 3. Resultado

### Pregunta 1. ¿El hecho de que la organización ya tenga los datos significa automáticamente que puede utilizarlos para cualquier finalidad?

No, porque los datos se deben utilizar para las finalidades informadas y bajo las condiciones aplicables. La empresa debe revisar si el nuevo uso es compatible y si cuenta con la base jurídica necesaria.

### Pregunta 2. ¿Qué preguntas debería realizar la organización antes de implementar este tratamiento?

Debería preguntarse si informó a los clientes sobre el uso de sus datos para promociones, si cuenta con la base jurídica necesaria, qué beneficio tendrá esta actividad y cómo protegerá la información.

### Pregunta 3. ¿Qué datos serían realmente necesarios?

Podrían utilizarse la edad o un rango de edad, la ciudad cuando sea relevante y la información necesaria sobre las compras. No sería necesario utilizar todos los datos personales si la promoción puede realizarse con menos información.

### Pregunta 4. ¿Necesitaría el área de marketing acceso directo a `clientes`?

No necesariamente. Podría recibir información preparada para las promociones, sin tener acceso directo a todos los datos de los clientes. Si necesita identificar a las personas para enviarles mensajes, ese acceso tendría que justificarse y limitarse.

### Pregunta 5. ¿Qué controles técnicos podrían limitar la información entregada?

Se podrían utilizar vistas con columnas específicas, permisos por rol, información agrupada cuando sea suficiente y registros de auditoría para revisar quién accede a los datos.

## 4. Análisis

Considero que tener los datos almacenados no significa que la empresa pueda utilizarlos para cualquier actividad. Antes de enviar promociones, debe revisar la finalidad, la base jurídica y la información que realmente necesita. También debe evitar que el área de marketing tenga acceso a datos que no utiliza.

## 5. Conclusión

Con esta actividad comprendí que los datos personales deben utilizarse de forma responsable. La empresa necesita justificar las nuevas finalidades y aplicar controles para limitar el acceso a la información, reduciendo así los riesgos para los clientes.

