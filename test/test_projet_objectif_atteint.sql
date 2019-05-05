BEGIN;
SAVEPOINT test1;
--RAISE NOTICE 'test 1 avec un projet arrivant à terme avec objectif atteint';
select incrementation_date_fictive(0,1,0);
select *from utilisateur WHERE user_id = 5;
select pg_sleep(10);

select add_participation(5,1,20000,(SELECT fictive_date FROM fiction_date));
select *from participation WHERE user_id = 5;
select pg_sleep(10);
select *from projet WHERE projet_id = 1;
select *from utilisateur WHERE user_id = 5;


select add_participation(5,1,20,(SELECT fictive_date FROM fiction_date));
select *from participation WHERE user_id = 5;
select pg_sleep(10);
select *from projet WHERE projet_id = 1;
select *from utilisateur WHERE user_id = 5;
select pg_sleep(10);
select incrementation_date_fictive(0,3,0);

select *from participation WHERE projet_id = 1;
select pg_sleep(10);
select *from projet WHERE projet_id = 1;
select pg_sleep(10);
select *from participation_archivage WHERE projet_id = 1;
select pg_sleep(10);


ROLLBACK TO SAVEPOINT test1;
COMMIT;
