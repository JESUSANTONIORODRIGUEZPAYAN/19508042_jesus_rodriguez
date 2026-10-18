7. Actividad 1 — Protección de credenciales

7.1 El problema

Pregunta
¿Qué ocurriría si una persona obtiene acceso de lectura a esta tabla?

Si  obtiene acceso de lectura a esta tabla podría ver directamente los nombres de usuario y sus contraseñas Esto representa un riesgo porque si la base de datos se filtra las credenciales podrían quedar expuestas y utilizarse para entrar a las cuentas de los usuarios. 


7.3 Generar una representación no reversible

Preguntas
¿Son iguales?
no son diferentes los resultados aunque sea la misma contrasena 

Si no son iguales, ¿por qué?
porque gen_salt('bf') genera una sal diferente cada vez que se ejecuta por eso cambia el hash 

¿Qué función cumple gen_salt()?
genera una sal aleatoria que se utiliza junto la contrasena para reproducir el hash

¿Qué función cumple crypt()?
genera una representacion hash de la contrasena utilizando el algoritmo indicado y la sal proporcionada 

¿Esto es cifrado reversible?
no porque es hash no esta desenado para recuperar la contrasena original  nomas es para ver si la contrasena coincide con la almacenada 

7.5 Verificar una contraseña

Preguntas
¿Qué resultado obtuviste con la contraseña correcta?
me salio el usuario de juan y en el apartado de contrasena me sale verdad

¿Qué resultado obtuviste con la contraseña incorrecta?
me salio en usuario igual el nombre de juan y en el de contrasena me salio que es falso

¿Por qué no es necesario recuperar la contraseña original?
Porque el sistema puede comprobar la contraseña ingresada generando su hash y comparándolo con el hash almacenado, sin tener que recuperar la contraseña original.

¿Por qué un hash no debe confundirse con cifrado?
Porque el hash está diseñado para ser una representación no reversible de los datos, mientras que el cifrado permite recuperar la información original utilizando la clave correspondiente.

