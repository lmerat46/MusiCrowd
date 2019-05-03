BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO MusiCrowd.Participation (user_id, projet_id, montant, date_p) VALUES (6,2, 2000, '2019-03-26');
COMMIT;
