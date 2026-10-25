# Actividad 11 — Matriz de gobierno de datos

La matriz sirve para definir para qué se utiliza cada dato, quién es responsable de cuidarlo, quién puede consultarlo y qué se debe hacer cuando ya no sea necesario. La idea es que cada usuario tenga acceso solamente a la información que necesita para realizar su trabajo.

| Dato | Finalidad | Responsable | Usuarios autorizados | Protección | Retención | Acción al finalizar |
|---|---|---|---|---|---|---|
| nombre | Identificar al cliente y atender sus solicitudes. | Atención al cliente | Atención al cliente, Facturación | Acceso por roles y permisos. | Mientras la cuenta esté activa y durante el tiempo necesario. | Eliminar o anonimizar cuando ya no sea necesario. |
| correo | Contactar al cliente y enviar información relacionada con sus servicios. | Atención al cliente | Atención al cliente, Facturación | Restringir el acceso y evitar compartirlo sin autorización. | Mientras sea necesario para la atención y las obligaciones aplicables. | Eliminar o dejar de utilizar para contactos innecesarios. |
| telefono | Comunicarse con el cliente cuando sea necesario. | Atención al cliente | Atención al cliente | Acceso limitado y permisos por rol. | Mientras se necesite para la atención. | Eliminar o anonimizar cuando termine su finalidad. |
| rfc | Realizar facturación y cumplir obligaciones fiscales. | Facturación | Personal de Facturación autorizado y DBA cuando sea necesario para administrar la base de datos. | Cifrado, permisos restringidos y consultas controladas. | Durante el periodo requerido por las obligaciones fiscales aplicables. | Eliminar de forma segura cuando ya no exista obligación de conservarlo. |
| edad | Obtener estadísticas generales de los clientes. | Analítica | Analítica | Preferir rangos de edad y evitar mostrar datos que identifiquen directamente a la persona. | Mientras se necesite para los análisis autorizados. | Eliminar o conservar únicamente estadísticas anónimas. |
| ciudad | Conocer la distribución de clientes por ubicación. | Analítica | Analítica, Dirección | Limitar el acceso y utilizar datos agrupados para reportes. | Mientras sea necesaria para los análisis. | Eliminar o anonimizar cuando ya no sea útil. |
| codigo_postal | Analizar la ubicación de los clientes y apoyar la planeación del servicio. | Analítica | Analítica; Atención al cliente solo cuando sea necesario. | Restringir el acceso y evitar combinarlo innecesariamente con otros datos identificables. | Mientras exista una finalidad válida. | Eliminar o generalizar el dato, por ejemplo, utilizando solo una zona geográfica. |

## Conclusión

Con esta matriz se puede organizar mejor el uso de los datos y evitar que todos los usuarios tengan acceso a toda la información. Por ejemplo, el personal de Analítica puede trabajar con datos agrupados sin necesitar el RFC o el teléfono de cada cliente.
