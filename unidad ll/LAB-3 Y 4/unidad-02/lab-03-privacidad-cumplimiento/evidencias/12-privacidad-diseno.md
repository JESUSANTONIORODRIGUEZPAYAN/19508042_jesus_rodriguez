# Actividad 12 — Privacidad por diseño

## 1. Objetivo

Analizar el diseño de una tabla de clientes para identificar qué datos son necesarios y cómo aplicar la privacidad desde el inicio del desarrollo de una aplicación.

## 2. Procedimiento

Se revisó la propuesta de registrar muchos datos personales de los clientes, como nombre, correo, teléfono, RFC, edad, dirección, fecha de nacimiento, ocupación, salario y estado civil.

Se analizó si todos esos datos son necesarios para el funcionamiento de la aplicación y qué medidas se podrían aplicar para proteger la información.

## 3. Resultado

**1. ¿Qué problemas identificas?**

El principal problema es que se quieren guardar demasiados datos sin saber si realmente se necesitan. Esto puede aumentar el riesgo de filtraciones, accesos no autorizados y uso incorrecto de la información personal.

**2. ¿Qué principio de privacidad se está ignorando?**

Se está ignorando principalmente el principio de minimización de datos, que consiste en recopilar solamente la información necesaria para cumplir con una finalidad específica. También se relaciona con la privacidad por diseño y por defecto.

**3. ¿Qué preguntas realizarías antes de aprobar el diseño?**

- ¿Para qué se necesita cada dato?
- ¿Es obligatorio guardar esa información?
- ¿Qué personas podrán consultarla?
- ¿Durante cuánto tiempo se conservará?
- ¿Qué medidas de seguridad se utilizarán?
- ¿Se puede realizar la misma función utilizando menos datos?

**4. ¿Qué datos eliminarías?**

Si la aplicación solamente necesita registrar clientes y comunicarse con ellos, eliminaría inicialmente el RFC, la edad, la dirección, el código postal, la fecha de nacimiento, la ocupación, el salario y el estado civil, siempre que no exista una finalidad concreta que justifique alguno de esos datos.

Conservaría únicamente los datos indispensables, como el identificador, el nombre y el correo. El teléfono se incluiría solamente si es necesario para comunicarse con el cliente.

**5. ¿Qué datos requerirían una justificación adicional?**

El RFC, la fecha de nacimiento, el salario, la ocupación, el estado civil y la dirección requieren una justificación adicional porque pueden revelar información personal que no es necesaria para todas las aplicaciones. Antes de recopilarlos, se debe definir su finalidad y comprobar que sean adecuados y necesarios.

**6. ¿Cómo aplicarías privacidad por defecto?**

Configurararía la aplicación para recopilar únicamente los datos indispensables desde el principio. También limitaría los permisos de acceso, protegería la información almacenada, establecería periodos de conservación y evitaría compartir datos con otras personas o sistemas sin una finalidad justificada.

## 4. Análisis

Guardar todos los datos por si algún día se necesitan no es una buena práctica, porque aumenta la cantidad de información que debe protegerse. Antes de diseñar la base de datos, se deben definir las finalidades y seleccionar únicamente los campos necesarios. Si posteriormente surge una nueva necesidad, se debe evaluar y justificar la recopilación de datos adicionales.

## 5. Conclusión

La privacidad debe tomarse en cuenta desde el diseño de la aplicación y no solamente cuando ya está funcionando. Recopilar menos información, limitar los accesos y establecer reglas de conservación ayuda a proteger a los clientes y reduce los riesgos de seguridad.