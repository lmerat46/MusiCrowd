BEGIN;
SAVEPOINT test2;
--RAISE NOTICE 'test 2 avec un projet arrivant à terme sans avoir atteint l''objectif';
select * from utilisateur WHERE user_id = 5;
select add_participation(5,1,200,(SELECT fictive_date FROM fiction_date));
select *from participation WHERE user_id = 5;
select pg_sleep(10);
select *from projet WHERE projet_id = 1;
select pg_sleep(10);
select *from utilisateur WHERE user_id = 5;
select pg_sleep(10);

select incrementation_date_fictive(0,4,0);
select *from participation WHERE projet_id = 1;
select pg_sleep(10);
select *from projet WHERE projet_id = 1;
select pg_sleep(10);
select *from participation_archivage WHERE projet_id = 1;
select pg_sleep(10);
select *from utilisateur WHERE user_id = 5;

ROLLBACK TO SAVEPOINT test2;

COMMIT;
