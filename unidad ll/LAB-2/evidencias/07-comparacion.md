# Actividad 7 — Comparar protección en reposo y protección en tránsito

| **Situación**            | **Mecanismo apropiado**         | **¿Qué protege?**                                                    |
|---                       |---                              |---                                                                   |
| Contraseña de usuario    | Hash con salt usando bcrypt    | Protege la contraseña para que no se almacene directamente y sea más difícil recuperarla si se filtra la base dedatos.                  |

| RFC almacenado en una tabla | Cifrado de datos con una clave | Protege el RFC almacenado para que no pueda leerse sin la clave correspondiente. |

| Consulta enviada desde un cliente al servidor | TLS         | Protege la información que viaja entre el cliente y el servidor para evitar que sea leída fácilmente por terceros. |

| Respaldo de una base de datos | Cifrado del archivo de respaldo |    Protege la información guardada en el respaldo si alguien obtiene el archivo. |

| Clave criptográfica | Gestor de claves o almacenamiento seguro de secretos | Protege las claves para evitar que personas no autorizadas las obtengan o utilicen. |
