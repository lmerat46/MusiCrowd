INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees) VALUES ('mot2passe', 'Merat', 'Laure', '184 rue de Tolbiac', '0666666666', 'laure.merat@etu.univ-paris-diderot.fr', 'FR45898676776796237H65', 0, 0);
INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees) VALUES ('mot1passe', 'Amari', 'Nabil', '5 rue Thomas Mann', '0777777777', 'nabil.amari@etu.univ-paris-diderot.fr', 'FR04399902978798786N65', 0, 0);
INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees) VALUES ('mot3passe', 'Rogova', 'Alexandra', '124 rue de compans', '0677667766', 'alexandra.rogova@etu.univ-paris-diderot.fr', NULL, 0, 0);
INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees) VALUES ('mot4passe', 'Chroboczek', 'Juliusz', '6 rue Thomas Mann', '0766776677', 'jch@irif.fr', 'DE567787868547980B34', 0, 0);
INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees) VALUES ('mot5passe', 'Laplante', 'Sophie', '19 rue de Vaugirard', '0645567219', 'laplante@irif.fr', NULL, 0, 0);
INSERT INTO MusiCrowd.Utilisateur (mdp, nom, prenom, adresse, telephone, mail, rib, nb_projet_supportes, nb_projet_crees) VALUES ('mot6passe', 'Jurski', 'Yan', '10 rue Thomas Mann', '0789235646', 'jurski@irif.fr', NULL, 0, 0);


INSERT INTO MusiCrowd.Projet (user_id, nom_proj, description, date_deb, date_fin, objectif, somme_recoltee, taxe_perc, termine) VALUES (1, 'boite de musique à manger', 'manger la musique au lieu de l écouter', NOW(), '2019-05-26', 200000, 0, 10, 0);
INSERT INTO MusiCrowd.Projet (user_id, nom_proj, description, date_deb, date_fin, objectif, somme_recoltee, taxe_perc, termine) VALUES (2, 'Music 4 the Proo', 'musique pour les pro ps4 only', '2019-05-15', '2019-05-23', 2000, 0, 50, 0);
INSERT INTO MusiCrowd.Projet (user_id, nom_proj, description, date_deb, date_fin, objectif, somme_recoltee, taxe_perc, termine) VALUES (1, 'guitare pour les manchots', 'pour que la musique soit accessible à tous', NOW(), '2019-05-10', 1000000, 0, 5, 0);
INSERT INTO MusiCrowd.Projet (user_id, nom_proj, description, date_deb, date_fin, objectif, somme_recoltee, taxe_perc, termine) VALUES (2, 'Music 3 the Proo', 'musique pour les amateurs', NOW(), '2019-05-1', 300000, 0, 15, 0);


INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (1, 'Reconnaissance', 'reconnaissance éternelle du dieu de la guitare: Splash', 10, 400);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (1, 'porte_clef', 'un porte clef à l effligie de notre seigneur tout puissant: Splash', 400, 450);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (1, 'une guitare', 'guitare toute dernière génération avec tous pleins de boutons rigolos', 450, 2000);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (2, 'une pédale', 'une pédale pour faire du son', 50, 200);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (2, 'une pédale', 'une pédale pour faire un  deuxième son', 200, 500);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (2, 'une pédale', 'une pédale un peu mieux que l autre pédale', 500, 2000);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (2, 'une pédale suprème', 'une pédale de vélo touchée par Splash', 2000, 30000);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (3, 'un bras méchanique', 'un bras pour jouer de la guitare', 100, 300);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (3, 'un autre bras méchanique', 'le deuxième bras pour pouvoir joeur de la musique', 300, 500);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (4, 'Remerciement', 'remerciement de la part de toute l équipe', 5, 10);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (4, 'un autographe', 'autographe de notre Sauveur: Splash', 10, 50);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (4, 'un restaurant', 'un dîner aux chandelles avec Splash le tout puissant', 50, 100);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (4, 'une virée', 'une virée en F1 avec Splash aux commandes', 100, 400);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (4, 'un chapeau', 'LE chapeau de Splash', 400, 1000);
INSERT INTO MusiCrowd.Reward (projet_id, nom_cadeau, detail_cadeau, somme_min, somme_max) VALUES (4, 'LA guitare', 'LA GUITARE DE SPLASH DÉDICACÉE par un pinguoin', 1000, 30000);


INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
INSERT INTO MusiCrowd.Participation (user_id, projet_id, reward_id, montant, date_p) VALUES ();
