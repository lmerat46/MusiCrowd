BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees, balance, date_inscription, date_connexion) VALUES ('mot10passe', 'test1', 'test1', '10 rue Thomas Mann', '0789289646', 'test@test.fr', 'FR8687269827', 0, 0, 3000000, '2000-04-28', '2018-05-28');
COMMIT;
