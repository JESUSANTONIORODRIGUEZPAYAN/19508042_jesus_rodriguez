# Actividad 1. Inventario y finalidad de los datos

## Objetivo

Identificar los datos personales que utiliza la empresa y definir para qué sirven, si son necesarios, quién puede consultarlos y durante cuánto tiempo deben conservarse.

## Inventario de datos

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
|---|---|---|---|---|---|
| id | Sí, si permite identificar o relacionar a un cliente | Identificar cada registro | Sí | Atención al cliente, facturación y DBA según sus funciones | Mientras sea necesario |
| nombre | Sí | Identificar y atender al cliente | Sí | Atención al cliente, facturación y personal autorizado | Mientras exista una finalidad válida |
| correo | Sí | Contactar al cliente | Sí, cuando se necesita comunicación por correo | Atención al cliente y personal autorizado | Mientras sea necesario |
| telefono | Sí | Contactar al cliente | Sí, cuando se requiere comunicación telefónica | Atención al cliente y personal autorizado | Mientras sea necesario |
| rfc | Sí | Realizar la facturación | Sí, para los procesos fiscales que lo requieran | Personal de facturación y personal autorizado | Según las obligaciones aplicables |
| edad | Sí, cuando se relaciona con una persona identificable | Realizar estadísticas si se necesita ese dato | No siempre; depende de la finalidad | Personal autorizado para análisis | Mientras sea necesario |
| ciudad | Sí, cuando se relaciona con un cliente identificable | Conocer la ubicación general y generar estadísticas | Sí, si se utiliza para esas finalidades | Atención al cliente y analítica según sus necesidades | Mientras sea necesario |
| codigo_postal | Sí, cuando se relaciona con un cliente identificable | Ubicación y análisis por zona | Depende de la finalidad | Personal autorizado; analítica solo si lo necesita | Mientras sea necesario |
| fecha_alta | Puede ser dato personal cuando se relaciona con un cliente | Conocer cuándo se registró el cliente | Sí, para administrar el registro | Atención al cliente y personal autorizado | Según la finalidad y las obligaciones aplicables |

## Justificación

Considero que los datos personales deben utilizarse únicamente para lo que necesita la empresa. Por ejemplo, el RFC se necesita principalmente para facturación, mientras que el área de analítica puede trabajar con información agrupada que no identifique directamente a los clientes.

También es importante limitar los permisos de cada usuario y no conservar los datos más tiempo del necesario. Los periodos definitivos de retención deben establecerse de acuerdo con la finalidad y las obligaciones aplicables.



## 1. Objetivo

Identificar los datos que almacena la empresa Comercializadora Norte S.A. de C.V., conocer para qué se utilizan y determinar cuáles son necesarios y quién debería tener acceso.

## 2. Procedimiento

Revisé los campos que utiliza la empresa para registrar a sus clientes: id, nombre, correo, teléfono, RFC, edad, ciudad, código postal y fecha de alta.

Después, analicé si cada campo se considera un dato personal, cuál es su finalidad, si es necesario para las actividades de la empresa, qué usuarios deberían consultarlo y durante cuánto tiempo se debería conservar.

## 3. Resultado

Se identificó que varios campos contienen datos personales o pueden relacionarse con una persona identificable. También se determinó que no todos los usuarios necesitan acceder a toda la información.

El RFC se utiliza principalmente para facturación, mientras que datos como la edad, ciudad y código postal pueden utilizarse para generar estadísticas, siempre que sean necesarios para esa finalidad.

La tabla completa del inventario se encuentra en este archivo, en el apartado correspondiente a cada campo.

## 4. Análisis

Considero que la empresa debe limitar la información que recopila y permitir que cada área consulte únicamente los datos que necesita para realizar su trabajo.

Por ejemplo, el área de analítica no necesita identificar directamente a cada cliente para generar estadísticas. También es importante establecer periodos de conservación adecuados y evitar guardar información cuando ya no sea necesaria, considerando las obligaciones aplicables.

## 5. Conclusión

Con esta actividad comprendí que no basta con almacenar los datos de forma segura. También es necesario conocer su finalidad, limitar el acceso y establecer cuánto tiempo deben conservarse. Esto ayuda a proteger la información de los clientes y a mejorar la administración de la base de datos.



## 8. Actividad 2 — Principio de minimización

1. ¿Todos los campos son necesarios para atención al cliente?

No, porque para atender a un cliente normalmente basta con conocer su nombre, correo y teléfono. Los demás datos solo deberían utilizarse si existe una necesidad específica.

2. ¿Por qué soporte necesitaría conocer el RFC?

Normalmente no lo necesita, porque el RFC se utiliza principalmente para realizar facturas y otros procesos fiscales.

3. ¿Necesita conocer la edad?

No necesariamente, porque la edad no es indispensable para atender dudas o ayudar a un cliente.

4. ¿Necesita conocer el código postal?

Solo cuando sea necesario para alguna actividad, como verificar una dirección o revisar la cobertura de un servicio.

5. ¿Qué principio de privacidad está relacionado con esta decisión?

El principio de minimización de datos, porque consiste en utilizar únicamente los datos personales que sean necesarios para cumplir una finalidad.

