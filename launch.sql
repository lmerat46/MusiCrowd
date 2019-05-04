DROP SCHEMA musicrowd CASCADE;
CREATE SCHEMA musicrowd;
SET SEARCH_PATH TO musicrowd;
\i create_All.sql;
\i create_Trigger.sql;
\i insert_Data.sql;

SELECT pg_sleep(10);

SELECT *FROM utilisateur;
