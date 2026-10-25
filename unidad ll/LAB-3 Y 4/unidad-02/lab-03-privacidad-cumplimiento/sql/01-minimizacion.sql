-- 1. Version del servidor
SELECT version();

-- 2. Configuracion principal
SHOW port;
SHOW listen_addresses;
SHOW ssl;
SHOW password_encryption;

-- 3. Conexiones actuales
SELECT
    pid,
    usename,
    datname,
    client_addr,
    client_port,
    application_name
FROM pg_stat_activity;

-- 4. Rutas y registro de conexiones
SHOW config_file;
SHOW hba_file;
SHOW ident_file;
SHOW data_directory;
SHOW log_directory;
SHOW log_connections;
SHOW log_disconnections;



