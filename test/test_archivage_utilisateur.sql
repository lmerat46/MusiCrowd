BEGIN;
SAVEPOINT test3;
select incrementation_date_fictive(0,1,0);
select add_participation(5,4,400000,(SELECT fictive_date FROM fiction_date));
select add_participation(5,4,20,(SELECT fictive_date FROM fiction_date));
select incrementation_date_fictive(0,3,0);
select *from participation_archivage;

\echo 'on ajoute 3 ans a la date fictive pour archiver l utilisateur';
select incrementation_date_fictive(3,0,0);
select *from utilisateur;
\echo 'utilisateur archivés';
select * from utilisateur_archivage;
\echo 'participations archivées';
select * from participation_archivage;

ROLLBACK TO SAVEPOINT test3;
COMMIT;
