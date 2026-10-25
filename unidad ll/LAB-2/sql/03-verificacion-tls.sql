CREATE TABLE clientes_soporte (
    id BIGSERIAL,
    nombre VARCHAR(120),
    correo VARCHAR(150),
    telefono VARCHAR(20),
    rfc VARCHAR(13),
    edad INTEGER,
    ciudad VARCHAR(80),
    codigo_postal VARCHAR(10),
    fecha_alta DATE
);



CREATE TABLE clientes_soportes (
    id BIGINT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    telefono VARCHAR(20)
);




INSERT INTO clientes_soportes (
    id,
    nombre,
    correo,
    telefono
)
SELECT
    id,
    nombre,
    correo,
    telefono
FROM cliente;

SELECT *FROM clientes_soporte;