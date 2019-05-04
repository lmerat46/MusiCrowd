-- ----------------------------
-- Records of utilisateur
-- ----------------------------
BEGIN;
INSERT INTO "utilisateur" ("mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES ('mot6passe', 'Jurski', 'Yan', '10 rue Thomas Mann', '0789235646', 'jurski@irif.fr', NULL, 0, 0, 3000, NULL, NULL);
INSERT INTO "utilisateur" ("mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES ('mot3passe', 'Rogova', 'Alexandra', '124 rue de compans', '0677667766', 'alexandra.rogova@etu.univ-paris-diderot.fr', 'DE092897828762', 0, 1, 10000, NULL, NULL);
INSERT INTO "utilisateur" ("mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES ('mot5passe', 'Laplante', 'Sophie', '19 rue de Vaugirard', '0645567219', 'laplante@irif.fr', 'FR04576786273', 0, 1, 20, NULL, NULL);
INSERT INTO "utilisateur" ("mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES ('mot2passe', 'Merat', 'Laure', '184 rue de Tolbiac', '0666666666', 'laure.merat@etu.univ-paris-diderot.fr', 'FR45898676776796237H65', 0, 1, 2000, NULL, NULL);
INSERT INTO "utilisateur" ("mdp", "nom", "prenom", "adresse", "telephone", "mail", "rib", "nb_projet_supportes", "nb_projet_crees", "balance", "date_inscription", "date_connexion") VALUES ('mot1passe', 'Amari', 'Nabil', '5 rue Thomas Mann', '0777777777', 'nabil.amari@etu.univ-paris-diderot.fr', 'FR04399902978798786N65', 2, 1, 700000, NULL, NULL);
COMMIT;

-- ----------------------------
-- Records of Fiction_Date
-- ----------------------------
BEGIN;
INSERT INTO "Fiction_Date" ("fiction_Date") VALUES ('2019-05-26');
COMMIT;

-- ----------------------------
-- Records of Milestones
-- ----------------------------
BEGIN;
INSERT INTO "Milestones" ("projet_id", "description", "objectif") VALUES (2, 'Prise en Charge de Logic Pro X', 20000);
INSERT INTO "Milestones" ("projet_id", "description", "objectif") VALUES (3, 'Prise en charge de module 16 bits', 250000);
INSERT INTO "Milestones" ("projet_id", "description", "objectif") VALUES (4, 'Deux Morceau de plus dans l''Album', 60000);
COMMIT;

-- ----------------------------
-- Records of projet
-- ----------------------------
BEGIN;
INSERT INTO "projet" ("user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (2, 'Tranxen 400', 'VST Compatible avec Pro Tools, permet de moduler les pic, les poc mais aussi les pitch et les potch', '2019-02-15', '2019-05-23', 10000, 0, 50, 'f');
INSERT INTO "projet" ("user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (3, 'ChipWave', 'Logiciel de MAO taillé pour la création de musique 8 bits.', '2019-01-01', '2019-05-10', 200000, 0, 5, 'f');
INSERT INTO "projet" ("user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (4, 'Outrun Alpha', 'Back to The 80s !', '2019-01-30', '2019-05-01', 50000, 0, 15, 'f');
INSERT INTO "projet" ("user_id", "nom_proj", "description", "date_deb", "date_fin", "objectif", "somme_recoltee", "taxe_perc", "termine") VALUES (1, 'OnduLab X', 'Simulateur numérique d''effet de basse', '2018-12-31', '2019-05-26', '2600000', 1000000, 10, 'f');
COMMIT;

-- ----------------------------
-- Records of participation_archivage
-- ----------------------------
BEGIN;
INSERT INTO "participation_archivage" ("projet_id", "user_id", "date_p") VALUES (1, 2, '2019-05-03');
COMMIT;

-- ----------------------------
-- Records of reward
-- ----------------------------
BEGIN;
--INSERT INTO "reward" ("reward_id", "projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (10, 4, 'Remerciement', 'remerciement de la part de toute l équipe', 5, 10);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (2, 'Tranxen 400 lite', 'Module uniquement les pic et les poc', 50, 200);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (2, 'Tranxen 400 standard', 'Module les pic les poc mais un peu les pitch', 200, 500);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (2, 'Tranxen 400 ultimate', 'Module tout', 500, 2000);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (2, 'Tranxen 400 ultimate + Pro Tools', 'Module tout et en plus tu peux l''essayer sur le meilleur soft de prod musical', 2000, 30000);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (3, 'ChipWave Standard', 'Recevez l''édition standard de chipwave ', 100, 300);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (3, 'ChipWave Ultimate', 'Avec des modules FPGA pour mieux simulez votre bonne vieille NES', 300, 500);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (4, 'L''album', 'A exemplaire de notre album qui vous ramenera au temps joyeux des synthé et des coupes de cheveux de mauvais gout', 10, 50);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (4, 'L''album + Tee Shirt', 'Notre Album + Un Tee Shirt avec la cover de l''album', 50, 100);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (4, 'L''album + Tee Shirt + Place de concert', 'une virée en F1 avec Splash aux commandes', 100, 400);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (4, 'Album + Tee shirt + Concert privé', 'Si tu as un jardin assez grand on vient jouer chez toi !', 400, 1000);
INSERT INTO "reward" ("projet_id", "nom_cadeau", "detail_cadeau", "somme_min", "somme_max") VALUES (4, 'Album + Tee Shirt + Korg Analogue', 'Remporte le synthé de notre claviériste signé par nos soins !', 1000, 30000);
COMMIT;

-- ----------------------------
-- Records of sponsor_type
-- ----------------------------
BEGIN;
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('Instruments Manufacturer');
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('Software Company');
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('Television Network');
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('Radio Network');
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('News Paper');
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('Magazine');
INSERT INTO "sponsor_type" ("sponsor_type_name") VALUES ('Social network');
COMMIT;

-- ----------------------------
-- Records of sponsor
-- ----------------------------
BEGIN;
INSERT INTO "sponsor" ("nom", "sponsor_type_id") VALUES ('Gibson', 1);
INSERT INTO "sponsor" ("nom", "sponsor_type_id") VALUES ('Korg', 1);
INSERT INTO "sponsor" ("nom", "sponsor_type_id") VALUES ('ESP', 1);
INSERT INTO "sponsor" ("nom", "sponsor_type_id") VALUES ('Fender', 1);
INSERT INTO "sponsor" ("nom", "sponsor_type_id") VALUES ('Facebook', 7);
COMMIT;

-- ----------------------------
-- Records of sponsored_projects
-- ----------------------------
BEGIN;
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (4, 2, 'Apport d''instrument de la marque auprèes des musiciens', 0);
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (4, 5, 'Publicité sur le réseau social', 10);
INSERT INTO "sponsored_projects" ("id_projet", "id_sponsor", "sponsoring_action", "tax") VALUES (1, 5, 'Publicité sur le réseau social', 10);
COMMIT;
