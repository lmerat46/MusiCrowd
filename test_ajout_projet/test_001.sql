BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO MusiCrowd.Projet (user_id, nom_proj, description, date_deb, date_fin, objectif, somme_recoltee, taxe_perc, termine) VALUES (1, 'boite de musique à manger2', 'manger la musique au lieu de l écouter2', '2019-12-31', '2019-05-26', 200000, 0, 10, FALSE);
COMMIT;
