DROP SCHEMA musicrowd CASCADE;
CREATE SCHEMA musicrowd;
SET SEARCH_PATH TO musicrowd;
\i create_All.sql;
\i create_Trigger.sql;
\i insert_Data.sql;

\i fonction/incrementation_date_fictive.sql;
\i fonction/fonction_calcul_milestones.sql;
\i fonction/fonction_calcul_reward.sql;
\i fonction/getSponsorTaxOnProject.sql;

/*
SELECT pg_sleep(10);
\i test/test_projet_objectif_atteint.sql;
SELECT pg_sleep(10);
\i test/test_objectif_pas_atteint.sql;
*/

