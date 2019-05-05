BEGIN;
SAVEPOINT test1;
\echo 'test 1 avec un projet arrivant à terme avec objectif atteint';
\echo 'incrementation de 1 mois';
select incrementation_date_fictive(0,1,0);
select *from utilisateur WHERE user_id = 5;
select pg_sleep(10);

\echo 'utilisateur 5 participe à projet 4 avec 400 000 euros';
select add_participation(5,4,400000,(SELECT fictive_date FROM fiction_date));
\echo 'participation enregistrée';
select *from participation WHERE user_id = 5;

\echo 'augmentation dans projet de somme_recoltée. diminution balance utilisateur 5 + incrementation de nb_projet_supportes';
select pg_sleep(10);
select *from projet WHERE projet_id = 4;
select *from utilisateur WHERE user_id = 5;


\echo 'utilisateur 5 reparticipe au meme projet';
\echo 'pas de participation ajoutée mais celle déjà présente modifiée';
select add_participation(5,4,20,(SELECT fictive_date FROM fiction_date));
select *from participation WHERE user_id = 5;

\echo 'pas d augmentation de nb_projet_supportes';
select pg_sleep(10);
select *from projet WHERE projet_id = 4;
select *from utilisateur WHERE user_id = 5;
select pg_sleep(10);
\echo 'incrementation date fictive pour amener projet à date_fin';
select incrementation_date_fictive(0,3,0);

\echo 'participation supprimées de la table participation';
select *from participation WHERE projet_id = 4;
\echo 'attribut termine du projet passé à t';
select pg_sleep(10);
select *from projet WHERE projet_id = 4;
select pg_sleep(10);
\echo 'participation archivée dans table participation_archivage';
select *from participation_archivage WHERE projet_id = 4;
select pg_sleep(10);

\echo 'affichage des sponsors avec actions proposées';
select get_sponsor_tax_on_project(4);


ROLLBACK TO SAVEPOINT test1;
COMMIT;
