## 22. Verificación final

1. Privacidad: ¿Qué diferencia existe entre seguridad de la información y privacidad?

La seguridad se encarga de proteger la información para que nadie entre sin permiso, mientras que la privacidad trata de cómo se utilizan los datos personales y para qué se pueden usar.

2. Finalidad: ¿Por qué una organización no debería utilizar automáticamente todos los datos que posee para cualquier propósito?

Porque tener los datos no significa que pueda utilizarlos para cualquier cosa. Se debe respetar el motivo por el que se recopilaron y revisar si se pueden usar para otra finalidad.

3. Minimización: ¿Por qué almacenar más información no necesariamente es mejor?

Porque entre más información se guarde, más cosas se tienen que proteger y existe más riesgo de que los datos se filtren o se utilicen incorrectamente. Es mejor guardar solamente lo necesario.

4. ARCO: ¿Qué implicaciones técnicas tienen los derechos de acceso, rectificación, cancelación y oposición?

Se necesita tener una forma de consultar los datos de una persona, corregirlos cuando estén equivocados, eliminarlos cuando corresponda y dejar de utilizarlos para ciertas finalidades cuando la persona se oponga. También hay que revisar las copias y los sistemas donde se encuentre esa información.

5. Retención: ¿Por qué la conservación indefinida puede representar un riesgo?

Porque los datos se pueden quedar guardados durante muchos años aunque ya no sean necesarios. Esto aumenta el riesgo de filtraciones y accesos no autorizados, por eso es importante establecer un tiempo para conservarlos.

6. Gobierno: ¿Quién debería decidir qué datos pueden utilizarse y para qué finalidad?

No debería decidirlo una sola persona. Deben participar las áreas responsables del negocio, privacidad, seguridad y asuntos legales, según corresponda, para definir qué datos se necesitan y cómo se pueden utilizar.

7. DBA: ¿Cuál es la responsabilidad del DBA y cuáles decisiones deben involucrar a otras áreas?

El DBA se encarga de administrar la base de datos, controlar los permisos, realizar respaldos y ayudar a proteger la información. Pero las decisiones sobre para qué se utilizan los datos, cuánto tiempo se guardan y si se pueden compartir deben involucrar también a las áreas responsables de privacidad, negocio y aspectos legales.




# LAB-03 — Privacidad, cumplimiento y gobierno de los datos

## 1. Introducción

En este laboratorio trabajé con el tema de la privacidad y la protección de los datos personales dentro de una base de datos. Aprendí que no solamente se trata de guardar la información de los clientes, sino también de saber para qué se utiliza, quién puede verla y cuánto tiempo se debe conservar.

También revisé algunos problemas que pueden ocurrir cuando se guardan datos que no son necesarios o cuando se les da acceso a personas que no los necesitan para realizar su trabajo.

## 2. Inventario de datos

En la tabla de clientes se pueden encontrar datos como los siguientes:

| Dato | Clasificación | Uso |
|---|---|---|
| ID | Identificador | Distinguir a cada cliente |
| Nombre | Dato personal | Identificar al cliente |
| Correo | Dato personal | Comunicarse con el cliente |
| Teléfono | Dato personal | Contactar al cliente |
| RFC | Dato personal identificativo | Facturación y trámites cuando corresponda |
| Edad | Dato personal | Estadísticas cuando sea necesario |
| Ciudad | Dato de ubicación | Estadísticas por zona |
| Código postal | Dato de ubicación | Ubicación y servicios cuando se requiera |
| Fecha de alta | Dato relacionado con el registro | Conocer cuándo se registró el cliente |

Estos datos deben protegerse porque algunos permiten identificar directamente a una persona. También es importante revisar cuáles son realmente necesarios para cada actividad.

## 3. Finalidades

Los datos deben utilizarse para una finalidad específica y no solamente porque ya están guardados en la base de datos.

Por ejemplo, el nombre y el correo pueden utilizarse para atender al cliente, mientras que la ciudad puede servir para realizar estadísticas. Si se quieren utilizar los correos para enviar promociones, primero se debe revisar si ese uso está justificado y si se cumplen los requisitos correspondientes.

## 4. Minimización

No es necesario guardar todos los datos posibles de cada cliente. Si una actividad solo necesita el nombre y el correo, no tendría sentido pedir también el salario, el estado civil o la fecha de nacimiento.

Algunos datos se pueden eliminar o limitar cuando no existe una razón para utilizarlos. Esto ayuda a reducir los riesgos y facilita la protección de la información.

## 5. Control de acceso

Los permisos deben asignarse según las funciones de cada trabajador. Por ejemplo el personal de atención al cliente puede consultar los datos necesarios para atender a las personas, mientras que el área de analítica puede utilizar vistas con información agrupada.

También se pueden crear roles en PostgreSQL para evitar que todos tengan acceso a la tabla completa. De esta manera se aplica el principio de mínimo privilegio.

## 6. Derechos ARCO

Los derechos ARCO son acceso, rectificación, cancelación y oposición. Para atenderlos técnicamente, la base de datos debe permitir consultar los datos de una persona, corregir información incorrecta y gestionar su cancelación u oposición según corresponda.

También se deben revisar las copias, los respaldos y otros sistemas donde pueda existir la información. No siempre basta con modificar o eliminar un registro de la tabla principal.

## 7. Retención

Los datos no deberían conservarse para siempre solamente porque podrían servir después. Es necesario establecer cuánto tiempo se necesita cada dato, tomando en cuenta su finalidad y las obligaciones legales que correspondan.

Cuando los datos ya no sean necesarios y no exista una obligación de conservarlos, se debe aplicar un procedimiento para eliminarlos de forma controlada.

## 8. Gobierno de datos

Para administrar correctamente la información, cada área debe tener responsabilidades claras.

| Responsable | Función |
|---|---|
| DBA | Administrar la base de datos, los permisos, los respaldos y la seguridad técnica |
| Responsable de privacidad | Revisar el uso de los datos y el cumplimiento de las reglas de privacidad |
| Área jurídica | Orientar sobre las obligaciones legales y los derechos de los clientes |
| Propietario de los datos o área responsable del negocio | Definir las necesidades del negocio y justificar las finalidades |
| Desarrolladores | Crear aplicaciones que utilicen y protejan los datos correctamente |
| Usuarios de la base de datos | Utilizar la información solamente para las actividades autorizadas |

## 9. Evaluación integral

Durante la evaluación encontré varios problemas que pueden poner en riesgo la información de los clientes:

- Todos los empleados de analítica pueden consultar la tabla completa
- Se puede acceder a datos que no son necesarios para hacer estadísticas
- No existe una política clara de retención
- Los datos llevan muchos años guardados
- Los desarrolladores reciben copias completas de la base de datos
- Las copias de desarrollo contienen datos reales
- Marketing utiliza correos para promociones sin tener las finalidades claramente documentadas
- No se sabe con claridad para qué se utiliza cada dato
- No se mencionan controles suficientes para revisar los accesos
- No existe un procedimiento documentado para atender solicitudes de los clientes



## 10. Conclusiones

Con este laboratorio aprendí que la privacidad, la seguridad y la administración de bases de datos están relacionadas, pero no significan lo mismo. La seguridad ayuda a proteger la información, mientras que la privacidad también se preocupa por el uso que se le da.

También entendí que es importante guardar solamente los datos necesarios, controlar quién puede consultarlos y establecer reglas para conservarlos o eliminarlos. Una base de datos debe diseñarse pensando en la protección de las personas desde el principio.

# 11. Preguntas de reflexión

### 1. ¿Una base de datos técnicamente segura necesariamente cumple con todos los requisitos de privacidad?

No necesariamente, porque puede tener contraseñas y permisos bien configurados, pero aun así utilizar los datos para algo que no corresponde. También se debe revisar para qué se recopila la información y cómo se utiliza.

### 2. ¿Por qué el principio de mínimo privilegio también contribuye a la privacidad?

Porque permite que cada persona vea solamente los datos que necesita para hacer su trabajo. Así se evita que los empleados consulten información personal sin necesidad.

### 3. ¿Por qué el DBA no debería decidir por sí solo la finalidad del tratamiento de los datos?

Porque el DBA se encarga principalmente de la parte técnica y no conoce todas las necesidades del negocio ni las obligaciones legales. Las finalidades deben definirse con las áreas responsables y de privacidad, además de recibir orientación jurídica cuando sea necesario.

### 4. ¿Por qué los desarrolladores no deberían recibir automáticamente copias completas de bases de datos productivas?

Porque esas bases pueden contener información privada de muchos clientes. Entregar copias completas aumenta el riesgo de que los datos se filtren o se utilicen incorrectamente. Es mejor darles datos ficticios o solamente la información necesaria para realizar las pruebas.

### 5. ¿Por qué una copia utilizada para desarrollo también puede representar un riesgo de privacidad?

Porque aunque sea una copia, sigue teniendo los datos reales de los clientes. Si alguien accede a ella sin permiso, la información puede quedar expuesta igual que en la base de datos original.

### 6. ¿Por qué la retención debe formar parte del ciclo de vida de los datos?

Porque desde que se recopila la información se debe saber cuánto tiempo se necesita conservar. Cuando deja de ser necesaria, se debe revisar si corresponde eliminarla, tomando en cuenta las obligaciones que puedan existir.

### 7. ¿Qué relación existe entre privacidad por diseño y diseño de bases de datos?

La privacidad por diseño consiste en pensar en la protección de los datos desde que se crea el sistema. Por eso, al diseñar una base de datos, se deben elegir los campos necesarios, separar las finalidades y definir los permisos desde el principio.

### 8. ¿Qué controles técnicos implementarías para reducir el riesgo de exposición de datos personales?

Implementaría roles y permisos en PostgreSQL, vistas con información limitada, cifrado, respaldos protegidos y registros de auditoría. También evitaría utilizar datos reales en las pruebas cuando no sea necesario.

### 9. ¿Qué información debería conocer un DBA para responder técnicamente a una solicitud ARCO?

Debe saber dónde están almacenados los datos de la persona, qué tablas los contienen, quién tiene acceso y si existen copias o respaldos. Con esa información puede ayudar a consultar, corregir o gestionar los datos según la solicitud y las instrucciones de las áreas responsables.

### 10. ¿Qué responsabilidades deberían corresponder al DBA, al responsable de privacidad, al área jurídica y al propietario de los datos?

El DBA debe encargarse de los permisos, la administración y la protección técnica de la base de datos. El responsable de privacidad debe revisar cómo se utilizan los datos, el área jurídica debe orientar sobre las obligaciones legales y el propietario de los datos debe explicar qué información necesita el negocio y para qué se va a utilizar.