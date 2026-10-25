## 19. Actividad 13 — Diferenciar controles técnicos y administrativos

Medida	Técnico	Administrativo	Justificación
Crear roles de PostgreSQL	X		Se crean permisos en la base de datos para limitar el acceso.
Política de retención		X	Define cuánto tiempo se conservan los datos y cuándo deben eliminarse.
Cifrado de datos	X		Utiliza herramientas técnicas para proteger la información.
Procedimiento para solicitudes ARCO		X	Establece los pasos para atender solicitudes de los clientes.
Vista con información limitada	X		Permite consultar solamente los datos necesarios.
Clasificación de información		X	Define qué tipo de información se maneja y qué protección necesita.
Registro de auditoría	X		Permite registrar accesos y operaciones realizadas en los sistemas.
Política de control de acceso	X	X	La política establece las reglas y los roles de PostgreSQL las aplican técnicamente.

# Actividad 14 — Evaluación integral de privacidad y gobierno de datos

## 1. Objetivo

Identificar los problemas de privacidad y seguridad de una empresa que almacena información de 50,000 clientes y proponer controles para reducir los riesgos.

## 2. Procedimiento

Se revisó el escenario de la empresa, considerando los permisos de acceso, la cantidad de datos recopilados, el tiempo de conservación, el uso de copias para desarrollo y el uso de correos electrónicos para campañas de marketing.

## 3. Resultado

| Problema | Principio afectado | Riesgo | Control propuesto |
|---|---|---|---|
| 1. Todo el personal de analítica puede consultar la tabla completa. | Mínimo privilegio y confidencialidad | Acceso innecesario a datos personales. | Crear roles y limitar los permisos de acceso. |
| 2. Analítica puede consultar nombres y correos aunque solo genera estadísticas. | Minimización de datos | Exposición innecesaria de información personal. | Crear vistas con datos agregados y sin identificadores directos. |
| 3. Se recopilan datos que podrían no ser necesarios, como RFC y código postal. | Minimización de datos | Acumulación de información que aumenta el impacto de una filtración. | Revisar cada campo y conservar solo los datos justificados. |
| 4. Los datos se conservan desde hace 12 años sin una política documentada. | Limitación del plazo de conservación | Mantener información durante más tiempo del necesario. | Establecer periodos de conservación y revisiones periódicas. |
| 5. No existe una política documentada de retención. | Responsabilidad y gobierno de datos | No hay criterios claros para conservar o eliminar información. | Documentar responsables, plazos y procedimientos de eliminación. |
| 6. Los desarrolladores reciben copias completas de la base de datos. | Minimización y confidencialidad | Más personas y sistemas quedan expuestos a los datos reales. | Proporcionar únicamente los datos necesarios para las pruebas. |
| 7. Las copias de desarrollo contienen información real. | Privacidad por diseño y seguridad | Una filtración en desarrollo podría exponer a los clientes. | Utilizar datos ficticios o anonimizar los datos antes de usarlos. |
| 8. Marketing utiliza los correos electrónicos para promociones sin una finalidad claramente documentada. | Limitación de la finalidad | Uso de los datos para un propósito que puede no estar debidamente justificado. | Documentar la finalidad, verificar la base legal aplicable y respetar las preferencias de los clientes. |
| 9. No está documentada la finalidad de cada dato. | Limitación de la finalidad y responsabilidad | No se puede determinar si cada dato es necesario para el uso que se le da. | Crear un inventario de datos con su finalidad, responsable y plazo de conservación. |
| 10. No se especifican medidas suficientes para controlar los accesos. | Seguridad y confidencialidad | Consultas o usos no autorizados de información personal. | Aplicar permisos por función, autenticación y revisiones de acceso. |
| 11. No se menciona un registro de las consultas y operaciones. | Responsabilidad y trazabilidad | Dificultad para investigar accesos indebidos o incidentes. | Habilitar registros de auditoría y revisarlos periódicamente. |
| 12. No se describe un procedimiento para atender solicitudes de los clientes. | Derechos de los titulares y responsabilidad | Retrasos o errores al atender solicitudes de acceso, rectificación, cancelación u oposición. | Establecer un procedimiento para recibir, verificar y atender solicitudes conforme a la normativa aplicable. |

## 4. Análisis

La empresa presenta varios riesgos porque conserva grandes cantidades de información personal, permite accesos demasiado amplios y utiliza datos reales en los entornos de desarrollo. Además, no tiene reglas documentadas para definir las finalidades ni el tiempo que deben conservarse los datos.

Para mejorar la situación, primero se deben revisar los datos recopilados y los permisos de cada área. Después se pueden crear vistas limitadas para analítica, utilizar datos ficticios para las pruebas y establecer políticas de retención, control de acceso y atención de solicitudes. También se debe revisar el uso de los correos electrónicos para marketing y comprobar que esté debidamente justificado.

## 5. Conclusión

La empresa necesita mejorar su privacidad y gobierno de datos para reducir la exposición de la información de sus clientes. Aplicar el principio de minimización, limitar los accesos, documentar las finalidades y establecer periodos de conservación ayuda a utilizar los datos de manera más segura y responsable.