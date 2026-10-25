-- LAB-04: revisar extensiones y parámetros de conexión. No modifica configuración.
SELECT extname, extversion
FROM pg_extension
ORDER BY extname;

SHOW max_connections;
SHOW superuser_reserved_connections;
SHOW statement_timeout;
SHOW idle_in_transaction_session_timeout;
SHOW ssl_min_protocol_version;
