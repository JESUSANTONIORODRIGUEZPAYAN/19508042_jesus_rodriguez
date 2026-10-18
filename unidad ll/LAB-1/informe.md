## Actividad 1 — Clasificación de los datos

Hacer la clasificación de los datos

3.1 Responder las preguntas

¿Qué campos identifican directamente a una persona?

El nombre, correo, teléfono y RFC, porque permiten identificar o contactar directamente al cliente.

¿Qué campos no identifican por sí solos, pero podrían contribuir a hacerlo?

La edad, ciudad, código postal, fecha de alta y el identificador del cliente, dependiendo del contexto.

¿Qué combinación de campos podría incrementar el riesgo de reidentificación?

La combinación de edad, ciudad y código postal, porque puede ayudar a distinguir a una persona dentro de un grupo pequeño.

¿Todos los datos que deben protegerse son necesariamente datos personales sensibles desde el punto de vista jurídico?

No. Existen datos personales que deben protegerse, pero no todos se consideran legalmente sensibles. Esto depende de su naturaleza y del marco jurídico aplicable.

### Actividad 2 — Enmascaramiento (masking)

Preguntas

¿Qué información continúa existiendo en la tabla original?

La tabla original clientes conserva toda la información de los clientes, como su nombre, correo electrónico, teléfono y RFC, sin ocultar.

¿Qué información puede visualizar el usuario soporte?

El usuario soporte puede consultar la vista v_clientes_soporte, donde los datos personales aparecen parcialmente ocultos para proteger la información de los clientes.

¿Por qué no es suficiente ocultar los datos únicamente en la aplicación?

Porque una persona podría acceder directamente a la base de datos y consultar la información original. Por eso también se deben configurar permisos en PostgreSQL.

¿Qué ocurriría si soporte tuviera acceso directo a clientes?

Podría consultar los datos personales completos de los clientes, lo que representaría un riesgo para su privacidad.

## Actividad 3 — Seudonimización

### Crear el conjunto de datos para ana

Crear una tabla que no contenga directamente los identificadores principales del cliente:

Actividad 4 — Separación de funciones

¿Qué ocurriría si analista pudiera consultar también pii.mapa_cliente?

Podría relacionar los tokens con los identificadores originales de los clientes, aumentando el riesgo de conocer su identidad.

¿Qué principio de seguridad se está aplicando al separar ambos accesos?

Se aplica el principio de mínimo privilegio, porque cada usuario debe tener únicamente los permisos necesarios para realizar su trabajo.

¿Por qué la seudonimización no equivale a anonimización?

Porque la seudonimización reemplaza los identificadores por tokens, pero todavía existe un mapa que permite relacionarlos con los clientes originales.

¿Qué información permite volver a relacionar el token con una persona?

La tabla pii.mapa_cliente, porque relaciona el token con el cliente_id, que puede vincularse con los datos originales de la tabla public.clientes.

## 12. Actividad 5 — Anonimización

Actividad 6 — Análisis del riesgo de reidentificación

¿Qué identificadores directos fueron eliminados?

Se eliminaron los datos que permiten identificar directamente a los clientes, como el nombre, correo electrónico, teléfono y RFC. En los resultados solamente se muestran datos agrupados.

¿Qué cuasi-identificadores permanecen?

Permanecen el rango de edad y la región obtenida de los dos primeros caracteres del código postal. Aunque no identifican directamente a una persona, pueden ayudar a distinguirla al combinarse con otros datos.

¿Qué combinaciones de atributos podrían reducir el anonimato?

La combinación de edad, región, ciudad y fecha de alta podría reducir el anonimato, especialmente si existen pocas personas con esas características.

¿Qué sucede cuando un grupo contiene pocos registros?

Aumenta el riesgo de identificar a una persona, porque hay menos individuos que comparten las mismas características. Por eso, la consulta utiliza un mínimo de cinco registros por grupo.

¿Qué atributos deberían generalizarse?

Se deberían generalizar las edades en rangos y los códigos postales en regiones más amplias. También se podrían agrupar las fechas de alta por año o eliminar detalles innecesarios.

¿Qué información debería suprimirse?

Se deberían suprimir los grupos con menos de cinco registros y evitar mostrar nombres, correos, teléfonos, RFC o códigos postales completos en los resultados estadísticos.

¿Es correcto afirmar que el conjunto de datos es “100 % anónimo”? ¿Por qué?

No. Aunque se eliminen los identificadores directos y se agrupen los datos, todavía podrían existir combinaciones de características que permitan identificar a una persona. Cumplir con un mínimo de cinco registros reduce ciertos riesgos, pero no garantiza el anonimato completo.

Reto — Reducir el riesgo de reidentificación

Cambio realizado: Se agregó una condición para mostrar únicamente grupos con diez registros o más, en lugar de cinco.

Motivo: Reducir la posibilidad de distinguir a una persona dentro de un grupo pequeño.

Resultado obtenido: no me dio ningún resultado

Riesgo que se pretende reducir: El riesgo de reidentificación mediante la combinación del rango de edad y la región.

# 14. Actividad 7 — Retención

Me sale vacia la tabla porque esta vencido el periodo

Área de soporte

Área de analítica

Preguntas de reflexión

¿Cuál es la diferencia entre enmascaramiento y seudonimización?

El enmascaramiento oculta datos sensibles al mostrarlos, mientras que la seudonimización reemplaza los identificadores originales por tokens que pueden relacionarse con la persona mediante un mapa.

¿Por qué la seudonimización no significa anonimización?

Porque todavía existe un mapa que permite relacionar los tokens con los clientes originales, por lo que es posible identificarlos nuevamente.

¿Por qué eliminar nombre y RFC no garantiza que un conjunto de datos sea anónimo?

Porque otros datos, como la edad, la ciudad o el código postal, pueden combinarse y ayudar a identificar a una persona.

¿Qué función tienen los cuasi-identificadores?

Son datos que por sí solos no identifican directamente a una persona, pero al combinarse pueden ayudar a reconocerla.

¿Por qué es importante separar el mapa de seudonimización?

Porque contiene la relación entre los tokens y los clientes originales. Mantenerlo separado reduce el riesgo de que alguien identifique a los clientes sin autorización.

¿Qué principio de seguridad se aplica al impedir que el analista acceda al mapa?

Se aplica el principio de mínimo privilegio, que consiste en dar a cada usuario únicamente los permisos que necesita para realizar su trabajo.

¿Por qué una vista puede ser preferible a entregar acceso directo a la tabla?

Porque una vista permite mostrar solamente los datos necesarios y ocultar información sensible sin dar acceso a toda la tabla original.

¿Qué diferencia existe entre proteger un dato para visualización y protegerlo contra acceso no autorizado?

Protegerlo para visualización significa ocultar o modificar cómo se muestra. Protegerlo contra accesos no autorizados significa impedir que usuarios sin permiso puedan consultarlo.

¿Por qué la retención forma parte de la protección de datos?

Porque ayuda a evitar que la información personal se conserve durante más tiempo del necesario y reduce los riesgos de exposición.

¿Qué riesgo existe si una organización conserva información indefinidamente?

Aumenta el riesgo de filtraciones, accesos no autorizados y uso indebido de información personal que ya no es necesaria.


| Campo | ¿Identifica directamente? | ¿Puede contribuir a identificar? | ¿Requiere protección? |
| --- | --- | --- | --- |
| id | No directamente | Sí | Sí |
| nombre | Sí | Sí | Sí |
| correo | Sí | Sí | Sí |
| telefono | Sí | Sí | Sí |
| rfc | Sí | Sí | Sí |
| edad | No | Sí | Sí |
| ciudad | No | Sí | Sí |


| codigo_postal | No | Sí | Sí |
| --- | --- | --- | --- |
| fecha_alta | No | Sí | Sí |
