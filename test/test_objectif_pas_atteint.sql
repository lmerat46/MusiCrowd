BEGIN;
SAVEPOINT test2;
\echo 'test 2 avec un projet arrivant à terme sans objectif atteint';
\echo 'utilisateur 5 participe à projet 4 avec 200 euros';
select * from utilisateur WHERE user_id = 5;
select add_participation(5,4,200,(SELECT fictive_date FROM fiction_date));
select *from participation WHERE user_id = 5;

\echo 'augmentation dans projet de somme_recoltée. diminution balance utilisateur 5 + incrementation de nb_projet_supportes';
select pg_sleep(10);
select *from projet WHERE projet_id = 4;
select pg_sleep(10);
select *from utilisateur WHERE user_id = 5;
select pg_sleep(10);

\echo 'incrementation date fictive pour amener projet à date_fin';
select incrementation_date_fictive(0,4,0);
select *from fiction_date;

\echo 'participation supprimées de la table participation';
select *from participation WHERE projet_id = 4;
select pg_sleep(10);
select *from projet WHERE projet_id = 4;
select pg_sleep(10);

\echo 'participation archivée dans table participation_archivage';
select *from participation_archivage WHERE projet_id = 4;
\echo 'remboursement de l utilisateur 5 et 4';
select pg_sleep(10);
select *from utilisateur WHERE user_id = 5 OR user_id = 4;
select *from projet WHERE projet_id = 4;

ROLLBACK TO SAVEPOINT test2;

COMMIT;
