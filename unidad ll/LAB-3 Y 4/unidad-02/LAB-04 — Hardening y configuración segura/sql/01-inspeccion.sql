-- LAB-04: inspección inicial. No modifica la configuración.
SELECT version();

SHOW port;
SHOW listen_addresses;
SHOW ssl;
SHOW password_encryption;

SELECT
    pid,
    usename,
    datname,
    client_addr,
    client_port,
    application_name
FROM pg_stat_activity;

SHOW config_file;
SHOW hba_file;
SHOW ident_file;
SHOW data_directory;
SHOW log_directory;
SHOW log_connections;
SHOW log_disconnections;

-- Reglas de autenticación leídas por PostgreSQL
SELECT line_number, type, database, user_name, address, auth_method, error
FROM pg_hba_file_rules
ORDER BY line_number;
